package com.springproject.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.common.utils.SHA256Util;
import com.springproject.deploy.dao.DeployDao;
import com.springproject.deploy.dto.DeployPayDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.employee.dao.EmployeeDao;
import com.springproject.employee.dto.AuthorityDto;
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
		
//		if ( salt != null ) {
//			String password = this.getHashedPassword(salt, employeeDto.getEmployeePassWord());
//			employeeDto.setEmployeePassWord(password);
//		}
		
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
	    boolean isDoPayingSuccessOfNextPay=false;
	    boolean isDoPayingSuccessOfCompleteNowPay = false;

//	    if(!deployPayDto.getDeployPayDescription().equals("deployPayE0")) {
	    	  isDoPayingSuccessOfCompleteNowPay=this.employeeDao.myDeployDoPayingOfCompleteNowPayDao(deployPayDto)>0;
		      if(deployPayDto.getDeployPayDescription().equals("deployPayB0")) {
			         deployPayDto.setDeployPayDescription("deployPayC0");
			         deployPayDto.setDeployPayLine("15");
			      }
			      
			      else if(deployPayDto.getDeployPayDescription().equals("deployPayC0")) {
			         deployPayDto.setDeployPayDescription("deployPayD0");
			         deployPayDto.setDeployPayLine("16");
			      }
			      
			      else if(deployPayDto.getDeployPayDescription().equals("deployPayD0")) {
			         deployPayDto.setDeployPayDescription("deployPayE0");
			         deployPayDto.setDeployPayLine("17");
			      }
	         isDoPayingSuccessOfNextPay = this.employeeDao.myDeployDoPayingOfAddNextPayDao(deployPayDto)>0;
	      
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
	      
	      boolean isChangeDeployRequestStatusCodeSuccess = this.employeeDao.changeStatusCodeForDeloyDoPayingDao(deployRequestDto)>0;

	      isDoPayingSuccess=isDoPayingSuccess&&isDoPayingSuccessOfCompleteNowPay&&isDoPayingSuccessOfNextPay&&isChangeDeployRequestStatusCodeSuccess;
	      
	      return isDoPayingSuccess;
	}
	
	@Override
	public boolean myDeployDoDeployingService(DeployPayDto deployPayDto) {
		boolean isDoDeployingSuccess=true;
	    boolean isDoDeployingSuccessOfCompleteNowPay = false;
	    isDoDeployingSuccessOfCompleteNowPay=this.employeeDao.myDeployDoPayingOfCompleteNowPayDao(deployPayDto)>0;
	    DeployRequestDto deployRequestDto=this.deployDao.selectDeployRequestOfDeployNoDao(deployPayDto.getDeployNo());
	    if(deployRequestDto.getStatusCode().equals("04")) {
        deployRequestDto.setStatusCode("05");
	    }
	    boolean isChangeDeployRequestStatusCodeSuccess = this.employeeDao.changeStatusCodeForDeloyDoPayingDao(deployRequestDto)>0;
	    isDoDeployingSuccess=isDoDeployingSuccess&&isDoDeployingSuccessOfCompleteNowPay&&isChangeDeployRequestStatusCodeSuccess;
		return isDoDeployingSuccess;
	}

	@Override
	public boolean myDeployDoReturningService(DeployPayDto deployPayDto) {
	      boolean isDoReturningSuccess=true;
	      
	      boolean isDoReturningSuccessOfNowPayForReturn=this.employeeDao.myDeployDoPayingOfCompleteNowPayDao(deployPayDto)>0;
	      deployPayDto.setDeployPayDescription("deployPayA1");
	      boolean isDoReturningSuccessOfNextPayForReturn=this.employeeDao.myDeployDoReturningOfNextPayDao(deployPayDto)>0;
	      
	      DeployRequestDto deployRequestDto=this.deployDao.selectDeployRequestOfDeployNoDao(deployPayDto.getDeployNo());
	      deployRequestDto.setStatusCode("06");
	      boolean isChangeDeployRequestStatusCodeSuccess=this.employeeDao.changeStatusCodeForDeloyDoPayingDao(deployRequestDto)>0;
	      
	      isDoReturningSuccess=isDoReturningSuccess&&isDoReturningSuccessOfNextPayForReturn&&isDoReturningSuccessOfNowPayForReturn&&isChangeDeployRequestStatusCodeSuccess;
	      return isDoReturningSuccess;
	}

	@Override
	public DeployPayDto selectMyDeployPayOfdeployNoService(Long deployNo) {
		return this.employeeDao.selectMyDeployPayOfdeployNoDao(deployNo);
	}

	@Override
	public boolean checkThisUserHaveAuthorityOfRequestService(EmployeeDto employeeDto) {
		boolean isThisUserHaveAuthorityOfRequest = false;
		List<AuthorityDto> authorityDto=this.employeeDao.checkThisUserHaveAuthorityOfRequestDao(employeeDto);
		if(authorityDto.size()==1) {
			isThisUserHaveAuthorityOfRequest=true;
		}
		else if(authorityDto.size()==0) {
			isThisUserHaveAuthorityOfRequest=false;
		}
		return isThisUserHaveAuthorityOfRequest ;
	}

	@Override
	public List<DeployPayDto> selectMyDeployPaidService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployPaidDao(employeeDto);
	}

	@Override
	public List<DeployPayDto> selectMyDeployWillDeployService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployWillDeployDao(employeeDto);
	}

	@Override
	public DeployPayDto selectMyDeployDoingDeployOfdeployNoService(DeployPayDto deployPayDtoForSearch) {
		return this.employeeDao.selectMyDeployDoingDeployOfdeployNoDao(deployPayDtoForSearch);
	}

	@Override
	public boolean checkThisUserHaveAuthorityOfDeployService(EmployeeDto employeeDto) {
		boolean isThisUserHaveAuthorityOfDeploy = false;
		List<AuthorityDto> authorityDto=this.employeeDao.checkThisUserHaveAuthorityOfDeployDao(employeeDto);
		if(authorityDto.size()==1) {
			isThisUserHaveAuthorityOfDeploy=true;
		}
		else if(authorityDto.size()==0) {
			isThisUserHaveAuthorityOfDeploy=false;
		}
		return isThisUserHaveAuthorityOfDeploy;
	}

	@Override
	public List<DeployPayDto> selectMyDeployDeployedService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployDeployedDao(employeeDto);
	}

	@Override
	public List<DeployPayDto> selectMyDeployReturnedService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployReturnedDao(employeeDto);
	}

	@Override
	public List<DeployPayDto> selectMyDeployCompletedService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployCompletedDao(employeeDto);
	}
}
