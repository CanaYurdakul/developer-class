import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';

export default class Week2UseCase2 extends LightningElement {
    selectedName;
    selectedStage;
    selectedType;
    stageOptions=[];
    typeOptions=[];

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    oppInfo; 

    @wire(getPicklistValuesByRecordType, {objectApiName: OPP_OBJECT, recordTypeId: '$oppInfo.data.defaultRecordTypeId'}) picklistHandler({data, error}) {
        console.log(this.oppInfo.data);
        if (data) {
            console.log(data);
            this.stageOptions = data.picklistFieldValues.StageName.values;
            this.typeOptions = data.picklistFieldValues.Type.values;    
        }
        if (error) {
            console.error(error);   
        }
    }

    changeHandler(event){
        const evt = event.target.label;
        if(evt === 'Select Stage'){
            this.selectedStage = event.target.value;
        }else if(evt === 'Select Type'){
            this.selectedType = event.target.value;
        }else{
            this.selectedName = event.target.value;
        }
    }
}