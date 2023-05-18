import { LightningElement } from 'lwc';
import AIRLINES_OBJECT from '@salesforce/schema/Airlines__c';
import NAME_FIELD from '@salesforce/schema/Airlines__c.Name';
import COUNTRY_FIELD from '@salesforce/schema/Airlines__c.Country__c';
import SLOGAN_FIELD from '@salesforce/schema/Airlines__c.Slogan__c';
import HEADQUARTERS_FIELD from '@salesforce/schema/Airlines__c.HeadQuaters__c';
import WEBSITE_FIELD from '@salesforce/schema/Airlines__c.Website__c';
import ESTABLISHED_FIELD from '@salesforce/schema/Airlines__c.Established__c';
import LOGOURL_FIELD from '@salesforce/schema/Airlines__c.LogoURL__c';
import LOGO_FIELD from '@salesforce/schema/Airlines__c.Logo__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class RecordFormAirlines extends LightningElement {
    objectName = AIRLINES_OBJECT;
    recordId = "a07Dn000003OZ1AIAW";
    fields = [NAME_FIELD, COUNTRY_FIELD, SLOGAN_FIELD, HEADQUARTERS_FIELD, WEBSITE_FIELD, ESTABLISHED_FIELD, LOGOURL_FIELD, LOGO_FIELD];


    successHandler (){
        const evt = new ShowToastEvent({
            title:'Success',
            message: 'Airlines detail has been saved successfully!',
            variant: 'success'
        });
        this.dispatchEvent(evt);
    }
}