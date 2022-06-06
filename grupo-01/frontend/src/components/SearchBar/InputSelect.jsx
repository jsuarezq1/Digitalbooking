import React, { useState, useEffect} from 'react'
import '../../styles/inputSelect.css'
import Select from 'react-select';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faLocationDot } from '@fortawesome/free-solid-svg-icons';
import axios from 'axios';
import { faStackOverflow } from '@fortawesome/free-brands-svg-icons';

const customStyles = {
    container: () => ({
        width: '100%',
    }),
    control: (provided, state) => ({
        ...provided,
        height: '40px',
        border: state.isSelected ? 'none' : 'none',
        outline: state.isFocused ? 'none' : 'none',
        boxShadow: state.isFocused ? 'none' : 'none',
        cursor: 'pointer',
    }),
    menu: () => ({
        backgroundColor: 'var(--primary-color)',
        borderRadius: '0px 0px 5px 5px',
        boxShadow: '0px 4px 4px 0px #00000040',
        padding: '5px 0px',
        marginTop: '1px',
    }),
    option: (provided, state) => ({
        ...provided,
        borderBottom: '1px solid var(--secondary-color)',
        /*width: '95%',*/
        height: '60px',
        display: 'flex',
        backgroundColor:
        state.isSelected 
        ? 'white'  /* lo cambie porque se ponia todo el menu aquamarine */
        : state.isFocused 
        ? 'var(--color-1)' 
        : undefined,
        borderRadius: state.isSelected ? 'inherited' : 'none',
        cursor: 'pointer',
        /* "&:active": {
            backgroundColor: "#7cc3be",
        }, */
        "&:hover": {
            backgroundColor: "#7cc3be",
        }
    }),
    menuList: () => ({
        display: 'flex',
        flexDirection: 'column',
        height: '200px',
        overflowY: 'scroll',
    }),
    singleValue: (provided, state) => ({
        ...provided,
        display: 'flex',
        flexDirection: 'row',
        alignItems: 'flex-end'
    }),
    menuPortal: base => ({
        ...base,
        position: 'absolute',
        zIndex: 1
     })
}

const InputSelect = () => {
    /* const cities = [
        { city: 'Rosario', country: 'Argentina' },
        { city: 'Córdoba', country: 'Argentina' },
        { city: 'Bariloche', country: 'Argentina' },
        { city: 'Buenos Aires', country: 'Argentina' }
    ] */

    const [city, setCity] = useState(null)
    const [cities, setCities] = useState([])

    const onDropDownChange = (value) => {
        setCity(value)
        console.log(value)
    }

    useEffect(() => {
        const fetchCities = async () => {
          const resp = await axios.get(`/cities`);
          setCities(resp.data);
          console.log(resp.data)
        };
        fetchCities();
      }, [])

    const options = cities.map((elem, id) => {
        return {
            value: elem.city,
            label: (
                <div className={`cities-list ${id === cities.length - 1 && 'no-border'}`} >
                    <FontAwesomeIcon className='icon-list' icon={faLocationDot} />
                    <div className='list-item'>
                        <h4>{`${elem.name}`}</h4>
                        <p>{elem.country}</p>
                    </div>
                </div>
            ),
        };
    });

    return (
        <Select
            className='select'
            placeholder={
                < div className='placeholder' >
                    <FontAwesomeIcon className='icon-select' icon={faLocationDot} />
                    ¿A dónde vamos?
                </div >
            }
            styles={customStyles}
            options={options}
            onChange={onDropDownChange}
            components={{ 
                DropdownIndicator: () => null,
                IndicatorSeparator: () => null,
            }}
            isClearable
            menuPosition="fixed"
            
        />
    )
}

export default InputSelect;