import { LightningElement } from 'lwc';

export default class QuerySelectors extends LightningElement {

    fruits =  ["Banana", "Strawberry", "Mango", "Blueberry"];

    clickHandler(event){
        //querySelector demo
        const h1elem = this.template.querySelector('h1');
        console.log(h1elem.innerText);
        h1elem.style.color = "##1c191b";
        h1elem.style.border = "2px solid red";
        h1elem.style.backgroundColor = "#d13bae";

        const pelem = this.template.querySelector('p');
        console.log(pelem.innerText);
        pelem.style.color = "#f0a905";
        pelem.style.border = "2px solid red";
        pelem.style.backgroundColor = "#8ef005";

        //querySelectorAll demo
        const divelems = this.template.querySelectorAll('div.child');
        divelems.forEach(item => {
            console.log(item.innerText);
            item.setAttribute("class", "slds-align_absolute-center");
        })
    }
}