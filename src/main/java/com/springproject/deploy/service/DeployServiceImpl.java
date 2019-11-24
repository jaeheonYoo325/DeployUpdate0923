package com.springproject.deploy.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhncorp.lucy.security.xss.XssFilter;
import com.springproject.chain.dto.ChainDto;
import com.springproject.deploy.dao.DeployDao;
import com.springproject.deploy.dto.CategoryTypeDto;
import com.springproject.deploy.dto.DeployApprovalDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.employee.dao.EmployeeDao;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.employee.service.EmployeeService;
import com.springproject.mastercode.dto.MasterCodeDto;
import com.springproject.modifiedprograms.dto.ModifiedProgramsDto;
import com.springproject.modifiedresources.dto.ModifiedResourcesDto;
import com.springproject.program.dto.ProgramDto;

@Service
@Transactional
public class DeployServiceImpl implements DeployService {

	@Autowired
	private DeployDao deployDao;
	
	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired EmployeeService employeeService;

	@Override
	public boolean InsertDeployRequestService(DeployRequestDto deployRequestDto, ArrayList<String> modifiedPrograms,
			ArrayList<String> modifiedProgramName, ArrayList<String> modifiedResources) {
		
		// XSS 방어로직
		XssFilter xssFilter = XssFilter.getInstance("xssfilter/lucy-xss-superset.xml", true);
		deployRequestDto.setModifiedContents(xssFilter.doFilter(deployRequestDto.getModifiedContents()));
		
		boolean insertDeployRequestSuccess = this.deployDao.InsertDeployRequestDao(deployRequestDto) > 0;
		boolean insertModifiedResourceSuccess = true;
		boolean insertModifiedProgramSuccess = true;
		
		Long deployNo = this.deployDao.selectMaxDeployNo();

		for (int i = 0; i < modifiedResources.size(); i++) {
			ModifiedResourcesDto modifiedResourcesDto = new ModifiedResourcesDto();
			modifiedResourcesDto.setModifiedResources_deployNo(deployNo);
			modifiedResourcesDto.setModifiedResources_wSourceName(xssFilter.doFilter(modifiedResources.get(i).toString()));
			insertModifiedResourceSuccess = insertModifiedResourceSuccess && (this.deployDao.insertModifiedResourceDao(modifiedResourcesDto) > 0);
		}

		for (int i = 0; i < modifiedPrograms.size(); i++) {
			ModifiedProgramsDto modifiedProgramsDto = new ModifiedProgramsDto();
			modifiedProgramsDto.setModifiedPrograms_pageId(modifiedPrograms.get(i).toString());
			modifiedProgramsDto.setModifiedPrograms_deployNo(deployNo);
			modifiedProgramsDto.setModifiedPrograms_pageName(modifiedProgramName.get(i).toString());
			insertModifiedProgramSuccess = insertModifiedProgramSuccess && (this.deployDao.insertModifiedProgramDao(modifiedProgramsDto) > 0);
		}

		DeployApprovalDto deployApprovalDto = new DeployApprovalDto();
	    deployApprovalDto.setDeployNo(deployNo);
	    deployApprovalDto.setDeployDrafter(deployRequestDto.getRequester());   
	    boolean insertDeployApprovalForDeployRequestSuccess = this.deployDao.insertDeployApprovalForDeployRequestDao(deployApprovalDto)>0;
		
		boolean requestSuccess = insertDeployRequestSuccess && insertModifiedProgramSuccess && insertModifiedResourceSuccess && insertDeployApprovalForDeployRequestSuccess;
		return requestSuccess;
	}

	@Override
	public List<DeployRequestDto> selectAllDeployRequestService() {
		return this.deployDao.selectAllDeployRequestDao();
	}

	@Override
	public DeployRequestDto selectDeployRequestOfDeployNoService(Long deployNo) {
		return this.deployDao.selectDeployRequestOfDeployNoDao(deployNo);
	}

	@Override
	public boolean updateOneDeployRequestService(DeployRequestDto deployRequestDto, ArrayList<String> modifiedPrograms, ArrayList<String> modifiedProgramName, ArrayList<String> modifiedResources) {
		Long deployNo = deployRequestDto.getDeployNo();

		boolean updateFinalSuccess = true;
		boolean insertModifiedResourceSuccess = true;
		boolean insertModifiedProgramSuccess = true;
		// XSS 방어로직
		XssFilter xssFilter = XssFilter.getInstance("xssfilter/lucy-xss-superset.xml", true);
		deployRequestDto.setModifiedContents(xssFilter.doFilter(deployRequestDto.getModifiedContents()));
		deployRequestDto.setStatusCode("01");
		boolean updateOneDeployRequestSuccess = this.deployDao.updateOneDeployRequestDao(deployRequestDto) > 0;
		boolean deleteModifiedProgramOfDeployNoSuccess = this.deployDao.deleteModifiedProgramOfDeployNoDao(deployNo) > 0;
		boolean deleteModifiedResourceOfDeployNoSuccess = this.deployDao.deleteModifiedResourceOfDeployNoDao(deployNo) > 0;

		for (int i = 0; i < modifiedPrograms.size(); i++) {
			ModifiedProgramsDto modifiedProgramsDto = new ModifiedProgramsDto();
			modifiedProgramsDto.setModifiedPrograms_deployNo(deployNo);
			modifiedProgramsDto.setModifiedPrograms_pageId(modifiedPrograms.get(i).toString());
			modifiedProgramsDto.setModifiedPrograms_pageName(xssFilter.doFilter(modifiedProgramName.get(i).toString()));
			insertModifiedProgramSuccess = insertModifiedProgramSuccess && (this.deployDao.insertModifiedProgramDao(modifiedProgramsDto) > 0);
		}

		for (int i = 0; i < modifiedResources.size(); i++) {
			ModifiedResourcesDto modifiedResourcesDto = new ModifiedResourcesDto();
			modifiedResourcesDto.setModifiedResources_deployNo(deployNo);
			modifiedResourcesDto.setModifiedResources_wSourceName(xssFilter.doFilter(modifiedResources.get(i).toString()));
			insertModifiedResourceSuccess = insertModifiedResourceSuccess && (this.deployDao.insertModifiedResourceDao(modifiedResourcesDto) > 0);
		}
		
		DeployApprovalDto deployApprovalDto = this.employeeService.selectMyDeployApprovalOfdeployNoService(deployNo);
	    deployApprovalDto.setDeployApprovalLineConfirm(deployRequestDto.getRequester());
	    boolean isDoApprovalingSuccessOfCompleteNowApproval = this.employeeDao.myDeployDoApprovalingOfCompleteNowApprovalDao(deployApprovalDto)>0;
	    deployApprovalDto.setDeployApprovalLine("3");
	    deployApprovalDto.setDeployApprovalDescription("deployApprovalB0");
	    boolean isDoApprovalingSuccessOfNextApproval = this.employeeDao.myDeployDoApprovalingOfAddNextApprovalDao(deployApprovalDto)>0;


		updateFinalSuccess = updateFinalSuccess && updateOneDeployRequestSuccess && deleteModifiedProgramOfDeployNoSuccess && deleteModifiedResourceOfDeployNoSuccess && insertModifiedProgramSuccess
				&& insertModifiedResourceSuccess&&isDoApprovalingSuccessOfCompleteNowApproval&&isDoApprovalingSuccessOfNextApproval;
		return updateFinalSuccess;
	}

	@Override
	public boolean deleteOneDeployRequestOfDeployNoService(Long deployNo) {
		return this.deployDao.deleteOneDeployRequestOfDeployNoDao(deployNo) > 0;
	}

	@Override
	public List<EmployeeDto> selectSearchEmployeesService(EmployeeDto employeeDto) {
		return this.deployDao.selectSearchEmployeesDao(employeeDto);
	}

	@Override
	public List<ChainDto> selectSearchedChainService(ChainDto chainTableDto) {
		return this.deployDao.selectSearchedChainDao(chainTableDto);
	}

	@Override
	public List<ProgramDto> selectSearchedModifiedProgramService(ProgramDto programDto) {
		return this.deployDao.selectSearchedModifiedProgramDao(programDto);
	}

	@Override
	public List<ChainDto> selectSearchAllChainService() {
		return this.deployDao.selectSearchAllChainDao();
	}

	@Override
	public List<ProgramDto> selectSearchAllModifiedProgramService(String selectedchainId) {
		return this.deployDao.selectSearchAllModifiedProgramDao(selectedchainId);
	}

	@Override
	public List<ModifiedProgramsDto> selectModifiedProgramOfDeploNoService(Long deployNo) {
		return this.deployDao.selectModifiedProgramOfDeploNoDao(deployNo);
	}

	@Override
	public List<ModifiedResourcesDto> selectModifiedResourceOfDeploNoService(Long deployNo) {
		return this.deployDao.selectModifiedResourceOfDeploNoDao(deployNo);
	}

	@Override
	public List<DeployRequestDto> selectCategoryDeployRequestService(CategoryTypeDto deployCateListDto) {
		CategoryTypeDto deployRequestForCatetory = new CategoryTypeDto();

		if (deployCateListDto.getSearchType().equals("검색타입")) {
			deployRequestForCatetory.setSearchType("%");
		} else {
			deployRequestForCatetory.setSearchType(deployCateListDto.getSearchType());
		}
		
		if (deployCateListDto.getSearchKeyword().equals("") ) {
			deployRequestForCatetory.setSearchKeyword("%");
		} else {
			deployRequestForCatetory.setSearchKeyword(deployCateListDto.getSearchKeyword());
		}
		
		if (deployCateListDto.getCategoryChain().equals("부문")) {
			deployRequestForCatetory.setCategoryChain("%");
		} else {
			deployRequestForCatetory.setCategoryChain(deployCateListDto.getCategoryChain());
		}

//		if (deployCateListDto.getCategoryDivision().equals("구분")) {
//			deployRequestForCatetory.setCategoryDivision("%");
//		} else {
//			deployRequestForCatetory.setCategoryDivision(deployCateListDto.getCategoryDivision());
//		}

		if (deployCateListDto.getCategoryStatus().equals("00")) {
			deployRequestForCatetory.setCategoryStatus("%");
		} else {
			deployRequestForCatetory.setCategoryStatus(deployCateListDto.getCategoryStatus());
		}

		if (deployCateListDto.getCategoryWorktype().equals("작업유형")) {
			deployRequestForCatetory.setCategoryWorktype("%");
		} else {
			deployRequestForCatetory.setCategoryWorktype(deployCateListDto.getCategoryWorktype());
		}

		deployRequestForCatetory.setCategoryRequestDate(deployCateListDto.getCategoryRequestDate());
		return this.deployDao.selectCategoryDeployRequestDao(deployRequestForCatetory);
	}

	@Override
	public List<MasterCodeDto> selectAllMasterTableByStatusService() {
		return this.deployDao.selectAllMasterTableByStatusDao();
	}

	@Override
	public List<MasterCodeDto> selectMasterCodeOfCategoryService() {
		return this.deployDao.selectMasterCodeOfCategoryDao();
	}

	@Override
	public Map<String, List<MasterCodeDto>> selectCategoryMasterCodesService(List<MasterCodeDto> categoryType) {
		List<MasterCodeDto> categoryOneMasterCode = new ArrayList<MasterCodeDto>();
		Map<String, List<MasterCodeDto>> masterDates = new HashMap<String, List<MasterCodeDto>>();
		
		for (int i = 0; i < categoryType.size(); i++) {
			categoryOneMasterCode = this.deployDao.selectCategoryMasterCodesDao(categoryType.get(i).getCodeType());
			masterDates.put(categoryType.get(i).getCodeType(), categoryOneMasterCode);			
		}
		
		return masterDates;
	}


	@Override
	public Map<String, List<MasterCodeDto>> selectMasterCodeOfSearchTypeService(String searchTypeString) {
		List<MasterCodeDto> searchTypeOneMasterCode = new ArrayList<MasterCodeDto>();
		Map<String, List<MasterCodeDto>> masterDates = new HashMap<String, List<MasterCodeDto>>();
		
		searchTypeOneMasterCode = this.deployDao.selectMasterCodeOfSearchTypeDao(searchTypeString);
		masterDates.put(searchTypeString, searchTypeOneMasterCode);
		
		return masterDates;
	}
	
	@Override
	public List<EmployeeDto> selectSearchAllEmployeesService() {
		return this.deployDao.selectSearchAllEmployeesDao();
	}

}
