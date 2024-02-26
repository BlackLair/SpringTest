package com.jwtest.spring.test.jsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwtest.spring.test.jsp.domain.Realtor;
import com.jwtest.spring.test.jsp.repository.RealtorRepository;

@Service
public class RealtorService {
	@Autowired
	RealtorRepository realtorRepository;
	
	public int createRealtor(Realtor realtor) {
		int count = realtorRepository.insertRealtor(realtor);
		return count;
	}
}
