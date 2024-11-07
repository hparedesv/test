import {Component, OnInit} from '@angular/core';

@Component({
  selector: 'app-list-entities',
  standalone: true,
  imports: [],
  templateUrl: './list-entities.component.html',
  styleUrl: './list-entities.component.scss'
})
export class ListEntitiesComponent implements OnInit {

    public listEntidades: any[] = [];

    constructor() {
    }

    ngOnInit(): void {

    }

}
