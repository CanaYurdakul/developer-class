import { LightningElement, wire } from 'lwc';
import PRODUCT_OBJECT from '@salesforce/schema/EcommerceProduct__c';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { createRecord } from 'lightning/uiRecordApi';

export default class CreateRecordProduct extends LightningElement {
    formdata = {};

    @wire(getObjectInfo, {objectApiName:PRODUCT_OBJECT})
    productInfo;

    changeHandler(event){
        const name = event.target.name;
        const value = event.target.value;
        this.formdata[name] = value;
    }
    cancelHandler(){
        this.template.querySelector('form.productform').reset();
        this.template.querySelector('lightning-combobox').value = undefined;
        this.template.querySelector('lightning-combobox.cabox').value = undefined;
        this.formdata = {};
    }
    saveHandler(){
        const recordInput = {
            apiName: PRODUCT_OBJECT.objectApiName,
            fields: this.formdata
        };

         createRecord(recordInput)
            .then(result => {
                this.cancelHandler();
                this.successMessage();
            })
            .catch(error => {
                console.log("Error");
            })       
    }
    successMessage(){
        const toast = new ShowToastEvent({
            title: "Success",
            message: "Ecommerce Product record has been created successfully!",
            variant: "success"
        });
        this.dispatchEvent(toast);
    }

    get brandOptions(){
        return [
            {label: "Samsung", value: "Samsung"},
            {label: "Apple", value: "Apple"},
            {label: "Blackberry", value: "Blackberry"},
            {label: "Nokia", value: "Nokia"}
        ];
    }
    
    get categoryOptions(){
        return [
            {label: "Smartphones", value: "Smartphones"},
            {label: "Tablets", value: "Tablets"},
            {label: "Refrigerators", value: "Refrigerators"},
            {label: "Air Conditioners", value: "Air Conditioners"},
            {label: "Smart Watches", value: "Smart Watches"},
            {label: "Head Phones", value: "Head Phones"}
        ];
    }
}