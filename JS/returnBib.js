"use strict";

const app = Vue.createApp({
    data() {
        return {
            searchString: null,
            driver: null,
            tickets: []
        }
    },
    methods:{
        searchBibs() {
            let formData = new FormData();
            formData.append("bibNumber", this.searchString);
            fetch(`../request/DriverSearch`, { method: 'POST', body: formData })
                .then(response => {
                    if (!response.ok) {
                        return response.text().then(html => {
                            throw new Error(`Error ${response.status}: ${response.statusText} - ${html}`);
                        });
                    }
                    return response.json();
                })
                .then(data => {
                    if(data != null){
                        this.driver = data;
                        this.getDriverTickets();
                    }
                    else{
                        toastr["error"]("Erreur", "Dossard non trouvé !");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        },
        getDriverTickets(){
            fetch(`../request/GetDriverTickets?idDriver=${this.driver.Id}`, { method: 'GET' })
                .then(response => {
                    if (!response.ok) {
                        return response.text().then(html => {
                            throw new Error(`Error ${response.status}: ${response.statusText} - ${html}`);
                        });
                    }
                    return response.json();
                })
                .then(data => {
                    this.tickets = data;
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        },
        returnDeposit(){
            let formData = new FormData();
            formData.append("idDriver", this.driver.idDriver);
            formData.append("depositReturned", 1);
            fetch(`../request/ReturnDeposit`, { method: 'POST', body: formData })
                .then(() => {
                    toastr["success"]("Yaaaayyyyy", "La caution a bien été rendue");
                    this.searchBibs(); // Met à jour les informations du coureur
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        }
    },
    computed : {
        canReturnDeposit(){
            return this.driver != null && !this.driver.depositReturned;
        },
        shouldDisplayWarning(){
            return this.driver != null && this.driver.depositReturned;
        },
        computedBackgroundColor(){
            return this.driver.BackgroundColor;
        },
        computedTextColor(){
            return this.driver.TextColor;
        },
        fullAddress(){
            return `${this.driver.number} ${this.driver.street} - ${this.driver.postalCode} ${this.driver.city} - ${this.driver.country}`;
        },
        shouldDisplayBib(){
            return this.driver != null;
        }
    },
    mounted() {
        // Toastr setup
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    }
});

app.mount("#app");