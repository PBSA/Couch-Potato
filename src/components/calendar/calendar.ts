import { Component } from '@angular/core';
import { ModalController, Events } from 'ionic-angular';
import { SelectorComponent } from '../../components/selector/selector';
import { DataComponent } from '../../app/modules/data'; 

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
  private userid: any;

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
     
      // get the user
      events.subscribe('user', (user: any) => {
        this.userid = user;
      
      });
      
      // get the selected league
      events.subscribe('league', (league: any) => {
          this.selectedLeague = league;
          this.loadGamesByDate();
      });

      events.subscribe('sports', (sports: any) => {
        this.allSports = sports;
        // default to first sport
        this.selectedSport=this.allSports[0].name;
      });

      events.subscribe('tab', (tab: any) => {
        this.selectedSport=this.allSports[tab-1].name;
      });
  }

  loadGamesByDate(){
      // load games date for the current month on the calendar and the current league
      this._data.getGamesDataByMonth((this.selectedMonthNumber + 1).toString(), 
                                      this.selectedYear.toString(), 
                                      this.selectedLeague.name).subscribe(games =>{
      this.allGames = games;
      // count how many games per day.
      var counter:number = 1;
      var numgames: number = 0;
      var game: any
      var daycount: number;

      // adjust for leap year
      daycount = this.months[this.selectedMonthNumber].days +1;
      if((this.selectedMonthNumber == 1) && (this.selectedYear % 4 == 0)) // Leap year
      { daycount++}
      

      for(counter=0; counter <= daycount; counter++){ 
          for(game of this.allGames){
                var day: string = (game.date).toString();
                var newday =  Number(day.substr(8,2));
                if(counter == newday && game.league == this.selectedLeague.name){
                    numgames ++;
                }
          }
          // add to array
          this.tempvalue[counter] = numgames;
          numgames=0;
      }
    });
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
      this.presentModal(thisDay, selectedDate);
  }

 async presentModal(thisDay: string, formattedDate: string) {
      let data = {'league': this.selectedLeague,
                  'date': thisDay,
                  'formattedDate': formattedDate,
                  'sport': this.selectedSport,
                  'userid': this.userid         
                };
      let selectormodal = await this.modalCtrl.create(SelectorComponent, data, 
          {cssClass: "selector-modal"});

        selectormodal.onDidDismiss(data => {
          if(data == "add"){
            this.presentModal(thisDay, formattedDate);}
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
   
      // reload data
      this.loadGamesByDate();
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
