package com.jwtest.spring.test.jpa;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jwtest.spring.test.jpa.domain.Company;
import com.jwtest.spring.test.jpa.service.CompanyService;

@RequestMapping("/jpa/company")
@Controller
public class CompanyController {
	@Autowired
	CompanyService companyService;
	
	@GetMapping("/create")
	@ResponseBody
	public List<Company> createCompanies(){
		List<Company> companyList = new ArrayList<>();
		companyList.add(companyService.addCompany("넥슨", "컨텐츠 게임", "대기업", 3585));
		companyList.add(companyService.addCompany("버블팡", "여신 금융업", "대기업", 6834));
		return companyList;
	}
	
	@GetMapping("/update")
	@ResponseBody
	public Company updateCompany() {
		Company company = companyService.updateCompany(8, "중소기업", 34);
		return company;
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public String deleteCompany() {
		if(companyService.deleteCompany(8)) {
			return "삭제 성공";
		}
		return "삭제 실패 : 존재하지 않는 id";
	}
}
