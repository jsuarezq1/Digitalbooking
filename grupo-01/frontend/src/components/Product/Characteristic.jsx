import React from "react";
import "../../styles/product/characteristicStyle.css";

import { IoPaw } from "react-icons/io5";
import { IoWifi } from "react-icons/io5";
import { IoSnow } from "react-icons/io5";
import { FaSwimmer } from "react-icons/fa";
import { MdTv } from "react-icons/md";
import { MdKitchen } from "react-icons/md";
import { AiFillCar } from "react-icons/ai";

const Characteristic = () => {
  return (
    <>
      <div className="container-characteristic">
        <h2>¿Qué ofrece este lugar?</h2>
        <hr />
        <div className="characteristic-icons">
          <div className="characteristic">
            <div>
              <p>
                <MdKitchen className="icon" /> Cocina
              </p>
            </div>
            <div>
              <p>
                <AiFillCar className="icon" /> Estacionamiento gratuito
              </p>
            </div>
            <div>
              <p>
                <MdTv className="icon" />
                Televisor
              </p>
            </div>
            <div>
              <p>
                <FaSwimmer className="icon" />
                Pileta
              </p>
            </div>
            <div>
              <p>
                <IoSnow className="icon" /> Aire Acondicionado
              </p>
            </div>
            <div>
              <p>
                <IoWifi className="icon" /> Wi-Fi
              </p>
            </div>
            <div>
              <p>
                <IoPaw className="icon" /> Apto mascotas
              </p>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Characteristic;
