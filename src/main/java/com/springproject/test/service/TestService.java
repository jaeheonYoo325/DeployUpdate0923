package com.springproject.test.service;

import java.util.List;

import com.springproject.test.dto.TestDto;


public interface TestService {

	List<TestDto> readMembers() throws Exception;	
}
