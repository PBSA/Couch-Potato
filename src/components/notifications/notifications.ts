import { Component } from '@angular/core';
import { Notifications} from '../../globals/globals';
import { DataComponent } from '../../app/modules/data'; 

@Component({
  selector: 'notifications',
  templateUrl: 'notifications.html'
})

export class NotificationsComponent {

  public notifications: Notifications[] = new Array();
  private counter: number =0;
  private allGames: any;
  private starttime: string;

  constructor(private _data: DataComponent) {

    // load notifications on startup 
    this.createNotifications();

    setInterval(() => {
      // update notifications every 3 seconds.
      this.createNotifications();
        }, 3000);

    setInterval(() => {
    // refresh notifications queue every 15 seconds.
      this.notifications = new Array();
      }, 15000);
  }

  createNotifications(){
    
    // add time zone offset
    var zoneOffset = new Date().getTimezoneOffset();

     // add/subtract offset
    var today = new Date();
    var start = new Date();
    var end = new Date();

    // add/subtract time zone offset
    start.setMinutes(start.getMinutes() + zoneOffset);
    end.setMinutes(end.getMinutes() + zoneOffset);
    today.setMinutes(today.getMinutes() + zoneOffset);

    // start search at 10 days past
    start.setHours(today.getHours()-(24*10));

    // end search at 2 hours ahead
    end.setHours(end.getHours()+2);
   
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
    return dateTime.getFullYear() + "-" + month + "-" + day;// + "T" + hour + ":" + minute + ":00.000Z";
}

  addNote(game: any, priority: string, message: string){
   
    var starttime = new Date(game.datetime);
    // only add a note if it isn't already in the list
    this.noteExists(game);
    this.notifications.unshift({ sportid: game.sportid, sportname: game.sportname,leagueid: game.leagueid, leaguename: game.league, 
      eventid: game.eventid, gameid: game.gameid, hometeam: game.hometeam , 
      awayteam: game.awayteam, starttime: starttime.toString().substring(0,21), class: priority, message: message, icon: game.icon});
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
