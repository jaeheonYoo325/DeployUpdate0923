package com.springproject.employee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springproject.common.session.Session;
import com.springproject.common.utils.HttpRequestHelper;
import com.springproject.common.validator.employee.EmployeeValidator;
import com.springproject.department.dto.DepartmentDto;
import com.springproject.department.service.DepartmentService;
import com.springproject.deploy.dto.CategoryTypeDto;
import com.springproject.deploy.dto.DeployApprovalDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.deploy.service.DeployService;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.employee.service.EmployeeService;
import com.springproject.mastercode.dto.MasterCodeDto;
import com.springproject.modifiedprograms.dto.ModifiedProgramsDto;
import com.springproject.modifiedresources.dto.ModifiedResourcesDto;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private DeployService deployService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@GetMapping("/employee/employeeLogin.do")
	public String viewEmployeeLoginPage() {
		return HttpRequestHelper.getJspPath();
	}
		
	@PostMapping("/employee/employeeLogin.do")
	public ModelAndView doEmployeeLoginAction(@Validated(value= {EmployeeValidator.Login.class}) @ModelAttribute EmployeeDto employeeDto, Errors errors, HttpSession session, HttpServletResponse response) {
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		ModelAndView mv = null;
		
		if ( errors.hasErrors()) {
			mv = new ModelAndView(HttpRequestHelper.getJspPath());
			mv.addObject("employeeDto", employeeDto);
			return mv;
		}
		
		EmployeeDto loginEmployeeDto = this.employeeService.selectOneEmployeeService(employeeDto);
		PrintWriter out;
		if ( loginEmployeeDto != null ) {
			loginEmployeeDto.setEmployeeNo(employeeDto.getEmployeeNo());
			loginEmployeeDto.setEmployeePassWord(employeeDto.getEmployeePassWord());
			session.setAttribute(Session.USER, loginEmployeeDto);
			
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 성공하였습니다.')");	
				out.println("window.location.href = 'http://localhost:8080/main/main.do';");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return mv;
		} else {
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('사원번호와 비밀번호가 일치하지 않습니다.')");
				out.println("history.back()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return mv;
		}
	}
	
   @GetMapping("/employee/employeeRegist.do")
   public String viewEmployeeRegistPage(HttpServletResponse response, HttpSession session) {
         response.setCharacterEncoding("UTF-8"); 
       response.setContentType("text/html; charset=UTF-8");          
       boolean isThisUserHaveAuthorityOfEmployeeRegist=this.employeeService.checkisThisUserHaveAuthorityOfEmployeeRegistService((EmployeeDto)session.getAttribute(Session.USER));
       if(isThisUserHaveAuthorityOfEmployeeRegist) {
          return HttpRequestHelper.getJspPath();
       }
       else {
          try {
            PrintWriter out;
            out = response.getWriter();
            out.println("<script>");
            out.println("alert('사원등록권한이 없습니다')");
            out.println("history.back()");
            out.println("</script>");
         } catch (IOException e) {
            e.printStackTrace();
         }
         return null;
       }
   }
	
	@PostMapping("/employee/employeeRegist.do")
	public ModelAndView doEmployeeRegistAction(@ModelAttribute EmployeeDto employeeDto) {
		ModelAndView mv = new ModelAndView("redirect:/employee/employeeLogin.do");
		boolean isSuccess = this.employeeService.insertOneEmployeeService(employeeDto);
		return mv;
	}
	
	@GetMapping("/employee/employeeLogout.do")
	public String doEmployeeLogoutAction(HttpSession session) {
		session.invalidate();
		return "redirect:/employee/employeeLogin.do";
	}
	
	@GetMapping("/employee/employeeRegistPopup.do")
	public String viewemployeeRegistPopupPage() {
		return HttpRequestHelper.getJspPath();
	}
	
	@GetMapping("/search/searchDepartment.do")
	public String viewSearchDepartmentPopup() {
		return HttpRequestHelper.getJspPath();
	}
	
	@PostMapping("/search/searchDepartment.do")
	public ModelAndView doSearchDepartmentPopupAction(@ModelAttribute DepartmentDto departmentDto) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<DepartmentDto> departmentDtoList = this.departmentService.selectSomeDepartmentService(departmentDto);
		mv.addObject("departmentDtoList", departmentDtoList);
		return mv;
	}
	
   @GetMapping("/employee/myDeployWillApproval.do")
   public ModelAndView viewMyDeployApprovalPage(HttpSession session) {
      List<DeployApprovalDto> deployApproval = this.employeeService.selectMyDeployApprovalService((EmployeeDto)session.getAttribute(Session.USER));
      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
      mv.addObject("deployApproval",deployApproval);
      return mv;
   }
   
   @GetMapping("/employee/showDeployApprovalDetail.do/{deployNo}/{deployApprovalDetailCode}")
   public ModelAndView viewMyDeployApprovalDetail(@PathVariable Long deployNo,@PathVariable String deployApprovalDetailCode,HttpServletRequest request) {
      ModelAndView mv=new ModelAndView(HttpRequestHelper.getJspPath());
      DeployRequestDto deployRequestOfDeployNo = this.deployService.selectDeployRequestOfDeployNoService(deployNo);
      List<ModifiedProgramsDto> modifiedProgramOfDeployNo = this.deployService.selectModifiedProgramOfDeploNoService(deployNo);
      List<ModifiedResourcesDto> modifiedResourceOfDeployNo = this.deployService.selectModifiedResourceOfDeploNoService(deployNo);
      List<MasterCodeDto> statusCodeList = this.deployService.selectAllMasterTableByStatusService();
      mv.addObject("modifiedProgramOfDeployNo",modifiedProgramOfDeployNo);
      mv.addObject("modifiedResourceOfDeployNo", modifiedResourceOfDeployNo);
      mv.addObject("deployRequestOfDeployNo", deployRequestOfDeployNo);
      mv.addObject("statusCodeList", statusCodeList);
      mv.addObject("deployApprovalDetailCode",deployApprovalDetailCode);
      return mv;
   }
   
   @GetMapping("/employee/MyDeployDoingApproval.do/{deployNo}")
   public void doMyDeployApprovalAction(@PathVariable Long deployNo,HttpSession session,HttpServletResponse response) {
	  response.setCharacterEncoding("UTF-8"); 
	  response.setContentType("text/html; charset=UTF-8");
	  
      DeployApprovalDto deployApprovalDto=this.employeeService.selectMyDeployApprovalOfdeployNoService(deployNo);
      deployApprovalDto.setDeployApprovalLineConfirm(((EmployeeDto)session.getAttribute(Session.USER)).getEmployeeNo());
      boolean isDoingApprovalSuccess =this.employeeService.myDeployDoApprovalingService(deployApprovalDto);
      PrintWriter out;
		if (isDoingApprovalSuccess) {
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('결제완료')");
				out.println("window.opener.location.reload()");
				out.println("window.close()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('오류')");
				out.println("history.back()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
   }
   
   @GetMapping("/employee/MyDeployDoingReturn.do/{deployNo}")
   public void doMyDeployReturnAction(@PathVariable Long deployNo,HttpSession session,HttpServletResponse response) {
	  response.setCharacterEncoding("UTF-8"); 
	  response.setContentType("text/html; charset=UTF-8");
	  
      DeployApprovalDto deployApprovalDto=this.employeeService.selectMyDeployApprovalOfdeployNoService(deployNo);
      deployApprovalDto.setDeployApprovalLineConfirm(((EmployeeDto)session.getAttribute(Session.USER)).getEmployeeNo());
      boolean isDoingReturnSuccess=this.employeeService.myDeployDoReturningService(deployApprovalDto);
      PrintWriter out;
		if (isDoingReturnSuccess) {
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('반려완료')");
				out.println("window.opener.location.reload()");
				out.println("window.close()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('반려실패')");
				out.println("history.back()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
   }
   
   @GetMapping("/employee/myDeployApproved.do")
   public ModelAndView viewMyDeployApprovedPage(HttpSession session) {
      List<DeployApprovalDto> deployApproved = this.employeeService.selectMyDeployApprovedService((EmployeeDto)session.getAttribute(Session.USER));
      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
      mv.addObject("deployApproved",deployApproved);
      return mv;
   }
   
   @GetMapping("/employee/myDeployWillDeploy.do")
   public ModelAndView viewMyDeployWillDeployPage(HttpSession session, HttpServletResponse response) {
	   
	   	response.setCharacterEncoding("UTF-8"); 
	    response.setContentType("text/html; charset=UTF-8"); 	   	
 		ModelAndView mv=null;
 		boolean isThisUserHaveAuthorityOfDeploy=this.employeeService.checkThisUserHaveAuthorityOfDeployService((EmployeeDto)session.getAttribute(Session.USER));

 		if(isThisUserHaveAuthorityOfDeploy) {
 			mv = new ModelAndView(HttpRequestHelper.getJspPath());
 		      List<DeployApprovalDto> deployWillDeploy = this.employeeService.selectMyDeployWillDeployService((EmployeeDto)session.getAttribute(Session.USER));
 		      mv.addObject("deployWillDeploy",deployWillDeploy);
 			return mv;
 		}
 		else {
 			try {
 				PrintWriter out;
 				out = response.getWriter();
 				out.println("<script>");
 				out.println("alert('배포권한이 없습니다')");
 				out.println("history.back()");
 				out.println("</script>");
 			} catch (IOException e) {
 				e.printStackTrace();
 			}
 			return mv;
 		}
   }
   
   @GetMapping("/employee/myDeployDoingDeploy.do/{deployNo}")
   public void doMyDeployDoDeployingAction(@PathVariable Long deployNo,HttpSession session,HttpServletResponse response) {
	  response.setCharacterEncoding("UTF-8"); 
	  response.setContentType("text/html; charset=UTF-8");
	  
	  DeployApprovalDto deployApprovalDtoForSearch = new DeployApprovalDto();
	  deployApprovalDtoForSearch.setDeployNo(deployNo);
	  deployApprovalDtoForSearch.setDeployApprovalLine(((EmployeeDto)session.getAttribute(Session.USER)).getEmployeeNo());
	  
      DeployApprovalDto deployApprovalDto = this.employeeService.selectMyDeployDoingDeployOfdeployNoService(deployApprovalDtoForSearch);
      deployApprovalDto.setDeployApprovalLineConfirm(((EmployeeDto)session.getAttribute(Session.USER)).getEmployeeNo());
      boolean isDoDeployingSuccess =this.employeeService.myDeployDoDeployingService(deployApprovalDto);
      PrintWriter out;
		if (isDoDeployingSuccess) {
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('배포완료')");
				out.println("window.opener.location.reload()");
				out.println("window.close()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('배포실패')");
				out.println("history.back()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
   }
   
   @GetMapping("/employee/myDeployDeployed.do")
   public ModelAndView viewMyDeployDeployedPage(HttpSession session, HttpServletResponse response) {
	   response.setCharacterEncoding("UTF-8"); 
	   response.setContentType("text/html; charset=UTF-8"); 	   	
	   
		ModelAndView mv=null;
		boolean isThisUserHaveAuthorityOfDeploy=this.employeeService.checkThisUserHaveAuthorityOfDeployService((EmployeeDto)session.getAttribute(Session.USER));
		
		if(isThisUserHaveAuthorityOfDeploy) {
			mv = new ModelAndView(HttpRequestHelper.getJspPath());
		      List<DeployApprovalDto> deployDeployed = this.employeeService.selectMyDeployDeployedService((EmployeeDto)session.getAttribute(Session.USER));
		      mv.addObject("deployDeployed",deployDeployed);
			return mv;
		}
		else {
			try {
				PrintWriter out;
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('배포권한이 없습니다')");
				out.println("history.back()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return mv;
		}
   }
   
   @GetMapping("/employee/myDeployReturned.do")
   public ModelAndView viewMyDeployReturnedPage(HttpSession session) {
      List<DeployApprovalDto> deployReturned = this.employeeService.selectMyDeployReturnedService((EmployeeDto)session.getAttribute(Session.USER));
      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
      mv.addObject("deployReturned",deployReturned);
      return mv;
   }
   
	@GetMapping("/employee/showMyApprovalReturnedDetail.do/{deployNo}")
	public ModelAndView viewDeployUpdatePage(@PathVariable Long deployNo) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		DeployRequestDto deployRequestOfDeployNo = this.deployService.selectDeployRequestOfDeployNoService(deployNo);
		List<ModifiedProgramsDto> modifiedProgramOfDeployNo = this.deployService.selectModifiedProgramOfDeploNoService(deployNo);
		List<ModifiedResourcesDto> modifiedResourceOfDeployNo = this.deployService.selectModifiedResourceOfDeploNoService(deployNo);
		
		List<MasterCodeDto> masterCodeType = this.deployService.selectMasterCodeOfCategoryService();
		Map<String, List<MasterCodeDto>> categoryMasterCodes = this.deployService.selectCategoryMasterCodesService(masterCodeType);
		CategoryTypeDto categoryType = new CategoryTypeDto();
		
		mv.addObject("modifiedProgramOfDeployNo",modifiedProgramOfDeployNo);
		mv.addObject("modifiedResourceOfDeployNo", modifiedResourceOfDeployNo);
		mv.addObject("deployRequestDto", deployRequestOfDeployNo);
		mv.addObject("categoryMasterCodes", categoryMasterCodes);
		mv.addObject("categoryType", categoryType);
		return mv;
	}
	
	@PostMapping("/employee/showMyApprovalReturnedDetail.do")
	public ModelAndView doDeployUpdateAction(@Valid @ModelAttribute DeployRequestDto deployRequestDto, Errors errors, HttpServletResponse response, HttpServletRequest request) {
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8"); 
		
		ModelAndView mv = null;
		ArrayList<String> modifiedPrograms = new ArrayList<String>();
		ArrayList<String> modifiedProgramName = new ArrayList<String>();
		ArrayList<String> modifiedResources = new ArrayList<String>();
		
		
		List<ModifiedProgramsDto> modifiedProgramOfDeployNo = this.deployService.selectModifiedProgramOfDeploNoService(deployRequestDto.getDeployNo());
		List<ModifiedResourcesDto> modifiedResourceOfDeployNo = this.deployService.selectModifiedResourceOfDeploNoService(deployRequestDto.getDeployNo());
		List<MasterCodeDto> masterCodeType = this.deployService.selectMasterCodeOfCategoryService();
		Map<String, List<MasterCodeDto>> categoryMasterCodes = this.deployService.selectCategoryMasterCodesService(masterCodeType);
		CategoryTypeDto categoryType = new CategoryTypeDto();
		
		if ( errors.hasErrors() ) {
			mv = new ModelAndView(HttpRequestHelper.getJspPath());
			mv.addObject("modifiedProgramOfDeployNo",modifiedProgramOfDeployNo);
			mv.addObject("modifiedResourceOfDeployNo", modifiedResourceOfDeployNo);
			mv.addObject("categoryType", categoryType);
			mv.addObject("categoryMasterCodes", categoryMasterCodes);
			mv.addObject("deployRequestDto", deployRequestDto);
			return mv;
		}
		
		
		for(int i=0;;i++) {
			if(request.getParameter("modifiedPrograms_pageId"+i)==null) {
				break;
			}
			modifiedPrograms.add(request.getParameter("modifiedPrograms_pageId"+i));
			modifiedProgramName.add(request.getParameter("modifiedPrograms_pageName"+i));
		}
		
		for(int i=0;;i++) {
			if(request.getParameter("modifiedResources_wSourceName"+i)==null) {
				break;
			}
			modifiedResources.add(request.getParameter("modifiedResources_wSourceName"+i));
		}
				
		boolean updateOneDeployRequestSuccess = this.deployService.updateOneDeployRequestService(deployRequestDto, modifiedPrograms, modifiedProgramName, modifiedResources);
		
		PrintWriter out;
		if (updateOneDeployRequestSuccess) {
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정완료')");
				out.println("window.opener.location.reload()");
				out.println("window.close()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return mv;
		} else {
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정실패')");
				out.println("history.back()");				
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return mv;
		}
	}
	
	@GetMapping("/employee/myDeployCompleted.do")
	   public ModelAndView viewMyDeployCompletedPage(HttpSession session) {
	      List<DeployApprovalDto> deployCompleted = this.employeeService.selectMyDeployCompletedService((EmployeeDto)session.getAttribute(Session.USER));
	      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
	      mv.addObject("deployCompleted",deployCompleted);
	      return mv;
	}
}
