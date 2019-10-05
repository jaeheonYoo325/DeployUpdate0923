package com.springproject.deploy.service;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springproject.chain.dto.ChainTableDto;
import com.springproject.deploy.dao.DeployDao;
import com.springproject.deploy.dto.DeployDto;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.program.dto.ProgramTableDto;
import com.springproject.statustable.dto.StatusTableDto;
import com.springproject.wprogramtable.dto.WProgramTableDto;
import com.springproject.wsource.dto.WSourceTableDto;

@Service
@Transactional
public class DeployServiceImpl implements DeployService {

	@Autowired
	private DeployDao deployDao;

	@Override
	public boolean insertOneDeployService(DeployDto deployDto,ArrayList wProgramArray, ArrayList pageNameArray, ArrayList wSourceArray, ArrayList statusArray) {
		boolean isSuccess=this.deployDao.insertOneDeployDao(deployDto) > 0;
		boolean isSuccess2=true;
		boolean isSuccess3=true;
		boolean isSuccess4=true;
		
		int deployNo=this.deployDao.selectMaxDeployNo();
		
		for(int i=0; i<wSourceArray.size();i++) {
			WSourceTableDto wSourceTableDto=new WSourceTableDto();
			wSourceTableDto.setwSo_deployNo(deployNo);
			wSourceTableDto.setwSo_wSourceName(wSourceArray.get(i).toString());
			isSuccess3=isSuccess3&&(this.deployDao.insertOneWSource(wSourceTableDto)>0);
		}
		
		
		for(int i=0; i<wProgramArray.size();i++) {
			WProgramTableDto wProgramTableDto=new WProgramTableDto();
			wProgramTableDto.setwProNo_pageId(wProgramArray.get(i).toString());
			wProgramTableDto.setwProNo_deployNo(deployNo);
			wProgramTableDto.setwProNo_pageName(pageNameArray.get(i).toString());
			isSuccess2=isSuccess2&&(this.deployDao.insertOneWProgram(wProgramTableDto)>0);
		}		
		
        StatusTableDto statusTableDto=new StatusTableDto();
        statusTableDto.setSt_deployNo(deployNo);
        statusTableDto.setSt_status(statusArray.get(0).toString());
        isSuccess4=this.deployDao.insertOneStatus(statusTableDto)>0;
        
		boolean success=isSuccess&&isSuccess2&&isSuccess3&&isSuccess4;
        return success;		
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
	public boolean updateOneDeployService(DeployDto deployDto) {
		return this.deployDao.updateOneDeployDao(deployDto) > 0;
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

}
