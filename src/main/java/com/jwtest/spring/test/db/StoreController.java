package com.jwtest.spring.test.db;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jwtest.spring.test.db.domain.Store;
import com.jwtest.spring.test.db.service.StoreService;

@Controller
public class StoreController {
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("/db/store/list")
	@ResponseBody
	public List<Store> storeServiceList(){
		List<Store> list = storeService.storeList();
		return list;
	}
}
