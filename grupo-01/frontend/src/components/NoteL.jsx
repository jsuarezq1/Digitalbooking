import React from 'react';
import { Link } from "react-router-dom";
import '../styles/note.css';

const Note = () => {
  return (
    <div className='note-container'>
      <Link to={'/register'}>
        <p className='p-note'>¿Aún no tenes cuenta? <span>Registrate</span></p>
      </Link>
    </div>
  )
}

export default Note