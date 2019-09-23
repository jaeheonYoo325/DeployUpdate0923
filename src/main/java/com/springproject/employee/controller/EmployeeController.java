package com.springproject.employee.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springproject.common.session.Session;
import com.springproject.common.utils.HttpRequestHelper;
import com.springproject.department.dto.DepartmentDto;
import com.springproject.department.service.DepartmentService;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.employee.service.EmployeeService;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@GetMapping("/employee/employeeLogin.do")
	public String viewEmployeeLoginPage() {
		return HttpRequestHelper.getJspPath();
	}
	
	@PostMapping("/employee/employeeLogin.do")
	public ModelAndView doEmployeeLoginAction(
			@ModelAttribute EmployeeDto employeeDto
			, HttpSession session) {
		
		ModelAndView mv = new ModelAndView("redirect:/main/main.do");
		
		EmployeeDto loginEmployeeDto = this.employeeService.selectOneEmployeeService(employeeDto);
		loginEmployeeDto.setEmpNo(employeeDto.getEmpNo());
		loginEmployeeDto.setEmpPw(employeeDto.getEmpPw());
		
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
	
	@GetMapping("/search/searchDepartmentPopup.do")
	public String viewSearchDepartmentPopup() {
		return HttpRequestHelper.getJspPath();
	}
	
	@PostMapping("/search/searchDepartmentPopup.do")
	public ModelAndView doSearchDepartmentPopupAction(@ModelAttribute DepartmentDto departmentDto) {
		System.out.println("진입!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<DepartmentDto> departmentDtoList = this.departmentService.selectSomeDepartmentService(departmentDto);
		
		mv.addObject("departmentDtoList", departmentDtoList);
		
		return mv;
		
	}
	
}
