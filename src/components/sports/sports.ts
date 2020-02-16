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
    this.events.publish('tab', this.selectedTab);
   
  }

  loadSportsData(){
    // load all sports data for tabs
    this._data.getSportsData().subscribe(sport =>{
      this.allSports = sport;
      this.events.publish('sports', this.allSports);
    });
  }

  sportClick(sport: any, tab: number){
    // select sport tab
    this.selectedTab = tab;
    this.events.publish('tab', tab) ;   
    this.events.publish('sport', sport) ;  
  } 
  
}
