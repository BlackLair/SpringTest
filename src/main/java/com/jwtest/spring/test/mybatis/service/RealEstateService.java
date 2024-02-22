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
	
	public int insertRealEstateInstance(RealEstate realEstate) {
		int count = realEstateRepository.insertRealEstateInstance(realEstate);
		return count;
	}
	
	public int insertRealEstate(
			int realtorId
			, String address
			, int area
			, String type
			, int price
			, Integer rentPrice) {
		int count = realEstateRepository.insertRealEstate(
				realtorId
				, address
				, area
				, type
				, price
				, rentPrice);
		return count;
	}
	
	public int updateRealEstate(int id, String type, int price) {
		int count = realEstateRepository.updateRealEstate(id, type, price);
		return count;
	}
	
	public int deleteRealEstate(int id) {
		int count = realEstateRepository.deleteRealEstate(id);
		return count;
	}
}
