import React from "react";
import { Link } from "react-router-dom";
import logo from "../../images/logoPrin.png";
import User from "./User";
import "../../styles/header.css";
import Burger from "./Burger";
import Button from "../Button";

const Header = (props) => {
  return (
    <>
      <header>
        <div className="blockLogo">
          <Link to="/">
            <img src={logo} alt="Logo"></img>{" "}
          </Link>
          <Link to="/">
            <p className="slogan">Sentite como en tu hogar</p>
          </Link>
        </div>
        <User />
        <div className="btn">
          <Burger page={props.page}></Burger>
          {props.page === "register" ? (
            ""
          ) : (
            <Button to="/register" name="Crear cuenta" />
          )}
          {props.page === "login" ? (
            ""
          ) : (
            <Button to="/login" name="Iniciar Sesión" />
          )}
        </div>
      </header>
    </>
  );
};

export default Header;
