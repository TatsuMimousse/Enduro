"use strict";

const app = Vue.createApp({
    data() {
        return {
            searchString: "",
            drivers: [],
            currentDriver: {
                IdDriver: null,
                Name: null,
                Surname: null,
                Birthdate: null,
                IdCountry: null,
                Country: null,
                PostalCode: null,
                City: null,
                Number: null,
                Street: null,
                Payed: null,
                DepositReturned: null,
                BibNumber: null,
                IdColor: null,
                BibColorLabel: null,
                BackgroundColor: null,
                TextColor: null
            },
            tickets:[],
            countries: [],
            vehiculeTypes: [],
            bibColors: [],
            newVehicule: {
                plate: null,
                idType: null,
                ticketNumber: null
            },
            bibAttribution: {
                bibNumber: null
            },
            currentBibColor: {
                number: null,
                backgroundColor: null,
                textColor: null
            }
        }
    },
    methods:{
        searchDrivers() {
            let formData = new FormData();
            formData.append("searchString", this.searchString);
            fetch(`../request/DriverSearch`, { method: 'POST', body: formData })
                .then(response => response.json())
                .then(data => {
                    this.drivers = data;
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        },
        selectDriver(driver) {
            this.currentDriver = driver;
        },
        getDriverTickets(){
            fetch(`../request/GetDriverTickets?idDriver=${this.currentDriver.IdDriver}`, { method: 'GET' })
                .then(response => response.json())
                .then(data => {
                    this.tickets = data;
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        },
        initForm(){
            // réinitialise le formulaire
            this.currentDriver = {
                IdDriver: null,
                Name: null,
                Surname: null,
                Birthdate: null,
                IdCountry: null,
                Country: null,
                PostalCode: null,
                City: null,
                Number: null,
                Street: null,
                Payed: null,
                DepositReturned: null,
                BibNumber: null,
                IdColor: null,
                BibColorLabel: null,
                BackgroundColor: null,
                TextColor: null
            };
        },
        getCountries(){
            fetch(`../request/GetCountries`, { method: 'GET' })
                .then(response => response.json())
                .then(data => {
                    this.countries = data;
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        },
        getBibColors(){
            fetch(`../request/GetBibColors`, { method: 'GET' })
                .then(response => response.json())
                .then(data => {
                    this.bibColors = data;
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        },
        getVehiculeTypes(){
            fetch(`../request/GetVehiculeTypes`, { method: 'GET' })
                .then(response => response.json())
                .then(data => {
                    this.vehiculeTypes = data;
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        },
        getBibColor(){
            fetch(`../request/GetVehiculeTypes?bibNumber=${this.bibAttribution.bibNumber}`, { method: 'GET' })
                .then(response => response.json())
                .then(data => {
                    this.currentBibColor = data;
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        },
        upsertDriver(){
            let formData = new FormData();
            if(this.currentDriver.IdDriver != null)
                formData.append("idDriver", this.currentDriver.idDriver);
            formData.append("name", this.currentDriver.name);
            formData.append("surname", this.currentDriver.surname);
            formData.append("birthdate", this.currentDriver.birthdate);
            formData.append("idCountry", this.currentDriver.idCountry);
            formData.append("postalCode", this.currentDriver.postalCode);
            formData.append("city", this.currentDriver.city);
            formData.append("number", this.currentDriver.number);
            formData.append("street", this.currentDriver.street);
            fetch(`../request/UpsertDriver`, { method: 'POST', body: formData })
                .then(() => {
                    toastr["success"]("Yaaaayyyyy", "Nouveau coureur enregistré");
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        },
        addVehicule(){
            let formData = new FormData();
            formData.append("idDriver", this.currentDriver.idDriver);
            formData.append("plate", this.newVehicule.plate);
            formData.append("idType", this.newVehicule.idType);
            formData.append("ticketNumber", this.newVehicule.ticketNumber);
            fetch(`../request/InsertVehicule`, { method: 'POST', body: formData })
                .then(() => {
                    toastr["success"]("Yaaaayyyyy", "Véhicule enregistré");
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        },
        asignBib(){
            let formData = new FormData();
            formData.append("idDriver", this.currentDriver.idDriver);
            formData.append("plate", this.bibAttribution.bibNumber);
            fetch(`../request/BibAttribution`, { method: 'POST', body: formData })
                .then(() => {
                    toastr["success"]("Yaaaayyyyy", "Dossard assigné au coureur");
                })
                .catch(error => {
                    console.error('Error:', error);
                    toastr["error"]("Erreur", error);
                });
        }
    },
    computed : {
        shouldDisplayPayedBadge(){
            return this.currentDriver != null && this.currentDriver.payed;
        },
        shouldDisplayNotPayedBadge(){
            return this.currentDriver != null && !this.currentDriver.payed;
        },
        shouldDisplayDepositReturnedBadge(){
            return this.currentDriver != null && this.currentDriver.depositReturned;
        },
        selectedPrice() {
            const selectedType = this.vehiculeTypes.find(type => type.Id === this.newVehicule.idType);
            return selectedType ? selectedType.Price : null;
        },
        hasCurrentDriver(){
            return this.currentDriver != null;
        },
        computedBackgroundColor(){
            return this.currentBibColor.BackgroundColor;
        },
        computedTextColor(){
            return this.currentBibColor.TextColor;
        }
    },
    mounted() {
        this.initForm();
        this.getCountries();
        this.getBibColors();
        this.getVehiculeTypes();
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