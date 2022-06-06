import React from "react";
import Location from "./Location";
import Score from "./Score";
import "../../styles/product/ubicationStyle.css";

const Ubication = ({city, prov, country}) => {
  return (
    <>
      <div className="container-ubication">
        <div className="container-location">
          <Location city={city} prov={prov} country={country} />
        </div>

        <div className="container-score">
          <Score />
        </div>
      </div>
    </>
  );
};

export default Ubication;
