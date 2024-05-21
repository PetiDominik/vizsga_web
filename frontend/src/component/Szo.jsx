import { useState } from "react"


export default function Szo(props) {
    const [visszajelzes, setVisszajelzes] = useState("");
    const [isDisabled, setIsDisabled] = useState(false);

    function onInputChange(event) {
        let newValue = event.target.value;
        if (newValue == "") {
            setVisszajelzes("");
        } else if (newValue == props.magyar) {
            setVisszajelzes("✔");
            props.changePoint(1);
            setIsDisabled(true);
        } else {
            setVisszajelzes("❌");
        }
    }

    return (
        <div className="szo">
            <div className="bold">
            {
                props.angol
            }
            </div>
            <div>
            <input type="text" onChange={onInputChange} disabled={isDisabled}/>
            </div>
            <div className="visszajelzes">
                {
                    visszajelzes
                }
            </div>
        </div>
    )
}