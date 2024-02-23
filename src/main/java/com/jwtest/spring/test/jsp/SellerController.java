package com.jwtest.spring.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jwtest.spring.test.jsp.domain.Seller;
import com.jwtest.spring.test.jsp.service.SellerService;

@RequestMapping("/jsp/seller")
@Controller
public class SellerController {
	@Autowired
	SellerService sellerService;
	
	@GetMapping("/input")
	public String inputSeller() { 
		return "/jsp/inputSeller";
	}
	
	@PostMapping("/create")
	@ResponseBody
	public String createSeller(
			@RequestParam("name") String name
			, @RequestParam("profileImage") String profileImage
			, @RequestParam("temperature") double temperature
			) {
		int count = sellerService.createSeller(name, profileImage, temperature);
		
		return "추가 성공 : " + count;
	}
	
	@GetMapping("/sellerInfo")
	public String getSellerInfo(Model model, @RequestParam(required=false) Integer id) {
		Seller seller = sellerService.getSellerInfo(id);
		model.addAttribute("seller", seller);
		return "/jsp/sellerInfo";
	}
}
