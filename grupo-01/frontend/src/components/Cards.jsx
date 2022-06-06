import React, { useState } from 'react';
import { useNavigate, useParams } from "react-router-dom";
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faHeart, faStar } from '@fortawesome/free-solid-svg-icons';
import '../styles/cards.css';

const Cards = ({product}) => {

  let toProduct = useNavigate();
  /*let {idP} = useParams();

   const [idParam, setIdParam] = useState(''); */

  const photoHotel = {
    backgroundImage: `url(${product.images.find( im => im.title === "main").urlImage})`
  }
  /* console.log(product.images.find( im => im.title === "main").urlImage) */
  /* const [isLoading, setIsLoading] = useState(true); */
  /* const [products, setProducts] = useState({});
  useEffect(() => {
    const fetchData = async () => {
      try {
        const result = await fetch("http://localhost:8080/products")
          .then((response) => response.json())
          .then((products) => {
            setProducts(products);
            setIsLoading(false);
            console.log(products);
          });

          //console.log(result);
      }
      catch (e) {
        console.log(e);
      }
    };
    fetchData();
  }, []); */


/*   if (isLoading) {
    return (
      <div>
        <h1>Cargando...</h1>
      </div>
    );
  } */
  return (
    <>
      <div key={product.id} className='card'>
        <div className='photo-card'style={photoHotel}>
          <FontAwesomeIcon icon={faHeart} className="fa-xl heart" />
        </div>
        <div className='text'>
              <div className='rating'>
                <span>8</span>
                <p>Muy Bueno</p>
              </div>
          <div className='title-hotel'>
            <div className='stars'>
              <div className='star-hotel'>HOTEL
                <FontAwesomeIcon icon={faStar} className="fa-l star" />
              </div>
            </div>
            <h3>{product.name}</h3>
          </div>
          <div className='info'>
            <h4>{product.category.title}</h4>
            <p className='description-card'>{product.category.description}</p>
          </div>
          <div className='more'>
            <button onClick={()=>{ toProduct(`/${product.category.title}/${product.name.replace(/ /g, '')}`)}} className="button">ver más</button>
          </div>
        </div>
      </div>
    </>
  )
}

export default Cards