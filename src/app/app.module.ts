import { BrowserModule } from '@angular/platform-browser';
import { ErrorHandler, NgModule } from '@angular/core';
import { IonicApp, IonicErrorHandler, IonicModule } from 'ionic-angular';
import { SplashScreen } from '@ionic-native/splash-screen';
import { StatusBar } from '@ionic-native/status-bar';
import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { MainPage } from '../pages/main/main';
import { DataComponent} from './modules/data'; 
import { UserComponent, Config} from './modules/user'; 
import { AlertComponent } from './modules/alerts'; 
import { SelectorComponent } from '../components/selector/selector';
import { SportsComponent } from '../components/sports/sports';
import { LeaguesComponent } from '../components/leagues/leagues';
import { TeamsComponent } from '../components/teams/teams';
import { ReplayComponent } from '../components/replay/replay';
import { CalendarComponent } from '../components/calendar/calendar';
import { NotificationsComponent } from '../components/notifications/notifications';
import { RegisterComponent } from '../components/register/register';
import { HttpClientModule, HttpParams } from '@angular/common/http'; 

@NgModule({
  declarations: [
    MyApp,
    HomePage,
    MainPage,
    SportsComponent,
    LeaguesComponent,
    TeamsComponent,
    CalendarComponent,
    SelectorComponent,
    ReplayComponent,
    NotificationsComponent,
    RegisterComponent,
  ],

  imports: [
    BrowserModule,
    IonicModule.forRoot(MyApp),
    HttpClientModule,
  ],

  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    HomePage,
    MainPage,
    SelectorComponent,
    ReplayComponent,
    RegisterComponent,
  ],

  providers: [
    StatusBar,
    SplashScreen,
    DataComponent,
    UserComponent,
    Config,
    AlertComponent,
    SportsComponent,
    LeaguesComponent,
    TeamsComponent,
    CalendarComponent,
    NotificationsComponent,
    SelectorComponent,
    RegisterComponent,
    {provide: ErrorHandler, useClass: IonicErrorHandler}
  ]
})
export class AppModule {


}

