package com.jwtest.spring.test.jsp.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jwtest.spring.test.jsp.domain.Seller;

@Mapper
public interface SellerRepository {
	public int insertSeller(
			@Param("name") String name
			,@Param("profileImage") String profileImage
			,@Param("temperature") double temperature);
	
	public Seller selectLastSeller();
	public Seller selectSeller(@Param("id") Integer id);
}
