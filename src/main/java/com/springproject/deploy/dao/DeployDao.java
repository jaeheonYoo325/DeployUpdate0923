package com.springproject.deploy.dao;

import java.util.ArrayList;
import java.util.List;


import com.springproject.chain.dto.ChainDto;
import com.springproject.deploy.dto.CategoryTypeDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.mastercode.dto.MasterCodeDto;
import com.springproject.modifiedprograms.dto.ModifiedProgramsDto;
import com.springproject.modifiedresources.dto.ModifiedResourcesDto;
import com.springproject.program.dto.ProgramDto;

public interface DeployDao {

	public int InsertDeployRequestDao(DeployRequestDto deployDto);
	
	public int insertModifiedProgramDao(ModifiedProgramsDto wProgramTableDto);
	
	public int insertModifiedResourceDao(ModifiedResourcesDto wSourceTableDto);
	
	public List<DeployRequestDto> selectAllDeployRequestDao();
	
	public DeployRequestDto selectDeployRequestOfDeployNoDao(Long deployNo);
	
	public int updateOneDeployRequestDao(DeployRequestDto deployDto);
	
	public int deleteOneDeployRequestOfDeployNoDao(Long deployNo);
	
   public List<EmployeeDto> selectSearchEmployeesDao(EmployeeDto employeeDto);
	
   public List<ChainDto> selectSearchedChainDao(ChainDto chainDto);
   
   public List<ProgramDto> selectSearchedModifiedProgramDao(ProgramDto programDto);
   
   public List<ChainDto> selectSearchAllChainDao();
   
   public List<ProgramDto> selectSearchAllModifiedProgramDao(String selectedchainId);
   
   public Long selectMaxDeployNo();
   
   public List<ModifiedProgramsDto> selectModifiedProgramOfDeploNoDao(Long deployNo);
   
   public List<ModifiedResourcesDto> selectModifiedResourceOfDeploNoDao(Long deployNo);
   
   public int deleteModifiedProgramOfDeployNoDao(Long deployNo);
   
   public int deleteModifiedResourceOfDeployNoDao(Long deployNo);

   public List<DeployRequestDto> selectCategoryDeployRequestDao(CategoryTypeDto deployCateListDto);
   
   public List<MasterCodeDto> selectAllMasterTableByStatusDao();

public List<MasterCodeDto> selectMasterCodeTypeDao();

public List<MasterCodeDto> selectCategoryMasterCodesDao(String codeType);

}
