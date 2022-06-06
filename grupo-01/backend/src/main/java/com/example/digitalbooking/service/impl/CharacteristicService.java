package com.example.digitalbooking.service.impl;

import com.example.digitalbooking.dto.CharacteristicDTO;
import com.example.digitalbooking.exceptions.BadRequestException;
import com.example.digitalbooking.exceptions.ResourceNotFoundException;
import com.example.digitalbooking.model.Characteristic;
import com.example.digitalbooking.repository.ICharacteristicRepository;
import com.example.digitalbooking.service.ICharacteristicService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CharacteristicService implements ICharacteristicService {

    @Autowired
    private ICharacteristicRepository characteristicRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public CharacteristicDTO findById(Long id) throws ResourceNotFoundException {
        Characteristic characteristic = characteristicRepository.findById(id).orElse(null);
        if(characteristic == null) {
            throw new ResourceNotFoundException("There is no characteristic with id=" + id + ".");
        }
        return mapDTO(characteristic);
    }

    @Override
    public CharacteristicDTO create(CharacteristicDTO characteristicDTO) {
        Characteristic characteristic = mapEntity(characteristicDTO);
        return mapDTO(characteristicRepository.save(characteristic));
    }

    @Override
    public void deleteById(Long id) throws ResourceNotFoundException, BadRequestException {
        Characteristic characteristic = characteristicRepository.findById(id).orElse(null);
        if(findById(id) == null) {
            throw new ResourceNotFoundException("There is no characteristic with id=" + id + ".");
        }
        characteristicRepository.delete(characteristic);
    }

    @Override
    public CharacteristicDTO update(CharacteristicDTO characteristicDTO) throws ResourceNotFoundException, BadRequestException {
        if(characteristicDTO.getId() == null) {
            throw new BadRequestException("The id cannot be null.");
        }
        if(findById(characteristicDTO.getId()) == null) {
            throw new ResourceNotFoundException("There is no characteristic with id=" + characteristicDTO.getId() + ".");
        }
        Characteristic characteristic = mapEntity(characteristicDTO);
        Characteristic newCharacteristicSave = characteristicRepository.save(characteristic);
        return mapDTO(newCharacteristicSave);
    }

    @Override
    public List<CharacteristicDTO> findAll() {
        List<Characteristic> characteristicList = characteristicRepository.findAll();

        List<CharacteristicDTO> characteristicDTOList = characteristicList.stream().map(characteristic -> mapDTO(characteristic)).collect(Collectors.toList());
        return characteristicDTOList;
    }

    @Override
    public Page<CharacteristicDTO> findAll(Pageable pageable) {
        return null;
    }

    //Mapper
    private CharacteristicDTO mapDTO(Characteristic characteristic) {
        CharacteristicDTO characteristicDTO = modelMapper.map(characteristic, CharacteristicDTO.class);
        return characteristicDTO;
    }

    public Characteristic mapEntity(CharacteristicDTO characteristicDTO) {
        Characteristic characteristic = modelMapper.map(characteristicDTO, Characteristic.class);
        return characteristic;
    }
}
