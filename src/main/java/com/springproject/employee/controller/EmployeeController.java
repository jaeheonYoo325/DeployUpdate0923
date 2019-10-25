package com.springproject.employee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springproject.common.session.Session;
import com.springproject.common.utils.HttpRequestHelper;
import com.springproject.department.dto.DepartmentDto;
import com.springproject.department.service.DepartmentService;
import com.springproject.deploy.dto.CategoryTypeDto;
import com.springproject.deploy.dto.DeployPayDto;
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
	public ModelAndView doEmployeeLoginAction(@ModelAttribute EmployeeDto employeeDto, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/main/main.do");
		EmployeeDto loginEmployeeDto = this.employeeService.selectOneEmployeeService(employeeDto);
		loginEmployeeDto.setEmployeeNo(employeeDto.getEmployeeNo());
		loginEmployeeDto.setEmployeePassWord(employeeDto.getEmployeePassWord());
		session.setAttribute(Session.USER, loginEmployeeDto);
		return mv;
	}
	
	@GetMapping("/employee/employeeRegist.do")
	public String viewEmployeeRegistPage() {
		return HttpRequestHelper.getJspPath();
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
		System.out.println("진입!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<DepartmentDto> departmentDtoList = this.departmentService.selectSomeDepartmentService(departmentDto);
		mv.addObject("departmentDtoList", departmentDtoList);
		return mv;
	}
	
   @GetMapping("/employee/myDeployWillPay.do")
   public ModelAndView viewMyDeployPayPage(HttpSession session) {
      List<DeployPayDto> deployPay = this.employeeService.selectMyDeployPayService((EmployeeDto)session.getAttribute(Session.USER));
      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
      mv.addObject("deployPay",deployPay);
      return mv;
   }
   
   @GetMapping("/employee/showDeployPayDetail.do/{deployNo}/{deployPayDetailCode}")
   public ModelAndView viewMyDeployPayDetail(@PathVariable Long deployNo,@PathVariable String deployPayDetailCode,HttpServletRequest request) {
      ModelAndView mv=new ModelAndView(HttpRequestHelper.getJspPath());
      DeployRequestDto deployRequestOfDeployNo = this.deployService.selectDeployRequestOfDeployNoService(deployNo);
      List<ModifiedProgramsDto> modifiedProgramOfDeployNo = this.deployService.selectModifiedProgramOfDeploNoService(deployNo);
      List<ModifiedResourcesDto> modifiedResourceOfDeployNo = this.deployService.selectModifiedResourceOfDeploNoService(deployNo);
      List<MasterCodeDto> statusCodeList = this.deployService.selectAllMasterTableByStatusService();
      mv.addObject("modifiedProgramOfDeployNo",modifiedProgramOfDeployNo);
      mv.addObject("modifiedResourceOfDeployNo", modifiedResourceOfDeployNo);
      mv.addObject("deployRequestOfDeployNo", deployRequestOfDeployNo);
      mv.addObject("statusCodeList", statusCodeList);
      mv.addObject("deployPayDetailCode",deployPayDetailCode);
      return mv;
   }
   
   @GetMapping("/employee/MyDeployDoingPay.do/{deployNo}")
   public void doMyDeployPayAction(@PathVariable Long deployNo,HttpSession session,HttpServletResponse response) {
      DeployPayDto deployPayDto=this.employeeService.selectMyDeployPayOfdeployNoService(deployNo);
      deployPayDto.setDeployPayLineConfirm(((EmployeeDto)session.getAttribute(Session.USER)).getEmployeeNo());
      boolean isDoingPaySuccess =this.employeeService.myDeployDoPayingService(deployPayDto);
      PrintWriter out;
		if (isDoingPaySuccess) {
			response.setContentType("text/html;charset=UTF-8");

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
      DeployPayDto deployPayDto=this.employeeService.selectMyDeployPayOfdeployNoService(deployNo);
      deployPayDto.setDeployPayLineConfirm(((EmployeeDto)session.getAttribute(Session.USER)).getEmployeeNo());
      boolean isDoingReturnSuccess=this.employeeService.myDeployDoReturningService(deployPayDto);
      PrintWriter out;
		if (isDoingReturnSuccess) {
			response.setContentType("text/html;charset=UTF-8");

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
   
   @GetMapping("/employee/myDeployPaid.do")
   public ModelAndView viewMyDeployPaidPage(HttpSession session) {
      List<DeployPayDto> deployPaid = this.employeeService.selectMyDeployPaidService((EmployeeDto)session.getAttribute(Session.USER));
      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
      mv.addObject("deployPaid",deployPaid);
      return mv;
   }
   
   @GetMapping("/employee/myDeployWillDeploy.do")
   public ModelAndView viewMyDeployWillDeployPage(HttpSession session, HttpServletResponse response) {
	 		ModelAndView mv=null;
	 		boolean isThisUserHaveAuthorityOfDeploy=this.employeeService.checkThisUserHaveAuthorityOfDeployService((EmployeeDto)session.getAttribute(Session.USER));
	 		//
	 		if(isThisUserHaveAuthorityOfDeploy) {
	 			mv = new ModelAndView(HttpRequestHelper.getJspPath());
	 		      List<DeployPayDto> deployWillDeploy = this.employeeService.selectMyDeployWillDeployService((EmployeeDto)session.getAttribute(Session.USER));
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
	  DeployPayDto deploypayDtoForSearch=new DeployPayDto();
	  deploypayDtoForSearch.setDeployNo(deployNo);
	  deploypayDtoForSearch.setDeployPayLine(((EmployeeDto)session.getAttribute(Session.USER)).getEmployeeNo());
	  
      DeployPayDto deployPayDto=this.employeeService.selectMyDeployDoingDeployOfdeployNoService(deploypayDtoForSearch);
      deployPayDto.setDeployPayLineConfirm(((EmployeeDto)session.getAttribute(Session.USER)).getEmployeeNo());
      System.out.println("deployDtoset후"+deployPayDto.getDeployPayLineConfirm());
      boolean isDoDeployingSuccess =this.employeeService.myDeployDoDeployingService(deployPayDto);
      PrintWriter out;
		if (isDoDeployingSuccess) {
			response.setContentType("text/html;charset=UTF-8");

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
	 		ModelAndView mv=null;
	 		boolean isThisUserHaveAuthorityOfDeploy=this.employeeService.checkThisUserHaveAuthorityOfDeployService((EmployeeDto)session.getAttribute(Session.USER));
	 		
	 		if(isThisUserHaveAuthorityOfDeploy) {
	 			mv = new ModelAndView(HttpRequestHelper.getJspPath());
	 		      List<DeployPayDto> deployDeployed = this.employeeService.selectMyDeployDeployedService((EmployeeDto)session.getAttribute(Session.USER));
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
      List<DeployPayDto> deployReturned = this.employeeService.selectMyDeployReturnedService((EmployeeDto)session.getAttribute(Session.USER));
      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
      mv.addObject("deployReturned",deployReturned);
      return mv;
   }
   
	@GetMapping("/employee/showMyPayReturnedDetail.do/{deployNo}")
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
		mv.addObject("deployRequestOfDeployNo", deployRequestOfDeployNo);
		mv.addObject("categoryMasterCodes", categoryMasterCodes);
		mv.addObject("categoryType", categoryType);
		return mv;
	}
	
	@GetMapping("/employee/myDeployCompleted.do")
	   public ModelAndView viewMyDeployCompletedPage(HttpSession session) {
	      List<DeployPayDto> deployCompleted = this.employeeService.selectMyDeployCompletedService((EmployeeDto)session.getAttribute(Session.USER));
	      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
	      mv.addObject("deployCompleted",deployCompleted);
	      return mv;
	}
}
