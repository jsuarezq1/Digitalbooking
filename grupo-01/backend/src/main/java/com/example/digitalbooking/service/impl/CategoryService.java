package com.example.digitalbooking.service.impl;

import com.example.digitalbooking.dto.CategoryDTO;
import com.example.digitalbooking.exceptions.BadRequestException;
import com.example.digitalbooking.exceptions.ResourceNotFoundException;
import com.example.digitalbooking.model.Category;
import com.example.digitalbooking.repository.ICategoryRepository;
import com.example.digitalbooking.service.ICategoryService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CategoryService implements ICategoryService {
    @Autowired
    private ICategoryRepository categoryRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public CategoryDTO findById(Long id) throws ResourceNotFoundException {
        Category category = categoryRepository.findById(id).orElse(null);
        if(category == null) {
            throw new ResourceNotFoundException("There is no category with id=" + id + ".");
        }
        return mapDTO(category);
    }

    @Override
    public CategoryDTO create(CategoryDTO categoryDTO) {
        Category category = mapEntity(categoryDTO);
        return mapDTO(categoryRepository.save(category));
    }

    @Override
    public void deleteById(Long id) throws ResourceNotFoundException, BadRequestException {
        Category category = categoryRepository.findById(id).orElse(null);
        if(findById(id) == null) {
            throw new ResourceNotFoundException("There is no category with id=" + id + ".");
        }
        categoryRepository.delete(category);
    }

    @Override
    public CategoryDTO update(CategoryDTO categoryDTO) throws ResourceNotFoundException, BadRequestException{
        if(categoryDTO.getId() == null) {
            throw new BadRequestException("The id cannot be null.");
        }
        if(findById(categoryDTO.getId()) == null) {
            throw new ResourceNotFoundException("There is no category with id=" + categoryDTO.getId() + ".");
        }
        Category category = mapEntity(categoryDTO);
        Category newCategorySave = categoryRepository.save(category);
        return mapDTO(newCategorySave);
    }

    @Override
    public List<CategoryDTO> findAll() {
        List<Category> categoryList = categoryRepository.findAll();

        List<CategoryDTO> categoryDTOList = categoryList.stream().map(category -> mapDTO(category)).collect(Collectors.toList());
        return categoryDTOList;
    }

    @Override
    public Page<CategoryDTO> findAll(Pageable pageable) {
        return null;
    }

    //Mapper
    private CategoryDTO mapDTO(Category category) {
        CategoryDTO categoryDTO = modelMapper.map(category, CategoryDTO.class);
        return categoryDTO;
    }

    public Category mapEntity(CategoryDTO categoryDTO) {
        Category category = modelMapper.map(categoryDTO, Category.class);
        return category;
    }
}
