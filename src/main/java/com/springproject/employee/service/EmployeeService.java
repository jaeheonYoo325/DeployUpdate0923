package com.springproject.employee.service;

import java.util.List;

import com.springproject.deploy.dto.DeployPayDto;
import com.springproject.employee.dto.EmployeeDto;

public interface EmployeeService {

	public boolean insertOneEmployeeService(EmployeeDto employeeDto);
	
	public EmployeeDto selectOneEmployeeService(EmployeeDto employeeDto);

	public List<DeployPayDto> selectMyDeployPayService(EmployeeDto employeeDto);

	public boolean myDeployDoPayingService(DeployPayDto deployPayDto);

	public boolean myDeployDoReturningService(DeployPayDto deployPayDto);

	public DeployPayDto selectMyDeployPayOfdeployNoService(Long deployNo);

	public boolean checkThisUserHaveAuthorityOfRequestService(EmployeeDto employeeDto);

	public List<DeployPayDto> selectMyDeployPaidService(EmployeeDto employeeDto);

	public List<DeployPayDto> selectMyDeployWillDeployService(EmployeeDto employeeDto);

	public DeployPayDto selectMyDeployDoingDeployOfdeployNoService(DeployPayDto deployPayDtoForSearch);

	public boolean myDeployDoDeployingService(DeployPayDto deployPayDto);

	public boolean checkThisUserHaveAuthorityOfDeployService(EmployeeDto employeeDto);

	public List<DeployPayDto> selectMyDeployDeployedService(EmployeeDto employeeDto);

	public List<DeployPayDto> selectMyDeployReturnedService(EmployeeDto employeeDto);

	public List<DeployPayDto> selectMyDeployCompletedService(EmployeeDto employeeDto);
}
