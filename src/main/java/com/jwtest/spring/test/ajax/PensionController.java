package com.jwtest.spring.test.ajax;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jwtest.spring.test.ajax.domain.Reservation;
import com.jwtest.spring.test.ajax.service.ReservationService;

@RequestMapping("/ajax/pension/reservation")
@Controller
public class PensionController {
	@Autowired
	ReservationService reservationService;
	
	@GetMapping("/listPage")
	public String reservationList(Model model) {
		List<Reservation> reservationList = reservationService.getReservationList();
		model.addAttribute("reservationList", reservationList);
		return "/ajax/pensionReservationList";
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String> reservationDelete(@RequestParam("id") int id) {
		int count = reservationService.removeReservation(id);
		
		Map<String, String> resultMap = new HashMap<>();
		resultMap.put("result", (count > 0) ? "success" : "failed");
		
		return resultMap;
	}
	
	@GetMapping("/searchPage")
	public String reservationSearchPage() {
		return "/ajax/pensionSearchReservationPage";
	}
	
	@GetMapping("/search")
	@ResponseBody
	public Map<String, Object> reservationSearch(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		Reservation reservation = reservationService.getReservation(name, phoneNumber);
		Map<String, Object> resultMap = new HashMap<>();
		String result = null;
		if(reservation != null) { // MyBatis 쿼리 데이터 존재할 경우
			result = "success";
			resultMap.put("name", reservation.getName());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			resultMap.put("date", sdf.format(reservation.getDate()));
			resultMap.put("day", reservation.getDay());
			resultMap.put("headcount", reservation.getHeadcount());
			resultMap.put("state", reservation.getState());
		}else{
			result = "failed";
		}
		resultMap.put("result", result); // 쿼리 결과

		return resultMap;
	}
	
	@GetMapping("/reservePage")
	public String reservePage() {
		return "/ajax/pensionReservePage";
	}
	
	@GetMapping("/reserve")
	@ResponseBody
	public Map<String, String> reserve(
				@RequestParam("name") String name
				, @RequestParam("date") @DateTimeFormat(pattern="yyyy년 M월 d일") Date date
				, @RequestParam("day") int day
				, @RequestParam("headcount") int headcount
				, @RequestParam("phoneNumber") String phoneNumber) {
		int count = reservationService.addReservation(name, date, day, headcount, phoneNumber);
		
		String result = (count > 0) ? "success" : "failed";
		Map<String, String> resultMap = new HashMap<>();
		
		resultMap.put("result", result);
		return resultMap;
	}
	

	
}
