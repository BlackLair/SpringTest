package com.jwtest.spring.test.lifecycle;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Test01Controller {
	
	@RequestMapping("/lifecycle/test01/printSample")
	@ResponseBody
	public String printSample() {
		return 	"<h1>테스트 프로젝트 완성</h1><br>"
			+	"<h2>해당 프로젝트를 통해서 문제 풀이를 진행 합니다.</h2";
	}
	
	@RequestMapping("/lifecycle/test01/score")
	@ResponseBody
	public Map<String, Integer> getScore(){
		Map<String, Integer> score = new HashMap<>();
		score.put("국어",  80);
		score.put("수학", 90);
		score.put("영어", 85);
		return score;
	}
}
