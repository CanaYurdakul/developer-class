import { LightningElement } from 'lwc';

export default class Week1UseCase1 extends LightningElement {
    userName ;
    selectedRole;

    get roles(){
        return [
            {label: "Salesforce Admin", value:"Salesforce Admin"},
            {label: "Salesforce Developer", value:"Salesforce Developer"},
            {label: "Salesforce Architect", value:"Salesforce Architect"}    
        ];
    }
    userNameChangeHandler(event){
        this.userName = event.target.value;
    }
    roleChangedHandler(event){
        this.selectedRole = event.target.value;
    }

}