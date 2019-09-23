package com.springproject.deploy.dao;

import java.util.List;

import com.springproject.chain.dto.ChainTableDto;
import com.springproject.deploy.dto.DeployDto;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.program.dto.ProgramTableDto;
import com.springproject.seqtable.dto.SeqTableDto;

public interface DeployDao {

	public int insertOneDeployDao(DeployDto deployDto);
	
	public List<DeployDto> selectAllDeployDao();
	
	public DeployDto selectOneDeployDao(int deployNo);
	
	public int updateOneDeployDao(DeployDto deployDto);
	
	public int deleteOneDeployDao(int deployNo);
	
	public List<EmployeeDto> selectSomeDeployDao(EmployeeDto employeeDto);
	
   public List<ChainTableDto> selectSomeChaintableDao(ChainTableDto chainTableDto);
   
   public List<ProgramTableDto> selectSomeProgramTableDao(ProgramTableDto programTableDto);
   
   public List<SeqTableDto> selectSomeSeqTableDao(SeqTableDto seqTableDto);
	
}
