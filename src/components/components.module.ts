import { NgModule } from '@angular/core';
import { SportsComponent } from './sports/sports';
import { LeaguesComponent } from './leagues/leagues';
import { TeamsComponent } from './teams/teams';
import { CalendarComponent } from './calendar/calendar';
import { SelectorComponent } from './selector/selector';
import { NotificationsComponent } from './notifications/notifications';
import { ReplayComponent } from './replay/replay';
import { RegisterComponent } from './register/register';
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
    RegisterComponent],
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
    RegisterComponent]
})
export class ComponentsModule {}
