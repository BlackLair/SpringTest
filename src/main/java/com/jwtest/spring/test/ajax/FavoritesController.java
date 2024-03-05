package com.jwtest.spring.test.ajax;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jwtest.spring.test.ajax.domain.Favorites;
import com.jwtest.spring.test.ajax.service.FavoritesService;

@Controller
public class FavoritesController {
	@Autowired
	FavoritesService favoritesService;
	
	@GetMapping("/ajax/favorites")
	public String FavoritesList(Model model) {
		List<Favorites> favoritesList = favoritesService.getFavoritesList();
		model.addAttribute("favoritesList", favoritesList);
		return "/ajax/favoritesList";
	}
	
	@GetMapping("/ajax/inputFavorite")
	public String InputFavorite() {
		return "/ajax/favoritesInput";
	}
	
	@GetMapping("/ajax/createFavorite")
	@ResponseBody
	public String CreateFavorite(@ModelAttribute Favorites favorite) {
		int count = favoritesService.addFavorite(favorite);
		return "/ajax/favorites";
	}
}
