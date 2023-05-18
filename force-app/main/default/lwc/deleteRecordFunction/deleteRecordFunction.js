import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { deleteRecord } from 'lightning/uiRecordApi';

export default class DeleteRecordFunction extends LightningElement {
    recordId;

    changeHandler(event){
        this.recordId = event.target.value;
    }

    deleteHandler(){
        if (this.recordId.length == 15 || this.recordId.length == 18) {  
            deleteRecord(this.recordId)
                .then(result => {
                    this.prepareToast("Success", "Record has been deleted successfully!", "success");
                })
                .catch(error => {
                    this.prepareToast("Error", error.body.message, "error");
                })
        }else{
            this.prepareToast("Warning", "Please enter 15 or 18 digit record Id only!", "warning");
        }
    }

    prepareToast(title, message, variant){
        const toast = new ShowToastEvent({title, message, variant});       
        this.dispatchEvent(toast);
    }
}1