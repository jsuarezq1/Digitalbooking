import React, { useState } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faEyeSlash, faEye } from '@fortawesome/free-solid-svg-icons';
import '../styles/formRegister.css';

const Form = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState(false);

    const handleSubmit = (e) => {
        e.preventDefault();
    }

    const togglePassword = () => {
        setPassword(!password);
      };

    return (
        <div className='login-container'>
            <form className='form-container' onSubmit={handleSubmit}>
                <label className='label-form'>Correo electrónico
                    <input className='input-form' type="email" onChange={e => setEmail(e.target.value)} value={email} />
                </label>
                <label className='label-form'>Contraseña
                    <div className='input-form-container'>
                        <input
                            className='input-form'
                            type={password ? "text" : "password"}
                            onChange={e => setPassword(e.target.value)}
                            //value={password}
                        />
                        {<FontAwesomeIcon
                            icon={faEyeSlash}
                            onClick={togglePassword}
                            className='eye'
                        />}
                        {/* {<FontAwesomeIcon
                            icon={faEye}
                            className='eye'
                        />} */}
                    </div>
                </label>
            </form>
            <button className='button-form'>Ingresar</button>

        </div>
    )
}

export default Form