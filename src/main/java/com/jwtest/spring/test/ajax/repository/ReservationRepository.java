package com.jwtest.spring.test.ajax.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jwtest.spring.test.ajax.domain.Reservation;

@Mapper
public interface ReservationRepository {
	public List<Reservation> selectReservationList();
	public int deleteReservation(@Param("id") int id);
	public int insertReservation(
			@Param("name") String name
			, @Param("date") Date date
			, @Param("day") int day
			, @Param("headcount") int headcount
			, @Param("phoneNumber") String phoneNumber);
	public Reservation selectReservation(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
}
