
import { Injectable } from '@angular/core';

@Injectable()

export class UserComponent {
    id: number = 0;
    username: string = '';
    salt: string = '';
    password: string = '';
}

export class Config{
    notifications: string = '';
    api_url: string = '';
    version: string = '';
    title1: string = '';
    title2: string = '';
    logolarge: string = '';
    logosmall: string = '';
}