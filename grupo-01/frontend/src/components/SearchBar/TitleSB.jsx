import React from 'react';


const Title = (props) => {
  const{text}=props;


  return (
    <div className='title-sb-container'>
      <label className='title-sb-label'> {text} </label>

    </div>
  )
}

export default Title