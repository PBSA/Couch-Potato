import { Component, ElementRef, ViewChild} from '@angular/core';
import { ViewController } from 'ionic-angular';
import { DataComponent } from '../../app/modules/data';
import { Config } from '../../app/modules/user';
import { AlertComponent } from '../../app/modules/alerts'; 
import * as Crypto from 'js-sha512';


@Component({
  selector: 'register',
  templateUrl: 'register.html'
})
export class RegisterComponent {

 // registratoion component for new accounts
 private configData; any;
 private providerName: string = "";
 private userName: string = "";
 private password: string = "";
 private confirmPassword: string = "";
 private email: string = "";

 @ViewChild('password2') password2: ElementRef;

 constructor(private viewCtrl: ViewController, private _data: DataComponent, 
              private _alert: AlertComponent, private config: Config)  {

    // get the provider name
    this._data.getServerConfig().subscribe(data =>{
      this.configData = data;
      this.providerName = this.configData.providers.name;
    });
   
  }

  register(){
    // need to validate first
    if(this.userName == ""){this._alert.showError("Error", "Username not entered"); return};
    if(this.userName.length < 8){this._alert.showError("Error", "Username must be at least 8 characters"); return};
    if(this.password == ""){this._alert.showError("Error", "Password not entered"); return};
    if(this.password.length < 8){this._alert.showError("Error", "Password must be at least 8 characters"); return};
    if(this.confirmPassword == ""){this._alert.showError("Error", "Confirm Password not entered"); return};
    if(this.email == ""){this._alert.showError("Error", "Email not entered"); return};
    if(!this.emailIsValid(this.email)){
      this._alert.showError("Error", "Email is not valid"); 
      return
    }
    if(this.password != this.confirmPassword){
      this._alert.showError("Error", "Password and Confirm Password are different"); 
      this.confirmPassword="";
      this.password2.nativeElement.focus();
      return
    };
    
    // register new user.
    var userData: any = {};
    
    // create a hashed password with the salt added.
    userData.username =  this.userName;
    userData.salt = this.newGuid();
    userData.password  = Crypto.sha512_256(this.password + userData.salt);
    userData.email = this.email;
    this._data.addUser(userData).subscribe(data=>{
      this._alert.showSuccess("Registration Complete", "A verification email has been sent to " + this.email);   
    });

    //this._data.verifyUser(userData).subscribe(data=>{});
   
    this.viewCtrl.dismiss();
  }

  newGuid(){
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random() * 16 | 0,
        v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toString(16);
    });
  }

  emailIsValid (email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
  }

  dismiss(){
    this.viewCtrl.dismiss();
  }
  
}
