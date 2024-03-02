package com.jwtest.spring.test.jstl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwtest.spring.test.jstl.domain.Weather;
import com.jwtest.spring.test.jstl.repository.WeatherRepository;

@Service
public class WeatherService {
	@Autowired
	WeatherRepository weatherRepository;
	
	public List<Weather> getAllWeather(){
		return weatherRepository.selectAllWeather();
	}
	
	public int createWeather(Weather weather) {
		weather.setDate(weather.getDate() + " 00:00:00");
		return weatherRepository.insertWeather(weather);
	}
}
