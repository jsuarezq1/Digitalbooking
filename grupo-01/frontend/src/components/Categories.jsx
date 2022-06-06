import React from "react";
import "../styles/categories.css";

const Categories = ({ id, category, crimg, changeCategory }) => {

  const photo = {
    backgroundImage: `url(${crimg})`,
  };

  return (
      <>
        <div key={id} className="category-type" onClick={() => changeCategory(category)}>
          <div className="title">
            <h3>{category}</h3>
            <p>807.105 hoteles</p>
          </div>
          <div className="photo-category" style={photo}></div>
        </div>
      </>
   
  );
}

export default Categories;
