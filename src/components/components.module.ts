import { NgModule } from '@angular/core';
import { SportsComponent } from './sports/sports';
import { LeaguesComponent } from './leagues/leagues';
import { TeamsComponent } from './teams/teams';
import { CalendarComponent } from './calendar/calendar';
import { SelectorComponent } from './selector/selector';
import { NotificationsComponent } from './notifications/notifications';
import { ReplayComponent } from './replay/replay';
import { RegisterComponent } from './register/register';
import { PasswordComponent } from './password/password';
@NgModule({
	declarations: [SportsComponent,
    LeaguesComponent,
    TeamsComponent,
    TeamsComponent,
    CalendarComponent,
    SelectorComponent,
    SelectorComponent,
    NotificationsComponent,
    ReplayComponent,
    RegisterComponent,
    PasswordComponent,
    PasswordComponent],
	imports: [],
	exports: [SportsComponent,
    LeaguesComponent,
    TeamsComponent,
    TeamsComponent,
    CalendarComponent,
    SelectorComponent,
    SelectorComponent,
    NotificationsComponent,
    ReplayComponent,
    RegisterComponent,
    PasswordComponent,
    PasswordComponent]
})
export class ComponentsModule {}
