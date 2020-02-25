import { Component } from '@angular/core';
import { DataComponent } from '../../app/modules/data'; 
import { Events } from 'ionic-angular';

@Component({
  selector: 'sports',
  templateUrl: 'sports.html'
})

export class SportsComponent {

  //private allData: any;
  private allSports: any;
  private selectedTab: number = 1;

  constructor(private _data: DataComponent, public events: Events) {
   
    this.loadSportsData();
  
  }

  loadSportsData(){
    // load all sports data for tabs
   
    this._data.getSportsData().subscribe(sport =>{
      this.allSports = sport;
       // default to first sport
       this.events.publish('tab', this.allSports[0]) ;  
      this.events.publish('sports', this.allSports);
    });
  }

  sportClick(tab: number, sport: any){
    // select sport tab
    this.selectedTab = tab;
    sport.tab = tab;
    this.events.publish('tab', sport) ;   
  } 
  
}
