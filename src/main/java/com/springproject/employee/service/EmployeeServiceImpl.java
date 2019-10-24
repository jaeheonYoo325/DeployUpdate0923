package com.springproject.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.common.utils.SHA256Util;
import com.springproject.deploy.dao.DeployDao;
import com.springproject.deploy.dto.DeployPayDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.employee.dao.EmployeeDao;
import com.springproject.employee.dto.EmployeeDto;

@Service
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	private DeployDao deployDao;

	@Override
	public boolean insertOneEmployeeService(EmployeeDto employeeDto) {
		
		String salt = SHA256Util.generateSalt();
		String password = this.getHashedPassword(salt, employeeDto.getEmployeePassWord());
		
		employeeDto.setEmployeePassWord(password);
		employeeDto.setSalt(salt);
		
		return this.employeeDao.insertOneEmployeeDao(employeeDto) > 0;
	}
	
	public String getHashedPassword(String salt, String password) {
		return SHA256Util.getEncrypt(password, salt);
	}
		
	@Override
	public EmployeeDto selectOneEmployeeService(EmployeeDto employeeDto) {
		
		String salt = this.employeeDao.getSaltByEmployeeNumber(employeeDto.getEmployeeNo());
		
		if ( salt != null ) {
			String password = this.getHashedPassword(salt, employeeDto.getEmployeePassWord());
			employeeDto.setEmployeePassWord(password);
		}
		
		EmployeeDto loginEmployeeDto = this.employeeDao.selectOneEmployeeDao(employeeDto);
		return loginEmployeeDto;
	}

	@Override
	public List<DeployPayDto> selectMyDeployPayService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployPayDao(employeeDto);
	}

	@Override
	public boolean myDeployDoPayingService(DeployPayDto deployPayDto) {
		boolean isDoPayingSuccess=true;
	      boolean isDoPayingSuccessOfNextPay=true;
	      
	      if(deployPayDto.getDeployPayer().equals("deployPayB0")) {
	         deployPayDto.setDeployPayer("deployPayC0");
	      }
	      
	      else if(deployPayDto.getDeployPayer().equals("deployPayC0")) {
	         deployPayDto.setDeployPayer("deployPayD0");
	      }
	      
	      else if(deployPayDto.getDeployPayer().equals("deployPayD0")) {
	         deployPayDto.setDeployPayer("deployPayE0");
	      }
	      
	      boolean isDoPayingSuccessOfCompleteNowPay = this.employeeDao.myDeployDoPayingOfCompleteNowPayDao(deployPayDto)>0;
	      
	      if(!deployPayDto.getDeployPayer().equals("deployPayE0")) {
	         isDoPayingSuccessOfNextPay = this.employeeDao.myDeployDoPayingOfAddNextPayDao(deployPayDto)>0;
	      }
	      
	      if(deployPayDto.getDeployPayer().equals("deployPayE0")) {
	         isDoPayingSuccessOfNextPay = this.employeeDao.myDeployDoFinalCompleteOfPayDao(deployPayDto)>0;
	      }
	      
	      DeployRequestDto deployRequestDto=this.deployDao.selectDeployRequestOfDeployNoDao(deployPayDto.getDeployNo());
	      
	      if(deployRequestDto.getStatusCode().equals("01")) {
	         deployRequestDto.setStatusCode("02");
	      }
	      else if(deployRequestDto.getStatusCode().equals("02")) {
	         deployRequestDto.setStatusCode("03");
	      }
	      
	      else if(deployRequestDto.getStatusCode().equals("03")) {
	         deployRequestDto.setStatusCode("04");
	      }
	      
	      else if(deployRequestDto.getStatusCode().equals("04")) {
	         deployRequestDto.setStatusCode("05");
	      }
	      
	      boolean isChangeDeployRequestStatusCodeSuccess = this.employeeDao.changeStatusCodeForDeloyDoPayingDao(deployRequestDto)>0;

	      isDoPayingSuccess=isDoPayingSuccess&&isDoPayingSuccessOfCompleteNowPay&&isDoPayingSuccessOfNextPay&&isChangeDeployRequestStatusCodeSuccess;
	      return isDoPayingSuccess;
	}

	@Override
	public boolean myDeployDoReturningService(DeployPayDto deployPayDto) {
	      boolean isDoReturningSuccess=true;
	      
	      boolean isDoReturningSuccessOfNowPay=this.employeeDao.myDeployDoPayingOfCompleteNowPayDao(deployPayDto)>0;
	      deployPayDto.setDeployPayer("deployPayA1");
	      boolean isDoReturningSuccessOfNextPay=this.employeeDao.myDeployDoFinalCompleteOfPayDao(deployPayDto)>0;
	      
	      DeployRequestDto deployRequestDto=this.deployDao.selectDeployRequestOfDeployNoDao(deployPayDto.getDeployNo());
	      deployRequestDto.setStatusCode("06");
	      boolean isChangeDeployRequestStatusCodeSuccess=this.employeeDao.changeStatusCodeForDeloyDoPayingDao(deployRequestDto)>0;
	      
	      isDoReturningSuccess=isDoReturningSuccess&&isDoReturningSuccessOfNextPay&&isDoReturningSuccessOfNowPay&&isChangeDeployRequestStatusCodeSuccess;
	      return isDoReturningSuccess;
	}
	
}
