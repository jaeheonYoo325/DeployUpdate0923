package com.springproject.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springproject.common.utils.HttpRequestHelper;
import com.springproject.test.dto.TestDto;
import com.springproject.test.service.TestService;
import com.springproject.wprogramtable.dto.WProgramTableDto;

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
	
	@RequestMapping("/test/NewFile.do")
	public String viewTestPage() {

		return HttpRequestHelper.getJspPath();
	}
}
