package com.jwtest.spring.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jwtest.spring.test.ajax.domain.Favorites;
import com.jwtest.spring.test.ajax.service.FavoritesService;

@Controller
public class FavoritesController {
	@Autowired
	FavoritesService favoritesService;
	
	@GetMapping("/ajax/favorites/list")
	public String favoritesList(Model model) {
		List<Favorites> favoritesList = favoritesService.getFavoritesList();
		model.addAttribute("favoritesList", favoritesList);
		return "/ajax/favoritesList";
	}
	
	@GetMapping("/ajax/favorites/input")
	public String inputFavorite() {
		return "/ajax/favoritesInput";
	}
	
	@GetMapping("/ajax/favorites/create")
	@ResponseBody
	public Map<String, String> createFavorite(@ModelAttribute Favorites favorite) {
		int count = favoritesService.addFavorite(favorite);
		Map<String, String> resultMap = new HashMap<>();
		if(count == 1) {
			resultMap.put("result", "success");
		}else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	@ResponseBody
	@GetMapping("/ajax/favorites/check-url-duplication")
	public Map<String, Boolean> checkUrlDuplication(@RequestParam("url") String url) {
		boolean isDuplicated = favoritesService.isUrlDuplicated(url);
		Map<String, Boolean> resultMap = new HashMap<>();
		resultMap.put("isDuplicated", isDuplicated);
		return resultMap;
	}
	
	@ResponseBody
	@GetMapping("/ajax/favorites/remove")
	public Map<String, Boolean> removeFavorite(@RequestParam("id")int id){
		boolean deleteResult = favoritesService.removeFavorite(id);
		Map<String, Boolean> resultMap = new HashMap<>();
		resultMap.put("result", deleteResult);
		return resultMap;
	}
}
