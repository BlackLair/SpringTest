package com.jwtest.spring.test.jstl;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jwtest.spring.test.jstl.domain.Weather;
import com.jwtest.spring.test.jstl.service.WeatherService;

@RequestMapping("/jstl")
@Controller
public class WeatherController {
	@Autowired
	WeatherService weatherService;
	
	@GetMapping("/weatherhome")
	public String weatherHome(Model model) {
		List<Weather> weatherList = weatherService.getAllWeather();
		model.addAttribute("weatherList", weatherList);
		return "/jstl/weatherHome";
	}
	
	@GetMapping("/inputweather")
	public String inputWeather() {
		return "/jstl/weatherInput";
	}
	
	@PostMapping("/createweather")
	public ResponseEntity<?> createWeather(@ModelAttribute("weather") Weather weather, Model model) {
		int count = weatherService.createWeather(weather);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(URI.create("/jstl/weatherhome"));
		return new ResponseEntity<>(headers, HttpStatus.MOVED_PERMANENTLY);
	}
}
