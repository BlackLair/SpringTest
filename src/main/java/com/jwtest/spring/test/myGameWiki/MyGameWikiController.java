package com.jwtest.spring.test.myGameWiki;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/myGameWiki")
@Controller
public class MyGameWikiController {
	
	@RequestMapping("/home")
	public String MyGameWikiHome() {
		
		return "/myGameWiki/myGameWikiHome";
	}
	
}
