package com.springproject.employee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	
   @GetMapping("/employee/myDeployPay.do")
   public ModelAndView viewMyDeployPayPage(HttpSession session) {
      List<DeployPayDto> deployPay = this.employeeService.selectMyDeployPayService((EmployeeDto)session.getAttribute(Session.USER));
      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
      mv.addObject("deployPay",deployPay);
      return mv;
   }
   
   @GetMapping("/employee/showMyDeployPayDetail.do/{deployNo}")
   public ModelAndView viewMyDeployPayDetail(@PathVariable Long deployNo,HttpServletRequest request) {
      ModelAndView mv=new ModelAndView(HttpRequestHelper.getJspPath());
      DeployRequestDto deployRequestOfDeployNo = this.deployService.selectDeployRequestOfDeployNoService(deployNo);
      List<ModifiedProgramsDto> modifiedProgramOfDeployNo = this.deployService.selectModifiedProgramOfDeploNoService(deployNo);
      List<ModifiedResourcesDto> modifiedResourceOfDeployNo = this.deployService.selectModifiedResourceOfDeploNoService(deployNo);
      List<MasterCodeDto> statusCodeList = this.deployService.selectAllMasterTableByStatusService();
      mv.addObject("modifiedProgramOfDeployNo",modifiedProgramOfDeployNo);
      mv.addObject("modifiedResourceOfDeployNo", modifiedResourceOfDeployNo);
      mv.addObject("deployRequestOfDeployNo", deployRequestOfDeployNo);
      mv.addObject("statusCodeList", statusCodeList);
      return mv;
   }
   
   @PostMapping("/employee/MyDeployDoingPay.do")
   public ModelAndView doMyDeployPayAction(@ModelAttribute DeployPayDto deployPayDto,HttpSession session) {
      ModelAndView mv=new ModelAndView("redirect:/employee/myDeployPay.do");
      deployPayDto.setDeployDoingPayer(((EmployeeDto)session.getAttribute(Session.USER)).getEmployeeNo());
      boolean isDoingPaySuccess =this.employeeService.myDeployDoPayingService(deployPayDto);
//      조건문추가필요
      return mv;
   }
   
   @PostMapping("/employee/MyDeployDoingReturn.do")
   public ModelAndView doMyDeployReturnAction(@ModelAttribute DeployPayDto deployPayDto,HttpSession session) {
      ModelAndView mv=new ModelAndView("redirect:/employee/myDeployPay.do");
      deployPayDto.setDeployDoingPayer(((EmployeeDto)session.getAttribute(Session.USER)).getEmployeeNo());
      boolean isDoingReturnSuccess=this.employeeService.myDeployDoReturningService(deployPayDto);
      //조건문추가필요
      return mv;   
}
	
}
