package com.springproject.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springproject.test.dto.TestDto;

@Repository
public class TestDaoImpl extends SqlSessionDaoSupport implements TestDao{

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {	
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	@Override
	public List<TestDto> selectMembers() throws Exception {
		return getSqlSession().selectList("TestDao.selectMembers");
	}

}
