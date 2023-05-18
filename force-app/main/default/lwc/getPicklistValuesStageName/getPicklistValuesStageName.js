import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';

export default class GetPicklistValuesStageName extends LightningElement {
    oppRtId;
    selectedStageName;
    stageNameOptions = [];

    @wire(getObjectInfo, {objectApiName:OPP_OBJECT})
    objectInfoHandler({data, error}) {
        if (data) {
            this.oppRtId = data.defaultRecordTypeId;
        }
    }
    @wire(getPicklistValues, {fieldApiName:STAGE_FIELD, recordTypeId:'$oppRtId'}) picklistHandler ({data, error}) {
        if (data) {
            console.log(data);
            this.stageNameOptions = data.values;   
        }
        if (error) {
            console.error(error);    
        }
    }
    changeHandler(event){
        this.selectedStageName = event.target.value;
    }
}