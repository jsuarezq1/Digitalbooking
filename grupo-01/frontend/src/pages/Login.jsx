import { Link } from "react-router-dom";
import Form from "../components/Form";
import Title from "../components/Title";
import Note from "../components/NoteL";
import Header from "../components/Header/Header";
import Footer from "../components/Footer";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faXmark } from "@fortawesome/free-solid-svg-icons";
import "../styles/register.css";

function Login() {
  return (
    <div className="Login">
      <div className="header-form">
        <Header page="login" />
      </div>
      <div className="login-title-container">
        <Link to={"/"}>
          <FontAwesomeIcon icon={faXmark} className="fa-2xl" />
        </Link>
        <Title text="Iniciar sesión" />
        <Form />
        <Note />
      </div>
      <Footer />
    </div>
  );
}

export default Login;
