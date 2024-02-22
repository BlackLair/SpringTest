package com.jwtest.spring.test.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jwtest.spring.test.mybatis.domain.RealEstate;
import com.jwtest.spring.test.mybatis.service.RealEstateService;

@RestController
@RequestMapping("/mybatis/real-estate")
public class RealEstateController {
	@Autowired
	RealEstateService realEstateService;
	
	@RequestMapping("/select/1")
	public RealEstate getRealEstate(@RequestParam("id") int id) {
		RealEstate realEstate = realEstateService.getRealEstate(id);
		return realEstate;
	}
	
	@RequestMapping("/select/2")
	public List<RealEstate> getCheapRealEstate(@RequestParam("rent") int rent){
		List<RealEstate> list = realEstateService.getCheapRealEstateList(rent);
		return list;
	}
	
	@RequestMapping("/select/3")
	public List<RealEstate> getGoodRealEstate(
			@RequestParam("area") int area
			, @RequestParam("price") int price){
		List<RealEstate> list = realEstateService.getGoodRealEstateList(area, price);
		return list;
		
	}
	
	@RequestMapping("/insert/1")
	public String insertRealEstateInstance() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		int count = realEstateService.insertRealEstateInstance(realEstate);
		return "입력 성공 : " + count;
	}
	
	@RequestMapping("/insert/2")
	public String insertRealEstate(@RequestParam("realtorId") int realtorId) {
		int count = realEstateService.insertRealEstate(
				realtorId
				, "썅떼빌리버 오피스텔 814호"
				, 45
				, "월세"
				, 100000
				, 120
				);
		return "입력 성공 : " + count;
	}
	
	@RequestMapping("/update")
	public String updateRealEstate() {
		int count = realEstateService.updateRealEstate(22, "전세", 70000);
		return "수정 성공 : " + count;
	}
	
	@RequestMapping("/delete")
	public String deleteRealEstate(@RequestParam("id") int id) {
		int count = realEstateService.deleteRealEstate(id);
		return "삭제 성공 : " + count;
	}
	
}
