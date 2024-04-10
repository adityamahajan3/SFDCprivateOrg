/**
 * @description       : 
 * @author            : aditya.mahajan@aethereus.com
 * @group             : 
 * @last modified on  : 04-10-2024
 * @last modified by  : aditya.mahajan@aethereus.com
**/
import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
        greeting = 'World';
        changeHandler(event) {
        this.greeting = event.target.value;
        }
}