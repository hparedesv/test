import { Component } from '@angular/core';
import {FormBuilder, FormGroup, NgControl, Validators} from '@angular/forms';
import { AuthService } from 'src/app/services/auth.service';
import { Router } from '@angular/router';
import {Global} from "../../../utils/Global";
import {EntitiesService} from "../../../services/entities/entities.service";

@Component({
    selector: 'app-login',
    templateUrl: './login.component.html',
    styles: [`
        :host ::ng-deep .pi-eye,
        :host ::ng-deep .pi-eye-slash {
            transform:scale(1.6);
            margin-right: 1rem;
            color: var(--primary-color) !important;
        }
    `]
})
export class LoginComponent {
    loginForm: FormGroup;
    tablesData: { tableName: string; content: any[] }[] = [];
    constructor(
        private fb: FormBuilder,
        private authService: AuthService,
        private router: Router,
    private entitiesService: EntitiesService
    ) {
        this.loginForm = this.fb.group({
            username: ['', Validators.required],
            password: ['', Validators.required]
        });
    }
    ngOnInit(): void {
        this.loadTablesData(); // Cargar datos de tablas al iniciar el componente
    }
    onLogin(): void {
        if (this.loginForm.valid) {
            const { username, password } = this.loginForm.value;
            this.authService.login(username, password).subscribe(
                () => {

                    this.router.navigate(['/dashboard']); // Redirige al dashboard tras el login
                },
                error => {
                    alert('Error en el inicio de sesión. Por favor, verifica tus credenciales e intenta de nuevo.');
                    console.error('Login failed', error); // Maneja el error de login
                }
            );
        }
    }
    loadTablesData(): void {
        this.entitiesService.getAllTables().subscribe({
            next: (tables) => {
                tables.forEach((tableName: string) => {
                    this.entitiesService.getListado(tableName).subscribe({
                        next: (content) => {
                            this.tablesData.push({ tableName, content });
                        },
                        error: (error) => console.error(`Error fetching data for table ${tableName}:`, error)
                    });
                });
            },
            error: (error) => console.error('Error fetching table names:', error)
        });
    }
    isValidInputClass(attrName: string){
        return Global.isInvalidControlClass(this.loginForm, attrName);
    }
    isInvalidControlPanel(attrName: string){
        return Global.isInvalidControlPanel(this.loginForm, attrName);
    }
    isInvalid(attrName: string){
        return Global.isInvalid(this.loginForm, attrName);
    }
}
