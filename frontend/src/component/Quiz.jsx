import { useState } from "react";
import CustomSelect from "./CustomSelect";
import Szo from "./Szo";
import axios from "axios";


export default function Quiz(props) {
    const [szavak, setSzavak] = useState([]);
    const [points, setPoints] = useState(0);

    function valueChange(value) {
        axios.get("http://localhost:8000/api/szavak/"+ value)
            .then((response ) =>  {
                setSzavak(response.data)
            })
            .catch((error) => {
                console.log(error);
            });
    }

    function changePoint(point) {
        setPoints(points + point);
    }

    return (
        <div className="quiz">
            <CustomSelect onSelectedValue={valueChange}/>
            <div className="table">
                <div className="tableHead">
                    <div className="bold">ANGOL</div>
                    <div className="bold">MAGYAR</div>
                    <div className="normal">visszajelzés</div>
                </div>
                {
                    szavak.map((szo, index) => {
                        return (<Szo angol={szo.angol} magyar={szo.magyar} changePoint={changePoint}/>);
                    })
                }
            </div>
            <div className="osszpont"> Ön pontjai: {points}</div>
        </div>
    )
}