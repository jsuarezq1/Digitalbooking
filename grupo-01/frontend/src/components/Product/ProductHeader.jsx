import React from 'react';
import { Link } from "react-router-dom";
import { IoChevronBackSharp } from "react-icons/io5";
import "../../styles/product/headerStyle.css";

const ProductHeader = ({name, category}) => {
  return (
    <>
      <div className="container-header-product">
        <div>
          <h4 className="category-product"> {category} </h4>
          <h3 className="product-name"> {name} </h3>
        </div>

        <div className="container-product-header">
          <Link to="/">
            <IoChevronBackSharp className="icon-home" />
          </Link>
        </div>
      </div>
    </>
  );
};

export default ProductHeader;
