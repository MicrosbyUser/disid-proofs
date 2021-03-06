// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.springframework.roo.relatedreadonly.web;

import io.springlets.web.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.relatedreadonly.domain.City;
import org.springframework.roo.relatedreadonly.service.api.CityService;
import org.springframework.roo.relatedreadonly.web.CitiesItemJsonController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.util.UriComponents;

privileged aspect CitiesItemJsonController_Roo_JSON {
    
    declare @type: CitiesItemJsonController: @RestController;
    
    declare @type: CitiesItemJsonController: @RequestMapping(value = "/cities/{city}", name = "CitiesItemJsonController", produces = MediaType.APPLICATION_JSON_VALUE);
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param cityService
     */
    @Autowired
    public CitiesItemJsonController.new(CityService cityService) {
        this.cityService = cityService;
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return City
     */
    @ModelAttribute
    public City CitiesItemJsonController.getCity(@PathVariable("city") Long id) {
        City city = cityService.findOne(id);
        if (city == null) {
            throw new NotFoundException(String.format("City with identifier '%s' not found",id));
        }
        return city;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param city
     * @return ResponseEntity
     */
    @GetMapping(name = "show")
    public ResponseEntity<?> CitiesItemJsonController.show(@ModelAttribute City city) {
        return ResponseEntity.ok(city);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param city
     * @return UriComponents
     */
    public static UriComponents CitiesItemJsonController.showURI(City city) {
        return MvcUriComponentsBuilder
            .fromMethodCall(
                MvcUriComponentsBuilder.on(CitiesItemJsonController.class).show(city))
            .buildAndExpand(city.getId()).encode();
    }
    
}
