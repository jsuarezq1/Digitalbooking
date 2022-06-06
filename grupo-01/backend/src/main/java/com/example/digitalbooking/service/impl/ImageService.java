package com.example.digitalbooking.service.impl;

import com.example.digitalbooking.dto.ImageDTO;
import com.example.digitalbooking.dto.ProductDTO;
import com.example.digitalbooking.exceptions.BadRequestException;
import com.example.digitalbooking.exceptions.ResourceNotFoundException;
import com.example.digitalbooking.model.City;
import com.example.digitalbooking.model.Image;
import com.example.digitalbooking.model.Product;
import com.example.digitalbooking.repository.IImageRepository;
import com.example.digitalbooking.repository.IProductRepository;
import com.example.digitalbooking.service.IImageService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ImageService implements IImageService {

    @Autowired
    private IImageRepository imageRepository;

    @Autowired
    private IProductRepository productRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public ImageDTO findById(Long id) throws ResourceNotFoundException {
        Image image = imageRepository.findById(id).orElse(null);
        if(image == null) {
            throw new ResourceNotFoundException("There is no image with id=" + id + ".");
        }
        return mapDTO(image);
    }

    @Override
    public ImageDTO create(ImageDTO imageDTO) {
        imageDTO.setProduct(getProduct(imageDTO));
        Image image = mapEntity(imageDTO);
        return mapDTO(imageRepository.save(image));
    }

    @Override
    public void deleteById(Long id) throws ResourceNotFoundException, BadRequestException {
        Image image = imageRepository.findById(id).orElse(null);
        if(findById(id) == null) {
            throw new ResourceNotFoundException("There is no image with id=" + id + ".");
        }
        imageRepository.delete(image);
    }

    @Override
    public ImageDTO update(ImageDTO imageDTO) throws ResourceNotFoundException, BadRequestException {
        if(imageDTO.getId() == null) {
            throw new BadRequestException("The id cannot be null.");
        }
        if(findById(imageDTO.getId()) == null) {
            throw new ResourceNotFoundException("There is no image with id=" + imageDTO.getId() + ".");
        }

        imageDTO.setProduct(getProduct(imageDTO));

        Image image = mapEntity(imageDTO);
        Image newImageSave = imageRepository.save(image);
        return mapDTO(newImageSave);
    }

    @Override
    public List<ImageDTO> findAll() {
        List<Image> imageList = imageRepository.findAll();

        List<ImageDTO> imageDTOList = imageList.stream().map(image -> mapDTO(image)).collect(Collectors.toList());
        return imageDTOList;
    }

    @Override
    public Page<ImageDTO> findAll(Pageable pageable) {
        return null;
    }

    private Product getProduct(ImageDTO imageDTO) {
        Product product = productRepository.findById(imageDTO.getProduct().getId()).get();
        return product;
    }

    //Mapper
    private ImageDTO mapDTO(Image image) {
        ImageDTO imageDTO = modelMapper.map(image, ImageDTO.class);
        return imageDTO;
    }

    public Image mapEntity(ImageDTO imageDTO) {
        Image image = modelMapper.map(imageDTO, Image.class);
        return image;
    }
}
