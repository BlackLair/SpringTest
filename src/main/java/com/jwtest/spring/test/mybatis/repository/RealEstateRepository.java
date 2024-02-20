package com.jwtest.spring.test.mybatis.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jwtest.spring.test.mybatis.domain.RealEstate;

@Mapper
public interface RealEstateRepository {
	public RealEstate selectRealEstate(@Param("id") int id);
	public List<RealEstate> selectCheapRealEstateList(@Param("rent") int rent);
	public List<RealEstate> selectGoodRealEstateList(@Param("area") int area, @Param("price") int price);
}

