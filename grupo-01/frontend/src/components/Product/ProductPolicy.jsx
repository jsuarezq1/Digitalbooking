import React from "react";
import "../../styles/product/policyStyle.css";

const ProductPolicy = ({cancellation}) => {
  return (
    <>
      <div className="container-policy">
        <h2>¿Qué tenes que saber?</h2>
        <hr />

        <div className="policy">
          <div className="house-rules">
            <div>
              <h3>Normas de la casa</h3>
            </div>
            <div>
              <p>Check-out: 10:00</p>
              <p> No se permiten fiestas</p>
              <p>No fumar</p>
            </div>
          </div>

          <div className="security-policy">
            <div>
              <h3>Salud y seguridad</h3>
            </div>
            <div>
              <p>
                Se aplican las pautas de distanciamiento social y otras normas
                relacionadas al coronavirus
              </p>
              <p>Detector de humo</p>
              <p>Déposito de seguridad</p>
            </div>
          </div>

          <div className="cancellation-policy">
            <div>
              <h3>Política de cancelación</h3>
            </div>
            <div>
              <p>{cancellation}</p>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default ProductPolicy;
