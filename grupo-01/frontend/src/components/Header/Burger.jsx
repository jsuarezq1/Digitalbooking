import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faFacebook,
  faInstagram,
  faLinkedinIn,
  faTwitter,
} from "@fortawesome/free-brands-svg-icons";
import { faXmark } from "@fortawesome/free-solid-svg-icons";
import "../../styles/burger.css";

const Burger = (props) => {
  const [clicked, setClicked] = useState(false);
  const handleClick = () => {
    setClicked(!clicked);
  };
  const closeMenu = () => {
    setClicked(false);
  };

  useEffect(() => {
    if (clicked) {
      document.body.style.overflow = "hidden";
    } else if (!clicked) {
      document.body.style.overflow = "unset";
    }
  }, [clicked]);

  return (
    <div className="burger-menu">
      <div onClick={handleClick} className={`bars ${clicked ? "ocultar" : ""}`}>
        <div className="bar"></div>
        <div className="bar"></div>
        <div className="bar"></div>
      </div>
      <div className={`${clicked ? "opacity" : "none"}`}></div>
      <div className={`open-menu ${clicked ? "" : "ocultar"}`}>
        <div className="menu">
          <FontAwesomeIcon
            icon={faXmark}
            className="fa-l"
            onClick={closeMenu}
          />
          <h4>MENÚ</h4>
        </div>
        <div className="links">
          {props.page === "register" ? (
            ""
          ) : (
            <Link to={"/register"}>Crear cuenta</Link>
          )}
          {props.page === "login" || props.page === "register" ? (
            ""
          ) : (
            <div className="line"></div>
          )}
          {props.page === "login" ? (
            ""
          ) : (
            <Link to={"/login"}>Iniciar sesión</Link>
          )}
        </div>
        <div className="icons">
          <FontAwesomeIcon icon={faFacebook} className="socials" />
          <FontAwesomeIcon icon={faLinkedinIn} className="socials" />
          <FontAwesomeIcon icon={faTwitter} className="socials" />
          <FontAwesomeIcon icon={faInstagram} className="socials" />
        </div>
      </div>
    </div>
  );
};

export default Burger;
