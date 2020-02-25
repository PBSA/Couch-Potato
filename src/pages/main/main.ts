import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, Events} from 'ionic-angular';
import { HomePage} from '../home/home';
import { RegisterComponent } from '../../components/register/register';
import { ModalController } from 'ionic-angular';
import { HttpClient } from '@angular/common/http';
import { DataComponent } from '../../app/modules/data'; 
import { UserComponent } from '../../app/modules/user'; 
import { AlertComponent } from '../../app/modules/alerts'; 
import * as Crypto from 'js-sha512';


@IonicPage()

@Component({
  selector: 'page-main',
  templateUrl: 'main.html',
})
export class MainPage {
  
  title1 = 'Couch';
  title2 = 'Potato';

  constructor(public navCtrl: NavController, public navParams: NavParams, private events: Events, private user: UserComponent,
              private _ctrl: ModalController, private _data: DataComponent, private _alert: AlertComponent, 
             private _http: HttpClient) {
            
  }

  registerUser(){
      this.presentModal();
  }

  async presentModal() {
    let data = {};

    let registerModal = await this._ctrl.create(RegisterComponent, data, 
        {cssClass: "register-modal"}); 
    return await registerModal.present();
}

  onClickLogin(): void {

    //validate credentials
    if(this.user.username == ""){this._alert.showError("Error", "Username not entered"); return};
    if(this.user.password == ""){this._alert.showError("Error", "Password not entered"); return};
    this.validate(); 
    this.navCtrl.push(HomePage);
  }

    validate(){
      var userdata: any;
      
      // first get the record that matches the username.
      this._data.getUser(this.user.username).subscribe(user =>{
        userdata = user;
        if(Object.keys(userdata).length == 0){
          this._alert.showError("Error", "Invalid username or password")
          return;
        }
        else{
          // encrypt password with salt and compare.
          var salt = userdata[0].salt;
          var password1 = userdata[0].password;
          var password2 = Crypto.sha512_256(this.user.password + salt);

          if(password1 === password2){
            // success
            this.user.id = userdata[0].id;
            this.user.password = password2;
            this.navCtrl.push(HomePage);
          }
          else{
            this._alert.showError("Error", "Invalid username or password")
          }
        }         
      });
    }

}
