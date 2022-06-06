import React from "react";
import { Link } from "react-router-dom";
import FormRegister from "../components/FormRegister";
import Title from "../components/Title";
import Note from "../components/NoteR";
import Header from "../components/Header/Header";
import Footer from "../components/Footer";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faXmark } from "@fortawesome/free-solid-svg-icons";
import "../styles/register.css";

const Register = () => {
  return (
    <div className="register">
      <div className="header-form">
        <Header page="register" />
      </div>
      <div className="login-title-container-reg">
        <Link to={"/"}>
          <FontAwesomeIcon icon={faXmark} className="fa-2xl" />
        </Link>
        <Title text="Crear cuenta" />
        <FormRegister />
        <Note />
      </div>
      <Footer />
    </div>
  );
};

export default Register;
