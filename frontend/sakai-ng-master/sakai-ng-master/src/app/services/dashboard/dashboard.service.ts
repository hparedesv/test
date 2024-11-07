import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';

@Injectable({
    providedIn: 'root'
})
export class DashboardService {

    private apiUrl = `${environment.serverUrl}/entities`;

    constructor(private http: HttpClient) {}

    // Crear una nueva tabla (entidad) con campos específicos
    createTable(data: any): Observable<any> {
        return this.http.post<any>(`${this.apiUrl}/create-table`, data);
    }
}
