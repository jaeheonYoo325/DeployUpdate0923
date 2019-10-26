package com.springproject.deploy.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.springproject.chain.dto.ChainDto;
import com.springproject.deploy.dto.CategoryTypeDto;
import com.springproject.deploy.dto.DeployApprovalDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.mastercode.dto.MasterCodeDto;
import com.springproject.modifiedprograms.dto.ModifiedProgramsDto;
import com.springproject.modifiedresources.dto.ModifiedResourcesDto;
import com.springproject.program.dto.ProgramDto;

public interface DeployService {
	public boolean InsertDeployRequestService(DeployRequestDto deployDto, ArrayList<String> wProgramArray, ArrayList<String> pageNameArray, ArrayList<String> wSourceArray);
	
	public List<DeployRequestDto> selectAllDeployRequestService();
	
	public DeployRequestDto selectDeployRequestOfDeployNoService(Long deployNo);

	public boolean updateOneDeployRequestService(DeployRequestDto deployDto, ArrayList<String> wProgramArray, ArrayList<String> pageNameArray, ArrayList<String> wSourceArray);

	public boolean deleteOneDeployRequestOfDeployNoService(Long deployNo);
	
	public List<EmployeeDto> selectSearchEmployeesService(EmployeeDto employeeDto);
	
	public List<ChainDto> selectSearchedChainService(ChainDto chainTableDto);
  
	public List<ProgramDto> selectSearchedModifiedProgramService(ProgramDto programDto);
	
	public List<ChainDto> selectSearchAllChainService();
	
	public List<ProgramDto> selectSearchAllModifiedProgramService(String selectedchainId);
	
	public List<ModifiedProgramsDto> selectModifiedProgramOfDeploNoService(Long deployNo);
	
	public List<ModifiedResourcesDto> selectModifiedResourceOfDeploNoService(Long deployNo);

	public List<DeployRequestDto> selectCategoryDeployRequestService(CategoryTypeDto deployCateListDto);

	public List<MasterCodeDto> selectAllMasterTableByStatusService();

	public List<MasterCodeDto> selectMasterCodeOfCategoryService();

	public Map<String, List<MasterCodeDto>> selectCategoryMasterCodesService(List<MasterCodeDto> categoryType);

	public List<EmployeeDto> selectSearchAllEmployeesService();
	
	public Map<String, List<MasterCodeDto>> selectMasterCodeOfSearchTypeService(String searchTypeString);
}
