package com.example.digitalbooking.service;

import com.example.digitalbooking.dto.ProductDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IProductService extends ICRUDService<ProductDTO>{
    List<ProductDTO> filterByCity(String cityName);
    Page<ProductDTO> findAll(Pageable pageable);
}
