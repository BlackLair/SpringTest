package com.jwtest.spring.test.jpa.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwtest.spring.test.jpa.domain.Recruit;
import com.jwtest.spring.test.jpa.repository.RecruitRepository;

@Service
public class RecruitService {
	@Autowired
	private RecruitRepository recruitRepository;
	
	public Recruit searchRecruit(int id) {
		Optional<Recruit> optionalRecruit = recruitRepository.findById(id);
		return optionalRecruit.orElse(null);
	}
	public List<Recruit> searchRecruitByCompanyId(int id){
		return recruitRepository.findByCompanyId(id);
	}

	public List<Recruit> searchRecruitByPositionAndType(String position, String type){
		return recruitRepository.findByPositionAndType(position, type);
	}
	
	public List<Recruit> searchRecruitByTypeOrSalary(String type, int minSalary){
		return recruitRepository.findByTypeOrSalaryGreaterThanEqual(type, minSalary);
	}
	
	public List<Recruit> searchTop3ByType(String type){
		return recruitRepository.findTop3ByTypeOrderBySalaryDesc(type);
	}
	
	public List<Recruit> searchSungnamBetween(String region, int start, int end){
		return recruitRepository.findByRegionAndSalaryBetween(region, start, end);
	}
	public List<Recruit> searchCustomRecruit(Date deadline, int salary, String type){
		return recruitRepository.findCustomRecruit(deadline, salary, type);
	}
}
