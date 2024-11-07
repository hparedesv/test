import {LOCALE_ID, NgModule} from '@angular/core';
import {CommonModule, registerLocaleData} from '@angular/common';
import {HTTP_INTERCEPTORS} from '@angular/common/http';
import {PanelModule} from 'primeng/panel';
import {SelectButtonModule} from 'primeng/selectbutton';
import {RadioButtonModule} from 'primeng/radiobutton';
import {ButtonModule} from 'primeng/button';
import {TimelineModule} from 'primeng/timeline';
import {InputTextModule} from 'primeng/inputtext';
import {RippleModule} from 'primeng/ripple';
import {DropdownModule} from 'primeng/dropdown';
import {BadgeModule} from 'primeng/badge';
import {ToolbarModule} from 'primeng/toolbar';

import {InputNumberModule} from 'primeng/inputnumber';
import {CalendarModule} from 'primeng/calendar';
import {CardModule} from 'primeng/card';
import {StepsModule} from 'primeng/steps';
import {InputTextareaModule} from 'primeng/inputtextarea';
import {TabMenuModule} from 'primeng/tabmenu';
import {InputSwitchModule} from 'primeng/inputswitch';
import {TabViewModule} from 'primeng/tabview';
import {SkeletonModule} from 'primeng/skeleton';
import {FieldsetModule} from 'primeng/fieldset';
import {MessagesModule} from 'primeng/messages';
import {MessageModule} from 'primeng/message';
import {ProgressBarModule} from 'primeng/progressbar';
import {TreeTableModule, TreeTableToggler} from 'primeng/treetable';
import localeEs from '@angular/common/locales/es';
import { FileUploadModule } from 'primeng/fileupload';
import {ScrollTopModule} from "primeng/scrolltop";
import {ScrollPanelModule} from "primeng/scrollpanel";
import {PrimeNGConfig} from 'primeng/api';
import {ToggleButtonModule} from 'primeng/togglebutton';
import {ChartModule} from 'primeng/chart';
import {DialogModule} from 'primeng/dialog';
import {ConfirmDialogModule} from 'primeng/confirmdialog';
import {CheckboxModule} from 'primeng/checkbox';
import {SplitButtonModule} from 'primeng/splitbutton';
import {SidebarModule} from 'primeng/sidebar';
import {DynamicDialogModule} from 'primeng/dynamicdialog';
import {PickListModule} from 'primeng/picklist';

import {DataViewModule} from 'primeng/dataview';
import {AutoCompleteModule} from 'primeng/autocomplete';
import {TableModule} from 'primeng/table';
import {CarouselModule} from 'primeng/carousel';
import {PaginatorModule} from "primeng/paginator";
import {DividerModule} from "primeng/divider";
import {TagModule} from "primeng/tag";
import {MenuModule} from "primeng/menu";
import {MultiSelectModule} from 'primeng/multiselect';
import {ChipModule} from "primeng/chip";
import {FullCalendarModule} from "@fullcalendar/angular";
import {PasswordModule} from "primeng/password";
import {InputMaskModule} from "primeng/inputmask";
import {ProgressSpinnerModule} from "primeng/progressspinner";
import {TreeSelectModule} from "primeng/treeselect";
import {ListboxModule} from "primeng/listbox";
import {OrganizationChartModule} from "primeng/organizationchart";
import {SpeedDialModule} from "primeng/speeddial";
import {TooltipModule} from "primeng/tooltip";
import {ToastModule} from "primeng/toast";
import {RatingModule} from "primeng/rating";
import {OrderListModule} from "primeng/orderlist";

import { EditorModule } from 'primeng/editor';

import { ImageModule } from 'primeng/image';
import {PanelMenuModule} from "primeng/panelmenu";
import {ColorPickerModule} from "primeng/colorpicker";
import {FormsModule, ReactiveFormsModule} from "@angular/forms";
import {AuthInterceptorService} from "../services/interceptors/auth-interceptor.service";


registerLocaleData(localeEs);

@NgModule({

    declarations: [],
    imports: [
        FormsModule,
        ReactiveFormsModule,
        ButtonModule,
        SelectButtonModule,
        RadioButtonModule,
        ButtonModule,
        ToggleButtonModule,
        SplitButtonModule,
        TimelineModule,
        InputTextModule,
        CardModule,
        PanelModule,
        RippleModule,
        DropdownModule,
        BadgeModule,
        DialogModule,
        ConfirmDialogModule,
        ToolbarModule,
        StepsModule,
        InputNumberModule,
        CalendarModule,
        InputTextareaModule,
        TabMenuModule,
        InputSwitchModule,
        TabViewModule,
        SkeletonModule,
        FieldsetModule,
        MessagesModule,
        MessageModule,
        ProgressBarModule,
        TreeTableModule,
        TableModule,
        ChartModule,
        CheckboxModule,
        ScrollTopModule,
        ScrollPanelModule,
        DynamicDialogModule,
        ToastModule,
        TooltipModule,
        FullCalendarModule,
        PickListModule,
        DataViewModule,
        AutoCompleteModule,
        CarouselModule,
        CommonModule,
        PaginatorModule,
        DividerModule,
        TagModule,
        MenuModule,
        ChipModule,
        MultiSelectModule,
        PasswordModule,
        CheckboxModule,
        InputMaskModule,
        ProgressSpinnerModule,
        TreeSelectModule,
        ListboxModule,
        OrganizationChartModule,
        SpeedDialModule,
        OrganizationChartModule,
        FileUploadModule,
        ImageModule,
        PanelMenuModule,
        ColorPickerModule

    ],
    exports: [
        FormsModule,
        ReactiveFormsModule,
        ButtonModule,
        SelectButtonModule,
        RadioButtonModule,
        ButtonModule,
        ToggleButtonModule,
        SplitButtonModule,
        TimelineModule,
        InputTextModule,
        CardModule,
        PanelModule,
        RippleModule,
        DropdownModule,
        BadgeModule,
        ToolbarModule,
        StepsModule,
        InputNumberModule,
        CalendarModule,
        InputTextareaModule,
        TabMenuModule,
        InputSwitchModule,
        TabViewModule,
        SkeletonModule,
        FieldsetModule,
        MessagesModule,
        MessageModule,
        ProgressBarModule,
        TreeTableModule,
        TableModule,
        ChartModule,
        SidebarModule,
        DynamicDialogModule,
        TooltipModule,
        FullCalendarModule,
        ToastModule,
        ScrollTopModule,
        ScrollPanelModule,
        PickListModule,
        DataViewModule,
        AutoCompleteModule,
        ConfirmDialogModule,
        CarouselModule,
        CommonModule,
        PaginatorModule,
        DialogModule,
        DividerModule,
        TagModule,
        MenuModule,
        ChipModule,
        MultiSelectModule,
        PasswordModule,
        CheckboxModule,
        InputMaskModule,
        ProgressSpinnerModule,
        TreeSelectModule,
        ListboxModule,
        OrganizationChartModule,
        SpeedDialModule,
        OrganizationChartModule,
        FileUploadModule,RatingModule,
        OrderListModule,
        ImageModule,
        PanelMenuModule,
        EditorModule,
        ColorPickerModule

    ],
    providers: [
        // {provide: HTTP_INTERCEPTORS, useClass: AuthInterceptorService, multi: true},
        { provide: LOCALE_ID, useValue: 'es' }
    ],
})
export class GlobalPrimengConfigModule {
    constructor(private primengConfig: PrimeNGConfig) {
        this.primengConfig.setTranslation({
            startsWith: 'Empieza con',
            contains: 'Contiene',
            notContains: 'No contiene',
            endsWith: 'Termina con',
            equals: 'Igual a',
            notEquals: 'Diferente de',
            noFilter: 'Sin filtro',
            accept: 'Aceptar',
            reject: 'Cancelar',
            apply: 'Aplicar',
            clear: 'Limpiar',
            matchAll: 'Coincidir todo',
            matchAny: 'Coincidir cualquier',
            addRule: 'Agregar Regla',
            removeRule: 'Quitar Regla',
            dayNames: ["domingo", "lunes", "martes", "miércoles", "jueves", "viernes", "sábado"],
            dayNamesShort: ["dom", "lun", "mar", "mié", "jue", "vie", "sáb"],
            dayNamesMin: ["D", "L", "M", "X", "J", "V", "S"],
            monthNames: ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"],
            monthNamesShort: ["ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic"],

        });
        this.primengConfig.ripple = true;
    }

}
