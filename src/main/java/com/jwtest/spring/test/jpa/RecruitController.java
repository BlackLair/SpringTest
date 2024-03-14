package com.jwtest.spring.test.jpa;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jwtest.spring.test.jpa.domain.Recruit;
import com.jwtest.spring.test.jpa.service.RecruitService;

@Controller
@RequestMapping("/jpa/recruit")
public class RecruitController {
	@Autowired
	private RecruitService recruitService;
	
	@GetMapping("/search-8")
	@ResponseBody
	public Recruit searchRecruitEight() {
		return recruitService.searchRecruit(8);
	}
	
	@GetMapping("/search-company")
	@ResponseBody
	public List<Recruit> searchByCompany(@RequestParam("companyId") int companyId){
		return recruitService.searchRecruitByCompanyId(companyId);
	}
	
	@GetMapping("/fulltime-backend-developer")
	@ResponseBody
	public List<Recruit> searchFullTimeBackendDeveloper(){
		return recruitService.searchRecruitByPositionAndType("웹 back-end 개발자", "정규직");
	}
	
	@GetMapping("/fulltime-or-big-salary")
	@ResponseBody
	public List<Recruit> fullTimeOrBigSalary(){
		return recruitService.searchRecruitByTypeOrSalary("정규직", 9000);
	}
	
	@GetMapping("/parttime-top3")
	@ResponseBody
	public List<Recruit> partTimeTop3(){
		return recruitService.searchTop3ByType("계약직");
	}
	
	@GetMapping("/sungnam-between-7000-8000")
	@ResponseBody
	public List<Recruit> sungnamBetween(){
		return recruitService.searchSungnamBetween("성남시 분당구", 7000, 8500);
	}
	
	@GetMapping("/custom-recruit")
	@ResponseBody
	public List<Recruit> customRecruit(){
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, 2026);
		cal.set(Calendar.MONTH, Calendar.APRIL);
		cal.set(Calendar.DATE, 10);
		Date date = cal.getTime();
		
		return recruitService.searchCustomRecruit(date, 8100, "정규직");
	} 
}
