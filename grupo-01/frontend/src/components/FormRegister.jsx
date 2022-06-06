import React, {useState} from 'react';
import '../styles/formRegister.css'

const FormRegister = () => {
    const [name, setName]= useState('');
    const [lastName, setLastName]= useState('');
    const [email, setEmail]= useState('');
    const [password, setPassword]= useState('');
    const [passConfirm, setPassConfirm]= useState('');
    
    const handleSubmit=(e) => {
        e.preventDefault();
    }
  
    return (
        <div className='login-container'>
            <form className='form-container' onSubmit={handleSubmit}>
            <div className='form-group-container'>
                <div className='name'>
                    <label className='label-1-form'>Nombre
                    <input className='input-1-form' type="text" onChange ={e => setName(e.target.value)}value={name} />
                    </label>
                </div>
                <div className='lastname'>
                    <label className='label-2-form'>Apellido
                    <input className='input-2-form' type="text" onChange ={e => setLastName(e.target.value)}value={lastName} />
                    </label>
                </div>
            </div>
            <label className='label-form'>Correo electrónico
            <input className='input-form' type="email" onChange ={e => setEmail(e.target.value)}value={email} />
            </label>
            <label className='label-form'>Contraseña
            <input className='input-form' type="password" onChange ={e => setPassword(e.target.value)} value={password} />
            </label>
            <label className='label-form'> Repetir contraseña
            <input className='input-form' type="password" onChange ={e => setPassConfirm(e.target.value)} value={passConfirm} />
            </label>
        </form>
        <button className='button-form'>Crear cuenta</button>
        
     </div>
  )
}

export default FormRegister