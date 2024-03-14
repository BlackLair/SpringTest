package com.jwtest.spring.test.jpa.domain;

import java.util.Date;

import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder(toBuilder=true)
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Table(name="recruit")
@Entity
public class Recruit {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	int id;
	
	int companyId;
	String position;
	String responsibilities;
	String qualification;
	String type;
	String region;
	int salary;
	Date deadline;
	
	@UpdateTimestamp
	@Column(updatable=false)
	Date createdAt;
	
	@UpdateTimestamp
	Date updatedAt;

}
