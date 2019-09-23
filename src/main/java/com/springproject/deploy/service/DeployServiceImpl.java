package com.springproject.deploy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.chain.dto.ChainTableDto;
import com.springproject.deploy.dao.DeployDao;
import com.springproject.deploy.dto.DeployDto;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.program.dto.ProgramTableDto;
import com.springproject.seqtable.dto.SeqTableDto;

@Service
public class DeployServiceImpl implements DeployService {

	@Autowired
	private DeployDao deployDao;

	@Override
	public boolean insertOneDeployService(DeployDto deployDto) {
		return this.deployDao.insertOneDeployDao(deployDto) > 0;
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
      return this.deployDao.selectSomeChaintableDao(chainTableDto);
   }

   @Override
   public List<ProgramTableDto> selectSomeProgramService(ProgramTableDto programTableDto) {
      return this.deployDao.selectSomeProgramTableDao(programTableDto);
   }

   @Override
   public List<SeqTableDto> selectSomeProgramService(SeqTableDto seqTableDto) {
      return this.deployDao.selectSomeSeqTableDao(seqTableDto);
   }
}
