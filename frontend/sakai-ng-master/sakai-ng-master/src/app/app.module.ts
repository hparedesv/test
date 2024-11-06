import { NgModule } from '@angular/core';
import { HashLocationStrategy, LocationStrategy, PathLocationStrategy } from '@angular/common';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { AppLayoutModule } from './layout/app.layout.module';
import { NotfoundComponent } from './components/notfound/notfound.component';
import { ProductService } from './services/service/product.service';
import { CountryService } from './services/service/country.service';
import { CustomerService } from './services/service/customer.service';
import { EventService } from './services/service/event.service';
import { IconService } from './services/service/icon.service';
import { NodeService } from './services/service/node.service';
import { PhotoService } from './services/service/photo.service';
import {ReactiveFormsModule} from "@angular/forms";
import {AppConfigModule} from "./layout/config/config.module";
import {AppConfigComponent} from "./layout/config/app.config.component";

@NgModule({
    declarations: [
        AppComponent,
        NotfoundComponent,
        AppConfigComponent],
    imports: [
        AppRoutingModule,
        ReactiveFormsModule,
        AppLayoutModule],
    providers: [
        { provide: LocationStrategy, useClass: PathLocationStrategy },
        CountryService,
        CustomerService,
        EventService,
        IconService,
        NodeService,
        PhotoService,
        ProductService
    ],
   exports: [
    AppConfigComponent
],
    bootstrap: [AppComponent,],
})
export class AppModule {}
