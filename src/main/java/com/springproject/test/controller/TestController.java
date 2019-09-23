package com.springproject.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springproject.common.utils.HttpRequestHelper;
import com.springproject.test.dto.TestDto;
import com.springproject.test.service.TestService;

@Controller
public class TestController {

	@Autowired
	private TestService testService;
	
	/*
	@GetMapping("/test/test")
	public String viewTestPage() {
		return "test";
	}
	*/
	
	@RequestMapping("/test/test.do")
	public String viewTestPage(Model model) {
		
		try {
			List<TestDto> testList = this.testService.readMembers();
			model.addAttribute("testList", testList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return HttpRequestHelper.getJspPath();
	}
}
