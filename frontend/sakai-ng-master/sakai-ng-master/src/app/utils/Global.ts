import {FormGroup} from "@angular/forms";


export class Global {

    public static isInvalidControlClass(formItem:FormGroup, attrName: string) {
        // return formItem[attrName].invalid && (formItem[attrName].touched || formItem[attrName].dirty);
        return Global.canFinAtrribProp(formItem, attrName, 'invalid')
        && (Global.canFinAtrribProp(formItem, attrName, 'touched')
        || Global.canFinAtrribProp(formItem, attrName, 'dirty'));
    }
    public static isInvalidControlPanel(formItem:FormGroup, attrName: string) {
        return Global.canFinAtrribProp(formItem, attrName, 'errors')
        && (Global.canFinAtrribProp(formItem, attrName, 'touched')
        || Global.canFinAtrribProp(formItem, attrName, 'dirty'));
    }

    public static canError(formItem:FormGroup, attrName: string) {
        return Global.canFinAtrribProp(formItem, attrName, 'errors');
    }
    public static isInvalid(formItem:FormGroup, attrName: string) {
        return Global.canFinAtrribProp(formItem, attrName, 'invalid');
    }

    public static canFinAtrribProp(formItem:FormGroup, attrName: string, propName: string) {

        if (Global.isNullOrUndefined(formItem)
            || Global.isNullOrUndefined(formItem[attrName])
            || Global.isNullOrUndefined(formItem[attrName][propName]))
            return false;

        return formItem.get(attrName)[propName];
    }

    public static isNullOrUndefined(data: any): boolean {
        return data === null || data === undefined;
    }

}
