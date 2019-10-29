package com.springproject.employee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springproject.deploy.dto.DeployApprovalDto;
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
	public List<DeployApprovalDto> selectMyDeployApprovalDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.selectMyDeployApprovalDao",employeeDto);
	}

	@Override
	public int myDeployDoApprovalingOfCompleteNowApprovalDao(DeployApprovalDto deployApprovalDto) {
		return this.getSqlSession().update("EmployeeDao.myDeployDoApprovalingOfCompleteNowApprovalDao",deployApprovalDto);
	}

	@Override
	public int myDeployDoApprovalingOfAddNextApprovalDao(DeployApprovalDto deployApprovalDto) {
		return this.getSqlSession().insert("EmployeeDao.myDeployDoApprovalingOfAddNextApprovalDao",deployApprovalDto);
	}

	@Override
	public int changeStatusCodeForDeloyDoApprovalingDao(DeployRequestDto deployRequestDto) {
		return this.getSqlSession().update("EmployeeDao.changeStatusCodeForDeloyDoApprovalingDao",deployRequestDto);
	}

	@Override
	public DeployApprovalDto selectMyDeployApprovalOfdeployNoDao(Long deployNo) {
		return this.getSqlSession().selectOne("EmployeeDao.selectMyDeployApprovalOfdeployNoDao",deployNo);
	}

	@Override
	public List<AuthorityDto> checkThisUserHaveAuthorityOfRequestDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.checkThisUserHaveAuthorityOfRequestDao",employeeDto);
	}

	@Override
	public int myDeployDoReturningOfNextApprovalDao(DeployApprovalDto deployApprovalDto) {
		return this.getSqlSession().insert("EmployeeDao.myDeployDoReturningOfNextApprovalDao",deployApprovalDto);
	}

	@Override
	public List<DeployApprovalDto> selectMyDeployApprovedDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.selectMyDeployApprovedDao",employeeDto);
	}

	@Override
	public List<DeployApprovalDto> selectMyDeployWillDeployDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.selectMyDeployWillDeployDao",employeeDto);
	}

	@Override
	public DeployApprovalDto selectMyDeployDoingDeployOfdeployNoDao(DeployApprovalDto deployApprovalDtoForSearch) {
		return this.getSqlSession().selectOne("EmployeeDao.selectMyDeployDoingDeployOfdeployNoDao",deployApprovalDtoForSearch);
	}

	@Override
	public List<AuthorityDto> checkThisUserHaveAuthorityOfDeployDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.checkThisUserHaveAuthorityOfDeployDao",employeeDto);
	}

	@Override
	public List<DeployApprovalDto> selectMyDeployDeployedDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.selectMyDeployDeployedDao",employeeDto);
	}

	@Override
	public List<DeployApprovalDto> selectMyDeployReturnedDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.selectMyDeployReturnedDao",employeeDto);
	}

	@Override
	public List<DeployApprovalDto> selectMyDeployCompletedDao(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.selectMyDeployCompletedDao",employeeDto);
	}

	@Override
	public List<AuthorityDto> checkThisUserHaveAuthorityOfEmployeeRegist(EmployeeDto employeeDto) {
		return this.getSqlSession().selectList("EmployeeDao.checkThisUserHaveAuthorityOfEmployeeRegistDao", employeeDto);
	}

	@Override
	public int duplicateCheckOfEmployeeNoDao(String employeeNo) {
		return this.getSqlSession().selectOne("EmployeeDao.duplicateCheckOfEmployeeNoDao", employeeNo);
	}
}
