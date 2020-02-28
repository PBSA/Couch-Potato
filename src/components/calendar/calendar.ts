import { Component } from '@angular/core';
import { ModalController, Events } from 'ionic-angular';
import { SelectorComponent } from '../../components/selector/selector';
import { DataComponent } from '../../app/modules/data'; 
import { Notifications} from '../../globals/globals';

@Component({
  selector: 'calendar',
  templateUrl: 'calendar.html'
})
export class CalendarComponent {

  private months: any[] = [
        {name: 'January', days: 31},
        {name: 'February', days: 28},
        {name: 'March', days: 31},
        {name: 'April', days: 30},
        {name: 'May', days: 31},
        {name: 'June', days: 30},
        {name: 'July', days: 31},
        {name: 'August', days: 31},
        {name: 'September', days: 30},
        {name: 'October', days: 31},
        {name: 'November', days: 30},
        {name: 'December', days: 31},
    ];

  private dayCounter: number = 0;
  private days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
  private selectedLeague: any ;
  private allSports: any;
  private selectedSport: any;
  private selectedYear: number;
  private selectedMonth: string;
  private calendarDate: Date;
  private selectedMonthNumber: number;
  private firstDay: Date;
  private firstDayNumber: number;
  private allGames: any ;
  private tempvalue = new Array();
  private timeRange: any = {};
  private userid: any;
  private zoneOffset: number;
  private dayCount: number;
  private eventCount: number =0;
  private note = new Notifications;

  constructor(private events: Events, private modalCtrl: ModalController,
    private _data: DataComponent) {
   
      // get todays date
      this.calendarDate = new Date();
      this.selectedYear = this.calendarDate.getFullYear();
      this.selectedMonthNumber = this.calendarDate.getMonth();
      this.selectedMonth = this.months[this.selectedMonthNumber].name;

      // set day of week month starts
      var firstMonth = (this.selectedMonthNumber + 1).toString();
      if(firstMonth.length == 1){firstMonth = "0" + firstMonth;}
      var firstDayString = this.selectedYear.toString() + "-" + firstMonth + "-01";
      this.firstDay = new Date (firstDayString);
      this.firstDayNumber = this.firstDay.getDay();

      // adjust for leap year
      this.isLeapYear();
      
     // get data range adjusting for local time
     this.zoneOffset = new Date().getTimezoneOffset();

     var timeStart = new Date(this.selectedYear,this.selectedMonthNumber,1,0,0,1);
     this.timeRange.start = this.convertDateTime(timeStart);
     var timeEnd = timeStart;

     // end time varies according to number of days in month
     timeEnd.setMinutes(timeEnd.getMinutes() + ((this.dayCount) * 24 * 60));
     this.timeRange.end = this.convertDateTime(timeEnd);

      // get the user
      events.subscribe('user', (user: any) => {
        this.userid = user;
      });
      
      // get the selected league
      events.subscribe('league', (league: any) => {
         this.selectedLeague = league;
          this.loadGamesByDate();
      });

      // get selected sport
      events.subscribe('sports', (sports: any) => {
        this.allSports = sports;
        // default to first sport
        this.selectedSport=this.allSports[0].name;
      });

      // get selected tab
      events.subscribe('tab', (sport: any) => {
        this.selectedSport=sport.name;
      });
  }

  convertDateTime(dateTime: Date): string{

    var day = dateTime.getDate().toString();
    var month = (dateTime.getMonth()+1).toString();
    var hour  = dateTime.getHours().toString();
    var minute = dateTime.getMinutes().toString();
     if(day.length == 1){day = "0" + day}
     if(month.length == 1){month = "0" + month}
     if(hour.length == 1){hour = "0" + hour}
     if(minute.length == 1){minute = "0" + minute}
    return dateTime.getFullYear() + "-" + month + "-" + day;// + "T" + hour + ":" + minute;
}


  loadGamesByDate(){
      // load games date for the current month on the calendar and the current league
      this._data.getGamesByLeagueAndDate(this.selectedLeague.name, this.timeRange.start, this.timeRange.end).subscribe(games =>{
      this.allGames = games;
      // count how many games per day.
      var counter:number = 1;
      var numgames: number = 0;
      var game: any
    
      for(counter=0; counter <= this.dayCount; counter++){ 
        
          for(game of this.allGames){
          
              // need to adjust game dates from UTC back to local time
                var newdate: Date= this.getLocalDay(game);
                var day: number = newdate.getDate();
                var month: number = newdate.getMonth();
                if(counter == day && game.league == this.selectedLeague.name && this.selectedMonthNumber == month){
                    numgames ++;
                }
          }
          // add to array
          this.tempvalue[counter] = numgames;
          numgames=0;
      }
    });
  }

  getLocalDay(game: any){
    var localDate = new Date(game.date + " " + game.starttime);
    localDate.setMinutes(localDate.getMinutes() - this.zoneOffset);
    var day = localDate.getDate().toString();
    var month = (localDate.getMonth() + 1).toString();
   
    if(day.length == 1){day = "0" + day}

    //return Number(day);
    return localDate;
  }

  openSelector(x: number, y: number){
    // calculate the date clicked on.
      var dayNumber: string = (((x*7) + y) - (this.firstDayNumber)).toString();
      if(dayNumber.length == 1){dayNumber = "0" + dayNumber;}
      var monthNumber: string = (this.selectedMonthNumber + 1).toString();
      if(monthNumber.length == 1){monthNumber = "0" + monthNumber;}
      var thisDay = this.selectedYear + "-" + monthNumber + "-" + dayNumber;
      var selectedDay = new Date(thisDay).getDay();
     // adjust for Sunday
     if(selectedDay == 6){selectedDay=-1};
      var dayOfWeek = this.days[selectedDay+1];
      var selectedDate = dayOfWeek + " " + dayNumber + " " + this.selectedMonth + ", " + this.selectedYear;
      // open selector modal
      this.presentModal(thisDay, selectedDate, this.selectedLeague, this.selectedSport, this.note);
    
  }

 async presentModal(thisDay: string, formattedDate: string, league: any, sport:string, note: Notifications) {
      let data = {'league': league,
                  'date': thisDay,
                  'formattedDate': formattedDate,
                  'sport': sport,
                  'note': note,
                  'userid': this.userid        
                };
      let selectormodal = await this.modalCtrl.create(SelectorComponent, data, 
          {cssClass: "selector-modal"});

        selectormodal.onDidDismiss(data => {
          if(data == "add"){
            this.presentModal(thisDay, formattedDate, this.selectedLeague, this.selectedSport,this.note);}
          else { // refresh screen
            this.loadGamesByDate();
        }
      });        
      return await selectormodal.present();
  }

  changeMonth(index: number)
  {
      // move month forward and back
      this.calendarDate.setMonth( this.calendarDate.getMonth() + index);
      this.selectedMonthNumber = this.calendarDate.getMonth();
      this.selectedMonth = this.months[this.selectedMonthNumber].name;
      this.selectedYear = this.calendarDate.getFullYear();

      // set day of week month starts
      var newMonth = (this.selectedMonthNumber + 1).toString();
      if(newMonth.length == 1){newMonth = "0" + newMonth;}
      var firstDayString = this.selectedYear + "-" + newMonth + "-01";
      this.firstDay = new Date (firstDayString);
      this.firstDayNumber = this.firstDay.getDay();

      // set new date range
     var timeStart = new Date(this.selectedYear,this.selectedMonthNumber,1,0,0,1);
     this.timeRange.start = this.convertDateTime(timeStart);
     var timeEnd = timeStart;

     

     // adjust for leap year
     this.isLeapYear();
     
     // end time varies according to number of days in month
     timeEnd.setMinutes(timeEnd.getMinutes() + ((this.dayCount) * 24 * 60));
     this.timeRange.end = this.convertDateTime(timeEnd);
   
      // reload data
      this.loadGamesByDate();
  }

  isLeapYear(){
    this.dayCount = this.months[this.selectedMonthNumber].days +1;
      if((this.selectedMonthNumber == 1) && (this.selectedYear % 4 == 0)) { this.dayCount++} //leap year
  }

  getRows(){
    return new Array(6);
  }

  getDay(x: number,y:number){
    var nextNum: number;
    var firstDay: number;
    var daysInMonth: number;

    // get days in month and adjust for leap year.
    daysInMonth = this.months[this.selectedMonthNumber].days +1;
    if((this.selectedMonthNumber == 1) && (this.selectedYear % 4 == 0)) // Leap year
    {daysInMonth++;}

    nextNum = (x*7) + y;
    if(nextNum < this.firstDayNumber) {return 0};
    
    if(nextNum >= (daysInMonth + this.firstDayNumber)){return 0;}
    else{
        nextNum -= (this.firstDayNumber);
        this.dayCounter = nextNum;
        return nextNum;
    }
  }

  isToday(x: number, y: number){
    // highligth today's date
    var day = ((x*7) + y) ;
    var month = this.selectedMonthNumber;
    // add offset
    day -= this.firstDayNumber ;
    var calendarDate: string = day + "/" + month + "/" + this.selectedYear;
    var date = new Date();
    var today: string = date.getDate().toString() + "/" + date.getMonth().toString() + "/" + date.getFullYear().toString();
    if (calendarDate == today){return true;}
    else{return false}
  }

  isBlank(x:number , y:number){
      var blank: number = this.getDay(x,y);
      return blank;
  }

  getIcon(){
    // get icon for league
    return this.selectedLeague.icon;
  }
}
