package com.jwtest.spring.test.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jwtest.spring.test.mybatis.domain.RealEstate;
import com.jwtest.spring.test.mybatis.service.RealEstateService;

@RestController
public class RealEstateController {
	@Autowired
	RealEstateService realEstateService;
	
	@RequestMapping("/mybatis/real-estate/1")
	public RealEstate getRealEstate(@Param("id") int id) {
		RealEstate realEstate = realEstateService.getRealEstate(id);
		return realEstate;
	}
	
	@RequestMapping("/mybatis/real-estate/2")
	public List<RealEstate> getCheapRealEstate(@Param("rent") int rent){
		List<RealEstate> list = realEstateService.getCheapRealEstateList(rent);
		return list;
	}
	
	@RequestMapping("/mybatis/real-estate/3")
	public List<RealEstate> getGoodRealEstate(@Param("area") int area, @Param("price") int price){
		List<RealEstate> list = realEstateService.getGoodRealEstateList(area, price);
		return list;
		
	}
	
}
