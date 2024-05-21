const { axios, Axios } = require("axios");


export default class ApiHandler {
    constructor() {
        //axios.defaults.baseURL = "";
    }

    getRequest(endpoint, callbackFn) {
        console.log("GET -> " + endpoint);
        axios.get("http://localhost:8000/api/" + endpoint)
        .then((response ) =>  {
            console.log(response);
            callbackFn(response);
        })
        .catch((error) => {
            console.log(error);
        });
    }
}

/*

export default class ApiHandler {
    #baseURL;
    constructor() {
        this.#baseURL = "http://localhost:8000/api/";
    }

    get(endpoint, callbackFn) {
        console.log("GET => " + this.#baseURL + endpoint);
        fetch(this.#baseURL + endpoint)
            .then(response => {
                console.log(response.body);
                callbackFn(response);
            })
            .catch(error => {
                console.log(error);
            })
    }
} */