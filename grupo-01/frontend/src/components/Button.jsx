import React from "react";
import { Link } from 'react-router-dom';
import "../styles/header.css";
import '../styles/burger.css';


const Button = ({ name, to }) => {
  return <Link to={to} className="button">{name}</Link>;
};

export default Button;
