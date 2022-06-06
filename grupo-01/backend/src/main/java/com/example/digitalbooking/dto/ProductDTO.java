package com.example.digitalbooking.dto;

//import com.example.digitalbooking.model.Category;
//import com.example.digitalbooking.model.City;
import com.example.digitalbooking.model.Category;
import com.example.digitalbooking.model.Characteristic;
import com.example.digitalbooking.model.City;
import com.example.digitalbooking.model.Image;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
//@JsonIgnoreProperties(ignoreUnknown = true)

public class ProductDTO {
    private Long id;
    private String name;
    private String description;
    private String address;
    private String houseRules;
    private String healthAndSafety;
    private String cancellationPolicy;
    private Category category;
    private List<Characteristic> characteristics;
    private City city;
    private List<Image> images;

    @Override
    public String toString() {
        return "ProductDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", address='" + address + '\'' +
                ", houseRules='" + houseRules + '\'' +
                ", healthAndSafety='" + healthAndSafety + '\'' +
                ", cancellationPolicy='" + cancellationPolicy + '\'' +
                ", category=" + category +
                ", characteristics=" + characteristics +
                ", city=" + city +
                ", images=" + images +
                '}';
    }
}
