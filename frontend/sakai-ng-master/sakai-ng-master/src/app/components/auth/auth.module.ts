import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthRoutingModule } from './auth-routing.module';
import {GlobalPrimengConfigModule} from "../../global-primeng-config/global-primeng-config.module";
import {LoginComponent} from "./login/login.component";

@NgModule({
    imports: [
        CommonModule,
        AuthRoutingModule,
        GlobalPrimengConfigModule,
    ],
    declarations: [
        LoginComponent
    ]
})
export class AuthModule { }
