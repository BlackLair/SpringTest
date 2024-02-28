package com.jwtest.spring.test.jstl;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyTestController {

	@GetMapping("/myTest/test01")
	public String myTest01(Model model) {
		String str = "controller String";
		model.addAttribute("str", str);
		return "/jstl/myTest01";
	}
}
