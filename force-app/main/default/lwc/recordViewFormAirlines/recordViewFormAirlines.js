import { LightningElement } from 'lwc';
import AIRLINES_OBJECT from '@salesforce/schema/Airlines__c';
import NAME_FIELD from '@salesforce/schema/Airlines__c.Name';
import COUNTRY_FIELD from '@salesforce/schema/Airlines__c.Country__c';
import SLOGAN_FIELD from '@salesforce/schema/Airlines__c.Slogan__c';
import HEADQUARTERS_FIELD from '@salesforce/schema/Airlines__c.HeadQuaters__c';
import ESTABLISHED_FIELD from '@salesforce/schema/Airlines__c.Established__c';
import WEBSITE_FIELD from '@salesforce/schema/Airlines__c.Website__c';

export default class RecordViewFormAirlines extends LightningElement {
    objectName = AIRLINES_OBJECT;
    recordId = "a07Dn000003OZ1AIAW";
    fields = {
        name:NAME_FIELD,
        country:COUNTRY_FIELD,
        slogan:SLOGAN_FIELD,
        headQuart:HEADQUARTERS_FIELD,
        established:ESTABLISHED_FIELD,
        website:WEBSITE_FIELD
    };
}