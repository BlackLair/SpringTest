package com.jwtest.spring.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jwtest.spring.test.jsp.domain.Realtor;
import com.jwtest.spring.test.jsp.service.RealtorService;

@RequestMapping("/realtor")
@Controller
public class RealtorController {
	@Autowired
	RealtorService realtorService;
	
	@GetMapping("/input")
	public String inputRealtor() {
		return "/jsp/inputRealtor";
	}
	
	@PostMapping("/create")
	public String createRealtor(Model model
			, @RequestParam("office") String office
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("address") String address
			, @RequestParam("grade") String grade) {
		Realtor realtor = new Realtor();
		realtor.setOffice(office);
		realtor.setPhoneNumber(phoneNumber);
		realtor.setAddress(address);
		realtor.setGrade(grade);
		int count = realtorService.createRealtor(realtor);
		model.addAttribute("result", realtor);
		return "/jsp/RealtorInfo";
		
	}
}
