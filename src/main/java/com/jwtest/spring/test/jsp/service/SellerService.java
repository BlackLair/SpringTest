package com.jwtest.spring.test.jsp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwtest.spring.test.jsp.domain.Seller;
import com.jwtest.spring.test.jsp.repository.SellerRepository;

@Service
public class SellerService {
	@Autowired
	SellerRepository sellerRepository;
	
	public int createSeller(
			String name
			, String profileImage
			, double temperature
			) {
		int count = sellerRepository.insertSeller(name, profileImage, temperature);
		return count;
	}
	
	public Seller getSellerInfo(Integer id) {
		Seller seller = null;
		if(id == null)
			seller = sellerRepository.selectLastSeller();
		else
			seller = sellerRepository.selectSeller(id);
		if(seller.getProfileImage() == null) {
			seller.setProfileImage("https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-for-website-design-or-mobile-app-no-photo-available_87543-11093.jpg?w=996");
		}
		return seller;
	}
	
}
