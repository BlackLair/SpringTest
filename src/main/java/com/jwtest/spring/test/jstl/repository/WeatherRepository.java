package com.jwtest.spring.test.jstl.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jwtest.spring.test.jstl.domain.Weather;

@Mapper
public interface WeatherRepository {
	public List<Weather> selectAllWeather();
	public int insertWeather(Weather weather);
}
