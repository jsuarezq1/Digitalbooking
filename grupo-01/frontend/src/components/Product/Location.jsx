import React from "react";
import { IoLocationSharp } from "react-icons/io5";

const Location = ({city, prov, country}) => {
  return (
    <>
      <div className="container-location-jsx">
        <IoLocationSharp className="location-icon" size={20}/>

        <div className="ubication">
          <p> {city}, {prov}, {country} </p>
          <p className="distance">A 940 m del centro</p>
        </div>
      </div>
    </>
  );
};

export default Location;
