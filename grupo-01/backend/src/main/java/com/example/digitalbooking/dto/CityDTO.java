
package com.example.digitalbooking.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter @Setter
//@JsonIgnoreProperties(ignoreUnknown = true)

public class CityDTO {
    private Long id;
    private String name;
    private String province;
    private String country;

    @Override
    public String toString() {
        return "CityDTO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", province='" + province + '\'' +
                ", country='" + country + '\'' +
                '}';
    }
}
