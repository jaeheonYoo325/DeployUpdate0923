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
	
}
