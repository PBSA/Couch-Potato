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

    // load notifications on startup and then every 10 seconds
    this.createNotifications();

    setInterval(() => {
      // update notifications every 5 seconds.
      this.createNotifications();
        }, 3000);

    setInterval(() => {
    // refresh notifications queue every 15 seconds.
      this.notifications = new Array();
      }, 15000);
  }

  createNotifications(){

    var today = new Date();
    var startdate = new Date();
    var enddate = new Date();
   
    startdate.setHours(startdate.getHours()-(24*10));
    enddate.setHours(enddate.getHours()+2);

    // get all data between 5 days past and 2 hours ahead
    var start = startdate.toISOString().substring(0,10);
    var end = enddate.toISOString().substring(0,10)
    this._data.getAllDataByDateRange(start.toString(), end.toString()).subscribe(data =>{
          this.allGames = data;
          var game: any;
        // loop through all the games
          for(game of this.allGames){
            var priority = "";
            var datetime = new Date(game.date + " " + game.starttime);
            // diffrerence in minutes
            var diffTime = (datetime.getTime() - today.getTime()) / (1000*60);
            // first create notifications for games that start within one hour or less
            if(game.name == "Not Started"){
                if(diffTime < 0){priority = 'note note-high', this.addNote(game,priority, "SHOULD HAVE STARTED")};
                if (diffTime >= 0 && diffTime < 15){priority = 'note note-medium', this.addNote(game,priority, "STARTS IN " + Math.round(diffTime) + " MINUTES")};
                if (diffTime >= 15 && diffTime < 30){priority = 'note note-low', this.addNote(game,priority, "STARTS IN " + Math.round(diffTime) + " MINUTES")};
            }
            // create notifications for games that are estimated to finish within half hour or less
            if(game.name == "In Progress"){
              var elapsedtime = (today.getTime() - datetime.getTime()) / (1000*60);
              var timeremaining = game.duration - elapsedtime;
      
              if(timeremaining < 0){priority = 'note note-high', this.addNote(game,priority, "GAME MAY HAVE FINISHED")};
              if (timeremaining >=0 && timeremaining < 15 ){priority = 'note note-medium', this.addNote(game,priority, "GAME MAY FINISH SOON")};
              if (timeremaining >= 15 && timeremaining < 30){priority = 'note note-low', this.addNote(game,priority, "GAME MAY FINISH SOON")};
            }
          }
      });
  }

  addNote(game: any, priority: string, message: string){
   
    var starttime = new Date(game.date + ' ' + game.starttime);
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
