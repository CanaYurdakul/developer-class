import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined
    fullName = 'Cana';
    age = 38;
    location = {
        city: 'Kitchener',
        country: 'Canada',
        postalCode: 'N2G6H6'
    };
    birds = ["Crow", "Swan", "BlueJay", "Sparrow"];
}