import { LightningElement } from 'lwc';

export default class Week1UseCase4 extends LightningElement {
    num1=0;
    num2=0;

    sumOfNums = 0;

    changeHandler(event){
        if (event.target.name === "Number1") {
            this.num1 = event.target.value;    
        }else{
            this.num2 = event.target.value;
        }
       //if (this.num1 === undefined) {
        //    this.num1 = 0;    
        //}
        //if (this.num2 === undefined) {
        //    this.num2 = 0;    
        //}
        this.sumOfNums = Number(this.num1) + Number(this.num2);
    }
}