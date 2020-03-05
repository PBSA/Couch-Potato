import { Component } from '@angular/core';
import { Notifications} from '../../globals/globals';
import { DataComponent } from '../../app/modules/data'; 
import { Events } from 'ionic-angular';
import { CalendarComponent } from '../../components/calendar/calendar';
import { Config } from '../../app/modules/user'; 

@Component({
  providers:[CalendarComponent ],
  selector: 'notifications',
  templateUrl: 'notifications.html'
})

export class NotificationsComponent {

  public notifications: Notifications[] = new Array();
  private counter: number =0;
  private allGames: any;
  private starttime: string;
  private note = new Notifications;
  private zoneOffset: number;

  constructor(private _data: DataComponent, private events: Events, private calendar: CalendarComponent, private config: Config ) {

      // get time zone offset
    this.zoneOffset = new Date().getTimezoneOffset();
 
    // load notifications on startup 
    this.createNotifications();

    setInterval(() => {
      // update notifications;
      this.createNotifications();
        }, Number(config.notifications.delay));

    setInterval(() => {
     //refresh notifications queue every 10 seconds.
      this.notifications.length = 0;
      }, 10000);
  }

  gameLink(note: Notifications){
   
      // get local time
      var localTime = note.datetime;
       // adjust for time zone
      localTime.setMinutes(localTime.getMinutes() - this.zoneOffset);
      var day = localTime.getDate().toString();
      var month = (localTime.getMonth()+1).toString();

      if(day.length == 1){day = "0" + day}
      if(month.length == 1){month = "0" + month}
      var thisDay = localTime.getFullYear() + "-" + month + "-" + day 
      // get all league details
      this._data.getLeagueDataByName(note.leaguename).subscribe(league =>{
          // find the selected game
          this.calendar.presentModal(thisDay, note.starttime.substr(4,6) + ", " + note.starttime.substr(11,4),league, note.sportname, note);  
      });
  }

  createNotifications(){
  
     // add/subtract offset
    var today = new Date();
    var start = new Date();
    var end = new Date();

    // add/subtract time zone offset
    start.setMinutes(start.getMinutes() + this.zoneOffset);
    end.setMinutes(end.getMinutes() + this.zoneOffset);
    today.setMinutes(today.getMinutes() + this.zoneOffset);

    // start search at 10 days past
    start.setHours(today.getHours()-(24*10));

    // end search at 36 hours ahead
    end.setHours(end.getHours()+36);
   
    // convert to same format as stored data.
    var startDate  = this.convertDateTime(start);
    var endDate  = this.convertDateTime(end);

    this._data.getAllDataByDateRange(startDate, endDate).subscribe(data =>{
          this.allGames = data;
          var game: any;
         
          // loop through all the games
          for(game of this.allGames){
            var priority = "";
            var gametime = new Date(Number(game.datetime.substr(0,4)), Number(game.datetime.substr(5,2))-1, Number(game.datetime.substr(8,2)), Number(game.datetime.substr(11,2)), Number(game.datetime.substr(14,2)), Number(game.datetime.substr(17,2)));
            // diffrerence in minutes
            var diffTime = (gametime.getTime() - today.getTime()) / (1000*60);
            // first create notifications for games that start within one hour or less
            game.datetime = gametime;
            if(game.name == "Not Started"){
           
                if(diffTime < 0){priority = 'note note-high', this.addNote(game,priority, "SHOULD HAVE STARTED")};
                if (diffTime >= 0 && diffTime < 15){priority = 'note note-medium', this.addNote(game,priority, "STARTS IN " + Math.round(diffTime) + " MINUTES")};
                if (diffTime >= 15 && diffTime < 30){priority = 'note note-low', this.addNote(game,priority, "STARTS IN " + Math.round(diffTime) + " MINUTES")};
            }
            // create notifications for games that are estimated to finish within half hour or less
            if(game.name == "In Progress"){
              var elapsedtime = (today.getTime() - gametime.getTime()) / (1000*60);
              var timeremaining = game.duration - elapsedtime;
      
              if(timeremaining < 0){priority = 'note note-high', this.addNote(game,priority, "GAME MAY HAVE FINISHED")};
              if (timeremaining >=0 && timeremaining < 15 ){priority = 'note note-medium', this.addNote(game,priority, "GAME MAY FINISH SOON")};
              if (timeremaining >= 15 && timeremaining < 30){priority = 'note note-low', this.addNote(game,priority, "GAME MAY FINISH SOON")};
            }
          }
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
    return dateTime.getFullYear() + "-" + month + "-" + day;
}

  addNote(game: any, priority: string, message: string){
   
    var starttime = new Date(game.datetime);
    // adjust for time zone
    starttime.setMinutes(starttime.getMinutes() - this.zoneOffset);
    // only add a note if it isn't already in the list
    this.noteExists(game);
    this.notifications.unshift({ sportid: game.sportid, sportname: game.sportname,leagueid: game.leagueid, leaguename: game.league, 
      eventid: game.eventid, gameid: game.gameid, hometeam: game.hometeam , 
      awayteam: game.awayteam, starttime: starttime.toString().substring(0,21), class: priority, message: message, icon: game.icon, datetime: game.datetime, leagueicon: game.leagueicon});

    }

  noteExists(game: any){
    var note: any;
    for(note of this.notifications){
      if(note.gameid == game.gameid){
        var index = this.notifications.indexOf(game);
        this.notifications.splice(index,1);
      }
    }
  }
}
