import React, { useState, useEffect } from 'react';
import Header from "../components/Header/Header";
import ProductHeader from "../components/Product/ProductHeader";
import Ubication from "../components/Product/Ubication";
import Footer from "../components/Footer";
import Description from "../components/Product/Description";
import Characteristic from "../components/Product/Characteristic";
import ProductPolicy from "../components/Product/ProductPolicy";
import axios from "axios";

function Product() {

  const [productData, setProductData] = useState([]);
  const [productCityData, setProductCityData] = useState([]);
  const [productCategoryData, setProductCategoryData] = useState([]);
  
  const [id, setId] = useState(2);

  useEffect(() => {
    const fetchProductData = async () => {
      const resp = await axios.get(`/products/${id}`);
      setProductData(resp.data);
      
      console.log(resp.data);
    };
    fetchProductData();
  }, []);

  useEffect(() => {
    const fetchCityData = async () => {
      const resp = await axios.get(`/products/${id}`);
      setProductCityData(resp.data.city);
    };
    fetchCityData();
  }, []);

  useEffect(() => {
    const fetchCategoryData = async () => {
      const resp = await axios.get(`/products/${id}`);
      setProductCategoryData(resp.data.category);
    };
    fetchCategoryData();
  }, []);

  return (
    <div>
      <Header />
      <ProductHeader name={productData.name} category={productCategoryData.title}  />
      <Ubication city={productCityData.name} prov={productCityData.province} country={productCityData.country} />  
      <Description description={productData.description} />
      <Characteristic />
      <ProductPolicy cancellation={productData.cancellationPolicy} />
      <Footer />
    </div>
  );
}

export default Product;
