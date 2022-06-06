import React, { useState } from 'react'
import InputSelect from './InputSelect';
import DatePicker from './DatePickerInput';
import TitleSB from './TitleSB';
import '../../styles/button.css'
import '../../styles/searchBar.css'

class SearchBar extends React.Component {
    constructor(props) {
        super(props);
        this.submit = this.submit.bind(this)
        this.submit = this.actualizarState.bind(this)
    }

    actualizarState(e) { }

    submit(e) { }

    render() {
        return (
            <div className='searchBar-container'>
                <div className='title-searchBar-container'>
                    <TitleSB
                        text="Busca ofertas en hoteles, casas y mucho más"
                    />
                </div>
                <div className='searchBar-structure'>
                    <div className='select-container' >
                        <InputSelect />
                    </div>
                    <DatePicker />
                    <button className='button-searchBar' type='submit'>Buscar</button>
                </div>
            </div>
        )
    }
}
export default SearchBar