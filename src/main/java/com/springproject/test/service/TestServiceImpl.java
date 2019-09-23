package com.springproject.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.test.dao.TestDao;
import com.springproject.test.dto.TestDto;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	private TestDao testDao;
	
	@Override
	public List<TestDto> readMembers() throws Exception {
		return this.testDao.selectMembers();
	}

}
