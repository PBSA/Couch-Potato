
import { Injectable } from '@angular/core';

@Injectable()

export class UserComponent {
    id: number = 0;
    username: string = '';
    password: string = '';
}

export class Config{
    name: string = '';
    api_url: string = ''

}