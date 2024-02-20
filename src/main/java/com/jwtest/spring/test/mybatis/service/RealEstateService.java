package com.jwtest.spring.test.mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwtest.spring.test.mybatis.domain.RealEstate;
import com.jwtest.spring.test.mybatis.repository.RealEstateRepository;

@Service
public class RealEstateService {
	@Autowired
	RealEstateRepository realEstateRepository;
	
	public RealEstate getRealEstate(int id) {
		RealEstate realEstate = realEstateRepository.selectRealEstate(id);
		return realEstate;
	}
	
	public List<RealEstate> getCheapRealEstateList(int rent){
		List<RealEstate> list = realEstateRepository.selectCheapRealEstateList(rent);
		return list;
	}
	
	public List<RealEstate> getGoodRealEstateList(int area, int price){
		List<RealEstate> list = realEstateRepository.selectGoodRealEstateList(area, price);
		return list;
	}
}
