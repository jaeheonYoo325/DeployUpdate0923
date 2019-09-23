package com.springproject.test.dao;

import java.util.List;

import com.springproject.test.dto.TestDto;


public interface TestDao {
	public List<TestDto> selectMembers() throws Exception;
}
