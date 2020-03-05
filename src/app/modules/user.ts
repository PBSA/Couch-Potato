
import { Injectable } from '@angular/core';

@Injectable()

export class UserComponent {
    id: number = 0;
    username: string = '';
    salt: string = '';
    password: string = '';
}

export class Notifications{
    delay: number;
    start: number;
    end: number;
}

export class Config{
    notifications = new Notifications;
    api_url: string = '';
    version: string = '';
    title1: string = '';
    title2: string = '';
    logolarge: string = '';
    logosmall: string = '';
}