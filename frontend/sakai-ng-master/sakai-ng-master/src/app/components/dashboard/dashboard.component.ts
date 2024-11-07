import { Component, OnInit, OnDestroy } from '@angular/core';
import { MenuItem } from 'primeng/api';
import { Product } from '../../models/product';
import { ProductService } from '../../services/service/product.service';
import { Subscription, debounceTime } from 'rxjs';
import { LayoutService } from 'src/app/services/app.layout.service';
import {DashboardService} from "../../services/dashboard/dashboard.service";

@Component({
    selector: 'app-dashboard',
    templateUrl: './dashboard.component.html',
})
export class DashboardComponent {
    entityName = '';
    fieldsData: Array<{ name: string; type: string }> = [];
    fieldTypes = [
        { label: 'TEXT', value: 'TEXT' },
        { label: 'INTEGER', value: 'INTEGER' },
        { label: 'FLOAT', value: 'FLOAT' },
        { label: 'DOUBLE PRECISION', value: 'DOUBLE PRECISION' },
        { label: 'TIMESTAMP', value: 'TIMESTAMP' }
    ];

    constructor(private dashboardService: DashboardService) {}

    addField() {
        this.fieldsData.push({ name: '', type: '' });
    }

    removeField(index: number) {
        this.fieldsData.splice(index, 1);
    }

    // Validar el nombre del campo
    isFieldNameValid(name: string): boolean {
        const regex = /^[a-z_]+$/; // Solo letras minúsculas y guiones bajos
        return regex.test(name);
    }

    createEntity() {
        // Verificar que todos los nombres de campos sean válidos y tengan tipo seleccionado
        for (let field of this.fieldsData) {
            if (!this.isFieldNameValid(field.name)) {
                alert(`El nombre del campo '${field.name}' no es válido. Solo se permiten letras minúsculas y guiones bajos.`);
                return;
            }

            if (!field.type) {
                alert(`Por favor selecciona un tipo de dato para el campo '${field.name}'.`);
                return;
            }
        }
        // Construimos el objeto fields como un mapa de nombre: tipo
        const fields = this.fieldsData.reduce((acc, field) => {
            acc[field.name] = field.type;
            return acc;
        }, {} as { [key: string]: string });

        const tableData = {
            tableName: this.entityName,
            fields: fields
        };

        this.dashboardService.createTable(tableData).subscribe({
            next: () => {
                console.log('Entidad creada con éxito');
                this.entityName = '';
                this.fieldsData = [];
            },
            error: (error) => {
                alert(`Error al crear la entidad: ${error.error.message}`);
                console.error('Error en la creación:', error);
            }
        });
    }
}
