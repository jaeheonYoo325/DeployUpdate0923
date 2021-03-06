package com.springproject.employee.dao;

import java.util.List;

import com.springproject.deploy.dto.DeployApprovalDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.employee.dto.AuthorityDto;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.program.dto.ProgramDto;

public interface EmployeeDao {

	public int insertOneEmployeeDao(EmployeeDto employeeDto);
	
	public EmployeeDto selectOneEmployeeDao(EmployeeDto employeeDto);
	
	public String getSaltByEmployeeNumber(String empNo);

	public List<DeployApprovalDto> selectMyDeployApprovalDao(EmployeeDto employeeDto);

	public int myDeployDoApprovalingOfCompleteNowApprovalDao(DeployApprovalDto deployApprovalDto);

	public int myDeployDoApprovalingOfAddNextApprovalDao(DeployApprovalDto deployApprovalDto);

	public int changeStatusCodeForDeloyDoApprovalingDao(DeployRequestDto deployRequestDto);

	public DeployApprovalDto selectMyDeployApprovalOfdeployNoDao(Long deployNo);

	public List<AuthorityDto> checkThisUserHaveAuthorityOfRequestDao(EmployeeDto employeeDto);

	public int myDeployDoReturningOfNextApprovalDao(DeployApprovalDto deployApprovalDto);

	public List<DeployApprovalDto> selectMyDeployApprovedDao(EmployeeDto employeeDto);

	public List<DeployApprovalDto> selectMyDeployWillDeployDao(EmployeeDto employeeDto);

	public DeployApprovalDto selectMyDeployDoingDeployOfdeployNoDao(DeployApprovalDto deployApprovalDtoForSearch);

	public List<AuthorityDto> checkThisUserHaveAuthorityOfDeployDao(EmployeeDto employeeDto);

	public List<DeployApprovalDto> selectMyDeployDeployedDao(EmployeeDto employeeDto);

	public List<DeployApprovalDto> selectMyDeployReturnedDao(EmployeeDto employeeDto);

	public List<DeployApprovalDto> selectMyDeployCompletedDao(EmployeeDto employeeDto);

	public List<AuthorityDto> checkThisUserHaveAuthorityOfEmployeeRegist(EmployeeDto employeeDto);
	
	public int duplicateCheckOfEmployeeNoDao(String employeeNo);

	public int insertOneProgramDao(ProgramDto programDto);

	public int SearchThisProgramIdIsCanUsedDao(ProgramDto programDto);

}
