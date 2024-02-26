package com.jwtest.spring.test.myGameWiki.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyGameWikiRepository {
	public int getAllCount();
}
