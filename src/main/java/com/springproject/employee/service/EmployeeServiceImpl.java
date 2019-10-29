package com.springproject.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springproject.common.utils.SHA256Util;
import com.springproject.deploy.dao.DeployDao;
import com.springproject.deploy.dto.DeployApprovalDto;
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
		if ( salt != null ) {
			String password = this.getHashedPassword(salt, employeeDto.getEmployeePassWord());
			employeeDto.setEmployeePassWord(password);
		}
		
		EmployeeDto loginEmployeeDto = this.employeeDao.selectOneEmployeeDao(employeeDto);
		return loginEmployeeDto;
	}

	@Override
	public List<DeployApprovalDto> selectMyDeployApprovalService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployApprovalDao(employeeDto);
	}

	@Override
	public boolean myDeployDoApprovalingService(DeployApprovalDto deployApprovalDto) {
		boolean isDoApprovalingSuccess=true;
	    boolean isDoApprovalingSuccessOfNextApproval=false;
	    boolean isDoApprovalingSuccessOfCompleteNowApproval = false;

    	  isDoApprovalingSuccessOfCompleteNowApproval=this.employeeDao.myDeployDoApprovalingOfCompleteNowApprovalDao(deployApprovalDto)>0;
	      if(deployApprovalDto.getDeployApprovalDescription().equals("deployApprovalB0")) {
		         deployApprovalDto.setDeployApprovalDescription("deployApprovalC0");
		         deployApprovalDto.setDeployApprovalLine("15");
		      }
		      
		      else if(deployApprovalDto.getDeployApprovalDescription().equals("deployApprovalC0")) {
		         deployApprovalDto.setDeployApprovalDescription("deployApprovalD0");
		         deployApprovalDto.setDeployApprovalLine("16");
		      }
		      
		      else if(deployApprovalDto.getDeployApprovalDescription().equals("deployApprovalD0")) {
		         deployApprovalDto.setDeployApprovalDescription("deployApprovalE0");
		         deployApprovalDto.setDeployApprovalLine("17");
		      }
	      
	      isDoApprovalingSuccessOfNextApproval = this.employeeDao.myDeployDoApprovalingOfAddNextApprovalDao(deployApprovalDto)>0;
	      
	      DeployRequestDto deployRequestDto=this.deployDao.selectDeployRequestOfDeployNoDao(deployApprovalDto.getDeployNo());
	      
	      if(deployRequestDto.getStatusCode().equals("01")) {
	         deployRequestDto.setStatusCode("02");
	      }
	      else if(deployRequestDto.getStatusCode().equals("02")) {
	         deployRequestDto.setStatusCode("03");
	      }
	      
	      else if(deployRequestDto.getStatusCode().equals("03")) {
	         deployRequestDto.setStatusCode("04");
	      }
	      
	      boolean isChangeDeployRequestStatusCodeSuccess = this.employeeDao.changeStatusCodeForDeloyDoApprovalingDao(deployRequestDto)>0;

	      isDoApprovalingSuccess=isDoApprovalingSuccess&&isDoApprovalingSuccessOfCompleteNowApproval&&isDoApprovalingSuccessOfNextApproval&&isChangeDeployRequestStatusCodeSuccess;
	      
	      return isDoApprovalingSuccess;
	}
	
	@Override
	public boolean myDeployDoDeployingService(DeployApprovalDto deployApprovalDto) {
		boolean isDoDeployingSuccess=true;
	    boolean isDoDeployingSuccessOfCompleteNowApproval = false;
	    isDoDeployingSuccessOfCompleteNowApproval=this.employeeDao.myDeployDoApprovalingOfCompleteNowApprovalDao(deployApprovalDto)>0;
	    DeployRequestDto deployRequestDto=this.deployDao.selectDeployRequestOfDeployNoDao(deployApprovalDto.getDeployNo());
	    if(deployRequestDto.getStatusCode().equals("04")) {
        deployRequestDto.setStatusCode("05");
	    }
	    boolean isChangeDeployRequestStatusCodeSuccess = this.employeeDao.changeStatusCodeForDeloyDoApprovalingDao(deployRequestDto)>0;
	    isDoDeployingSuccess=isDoDeployingSuccess&&isDoDeployingSuccessOfCompleteNowApproval&&isChangeDeployRequestStatusCodeSuccess;
		return isDoDeployingSuccess;
	}

	@Override
	public boolean myDeployDoReturningService(DeployApprovalDto deployApprovalDto) {
	      boolean isDoReturningSuccess=true;
	      
	      boolean isDoReturningSuccessOfNowApprovalForReturn=this.employeeDao.myDeployDoApprovalingOfCompleteNowApprovalDao(deployApprovalDto)>0;
	      deployApprovalDto.setDeployApprovalDescription("deployApprovalA1");
	      boolean isDoReturningSuccessOfNextApprovalForReturn=this.employeeDao.myDeployDoReturningOfNextApprovalDao(deployApprovalDto)>0;
	      
	      DeployRequestDto deployRequestDto=this.deployDao.selectDeployRequestOfDeployNoDao(deployApprovalDto.getDeployNo());
	      deployRequestDto.setStatusCode("06");
	      boolean isChangeDeployRequestStatusCodeSuccess=this.employeeDao.changeStatusCodeForDeloyDoApprovalingDao(deployRequestDto)>0;
	      
	      isDoReturningSuccess=isDoReturningSuccess&&isDoReturningSuccessOfNextApprovalForReturn&&isDoReturningSuccessOfNowApprovalForReturn&&isChangeDeployRequestStatusCodeSuccess;
	      return isDoReturningSuccess;
	}

	@Override
	public DeployApprovalDto selectMyDeployApprovalOfdeployNoService(Long deployNo) {
		return this.employeeDao.selectMyDeployApprovalOfdeployNoDao(deployNo);
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
	public List<DeployApprovalDto> selectMyDeployApprovedService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployApprovedDao(employeeDto);
	}

	@Override
	public List<DeployApprovalDto> selectMyDeployWillDeployService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployWillDeployDao(employeeDto);
	}

	@Override
	public DeployApprovalDto selectMyDeployDoingDeployOfdeployNoService(DeployApprovalDto deployApprovalDtoForSearch) {
		return this.employeeDao.selectMyDeployDoingDeployOfdeployNoDao(deployApprovalDtoForSearch);
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
	public List<DeployApprovalDto> selectMyDeployDeployedService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployDeployedDao(employeeDto);
	}

	@Override
	public List<DeployApprovalDto> selectMyDeployReturnedService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployReturnedDao(employeeDto);
	}

	@Override
	public List<DeployApprovalDto> selectMyDeployCompletedService(EmployeeDto employeeDto) {
		return this.employeeDao.selectMyDeployCompletedDao(employeeDto);
	}

	@Override
	public boolean checkisThisUserHaveAuthorityOfEmployeeRegistService(EmployeeDto employeeDto) {
		boolean isThisUserHaveAuthorityOfEmployeeRegist = false;
	      List<AuthorityDto> authorityDto=this.employeeDao.checkThisUserHaveAuthorityOfEmployeeRegist(employeeDto);
	      if(authorityDto.size()==1) {
	         isThisUserHaveAuthorityOfEmployeeRegist=true;
	      }
	      else if(authorityDto.size()==0) {
	         isThisUserHaveAuthorityOfEmployeeRegist=false;
	      }
	      return isThisUserHaveAuthorityOfEmployeeRegist;
	}

	@Override
	public int duplicateCheckOfEmployeeNoService(String employeeNo) {
		return this.employeeDao.duplicateCheckOfEmployeeNoDao(employeeNo);
	}
}
