package com.springproject.employee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springproject.deploy.dto.DeployPayDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.employee.dto.AuthorityDto;
import com.springproject.employee.dto.EmployeeDto;

@Repository
public class EmployeeDaoImpl extends SqlSessionDaoSupport implements EmployeeDao{

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public int insertOneEmployeeDao(EmployeeDto employeeDto) {
		return getSqlSession().insert("EmployeeDao.insertOneEmployeeDao", employeeDto);
	}
	
	@Override
	public EmployeeDto selectOneEmployeeDao(EmployeeDto employeeDto) {
		return getSqlSession().selectOne("EmployeeDao.selectOneEmployeeDao", employeeDto);
	}

	@Override
	public String getSaltByEmployeeNumber(String empNo) {
		return getSqlSession().selectOne("EmployeeDao.getSaltByEmployeeNumber", empNo);
	}

	@Override
	public List<DeployPayDto> selectMyDeployPayDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.selectMyDeployPayDao",employeeDto);
	}

	@Override
	public int myDeployDoPayingOfCompleteNowPayDao(DeployPayDto deployPayDto) {
		return this.getSqlSession().update("EmployeeDao.myDeployDoPayingOfCompleteNowPayDao",deployPayDto);
	}

	@Override
	public int myDeployDoPayingOfAddNextPayDao(DeployPayDto deployPayDto) {
		return this.getSqlSession().insert("EmployeeDao.myDeployDoPayingOfAddNextPayDao",deployPayDto);
	}

	@Override
	public int changeStatusCodeForDeloyDoPayingDao(DeployRequestDto deployRequestDto) {
		return this.getSqlSession().update("EmployeeDao.changeStatusCodeForDeloyDoPayingDao",deployRequestDto);
	}

	@Override
	public DeployPayDto selectMyDeployPayOfdeployNoDao(Long deployNo) {
		return this.getSqlSession().selectOne("EmployeeDao.selectMyDeployPayOfdeployNoDao",deployNo);
	}

	@Override
	public List<AuthorityDto> checkThisUserHaveAuthorityOfRequestDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.checkThisUserHaveAuthorityOfRequestDao",employeeDto);
	}

	@Override
	public int myDeployDoReturningOfNextPayDao(DeployPayDto deployPayDto) {
		return this.getSqlSession().insert("EmployeeDao.myDeployDoReturningOfNextPayDao",deployPayDto);
	}

	@Override
	public List<DeployPayDto> selectMyDeployPaidDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.selectMyDeployPaidDao",employeeDto);
	}

	@Override
	public List<DeployPayDto> selectMyDeployWillDeployDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.selectMyDeployWillDeployDao",employeeDto);
	}

	@Override
	public DeployPayDto selectMyDeployDoingDeployOfdeployNoDao(DeployPayDto deployPayDtoForSearch) {
		return this.getSqlSession().selectOne("EmployeeDao.selectMyDeployDoingDeployOfdeployNoDao",deployPayDtoForSearch);
	}

	@Override
	public List<AuthorityDto> checkThisUserHaveAuthorityOfDeployDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.checkThisUserHaveAuthorityOfDeployDao",employeeDto);
	}

	@Override
	public List<DeployPayDto> selectMyDeployDeployedDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.selectMyDeployDeployedDao",employeeDto);
	}
}
