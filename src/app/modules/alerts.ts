import { Injectable } from '@angular/core';
import { AlertController } from 'ionic-angular';

@Injectable()

// alert component for error messaged and pop-ups.
export class AlertComponent{

    constructor(private alertCtrl: AlertController) {
       
    }

    showAlert(game: any, subtitle: string): Promise<boolean> {
        return new Promise((resolve, reject) =>{
          const confirm = this.alertCtrl.create({
            title : game.hometeam + ' v ' + game.awayteam ,
            subTitle: subtitle + ' - Are you sure?',
            cssClass: "alert-popup",
            buttons: [
              {
                text: 'Yes',
                handler:_=> resolve(true)
              },
              {
                text: 'No',
                handler:_=> resolve(false)
              }
            ]
          }).present();
        })
      }
    
    // show error messages
    showError(title: string, message: string): Promise<boolean> {
        return new Promise((resolve, reject) =>{
            const confirm = this.alertCtrl.create({
            title : title,
            subTitle: message,
            cssClass: "error-popup",
            buttons: [
                {
                text: 'OK',
                handler:_=> resolve(true)
                }
            ]
            }).present();
        })
    }

    // show success messages
    showSuccess(title: string, message: string): Promise<boolean> {
      return new Promise((resolve, reject) =>{
          const confirm = this.alertCtrl.create({
          title : title,
          subTitle: message,
          cssClass: "success-popup",
          buttons: [
              {
              text: 'OK',
              handler:_=> resolve(true)
              }
          ]
          }).present();
      })
  }
}