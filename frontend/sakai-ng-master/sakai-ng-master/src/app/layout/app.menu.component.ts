import { OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { LayoutService } from '../services/app.layout.service';
import {EntitiesService} from "../services/entities/entities.service";

@Component({
    selector: 'app-menu',
    templateUrl: './app.menu.component.html'
})
export class AppMenuComponent implements OnInit {

    model: any[] = [];

    constructor(public layoutService: LayoutService,
                private entitiesService: EntitiesService) { }

    ngOnInit() {

        this.entitiesService.getAllTables().subscribe(
            (response) => {
                // this.tables = response;
                console.log('Tables:', response);
                const listEntityesMenu = [];
                for (let ind = 0; ind < response.length; ind++) {
                    listEntityesMenu.push({
                        label: response[ind],
                        icon: 'pi pi-fw pi-star',
                        routerLink: ['/entidad/' + response[ind]]
                    });
                }

                this.model = [
                    {
                        label: 'Inicio',
                        items: [
                            { label: 'Dashboard', icon: 'pi pi-fw pi-home', routerLink: ['/dashboard'] }
                        ]
                    },
                    {
                        label: 'Lista de Entidades',
                        items: listEntityesMenu
                    }
                ];
            },
            (error) => {
                console.error('Error fetching tables:', error);
            }
        );

    }
}
