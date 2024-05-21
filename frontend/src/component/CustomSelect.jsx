import { useEffect, useState } from "react"
import ApiHandler from "../controller/ApiHandler";
import axios from "axios";

let handler = new ApiHandler();
export default function CustomSelect(props) {
    const [options, setOptions] = useState([]);

    useEffect(() => {
        /* try {
            handler.getRequest("tema", temasGetted);
            
        } catch(ex) {
            console.log(ex);
        } */
        axios.get("http://localhost:8000/api/tema")
            .then((response ) =>  {
                temasGetted(response);
            })
            .catch((error) => {
                console.log(error);
            });
    }, []);

    function temasGetted(response) {
        let opts = [];
        response.data.forEach(element => {
            opts.push(element.temanev);
        });
        setOptions(opts);
    }

    function onSelectChange(event) {
        let val = event.target.value;

        if (val != 0) {
            props.onSelectedValue(val);
        }
        
    }


    return (
        <div>
            <select onChange={onSelectChange}>
                <option value="0" >Válassz témát!</option>
                {
                    options.map((option, index) => {
                        return (<option value={option} key={index}>{option}</option>)
                    })
                }
            </select>
        </div>
    )
}