import { getFieldDisplayValue, getFieldValue, getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

const FIELDS = [NAME_FIELD, INDUSTRY_FIELD, REVENUE_FIELD, PHONE_FIELD];

export default class UpdateRecordAccount extends LightningElement {
    recordId = "001Dn00000B9NLfIAN";
    industryOptions = [];
    formdata = {};

    changeHandler(event){
        const name = event.target.name;
        const value = event.target.value;
        this.formdata[name] = value;
    }
    updateHandler(){
        this.formdata["Id"] = this.recordId;
        const recordInput = {
            fields: this.formdata
        };
        updateRecord(recordInput)
            .then(result => {
                const toast = new ShowToastEvent({
                    title: "Success",
                    message: "Account record has been updated successfully!",
                    variant: "success"
                });
                this.dispatchEvent(toast);
            })
            .catch(error => {
                console.error(error);
                const toast = new ShowToastEvent({
                    title: error.StatusText,
                    message: error.body.message,
                    variant: "error"
                });
                this.dispatchEvent(toast);
            })
    }

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountInfo;

    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$accountInfo.data.defaultRecordTypeId'}) picklistHandler({data, error}){
        if (data) {
            this.industryOptions = data.values;
        }
    }

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    account;

    get name(){
        return getFieldValue(this.account.data, NAME_FIELD);
    }
    get industry(){
        return getFieldValue(this.account.data, INDUSTRY_FIELD);
    }
    get revenue(){
        return getFieldDisplayValue(this.account.data, REVENUE_FIELD);
    }
    get phone(){
        return getFieldValue(this.account.data, PHONE_FIELD);
    }
}
  