package com.example.digitalbooking.repository;


import com.example.digitalbooking.dto.ProductDTO;
import com.example.digitalbooking.model.Product;
import com.example.digitalbooking.service.impl.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IProductRepository extends JpaRepository<Product, Long> {
    @Query("select p from Product p where p.city.name like ?1")
    List<Product> filterByCity(@Param("name") String cityName);

    @Query("SELECT p FROM Product p WHERE LOWER(p.category.title) LIKE ('%' || LOWER(?1) || '%')")
    List<Product> findProductsByCategory(String category);

    @Query("SELECT p FROM Product p ORDER BY RAND()")
    List<Product> findAll();

    @Query("SELECT p FROM Product p ORDER BY RAND()")
    Page<Product> findAll(Pageable pageable);
}
