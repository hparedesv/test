import { Injectable } from '@angular/core';
import {environment} from "../../../environments/environment";
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {Observable} from "rxjs";
import {tap} from "rxjs/operators";

@Injectable({
  providedIn: 'root'
})
export class EntitiesService {

    private apiUrl = environment.serverUrl + '/entities';

    constructor(private http: HttpClient) {}

    public getList(): Observable<any> {
        return this.http.get<any>(this.apiUrl);
    }

    getAllTables(): Observable<any> {
        return this.http.get<string[]>(this.apiUrl + '/all-tables');
    }

    getListado(tableName: string): Observable<any> {
        return this.http.get<any[]>(this.apiUrl + '/table-data/' + tableName);
    }

    getInfoEntity(tableName: string): Observable<any> {
        // modelo
        return this.http.get<any[]>(this.apiUrl + '/table-structure/' + tableName);
    }

    createTable(data: any): Observable<any> {
        // const headers = new HttpHeaders({
        //     'Content-Type': 'application/json',
        // });

        // return this.http.post<any>(this.apiUrl + '/create-table', data, { headers });
        return this.http.post<any>(this.apiUrl + '/create-table', data);
    }

    saveDataInTable(tableName: string, data: any): Observable<any> {
        return this.http.post<any>(this.apiUrl + '/add-data/' + tableName, data);
    }

    editDataInTable(tableName: string, id: number, data: any): Observable<any> {
        return this.http.put<any>(this.apiUrl + '/edit-data/' + tableName + '/' + id, data);
    }

    deleteDataInTable(tableName: string, id: number): Observable<any> {
        return this.http.delete<any>(this.apiUrl + '/delete-data/' + tableName + '/' + id);
    }
    deleteTable(tableName: string): Observable<any> {
        return this.http.delete<any>(`${this.apiUrl}/delete-table/${tableName}`);
    }

}
