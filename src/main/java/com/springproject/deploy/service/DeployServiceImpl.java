package com.springproject.deploy.service;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springproject.chain.dto.ChainTableDto;
import com.springproject.deploy.dao.DeployDao;
import com.springproject.deploy.dto.DeployCateListDto;
import com.springproject.deploy.dto.DeployDto;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.mastertable.dto.MasterTableDto;
import com.springproject.program.dto.ProgramTableDto;
import com.springproject.wprogramtable.dto.WProgramTableDto;
import com.springproject.wsource.dto.WSourceTableDto;

@Service
@Transactional
public class DeployServiceImpl implements DeployService {

	@Autowired
	private DeployDao deployDao;

	@Override
	public boolean insertOneDeployService(DeployDto deployDto, ArrayList<String> wProgramArray,
			ArrayList<String> pageNameArray, ArrayList<String> wSourceArray) {
		boolean insertDeploySuccess = this.deployDao.insertOneDeployDao(deployDto) > 0;
		boolean insertWSourceSuccess = true;
		boolean insertWProgramSuccess = true;

		int deployNo = this.deployDao.selectMaxDeployNo();

		for (int i = 0; i < wSourceArray.size(); i++) {
			WSourceTableDto wSourceTableDto = new WSourceTableDto();
			wSourceTableDto.setwSo_deployNo(deployNo);
			wSourceTableDto.setwSo_wSourceName(wSourceArray.get(i).toString());
			insertWSourceSuccess = insertWSourceSuccess && (this.deployDao.insertOneWSource(wSourceTableDto) > 0);
		}

		for (int i = 0; i < wProgramArray.size(); i++) {
			WProgramTableDto wProgramTableDto = new WProgramTableDto();
			wProgramTableDto.setwProNo_pageId(wProgramArray.get(i).toString());
			wProgramTableDto.setwProNo_deployNo(deployNo);
			wProgramTableDto.setwProNo_pageName(pageNameArray.get(i).toString());
			insertWProgramSuccess = insertWProgramSuccess && (this.deployDao.insertOneWProgram(wProgramTableDto) > 0);
		}

		boolean TotalSuccess = insertDeploySuccess && insertWProgramSuccess && insertWSourceSuccess;
		return TotalSuccess;
	}

	@Override
	public List<DeployDto> selectAllDeployService() {
		return this.deployDao.selectAllDeployDao();
	}

	@Override
	public DeployDto selectOneDeployService(int deployNo) {
		return this.deployDao.selectOneDeployDao(deployNo);
	}

	@Override
	public boolean updateOneDeployService(DeployDto deployDto, ArrayList<String> wProgramArray,
			ArrayList<String> pageNameArray, ArrayList<String> wSourceArray) {
		int deployNo = deployDto.getDeployNo();

		boolean isUpdateSuccess = true;
		boolean isInsertwSource = true;
		boolean isInsertwProgram = true;
		boolean isUpdateDeploy = this.deployDao.updateOneDeployDao(deployDto) > 0;
		boolean isDeleteWProgram = this.deployDao.deleteAllWProgram(deployNo) > 0;
		boolean isDeleteWSource = this.deployDao.deleteAllWSource(deployNo) > 0;

		for (int i = 0; i < wProgramArray.size(); i++) {
			WProgramTableDto wProgramTableDto = new WProgramTableDto();
			wProgramTableDto.setwProNo_deployNo(deployNo);
			wProgramTableDto.setwProNo_pageId(wProgramArray.get(i).toString());
			wProgramTableDto.setwProNo_pageName(pageNameArray.get(i).toString());
			isInsertwProgram = isInsertwProgram && (this.deployDao.insertOneWProgram(wProgramTableDto) > 0);
		}

		for (int i = 0; i < wSourceArray.size(); i++) {
			WSourceTableDto wSourceTableDto = new WSourceTableDto();
			wSourceTableDto.setwSo_deployNo(deployNo);
			wSourceTableDto.setwSo_wSourceName(wSourceArray.get(i).toString());
			isInsertwSource = isInsertwSource && (this.deployDao.insertOneWSource(wSourceTableDto) > 0);
		}

		isUpdateSuccess = isUpdateSuccess && isUpdateDeploy && isDeleteWProgram && isDeleteWSource && isInsertwProgram
				&& isInsertwSource;
		return isUpdateSuccess;
	}

	@Override
	public boolean deleteOneDeployService(int deployNo) {
		return this.deployDao.deleteOneDeployDao(deployNo) > 0;
	}

	@Override
	public List<EmployeeDto> selectSomeDeployService(EmployeeDto employeeDto) {
		return this.deployDao.selectSomeDeployDao(employeeDto);
	}

	@Override
	public List<ChainTableDto> selectSomeChainService(ChainTableDto chainTableDto) {
		return this.deployDao.selectSomeChainDao(chainTableDto);
	}

	@Override
	public List<ProgramTableDto> selectSomeProgramService(ProgramTableDto programTableDto) {
		return this.deployDao.selectSomeProgramDao(programTableDto);
	}

	@Override
	public List<ChainTableDto> selectAllChainService() {
		return this.deployDao.selectAllChainDao();
	}

	@Override
	public List<ProgramTableDto> selctAllProgramService(String paramChainId) {
		return this.deployDao.selectAllProgramDao(paramChainId);
	}

	@Override
	public List<WProgramTableDto> selectAllWProgramService(int deployNo) {
		return this.deployDao.selectAllWProgramDao(deployNo);
	}

	@Override
	public List<WSourceTableDto> selectAllWSourceService(int deployNo) {
		return this.deployDao.selectAllWSourceDao(deployNo);
	}

	@Override
	public List<DeployDto> selectSomeDeployCateListService(DeployCateListDto deployCateListDto) {
		DeployCateListDto deployCateListForDao=new DeployCateListDto();
		if(deployCateListDto.getCateChain().equals("부문")) {
		deployCateListForDao.setCateChain("%");
		}
		else {
			deployCateListForDao.setCateChain(deployCateListDto.getCateChain());
		}
		
		if(deployCateListDto.getCateDivision().equals("구분")) {
		deployCateListForDao.setCateDivision("%");
		}
		else {
			deployCateListForDao.setCateDivision(deployCateListDto.getCateDivision());
		}
		
		if(deployCateListDto.getCateStatus().equals("00")) {
		deployCateListForDao.setCateStatus("%");
		}
		else {
			deployCateListForDao.setCateStatus(deployCateListDto.getCateStatus());
		}
		
		if(deployCateListDto.getCateWtype().equals("작업유형")) {
		deployCateListForDao.setCateWtype("%");
		}
		else {
			deployCateListForDao.setCateWtype(deployCateListDto.getCateWtype());
		}
		
		deployCateListForDao.setCateReqDate(deployCateListDto.getCateReqDate());
		return this.deployDao.selectSomeDeployCateListDao(deployCateListForDao);
	}

	@Override
	public List<MasterTableDto> selectAllMasterTableByStatusService() {
		return this.deployDao.selectAllMasterTableByStatusDao();
	}

	@Override
	public List<MasterTableDto> selectCategoryTypeService() {
		 return this.deployDao.selectCategoryTypeDao();
	}

	@Override
	public List<List<MasterTableDto>> selectAllCategoryService(List<MasterTableDto> categoryType) {
	    List<MasterTableDto> categoryList = new ArrayList<MasterTableDto>();
	      List<List<MasterTableDto>> categoryInfoList = new ArrayList<List<MasterTableDto>>();
	      for(int i = 0; i < categoryType.size(); i++ ) {
	         categoryList = this.deployDao.selectAllCategoryDao(categoryType.get(i).getCodeType());
	         categoryInfoList.add(categoryList);
	      }
	      return categoryInfoList;
	}
}
