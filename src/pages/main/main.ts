import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams, Events} from 'ionic-angular';
import { HomePage} from '../home/home';
import { RegisterComponent } from '../../components/register/register';
import { ModalController } from 'ionic-angular';
import { HttpClient } from '@angular/common/http';
import { DataComponent } from '../../app/modules/data'; 
import { UserComponent, Config } from '../../app/modules/user'; 
import { AlertComponent } from '../../app/modules/alerts'; 
import * as Crypto from 'js-sha512';

@IonicPage()

@Component({
  selector: 'page-main',
  templateUrl: 'main.html',
})
export class MainPage {

  constructor(public navCtrl: NavController, public navParams: NavParams, private events: Events, private _user: UserComponent,
              private _ctrl: ModalController, private _data: DataComponent, private _alert: AlertComponent, 
             private _http: HttpClient, private _config: Config) {

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
    if(this._user.username == ""){this._alert.showError("Error", "Username not entered"); return};
    if(this._user.password == ""){this._alert.showError("Error", "Password not entered"); return};
    this.validate();
  }

  validate(){
    var userdata: any;
    
    // first get the record that matches the username.
    this._data.getUser(this._user.username).subscribe(user =>{
            userdata = user;
            if(Object.keys(userdata).length == 0){
              this._alert.showError("Error", "Invalid username or password")
              return;
            }
            else{
              // is the user active yet
              if(userdata[0].active == 'False'){
                this._alert.showError("Error", "Account is not yet active")
                return;
              }

              // encrypt password with salt and compare.
              this._user.salt = userdata[0].salt;
              var password1 = userdata[0].password;
              var password2 = Crypto.sha512_256(this._user.password + this._user.salt);

              if(password1 === password2){
                // success
                this._user.id = userdata[0].id;
                this._user.username = userdata[0].username;
                this._user.password  = password1;
                this.navCtrl.push(HomePage);
              }
              else{
                this._alert.showError("Error: ", "Invalid username or password");
              }
            }        
        },
        error => { // trap server errors
          console.log(error);
          this._alert.showError("Error: Unable to log in", "[504] " + error.message);
      },
    );
  }

}
