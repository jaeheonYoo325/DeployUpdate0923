package com.springproject.deploy.service;

import java.util.List;

import com.springproject.chain.dto.ChainTableDto;
import com.springproject.deploy.dto.DeployDto;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.program.dto.ProgramTableDto;
import com.springproject.seqtable.dto.SeqTableDto;

public interface DeployService {

	public boolean insertOneDeployService(DeployDto deployDto);
	
	public List<DeployDto> selectAllDeployService();
	
	public DeployDto selectOneDeployService(int deployNo);
	
	public boolean updateOneDeployService(DeployDto deployDto);
	
	public boolean deleteOneDeployService(int deployNo);
	
	public List<EmployeeDto> selectSomeDeployService(EmployeeDto employeeDto);
	
	public List<ChainTableDto> selectSomeChainService(ChainTableDto chainTableDto);
   
	public List<ProgramTableDto> selectSomeProgramService(ProgramTableDto programTableDto);
   
	public List<SeqTableDto> selectSomeProgramService(SeqTableDto seqTableDto);
}
