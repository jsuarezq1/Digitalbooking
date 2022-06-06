
package com.example.digitalbooking.service.impl;


import com.example.digitalbooking.dto.CategoryDTO;
import com.example.digitalbooking.dto.CityDTO;
import com.example.digitalbooking.exceptions.BadRequestException;
import com.example.digitalbooking.exceptions.ResourceNotFoundException;
import com.example.digitalbooking.model.Category;
import com.example.digitalbooking.model.City;
import com.example.digitalbooking.repository.ICityRepository;
import com.example.digitalbooking.service.ICityService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CityService implements ICityService {

    @Autowired
    private ICityRepository cityRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public CityDTO findById(Long id) throws ResourceNotFoundException {
        City city = cityRepository.findById(id).orElse(null);
        if(city == null) {
            throw new ResourceNotFoundException("There is no city with id=" + id + ".");
        }
        return mapDTO(city);
    }

    @Override
    public CityDTO create(CityDTO cityDTO) {
        City city = mapEntity(cityDTO);
        return mapDTO(cityRepository.save(city));
    }

    @Override
    public void deleteById(Long id) throws ResourceNotFoundException, BadRequestException {
        City city = cityRepository.findById(id).orElse(null);
        if(findById(id) == null) {
            throw new ResourceNotFoundException("There is no city with id=" + id + ".");
        }
        cityRepository.delete(city);
    }

    @Override
    public CityDTO update(CityDTO cityDTO) throws ResourceNotFoundException, BadRequestException {
        if(cityDTO.getId() == null) {
            throw new BadRequestException("The id cannot be null.");
        }
        if(findById(cityDTO.getId()) == null) {
            throw new ResourceNotFoundException("There is no city with id=" + cityDTO.getId() + ".");
        }
        City city = mapEntity(cityDTO);
        City newCitySave = cityRepository.save(city);
        return mapDTO(newCitySave);
    }

    @Override
    public List<CityDTO> findAll() {
        List<City> cityList = cityRepository.findAll();

        List<CityDTO> cityDTOList = cityList.stream().map(city -> mapDTO(city)).collect(Collectors.toList());
        return cityDTOList;
    }

    @Override
    public Page<CityDTO> findAll(Pageable pageable) {
        return null;
    }

    //Mapper
    private CityDTO mapDTO(City city) {
        CityDTO cityDTO = modelMapper.map(city, CityDTO.class);
        return cityDTO;
    }

    public City mapEntity(CityDTO cityDTO) {
        City city = modelMapper.map(cityDTO, City.class);
        return city;
    }
}
