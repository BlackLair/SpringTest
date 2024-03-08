package com.jwtest.spring.test.ajax.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwtest.spring.test.ajax.domain.Reservation;
import com.jwtest.spring.test.ajax.repository.ReservationRepository;

@Service
public class ReservationService {
	@Autowired
	ReservationRepository reservationRepository;
	
	public List<Reservation> getReservationList(){
		return reservationRepository.selectReservationList();
	}
	
	public int removeReservation(int id) {
		return reservationRepository.deleteReservation(id);
	}
	
	public int addReservation(
			String name
			, Date date
			, int day
			, int headcount
			, String phoneNumber) {
		return reservationRepository.insertReservation(name, date, day, headcount, phoneNumber);
	}
	
	public Reservation getReservation(
			String name
			, String phoneNumber) {
		Reservation reservation = reservationRepository.selectReservation(name, phoneNumber);
		return reservation;
	}
}
