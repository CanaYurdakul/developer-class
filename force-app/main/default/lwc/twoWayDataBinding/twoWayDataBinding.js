import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {
    fullName = "Cana";
    title = "Salesforce Developer";
    age = 38;

    titleChangeHandler(event){
        this.title = event.target.value;
    }
}