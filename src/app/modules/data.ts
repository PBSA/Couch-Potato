
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders,HttpParams } from '@angular/common/http';
import 'rxjs/add/operator/map'
import { AlertComponent } from '../../app/modules/alerts'; 
import { Config } from '../../app/modules/user'; 

@Injectable()

export class DataComponent{

    private result: any;
    private url: string;
    private configFile: any;

    constructor(private http: HttpClient, private _alert: AlertComponent, private _config: Config) {   
        // load config data
            this.getClientConfig().subscribe(data => {
            this.configFile = data;
            this.url = this.configFile.api_url;
            _config.api_url = this.url;
            _config.notifications.delay = this.configFile.notifications.delay;
            _config.notifications.start = this.configFile.notifications.start;
            _config.notifications.end = this.configFile.notifications.end;
            _config.version = this.configFile.version;
            _config.title1 = this.configFile.title1;
            _config.title2 = this.configFile.title2;
            _config.logosmall = this.configFile.logosmall;
            _config.logolarge = this.configFile.logolarge;
        });
    }
    
    getClientConfig(){
        return this.http.get("assets/config.json");
    }

    getServerConfig(){
      return this.http.get(this.url +  "get_config_dataproxy.php")
      .map(data => this.result = data);
  }

    getHttpHeader(): HttpHeaders{
      return new HttpHeaders({'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'});
    }

    getJSONHeader(){
      return new HttpHeaders({'Content-Type' : 'application/json'});
    }

    getUser(username: string){
      return this.http.get(this.url +  "get_user.php", {params:{username: username}})
        .map(data => this.result = data);
    }

    verifyUser(putData: any){
      var headers = this.getHttpHeader();
      return this.http.post(this.url + "verify_email.php", putData, {headers}).subscribe(data=>{});
    }

    // incident calls
    addGame(putData: any){
      var headers = this.getJSONHeader();
      return this.http.post(this.url + "add_game.php?" , putData, {headers}).map( data =>  this.result = data);
    }

    startGame(putData: any){
      var headers = this.getJSONHeader();
      return this.http.post(this.url + "start_game.php?" , putData, {headers}).map( data =>  this.result = data);
    }

    addScore(putData: any){
      var headers = this.getJSONHeader();
      return this.http.put(this.url + "add_score.php?" , putData, {headers}).map( data =>  this.result = data);
    }

    finishGame(putData: any){
      var headers = this.getJSONHeader();
      return this.http.post(this.url + "finish_game.php?" , putData, {headers}).map( data =>  this.result = data);
    }

    cancelGame(putData: any){
      var headers = this.getJSONHeader();
      return this.http.post(this.url + "cancel_game.php", putData, {headers}).map( data =>  this.result = data);
    }
    // end of incident calls

    runReplay(sport: string, league: string, start: string, end: string){
      return this.http.get(this.url + "run_replay.php", {params:{sport: sport, leagues: league, start: start, end: end}})
        .map(data => this.result = data);
    }

    getAllDataByDateRange(startdate: string, enddate: string){
      return this.http.get(this.url + "get_all_data_by_date_range.php", {params:{startdate: startdate, enddate: enddate}})
        .map(data => this.result = data);
    }

    getSportsData(){
      return this.http.get(this.url + "get_all_sports.php")
      .map( data =>  this.result = data);
    }

    getSportsAndLeagueData(){
      return this.http.get(this.url + "get_sports_and_leagues.php")
      .map( data =>  this.result = data);
    }

    getLastGameIdByDateAndLeague(date: string, league: string){
      return this.http.get(this.url + "last_game_id_by_date_and_league.php", {params:{date: date, league: league}})
      .map( data =>  this.result = data)
    }

    getLeagueDataBySport(sport: number){
      return this.http.get(this.url + "get_leagues_by_sport.php", {params:{sport: sport.toString()}})
      .map( data =>  this.result = data);
    }

    getLeagueDataByName(league: string){
      return this.http.get(this.url + "get_league_data_by_name.php", {params:{league: league}})
      .map( data =>  this.result = data);
    }

    getTeamsByLeague(league: number){
      return this.http.get(this.url + "get_teams_by_league.php", {params:{league: league.toString()}})
      .map( data =>  this.result = data);
    }

    getGamesByLeagueAndDate(league: string, start: string, end: string){
      return this.http.get(this.url + "get_games_by_league_and_date.php", {params:{league: league, start: start, end: end}})
      .map( data =>  this.result = data);
    }

    addUser(putData:any){
      var headers = this.getHttpHeader();
      return this.http.post(this.url + "add_user.php", putData, {headers})
    }

    changePassword(putData: any){
      var headers = this.getJSONHeader();
      return this.http.put(this.url + "change_password.php?" , putData, {headers}).map( data =>  this.result = data);
    }

    deleteGame(putData: any){
      var headers = this.getHttpHeader();
      let httpParams = new HttpParams().set('id', putData.id);
      return this.http.delete(this.url + "delete_game.php", { params: httpParams, headers: headers});
    }

    deleteEvent(putData: any){
      var headers = this.getHttpHeader();
      let httpParams = new HttpParams().set('date', putData.date);
      httpParams.set('league', putData.league);
      return this.http.delete(this.url + "delete_event.php", { params: httpParams, headers: headers});
    }
  }
