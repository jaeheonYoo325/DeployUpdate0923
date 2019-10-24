package com.springproject.employee.dao;

import java.util.List;

import com.springproject.deploy.dto.DeployPayDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.employee.dto.AuthorityDto;
import com.springproject.employee.dto.EmployeeDto;

public interface EmployeeDao {

	public int insertOneEmployeeDao(EmployeeDto employeeDto);
	
	public EmployeeDto selectOneEmployeeDao(EmployeeDto employeeDto);
	public String getSaltByEmployeeNumber(String empNo);

	public List<DeployPayDto> selectMyDeployPayDao(EmployeeDto employeeDto);

	public int myDeployDoPayingOfCompleteNowPayDao(DeployPayDto deployPayDto);

	public int myDeployDoPayingOfAddNextPayDao(DeployPayDto deployPayDto);

	public int changeStatusCodeForDeloyDoPayingDao(DeployRequestDto deployRequestDto);

	public DeployPayDto selectMyDeployPayOfdeployNoDao(Long deployNo);

	public List<AuthorityDto> checkThisUserHaveAuthorityOfRequestDao(EmployeeDto employeeDto);

	public int myDeployDoReturningOfNextPayDao(DeployPayDto deployPayDto);

	public List<DeployPayDto> selectMyDeployPaidDao(EmployeeDto employeeDto);

	public List<DeployPayDto> selectMyDeployWillDeployDao(EmployeeDto employeeDto);

	public DeployPayDto selectMyDeployDoingDeployOfdeployNoDao(DeployPayDto deployPayDtoForSearch);

	public List<AuthorityDto> checkThisUserHaveAuthorityOfDeployDao(EmployeeDto employeeDto);

	public List<DeployPayDto> selectMyDeployDeployedDao(EmployeeDto employeeDto);
}
