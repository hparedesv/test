import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import { MenuItem } from 'primeng/api';
import { LayoutService } from "../services/app.layout.service";
import {Router} from "@angular/router";
@Component({
    selector: 'app-topbar',
    templateUrl: './app.topbar.component.html'
})
export class AppTopBarComponent implements OnInit {

    @ViewChild('menubutton') menuButton!: ElementRef;
    @ViewChild('topbarmenubutton') topbarMenuButton!: ElementRef;
    @ViewChild('topbarmenu') menu!: ElementRef;

    constructor(public layoutService: LayoutService, private router: Router) { }

    ngOnInit(): void {
        // Redirige al usuario al login si no hay sesión activa
        if (!this.isSessionActive()) {
            this.router.navigate(['auth/login']);
        }
    }

    logout(): void {
        // Elimina los datos de la sesión, por ejemplo, token en localStorage o sesión
        localStorage.removeItem('token'); // Suponiendo que el token de sesión se guarda aquí
        this.router.navigate(['auth/login']);
    }

    private isSessionActive(): boolean {
        // Verifica si hay sesión activa (ej. si existe un token en localStorage)
        return !!localStorage.getItem('token'); // Devuelve true si hay token
    }
}
