package com.jwtest.spring.test.jpa.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.jwtest.spring.test.jpa.domain.Recruit;

public interface RecruitRepository extends JpaRepository<Recruit, Integer>{
	public List<Recruit> findByCompanyId(@Param("companyId") int companyId);
	
	public List<Recruit> findByPositionAndType(@Param("position") String position, @Param("type") String type);
	
	public List<Recruit> findByTypeOrSalaryGreaterThanEqual(@Param("type") String type, @Param("salary")int minSalary);
	
	public List<Recruit> findTop3ByTypeOrderBySalaryDesc(@Param("type") String type);
	
	public List<Recruit> findByRegionAndSalaryBetween(@Param("region") String region, @Param("startSalary")int startSalary, @Param("endSalary")int endSalary);
	
	@Query(value="SELECT * FROM `recruit` WHERE `deadline` >= :deadline AND `type` = :type AND `salary` >= :salary ORDER BY `salary` DESC", nativeQuery=true)
	public List<Recruit> findCustomRecruit(@Param("deadline")Date deadline, @Param("salary") int salary, @Param("type") String type);
	
	
}
