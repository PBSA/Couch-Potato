import { Component } from '@angular/core';
import { DataComponent } from '../../app/modules/data'; 
import { Events } from 'ionic-angular';

@Component({
  selector: 'leagues',
  templateUrl: 'leagues.html'
})
export class LeaguesComponent {

  
  public allSports : any;
  private selectedLeague: any;
  private selectedLeagueTab: number;
  private activeLeagues: any;

  constructor(private _data: DataComponent, private events: Events) {

    // default to first league tab
    this.selectedLeagueTab = 0;  
    
    // get the selected sport tab
    events.subscribe('tab', (sport: any) => {
        this.loadLeagues(sport.id);
        // when sport changes default to first league
        this.selectedLeagueTab = 0;
    });
  }

  loadLeagues(sport: number){
      this._data.getLeagueDataBySport(sport).subscribe(leagues =>{
        this.activeLeagues = leagues;
        this.events.publish('league', this.activeLeagues[0]);
      });
  }

   leagueClick(league: any, tab: number){
      this.selectedLeague = league;
      this.selectedLeagueTab = tab;
      this.events.publish('league', this.selectedLeague);
   }

}
