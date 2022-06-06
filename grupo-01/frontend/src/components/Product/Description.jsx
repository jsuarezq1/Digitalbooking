import React from "react";
import "../../styles/product/descriptionStyle.css";

const Description = ({description}) => {
  return (
    <>
      <div className="container-description">
        <h2>Un entorno inigualable</h2>
        { !description? 'cargando...' : (description).split("/").map( e => <p>{e}</p>)}
      </div>
    </>
  );
};

export default Description;
