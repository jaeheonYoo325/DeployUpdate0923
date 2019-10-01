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
import com.springproject.wprogramtable.dto.WProgramTableDto;

@Service
@Transactional
public class DeployServiceImpl implements DeployService {

	@Autowired
	private DeployDao deployDao;

	@Override
	public boolean insertOneDeployService(DeployDto deployDto,String[] wProgramArray) {
		boolean isSuccess=this.deployDao.insertOneDeployDao(deployDto) > 0;
		boolean isSuccess2=true;
		int deployNo=this.deployDao.selectMaxDeployNo();
		System.out.println("서비스deployNo : "+deployNo);
		for(int i=0; i<wProgramArray.length;i++) {
			WProgramTableDto wProgramTableDto=new WProgramTableDto();
			wProgramTableDto.setwProNo_pageId(wProgramArray[i]);
			System.out.println("서비스안에서 String[i]값 : " + wProgramArray[i]);
			wProgramTableDto.setwProNo_deployNo(deployNo);
			System.out.println(wProgramTableDto.getwProNo_pageId()+"/"+wProgramTableDto.getwProNo_deployNo());
			isSuccess2=isSuccess2&&(this.deployDao.insertOneWProgram(wProgramTableDto)>0);
		}		
		boolean success=isSuccess&&isSuccess2;
        return success;		
	}
	

//	@Override
//	public List<DeployDto> selectAllDeployService() {
//		return this.deployDao.selectAllDeployDao();
//	}
//
//	@Override
//	public DeployDto selectOneDeployService(int deployNo) {
//		return this.deployDao.selectOneDeployDao(deployNo);
//	}
//
//	@Override
//	public boolean updateOneDeployService(DeployDto deployDto) {
//		return this.deployDao.updateOneDeployDao(deployDto) > 0;
//	}
//
//	@Override
//	public boolean deleteOneDeployService(int deployNo) {
//		return this.deployDao.deleteOneDeployDao(deployNo) > 0;
//	}
//
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

}
