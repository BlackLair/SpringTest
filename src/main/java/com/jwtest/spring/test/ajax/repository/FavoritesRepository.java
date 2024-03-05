package com.jwtest.spring.test.ajax.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jwtest.spring.test.ajax.domain.Favorites;

@Mapper
public interface FavoritesRepository {
	public List<Favorites> selectFavoritesList();
	public int insertFavorite(Favorites favorite);
}
