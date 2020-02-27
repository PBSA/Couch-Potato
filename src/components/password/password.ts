
import { Component, ElementRef, ViewChild} from '@angular/core';
import { ViewController } from 'ionic-angular';
import { DataComponent } from '../../app/modules/data';
import { AlertComponent } from '../../app/modules/alerts'; 
import { UserComponent } from '../../app/modules/user'; 
import * as Crypto from 'js-sha512';

@Component({
  selector: 'password',
  templateUrl: 'password.html'
})
export class PasswordComponent {
   // change password component

  private currentPassword: string = "";
  private newPassword: string = "";
  private confirmNewPassword: string = "";

  @ViewChild('password2') password2: ElementRef;

  constructor(private viewCtrl: ViewController, private _data: DataComponent, 
    private _alert: AlertComponent, private _user: UserComponent) {
   
  }

  changePassword(){
    
    // need to validate first
    if(this.currentPassword == ""){this._alert.showError("Error", "Current password not entered"); return};
    if(this.validatePassword()==false){this._alert.showError("Error", "Current password is incorrect"); return};
    if(this.newPassword == ""){this._alert.showError("Error", "New password not entered"); return};
    if(this.newPassword.length < 8){this._alert.showError("Error", "New password must be at least 8 characters"); return};
    if(this.confirmNewPassword == ""){this._alert.showError("Error", "Confirm new password not entered"); return};
    if(this.newPassword != this.confirmNewPassword){
      this._alert.showError("Error", "New Password and Confirm New Password are different"); 
      this.confirmNewPassword="";
      this.password2.nativeElement.focus();
      return
    };
    
    // update user record
    var userData: any = {};
    var retval: any;
    
    // create new hashed password with the salt added.
    userData.salt = this.newGuid();
    userData.password  = Crypto.sha512_256(this.newPassword + userData.salt);
    userData.userid = this._user.id;
    userData.username = this._user.username;
   
    this._data.changePassword(userData).subscribe(data=>{
        retval = data;
        if(retval.status == "200"){ //all good
            this._alert.showSuccess(retval.title,retval.message);   
            this.viewCtrl.dismiss(); 
        }
        else{
          this._alert.showError("Error " + retval.status + ": Update Error", "[" + retval.subcode + "] " +  retval.title );
        }
    });
  }

  validatePassword(): boolean{
    // is current password correct
      var salt = this._user.salt;
      var password1 = this._user.password;
      var password2 = Crypto.sha512_256(this.currentPassword + salt);
      return (password1 === password2);
  }
  
  newGuid(){
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random() * 16 | 0,
        v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toString(16);
    });
  }

  dismiss(){
    this.viewCtrl.dismiss();
  }

}
