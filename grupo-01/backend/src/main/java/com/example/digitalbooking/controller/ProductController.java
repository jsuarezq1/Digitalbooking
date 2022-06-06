package com.example.digitalbooking.controller;

import com.example.digitalbooking.dto.CategoryDTO;
import com.example.digitalbooking.dto.ProductDTO;
import com.example.digitalbooking.exceptions.BadRequestException;
import com.example.digitalbooking.exceptions.GlobalExceptionHandler;
import com.example.digitalbooking.exceptions.ResourceNotFoundException;
import com.example.digitalbooking.model.Product;
import com.example.digitalbooking.service.impl.ProductService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/products")
@CrossOrigin(origins = "*")
public class ProductController {
    private static final Logger logger = Logger.getLogger(GlobalExceptionHandler.class);

    @Autowired
    private ProductService productService;

    @GetMapping("/{id}")
    public ResponseEntity<ProductDTO> findProductById(@PathVariable Long id)  throws ResourceNotFoundException {
        ProductDTO productDTO = productService.findById(id);
        logger.info("Product successfully returned: " + productDTO);
        return ResponseEntity.ok(productDTO);
    }

    @PostMapping
    public ResponseEntity<ProductDTO> createProduct(@RequestBody ProductDTO productDTO) throws ResourceNotFoundException {
        System.out.println(productDTO);
        ProductDTO productCreated = productService.create(productDTO);
        logger.info("Product successfully saved: " + productCreated);
        return ResponseEntity.ok(productCreated);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deleteProductById(@PathVariable Long id) throws ResourceNotFoundException, BadRequestException {
        productService.deleteById(id);
        logger.info("Product with id: " + id + ", successfully deleted.");
        return ResponseEntity.ok("Product deleted");
    }

    @PutMapping
    public ResponseEntity<ProductDTO> updateProduct(@RequestBody ProductDTO productDTO) throws ResourceNotFoundException, BadRequestException {
        ProductDTO productUpdated = productService.update(productDTO);
        logger.info("Product successfully updated: " + productDTO);
        return ResponseEntity.ok(productUpdated);
    }

    @GetMapping
    public ResponseEntity<List<ProductDTO>> findAllProducts() {
        List<ProductDTO> products = productService.findAll();
        logger.info(products.size() + (products.size() == 1 ? " product" : " products")  + " successfully returned.");
        System.out.println(products);
        return ResponseEntity.ok(products);
    }

    @GetMapping("/paged")
    public ResponseEntity<Page<ProductDTO>> findAllProducts(Pageable pageable) {
        Page<ProductDTO> products = productService.findAll(pageable);
        return ResponseEntity.ok(products);
    }

    @GetMapping("/city/{cityName}") //unificar nombres
    public ResponseEntity<List<ProductDTO>> filterByCity(@PathVariable String cityName) throws ResourceNotFoundException {
        List<ProductDTO> productsByCity = productService.filterByCity(cityName);
        logger.info(productsByCity.size() + (productsByCity.size() == 1 ? " product" : " products") + " successfully returned.");
        System.out.println(productsByCity);
        return ResponseEntity.ok(productsByCity);
    }

    @GetMapping("category/{category}") //unificar nombres
    public ResponseEntity<List<ProductDTO>> getProductByCategory(@PathVariable String category) {
        List<ProductDTO> products = productService.findProductsByCategory(category);
        if(products != null) {
            logger.info(products.size() + (products.size() == 1 ? " product" : " products") + " successfully returned.");
            return ResponseEntity.ok(products);
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }
}
