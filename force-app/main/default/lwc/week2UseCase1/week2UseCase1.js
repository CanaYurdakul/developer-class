import { LightningElement } from 'lwc';
import CASE_OBJECT from '@salesforce/schema/Case';
import CONTACT_NAME from '@salesforce/schema/Case.ContactId';
import ACCOUNT_NAME from '@salesforce/schema/Case.AccountId'
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class Week2UseCase1 extends LightningElement {
    objectName = CASE_OBJECT;
    recordId = "500Dn000007w9zpIAA";
    fields= {
        contactName: CONTACT_NAME,
        accountName: ACCOUNT_NAME,
        subject: SUBJECT_FIELD,
        priority: PRIORITY_FIELD,
        status: STATUS_FIELD,
        description: DESCRIPTION_FIELD,
        origin: ORIGIN_FIELD
    };

    successHandler() {
        const evt = new ShowToastEvent({
            title: "Success",
            message: "Case Information has been saved successfully!",
            variant:"success"
        });
        this.dispatchEvent(evt);
    }

    errorHandler() {
        const evt = new ShowToastEvent({
            title: "Error",
            message: "Error occurred please try again!",
            variant:"error"
        });
        this.dispatchEvent(evt);
    }
}