package com.example.digitalbooking.service.impl;

import com.example.digitalbooking.dto.CategoryDTO;
import com.example.digitalbooking.dto.ProductDTO;
import com.example.digitalbooking.exceptions.BadRequestException;
import com.example.digitalbooking.exceptions.ResourceNotFoundException;
import com.example.digitalbooking.model.Category;
import com.example.digitalbooking.model.Characteristic;
import com.example.digitalbooking.model.City;
import com.example.digitalbooking.model.Product;
import com.example.digitalbooking.repository.ICategoryRepository;
import com.example.digitalbooking.repository.ICharacteristicRepository;
import com.example.digitalbooking.repository.ICityRepository;
import com.example.digitalbooking.repository.IProductRepository;
import com.example.digitalbooking.service.ICharacteristicService;
import com.example.digitalbooking.service.IProductService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class ProductService implements IProductService {

    @Autowired
    private IProductRepository productRepository;

    @Autowired
    private ICategoryRepository categoryRepository;

    @Autowired
    private ICharacteristicRepository characteristicRepository;

    @Autowired
    private ICityRepository cityRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public ProductDTO findById(Long id) throws ResourceNotFoundException {
        Product product = productRepository.findById(id).orElse(null);
        if(product == null) {
            throw new ResourceNotFoundException("There is no product with id=" + id + ".");
        }
        return mapDTO(product);
    }

    @Override
    public ProductDTO create(ProductDTO productDTO) {

        productDTO.setCategory(getCategory(productDTO));
        productDTO.setCharacteristics(getCharacteristicList(productDTO));
        productDTO.setCity(getCity(productDTO));

        Product product = mapEntity(productDTO);
        return mapDTO(productRepository.save(product));
    }

    @Override
    public void deleteById(Long id) throws ResourceNotFoundException, BadRequestException {
        Product product = productRepository.findById(id).orElse(null);
        if(findById(id) == null) {
            throw new ResourceNotFoundException("There is no Product with id=" + id + ".");
        }
        productRepository.delete(product);

    }

    @Override
    public ProductDTO update(ProductDTO productDTO) throws ResourceNotFoundException, BadRequestException {
        if(productDTO.getId() == null) {
            throw new BadRequestException("The id cannot be null.");
        }
        if(findById(productDTO.getId()) == null) {
            throw new ResourceNotFoundException("There is no product with id=" + productDTO.getId() + ".");
        }

        productDTO.setCategory(getCategory(productDTO));
        productDTO.setCharacteristics(getCharacteristicList(productDTO));
        productDTO.setCity(getCity(productDTO));

        Product product = mapEntity(productDTO);
        Product newProductSave = productRepository.save(product);
        return mapDTO(newProductSave);
    }

    @Override
    public List<ProductDTO> findAll() {
        List<Product> productList = productRepository.findAll();

        List<ProductDTO> productDTOList = productList.stream().map(product -> mapDTO(product)).collect(Collectors.toList());
        return productDTOList;
    }

    @Override
    public Page<ProductDTO> findAll(Pageable pageable) {
        Page<Product> productPage = productRepository.findAll(pageable);
        List<ProductDTO> productDTOList = productPage.stream().map(product -> mapDTO(product)).collect(Collectors.toList());
        Page<ProductDTO> productDTOPage = new PageImpl<ProductDTO>(productDTOList);
        return productDTOPage;
    }

    private Category getCategory(ProductDTO productDTO) {
        Category category = categoryRepository.findById(productDTO.getCategory().getId()).get();
        return category;
    }

    private List<Characteristic> getCharacteristicList(ProductDTO productDTO) {
        List<Characteristic> characteristicIdList = productDTO.getCharacteristics();
        List<Characteristic> characteristicList = new ArrayList<>();
        for (Characteristic c: characteristicIdList) {
            Characteristic characteristic = characteristicRepository.findById(c.getId()).get();
            characteristicList.add(characteristic);
        }
        return characteristicList;
    }

    private City getCity(ProductDTO productDTO) {
        City city = cityRepository.findById(productDTO.getCity().getId()).get();
        return city;
    }

    //Filtrar producto por ciudad
    @Override
    public List<ProductDTO> filterByCity(String cityName) {
        List<Product> products = productRepository.filterByCity(cityName);
        List<ProductDTO> productsDTO = new ArrayList<>();

        for (Product product: products) {
            productsDTO.add(mapDTO(product));
        }

        return productsDTO;
    }

    //Filtrar por categoria
    public List<ProductDTO> findProductsByCategory(String categoryTitle){
        List<Product> products = productRepository.findProductsByCategory(categoryTitle);

        List<ProductDTO> productsDTO = new ArrayList<>();
        for (Product product: products) {
            productsDTO.add(mapDTO(product));
        }
        return productsDTO;
    }

    //Mapper
    private ProductDTO mapDTO(Product product) {
        ProductDTO productDTO = modelMapper.map(product, ProductDTO.class);
        return productDTO;
    }

    public Product mapEntity(ProductDTO productDTO) {
        Product product = modelMapper.map(productDTO, Product.class);
        return product;
    }
}
