package com.jwtest.spring.test.db.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwtest.spring.test.db.domain.Store;
import com.jwtest.spring.test.db.repository.StoreRepository;

@Service
public class StoreService {
	@Autowired
	private StoreRepository storeRepository;
	
	public List<Store> storeList(){
		List<Store> storeList = storeRepository.selectStoreList();
		return storeList;
	}
	
}
