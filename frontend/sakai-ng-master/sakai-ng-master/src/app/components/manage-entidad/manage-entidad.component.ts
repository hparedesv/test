import {AfterContentInit, AfterViewInit, Component, OnInit, SimpleChanges} from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import {Global} from "../../utils/Global";
import {EntitiesService} from "../../services/entities/entities.service";
import {FormBuilder, FormGroup, ReactiveFormsModule, Validators} from "@angular/forms";
import {NgClass, NgForOf, NgIf, TitleCasePipe} from "@angular/common";
import {InputTextModule} from "primeng/inputtext";
import {ButtonModule} from "primeng/button";
import {GlobalPrimengConfigModule} from "../../global-primeng-config/global-primeng-config.module";

@Component({
    selector: 'app-manage-entidad',
    standalone: true,
    imports: [
        TitleCasePipe,
        ReactiveFormsModule,
        NgClass,
        InputTextModule,
        NgForOf,
        NgIf,
        ButtonModule,
        GlobalPrimengConfigModule
    ],
    templateUrl: './manage-entidad.component.html',
    styleUrl: './manage-entidad.component.scss'
})
export class ManageEntidadComponent implements OnInit, AfterContentInit, AfterViewInit {

    public tableName: string = '';
    public tableData: any[] = [];
    public dynamicForm: FormGroup;
    public formFields: any[]; // campos
    public flagEdition: boolean = false;

    constructor(private router: Router,
                private route: ActivatedRoute,
                private entitiesService: EntitiesService,
                private fb: FormBuilder) {
        this.dynamicForm = this.fb.group({});
    }

    ngAfterContentInit(): void {
    }

    ngAfterViewInit(): void {
    }

    ngOnInit(): void {

        // this.tableName = this.route.snapshot.paramMap.get('tableName');
        this.route.paramMap.subscribe((params) => {
            this.tableName = params.get('tableName') || '';
            this.loadTableData(this.tableName); // Llama a tu función de carga
        });
    }

    loadTableData(tableName: string) {
        // Aquí puedes implementar la lógica para cargar los datos
        console.log(`Cargando datos para la tabla: ${tableName}`);
        if (!Global.isNullOrUndefined(this.tableName)) {
            console.log('nombre de tabla', this.tableName);

            this.entitiesService.getInfoEntity(this.tableName).subscribe(
                (infoStructure) => {
                    // this.tables = response;
                    console.log('Estuctura:', infoStructure);
                    this.formFields = infoStructure;
                    this.buildForm();
                    this.entitiesService.getListado(this.tableName).subscribe(
                        (response) => {
                            console.log('datos:', response);
                            this.tableData = response;
                        });
                });
        }
    }

    buildForm() {
        this.formFields.forEach(field => {
            const control = this.fb.control(
                '',
                (field.is_nullable || this.ignoreCaseCampos(field.column_name)) ? [] : [Validators.required]
            );
            console.log(field.column_name + ': estado = ' + (field.is_nullable || this.ignoreCaseCampos(field.column_name)))
            this.dynamicForm.addControl(field.column_name, control);
        });
        console.log(this.dynamicForm)
    }

    onSubmit() {
        if (this.dynamicForm.valid) {
            console.log('Form Values:', this.dynamicForm.value);
            const jsonRequest = {...this.dynamicForm.value};

            delete jsonRequest.id;
            delete jsonRequest.createdAt;
            delete jsonRequest.updatedAt;
            if (!this.flagEdition) {
                this.entitiesService.saveDataInTable(this.tableName, jsonRequest).subscribe((resp) => {
                    console.log('resultado', resp);
                    this.loadTableData(this.tableName); // Recarga la tabla
                    this.dynamicForm.reset();
                    // update de tabla
                })
            } else {
                this.entitiesService.editDataInTable(this.tableName, this.dynamicForm.value.id, jsonRequest).subscribe((resp) => {
                    console.log('resultado edicion', resp);
                    this.loadTableData(this.tableName); // Recarga la tabla
                    this.dynamicForm.reset(); // Limpia el formulario
                    this.flagEdition = false; // Salir del modo edición
                })
            }
        }
    }

    ignoreCaseCampos(fieldName: string) {
        return ['id', 'createdAt', 'updatedAt'].indexOf(fieldName) > -1;
    }

    public editItem(item) {
        this.flagEdition = true;
        this.dynamicForm.patchValue(item);
    }

    public deleteItem(item) {
        // this.dynamicForm.patchValue(item);
        this.entitiesService.deleteDataInTable(this.tableName, item.id).subscribe((resp) => {
            console.log('resultado eliminacion', resp);
            this.loadTableData(this.tableName); // Recarga la tabla
            this.dynamicForm.reset(); // Limpia el formulario en caso de que esté en modo edición
            this.flagEdition = false;
            // update de tabla
        })
    }

    public cancel(): void {
        this.dynamicForm.reset(); // Limpia el formulario
        this.flagEdition = false; // Sale del modo edición
    }

    public confirmDelete() {

    }

    public deleteEntity(): void {
        if (confirm(`¿Estás seguro de que deseas eliminar la entidad "${this.tableName}"?`)) {
            this.entitiesService.deleteTable(this.tableName).subscribe({
                next: (response) => {
                    console.log('Entidad eliminada:', response);
                    alert(`La entidad "${this.tableName}" fue eliminada con éxito.`);
                    this.router.navigate(['/dashboard']).then(() => {
                        window.location.reload();
                    });
                },
                error: (error) => {
                    console.error('Error al eliminar la entidad:', error);
                    alert('Ocurrió un error al eliminar la entidad.');
                }
            });
        }
    }

}
