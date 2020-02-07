import { Component } from '@angular/core';
import { NavParams, NavController } from 'ionic-angular';
import { ViewController } from 'ionic-angular';
import { DataComponent } from '../../app/modules/data'; 
import { UserComponent } from '../../app/modules/user'; 
import { AlertComponent } from '../../app/modules/alerts'; 

@Component({
  selector: 'selector',
  templateUrl: 'selector.html'
})

export class SelectorComponent {

  private activeLeague: any;
  private events: any
  private date: string;
  private formattedDate: string;
  private hometeam: string = "";
  private awayteam: string = "";
  private starttime: string = new Date().toTimeString().substr(0,5);
  private teams: any = new Array();
  private putData: any = {};
  private putGame: any = {};
  private putEvent: any = {};
  private timeRange: any = {};
  private lastGameId: any;
  private sport: string;
  private zoneOffset: number;

  constructor(navParams: NavParams, 
              public navCtrl: NavController, private viewCtrl: ViewController, private user:UserComponent,
              private _data: DataComponent, private _alert: AlertComponent) {
      
        // get parameters sent from the calendar
      this.activeLeague = navParams.get('league');
      this.date = navParams.get('date');
      this.formattedDate = navParams.get('formattedDate');
      this.sport = navParams.get('sport');
      // get timezone offset in minutes
      this.zoneOffset = new Date().getTimezoneOffset();
      // add/subtract offset
      var timeStart = new Date(Number(this.date.substr(0,4)), Number(this.date.substr(5,2))-1, Number(this.date.substr(8,2)), 0, 0, 1)
      timeStart.setMinutes(timeStart.getMinutes() + this.zoneOffset);
      this.timeRange.start = this.convertDateTime(timeStart);
      var timeEnd = timeStart;
      timeEnd.setMinutes(timeEnd.getMinutes() + (24*60));
      this.timeRange.end = this.convertDateTime(timeEnd);
      // get team data.
      this.getTeams();
      // get event data
      this.getEvents();

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

      return dateTime.getFullYear() + "-" + month + "-" + day + " " + hour + ":" + minute;
  }

  getTeams(){
      this._data.getTeamsByLeague(this.activeLeague.id).subscribe(teams =>{
          var allteams: any = teams;
          for (let team of allteams){ 
            this.teams.push(team); 
          }
          this.teams.sort((a, b) => (a.name > b.name) ? 1 : -1)
      });
  }

  getEvents(){
    // need to adjust time/date by timezone offset.
    this._data.getEventsByLeagueAndDate(this.activeLeague.name, this.timeRange.start, this.timeRange.end).subscribe(events =>{
        this.events = events; 
    });
  }

  getLocalStartTime(event){
    var hour: string;
    var minute: string;
    var localDate = new Date(event.date + " " + event.starttime);
    localDate.setMinutes(localDate.getMinutes() - this.zoneOffset);
    hour = localDate.getHours().toString();
    minute = localDate.getMinutes().toString();
    if(hour.length == 1){hour = "0" + hour}
    if(minute.length == 1){minute = "0" + minute}
    return hour + ":" + minute;
  }
  
  addGame(){
      // do validation client side before sending data to API
      if(this.hometeam == ""){this._alert.showError("Add Game Error", "No home team selected");return;}
      if(this.awayteam == ""){this._alert.showError("Add Game Error", "No away team selected");return;}
      if(this.awayteam == this.hometeam){this._alert.showError("Add Game Error", "Teams must be different");return;}
      if(this.starttime == ""){this._alert.showError("Add Game Error", "No start time selected");return;}

      var putData:any = {};
      var retval: any;
      putData.call = 'create';
      putData.sport = this.sport;
      putData.league = this.activeLeague.name;
      putData.user = this.user.id;
      putData.home = this.hometeam.trim();
      putData.away = this.awayteam.trim();
      // remove seconds
      this.starttime = this.starttime.substring(0,5);
      putData.start_time = new Date(this.date + " " + this.starttime).toISOString();
      // use local date/time for GUI
      //putData.local_start_time = this.starttime;
      //putData.local_start_date = this.date;
      this._data.addGame(putData).subscribe(result =>{
          retval = result;
          if(retval.status != "200"){ // error
            if(retval.subcode = "460"){
              // not normalized data.
              this._alert.showError("Error " + retval.status + ": Bad Request", "[" + retval.subcode + "] " + this.sport + " (" + this.activeLeague.name + ") not supported");
            }
            else{
              this._alert.showError("Error " + retval.status, "[" + retval.subcode + "]: "+ retval.title);
            }
          }
          else{this.viewCtrl.dismiss("add",null,{animation: 'false', duration:0});}    
        });
  }

  dismiss(){
      this.viewCtrl.dismiss("close");
  }

  getFlow(game: any): string{
    // get status of game
    if(game.name == "Not Started"){return "Start";}
    if(game.name == "In Progress"){return "Finish";}
    if(game.name == "Finished"){return "";}
    if(game.name == "Cancelled"){return "";}   
  }

  getFlowColor(game: any): string{
    // get status color of game 
    if(game.name == "Not Started"){return "start";}
    if(game.name == "In Progress"){return "finish";}
    if(game.name == "Finished"){return "completed";}
    if(game.name == "Cancelled"){return "cancel";}
  }

  getCanScore(game){
    // can score be added
    if(game.name == "In Progress"){return "scoreEnabled"}
    else{return "scoreDisabled"};
  }

  scoreDisabled(game){
    return(game.name == "In Progress");
  }

 getTeamIcon(thisTeam: string){
    // build using the league and team.
    var teamicon: string;
    
    teamicon = "/assets/imgs/" + this.sport + "/" + this.activeLeague.name +"/"
    for (let team of this.teams){
        if(team.name == thisTeam){
          teamicon += team.icon;
          return teamicon};
    }
    return "";
  }

  isVisible(game: any): boolean{
    return (game.name == game.id && (game.name == "Cancelled" || game.name == "Finished"))
  }

  formatText(text: string): string{
      // replace spaces in names for dashes and make lowercase
    return text.replace(/ /, "-").toLowerCase();
  }

  changeStatus(game: any){
    // change the status of the game depending on action.
      if(game.name == "Not Started"){
        game.name = "In Progress";
        this.startGame(game);
        return;
      }
      else if(game.name == "In Progress"){
        // throw error is scores aren't entered.
        if(game.homescore == null){this._alert.showError(game.hometeam + ' v ' + game.awayteam , "No home score entered");return;}
        if(game.awayscore == null){this._alert.showError(game.hometeam + ' v ' + game.awayteam , "No away score entered");return;}
        game.name = "Finished";
        this.addScore(game);
        return;
      }
      else if(game.name == "Cancelled"){
        this.cancelGame(game);
        return;
      }  
  }

  startGame(game: any){
      var retval: any;
      this.putData.call = 'in_progress';
      this.getMandatoryData(game);
      this.putData.whistle_start_time = new Date().toISOString();   
      this._data.startGame(this.putData).subscribe(data=>{
        retval = data;
        if(retval.status != "200"){ // error
          if(retval.subcode = "460"){
            // not normalized data.
            this._alert.showError("Error " + retval.status + ": Bad Request", "[" + retval.subcode + "] " + this.sport + " (" + this.activeLeague.name + ") not supported");
          }
          else{
            this._alert.showError("Error " + retval.status, "[" + retval.subcode + "]: "+ retval.title);
          }
        }
      });
  }

  addScore(game: any){
      // add the score
      this.putData.call = 'result';
      this.getMandatoryData(game);
      this.putData.home_score = game.homescore;
      this.putData.away_score = game.awayscore;
      this._data.addScore(this.putData).subscribe(data=>{});  
      // finish game since I don't think the result can be changed anyway!!
      this.putData.call= 'finish';
      this.putData.whistle_end_time = new Date().toISOString();   
      this._data.finishGame(this.putData).subscribe(data=>{});
  }

  cancelGame(game: any){
    // cancel a game
    if(game.name == "Not Started" || game.name == "In Progress"){
        this._alert.showAlert(game, 'Cancel Game').then((result) => {
        if(result){
          game.name = "Cancelled";
          this.putData.call = 'canceled';
          this.getMandatoryData(game);
          this._data.cancelGame(this.putData).subscribe(data=>{
              this.viewCtrl.dismiss("add",null,{animation: 'false', duration:0});
              });
            };
        });
    }
  }

  deleteGame(game: any){
      // delete a game
      this._alert.showAlert(game, 'Delete Game').then((result) => {
        if(result){
          this.putGame.action = "delete";
          this.putGame.id = game.gameid;
          this._data.deleteGame(this.putGame).subscribe(data=>{
          // if this is the last game on selected date then need to delete the event as well
          this._data.getLastGameIdByDateAndLeague(this.date,this.activeLeague.name).subscribe(lastgameid =>{
            this.lastGameId = lastgameid;
            if(this.lastGameId.id == null){
                // delete event
                this.putEvent.action = "delete";
                this.putEvent.date = this.date;
                this.putEvent.league = this.activeLeague.name;
                this._data.deleteEvent(this.putEvent).subscribe(data=>{});
            }
            // delete event must send a canceled incident to BOS
            this.putData.call = 'canceled';
            this.getMandatoryData(game);
            this._data.cancelGame(this.putData).subscribe(data=>{
              this.viewCtrl.dismiss("add",null,{animation: 'false', duration:0});
              });
          });
        });
      }
    })   
  }

  getMandatoryData(game: any){
    this.putData.sport = this.sport;
    this.putData.league = game.league;
    this.putData.home = game.hometeam.trim();
    this.putData.away = game.awayteam.trim();
    this.putData.start_time = new Date(this.date + ' ' + game.starttime).toISOString();
    this.putData.match_id = game.gameid;
  }

  canCancel(game: any): string{
    // not all statuses can be cancelled
    if(game.name == "Not Started" || game.name == "In Progress"){return "Cancel"}
    return "";
  }

  canDelete(game: any): string{
    // not all statuses can be cancelled
    if(game.name == "Not Started"){return "Delete"}
    return "";
  }
}

