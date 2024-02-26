package com.jwtest.spring.test.jsp.repository;

import org.apache.ibatis.annotations.Mapper;

import com.jwtest.spring.test.jsp.domain.Realtor;

@Mapper
public interface RealtorRepository {
	public int insertRealtor(Realtor realtor);
}
