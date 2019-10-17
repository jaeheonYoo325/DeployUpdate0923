package com.springproject.deploy.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springproject.chain.dto.ChainDto;
import com.springproject.common.utils.HttpRequestHelper;
import com.springproject.deploy.dto.CategoryTypeDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.deploy.service.DeployService;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.mastercode.dto.MasterCodeDto;
import com.springproject.modifiedprograms.dto.ModifiedProgramsDto;
import com.springproject.modifiedresources.dto.ModifiedResourcesDto;
import com.springproject.program.dto.ProgramDto;

@Controller
public class DeployController {
	@Autowired
	private DeployService deployService;

	@GetMapping("/main/main.do")
	public String viewMainPage() {
		return HttpRequestHelper.getJspPath();
	}

	@GetMapping("/deploy/deploy.do")
	public String viewDeployPage() {
		return HttpRequestHelper.getJspPath();
	}


	@GetMapping("/search/searchEmployee.do")
	public String viewsearchEmployeePage(@RequestParam("employeeSearchWhere") String employeeSearchWhere) {
		return HttpRequestHelper.getJspPath();
	}
	
	@PostMapping("/search/searchEmployee.do")
	public ModelAndView doSearchEmployeeAction(@ModelAttribute EmployeeDto employeeDto) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		System.out.println("modelattrubtue로 받아온 이름"+employeeDto.getEmployeeName());
		List<EmployeeDto> searchEmployees = this.deployService.selectSearchEmployeesService(employeeDto);
		System.out.println("DB검색후이름"+searchEmployees.get(0).getEmployeeName());
		mv.addObject("searchEmployees", searchEmployees);
		return mv;
	}

	@GetMapping("/search/searchChain.do")
	public ModelAndView viewsearchChainPage() {
		ModelAndView mv=new ModelAndView(HttpRequestHelper.getJspPath());
		List<ChainDto> searchChain = this.deployService.selectSearchAllChainService();
		mv.addObject("searchChain",searchChain);
		return mv;
	}
	
	@PostMapping("/search/searchChain.do")
	public ModelAndView doSearchChainAction(@ModelAttribute ChainDto chainDto) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<ChainDto> searchChain = this.deployService.selectSearchedChainService(chainDto);
		mv.addObject("searchChain", searchChain);
		return mv;
	}

	@GetMapping("/search/searchModifiedPrograms.do")
	   public ModelAndView viewSearchModifiedProgramsPage(@RequestParam("selectedchainId") String selectedchainId, @RequestParam("modifiedProgramsTextNo") int modifiedProgramsTextNo) {
	      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
	      List<ProgramDto> Programs = this.deployService.selectSearchAllModifiedProgramService(selectedchainId);
	      mv.addObject("selectedchainId",selectedchainId);
	      mv.addObject("Programs",Programs);
	      mv.addObject("modifiedProgramsTextNo",modifiedProgramsTextNo);
	      return mv;
	   }
	
	@PostMapping("/search/searchModifiedPrograms.do")
	public ModelAndView doSearchModifiedProgramsDtoAction(@RequestParam("selectedchainId") String selectedchainId, @ModelAttribute ProgramDto programDto, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		String modifiedProgramsTextNo=request.getParameter("modifiedProgramsTextNo");
		List<ProgramDto> Programs = this.deployService.selectSearchedModifiedProgramService(programDto);
		mv.addObject("selectedchainId",selectedchainId);
		mv.addObject("Programs", Programs);	
		mv.addObject("modifiedProgramsTextNo",modifiedProgramsTextNo);
		return mv;
	}

	@GetMapping("/search/searchModifiedResource.do")
	public ModelAndView doSearchSourceAction(@RequestParam("modifiedResourceTextNo") int modifiedResourceTextNo) {
	      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
	      mv.addObject("modifiedResourceTextNo", modifiedResourceTextNo);
	      return mv;
			
	}
	
	@GetMapping("/deploy/deployRequest.do")
	public String viewDeployRequestPage() {
		return HttpRequestHelper.getJspPath();
	}
	
	@PostMapping("/deploy/deployRequest.do")
	public ModelAndView doDeployAction(@Valid @ModelAttribute DeployRequestDto deployRequestDto, Errors errors, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
//		ModifiedProgramsDto modifiedProgramsDto = new ModifiedProgramsDto();
//		ModifiedResourcesDto modifiedResourcesDto = new ModifiedResourcesDto();
		ArrayList<String> modifiedPrograms = new ArrayList<String>();
		ArrayList<String> modifiedProgramName = new ArrayList<String>();
		ArrayList<String> modifiedResources = new ArrayList<String>();
		
		if ( errors.hasErrors() ) {
			System.out.println("Controller - deployRequest.do errors!!!");
			mv.setViewName("pc/deploy/deployRequest");
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

		
		boolean deployInsertSuccess = this.deployService.InsertDeployRequestService(deployRequestDto, modifiedPrograms, modifiedProgramName, modifiedResources);
		
		PrintWriter out;
		if (deployInsertSuccess) {
			response.setContentType("text/html;charset=UTF-8");

			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('요청완료')");
				out.println("window.opener.location.reload()");
				out.println("window.close()");
				out.println("</script>");
				mv.setViewName("redirect:/deploy/deployList.do");
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
		return mv;
	}
	
	@RequestMapping("/deploy/deployList.do")
	public ModelAndView doDeployListAction(HttpServletRequest request) {
		// 여기서 부터 네이밍 수정해야함
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<ChainDto> chain = this.deployService.selectSearchAllChainService();
		List<List<ModifiedProgramsDto>> modifiedPrograms = new ArrayList<List<ModifiedProgramsDto>>();
		List<List<ModifiedResourcesDto>> modifiedResources = new ArrayList<List<ModifiedResourcesDto>>();
		List<DeployRequestDto> deployRequests = new ArrayList<DeployRequestDto>();
	    CategoryTypeDto categoryType = new CategoryTypeDto();
	    List<MasterCodeDto> statusCodeList = this.deployService.selectAllMasterTableByStatusService();
	    List<MasterCodeDto> masterCodeType = this.deployService.selectMasterCodeTypeService();
	    Map<String, List<MasterCodeDto>> categoryMasterCodes = this.deployService.selectCategoryMasterCodesService(masterCodeType);
	    
	    if(request.getParameter("categoryChain") != null && request.getParameter("categoryWorktype") != null && request.getParameter("categoryRequestDate") != null && request.getParameter("categoryDivision") != null && request.getParameter("categoryStatus")!=null) {
	    	  String categoryChain = request.getParameter("categoryChain");
		      String categoryWorkType=request.getParameter("categoryWorktype");
		      String categoryRequestDate = request.getParameter("categoryRequestDate");
		      String categoryDivision = request.getParameter("categoryDivision");
		      String categoryStatus = request.getParameter("categoryStatus");
		      categoryType.setCategoryChain(categoryChain);
		      categoryType.setCategoryWorktype(categoryWorkType);
		      categoryType.setCategoryRequestDate(categoryRequestDate);
		      categoryType.setCategoryDivision(categoryDivision);
		      categoryType.setCategoryStatus(categoryStatus);
		      deployRequests = this.deployService.selectCategoryDeployRequestService(categoryType);
	    } else {
	         categoryType.setCategoryChain("부문");
	         categoryType.setCategoryWorktype("작업유형");
	         categoryType.setCategoryRequestDate("요청날짜");
	         categoryType.setCategoryDivision("구분");
	         categoryType.setCategoryStatus("상태");
	         deployRequests = this.deployService.selectAllDeployRequestService();
	      }
	      	      
		for(int i=0; i<deployRequests.size();i++) {
			Long deployNo=deployRequests.get(i).getDeployNo();
			
			List<ModifiedProgramsDto> modifiedProgramOfDeploNo = this.deployService.selectModifiedProgramOfDeploNoService(deployNo);
			modifiedPrograms.add(modifiedProgramOfDeploNo);
			
			List<ModifiedResourcesDto> modifiedResourceOfDeploNo = this.deployService.selectModifiedResourceOfDeploNoService(deployNo);
			modifiedResources.add(modifiedResourceOfDeploNo);

		}
		
		mv.addObject("deployRequests", deployRequests);
		mv.addObject("modifiedPrograms",modifiedPrograms);
		mv.addObject("modifiedResources",modifiedResources);
		mv.addObject("chain", chain);
		mv.addObject("categoryType", categoryType);
		mv.addObject("statusCodeList", statusCodeList);
		mv.addObject("categoryMasterCodes",categoryMasterCodes);
		return mv;
	}
    
	@GetMapping("/deploy/showDeployRequestDetail.do/{deployNo}")
	//
	public ModelAndView viewDeployUpdatePage(@PathVariable Long deployNo) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
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

	@PostMapping("/deploy/deployRequestModify.do")
	public void doDeployUpdateAction(@ModelAttribute DeployRequestDto deployRequestDto, HttpServletResponse response, HttpServletRequest request) {
		ArrayList<String> modifiedPrograms = new ArrayList<String>();
		ArrayList<String> modifiedProgramName = new ArrayList<String>();
		ArrayList<String> modifiedResources = new ArrayList<String>();
		
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
			response.setContentType("text/html;charset=UTF-8");
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
		}
	}

	@RequestMapping("/deploy/deployRequestDelete.do/{deployNo}")
	public void doDeployDeleteAction(@PathVariable Long deployNo, HttpServletResponse response) {
		boolean deleteOneDeployRequestOfDeployNoSuccess = this.deployService.deleteOneDeployRequestOfDeployNoService(deployNo);
		
		PrintWriter out;
		if (deleteOneDeployRequestOfDeployNoSuccess) {
			response.setContentType("text/html;charset=UTF-8");

			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제완료')");
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
				out.println("alert('수정실패')");
				out.println("history.back()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}

