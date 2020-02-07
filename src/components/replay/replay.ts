import { Component } from '@angular/core';
import { ViewController } from 'ionic-angular';
import { DataComponent } from '../../app/modules/data';
import { AlertComponent } from '../../app/modules/alerts'; 

@Component({
  selector: 'replay',
  templateUrl: 'replay.html'
})
export class ReplayComponent {

  private sportData: any;
  private leagueData: any;
  private putData: any = {};
  private startDate: string = "";
  private endDate: string = "";
  private select_all: boolean = false;

  constructor(private viewCtrl: ViewController, private _data: DataComponent, private _alert: AlertComponent) {

    // get sport and leagues.
    this.getSports();
    this.getLeagues();
  }

  getSports(){
    // load all sports data 
    this._data.getSportsData().subscribe(sport =>{
      this.sportData = sport;
    });
  }

  getLeagues(){
    // load all league data for selected sport
    this._data.getSportsAndLeagueData().subscribe(league =>{
      this.leagueData = league;
    });
  }

  selectAll(){
    for (let sport of this.sportData){
      sport.isChecked = this.select_all;
        for (let league of this.leagueData){
          league.isChecked = this.select_all; 
        }
    }
  }

  runReplay(){
    // validate 
    if(this.startDate == ""){this._alert.showError("Start Date Error", "No start date entered"); return};
    if(this.endDate == ""){this._alert.showError("End Date Error", "No end date entered"); return};
    if(!this.compareDates(this.startDate, this.endDate)){this._alert.showError("Date Error", "Start date is after end date"); return};
    
    // loop through all selected sports
    var retval: any;
    for (let sport of this.sportData){
      if(sport.isChecked){
        var leagueString: string = '';
        // loop through all selected leagues
        for (let league of this.leagueData){
          if(league.isChecked && league.id == sport.id){
            leagueString += league.leaguename + '|'; // pipe seperated leagues as a comma screws with the url.
          }
        }
      // remove last pipe
      leagueString = leagueString.substring(0,leagueString.length-1);
      // create one replay for each sport - ** this stops possible race conditions **.
        this._data.runReplay(sport.name,leagueString,this.startDate, this.endDate).subscribe(data=>{
            retval=data;
        })
      }
    }
    this._alert.showSuccess("Replay Complete", "");
    this.dismiss();
  }

compareDates(startDate: string, endDate: string): boolean{
  // make sure start date is before end date
  return (new Date(startDate) <= new Date(endDate));
}
dismiss(){
  this.viewCtrl.dismiss();
}

}
