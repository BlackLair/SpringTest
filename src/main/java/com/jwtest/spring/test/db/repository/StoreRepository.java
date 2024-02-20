package com.jwtest.spring.test.db.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jwtest.spring.test.db.domain.Store;

@Mapper
public interface StoreRepository {
	public List<Store> selectStoreList();
}
