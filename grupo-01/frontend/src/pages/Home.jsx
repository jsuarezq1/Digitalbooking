import React, { useEffect, useState } from "react";
import Header from "../components/Header/Header";
import Cards from "../components/Cards";
import Categories from "../components/Categories";
import Footer from "../components/Footer";
import SearchBar from "../components/SearchBar/SearchBar";
import axios from "axios";
import "../styles/home.css";

const Home = () => {

  const [categoriesData, setCategoriesData] = useState([]);
  let [products, setProducts] = useState([]);
  let [category, setCategory] = useState("");

  useEffect(() => {
    const fetchCategories = async () => {
      const resp = await axios.get(`/categories`);
      setCategoriesData(resp.data);
    };
    fetchCategories();
  }, [])

  useEffect(() => {
    const fetchProducts = async () => {
      const resp = await axios.get(`/products`);
      setProducts(resp.data);
    };
    fetchProducts();
  }, [])

  useEffect(() => {
    const fetchProductsByCategory = async () => {
      try {
        const resp = await axios.get(`products/category/${category}`);
        setProducts(resp.data);
      } catch (error) {
        console.warn(error)
      }
    };
    fetchProductsByCategory();
  }, [category]);

  const changeCategory = (value) => {
    setCategory(value)
  }

  return (
    <>
      <div className="header-home">
        <Header page={"home"} />
      </div>
      <div className="main">
        <SearchBar />
        <div className="categories-container">
          <h2>Buscar por tipo de alojamiento</h2>
          <div className="categos">
            {categoriesData.map((e) => (
              <Categories key={e.id} category={e.title} crimg={e.urlImage} changeCategory={changeCategory} />
            ))}
          </div>
        </div>
        <div className="suggestion">
          <h2>Recomendaciones</h2>
          <div className="card-container">
            {products.map((e) => {
              return (<Cards
                product={e}
                key={e.id}
              />)
            })}
          </div>
        </div>
      </div>
      <div className="footer-home">
        <Footer />
      </div>
    </>
  );
};

export default Home;
