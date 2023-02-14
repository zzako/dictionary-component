import { LightningElement, wire, track,api } from 'lwc';
import getDefinition from '@salesforce/apex/dictionaryCalloutHandler.getDefinition';
import getAudio from '@salesforce/apex/dictionaryCalloutHandler.getAudio';


export default class DictionaryAppComponent extends LightningElement {

    @api searchKey = '';
    @track data;
    @track audio;
    @track error;

    getInput(event) {
        this.searchKey = event.target.value;
    }

    handleSearch() {
        getDefinition({input: this.searchKey})
            .then((result) => {
                console.log(result)
                this.data = result;
                this.error = undefined;
            })
            .catch((error) => {
                console.log(error)
                this.error = error;
                this.data = undefined;
            });

            getAudio({input: this.searchKey})
            .then((result) => {
                console.log(result)
                this.audio = result;
                this.error = undefined;
            })
            .catch((error) => {
                console.log(error)
                this.error = error;
                this.audio = undefined;
            });     

}
}