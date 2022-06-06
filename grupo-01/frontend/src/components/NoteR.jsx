import React from 'react';
import { Link } from "react-router-dom";
import '../styles/note.css';

const Note = () => {
  return (
    <div className='note-container'>
      <Link to={'/login'}>
        <p className='p-note a-note'>¿Ya tienes una cuenta? <span>Iniciar sesión</span></p>
      </Link>
    </div>
  )
}

export default Note