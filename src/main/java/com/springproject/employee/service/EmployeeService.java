package com.springproject.employee.service;

import java.util.List;

import com.springproject.deploy.dto.DeployApprovalDto;
import com.springproject.employee.dto.EmployeeDto;

public interface EmployeeService {

	public boolean insertOneEmployeeService(EmployeeDto employeeDto);
	
	public EmployeeDto selectOneEmployeeService(EmployeeDto employeeDto);

	public List<DeployApprovalDto> selectMyDeployApprovalService(EmployeeDto employeeDto);

	public boolean myDeployDoApprovalingService(DeployApprovalDto deployApprovalDto);

	public boolean myDeployDoReturningService(DeployApprovalDto deployApprovalDto);

	public DeployApprovalDto selectMyDeployApprovalOfdeployNoService(Long deployNo);

	public boolean checkThisUserHaveAuthorityOfRequestService(EmployeeDto employeeDto);

	public List<DeployApprovalDto> selectMyDeployApprovedService(EmployeeDto employeeDto);

	public List<DeployApprovalDto> selectMyDeployWillDeployService(EmployeeDto employeeDto);

	public DeployApprovalDto selectMyDeployDoingDeployOfdeployNoService(DeployApprovalDto deployApprovalDtoForSearch);

	public boolean myDeployDoDeployingService(DeployApprovalDto deployApprovalDto);

	public boolean checkThisUserHaveAuthorityOfDeployService(EmployeeDto employeeDto);

	public List<DeployApprovalDto> selectMyDeployDeployedService(EmployeeDto employeeDto);

	public List<DeployApprovalDto> selectMyDeployReturnedService(EmployeeDto employeeDto);

	public List<DeployApprovalDto> selectMyDeployCompletedService(EmployeeDto employeeDto);

	public boolean checkisThisUserHaveAuthorityOfEmployeeRegistService(EmployeeDto employeeDto);
}
