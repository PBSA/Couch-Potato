import { Component } from '@angular/core';
import { Events } from 'ionic-angular';

@Component({
  selector: 'teams',
  templateUrl: 'teams.html'
})
export class TeamsComponent {

  private selectedSport: any;
  private selectedSportLeagues: any;
  private selectedTab: number = 0;

  constructor(events: Events) {
    
    // get the selected tab
    events.subscribe('tab', (sport: any) => {
      this.selectedTab = sport.tab;
      this.selectedSport = sport;
      this.selectedSportLeagues=sport.leagues[0].teams;
    });

    events.subscribe('league', (tab: number, league: any) => {
      this.selectedTab = tab;
      this.selectedSportLeagues=league.teams;
    });
    
  }

}
