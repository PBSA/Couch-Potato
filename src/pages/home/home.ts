import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { NavController, NavParams, ModalController, Events } from 'ionic-angular';
import { DataComponent } from '../../app/modules/data'; 
import { UserComponent, Config } from '../../app/modules/user'; 
import { ReplayComponent } from '../../components/replay/replay'; 

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})

export class HomePage {

  public allSports : any;
  private localtime = Date.now().toString();
  private username: string = "";

  constructor(public navCtrl: NavController, private navParams: NavParams,private _data: DataComponent, 
              private modalCtrl: ModalController, private events: Events, private user: UserComponent, 
              private _http: HttpClient, private config: Config) {

      setInterval(() => {
        this.localtime = Date.now().toString();
      });

      console.log(config);
  }

  openReplay(){
    // display replay modal to get inputs.
    this.presentModal();
  }

  async presentModal() {
    let selectormodal = await this.modalCtrl.create(ReplayComponent,null,
        {cssClass: "replay-modal"});
    return await selectormodal.present();
}

  logOut(): void {
    // go to main page
    this.navCtrl.pop();
    }
}
