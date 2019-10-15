package com.springproject.deploy.dao;

import java.util.ArrayList;
import java.util.List;


import com.springproject.chain.dto.ChainTableDto;
import com.springproject.deploy.dto.DeployCateListDto;
import com.springproject.deploy.dto.DeployDto;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.mastertable.dto.MasterTableDto;
import com.springproject.program.dto.ProgramTableDto;
import com.springproject.wprogramtable.dto.WProgramTableDto;
import com.springproject.wsource.dto.WSourceTableDto;

public interface DeployDao {

	public int insertOneDeployDao(DeployDto deployDto);
	
	public int insertOneWProgram(WProgramTableDto wProgramTableDto);
	
	public int insertOneWSource(WSourceTableDto wSourceTableDto);
	
	public List<DeployDto> selectAllDeployDao();
	
	public DeployDto selectOneDeployDao(int deployNo);
	
	public int updateOneDeployDao(DeployDto deployDto);
	
	public int deleteOneDeployDao(int deployNo);
	
   public List<EmployeeDto> selectSomeDeployDao(EmployeeDto employeeDto);
	
   public List<ChainTableDto> selectSomeChainDao(ChainTableDto chainTableDto);
   
   public List<ProgramTableDto> selectSomeProgramDao(ProgramTableDto programTableDto);
   
   public List<ChainTableDto> selectAllChainDao();
   
   public List<ProgramTableDto> selectAllProgramDao(String paramChainId);
   
   public int selectMaxDeployNo();
   
   public List<WProgramTableDto> selectAllWProgramDao(int deployNo);
   
   public List<WSourceTableDto> selectAllWSourceDao(int deployNo);
   
   public int deleteAllWProgram(int deployNo);
   
   public int deleteAllWSource(int deployNo);

   public List<DeployDto> selectSomeDeployCateListDao(DeployCateListDto deployCateListDto);
   
   public List<MasterTableDto> selectAllMasterTableByStatusDao();

public List<MasterTableDto> selectCategoryTypeDao();

public List<MasterTableDto> selectAllCategoryDao(String codeType);

}
