package com.jwtest.spring.test.ajax.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jwtest.spring.test.ajax.domain.Favorites;
import com.jwtest.spring.test.ajax.repository.FavoritesRepository;

@Service
public class FavoritesService {
	@Autowired
	FavoritesRepository favoritesRepository;
	
	public List<Favorites> getFavoritesList(){
		return favoritesRepository.selectFavoritesList();
	}
	
	public int addFavorite(Favorites favorite) {
		return favoritesRepository.insertFavorite(favorite);
	}
}
