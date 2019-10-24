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
import javax.servlet.http.HttpSession;
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
import com.springproject.common.session.Session;
import com.springproject.common.utils.HttpRequestHelper;
import com.springproject.deploy.dto.CategoryTypeDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.deploy.service.DeployService;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.employee.service.EmployeeService;
import com.springproject.mastercode.dto.MasterCodeDto;
import com.springproject.modifiedprograms.dto.ModifiedProgramsDto;
import com.springproject.modifiedresources.dto.ModifiedResourcesDto;
import com.springproject.program.dto.ProgramDto;

@Controller
public class DeployController {
	@Autowired
	private DeployService deployService;

	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping("/main/main.do")
	public String viewMainPage() {
		return HttpRequestHelper.getJspPath();
	}

	@GetMapping("/deploy/deploy.do")
	public String viewDeployPage() {
		return HttpRequestHelper.getJspPath();
	}

	@GetMapping("/search/searchEmployee.do")
	public ModelAndView viewsearchEmployeePage(@RequestParam("employeeSearchWhere") String employeeSearchWhere) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<EmployeeDto> searchEmployees = this.deployService.selectSearchAllEmployeesService();
		mv.addObject("searchEmployees", searchEmployees);
		return mv;
	}
	
	@PostMapping("/search/searchEmployee.do")
	public ModelAndView doSearchEmployeeAction(@ModelAttribute EmployeeDto employeeDto) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<EmployeeDto> searchEmployees = this.deployService.selectSearchEmployeesService(employeeDto);
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
	public ModelAndView viewDeployRequestPage(HttpSession session, HttpServletResponse response) {
		ModelAndView mv=null;
		boolean isThisUserHaveAuthorityOfRequest=this.employeeService.checkThisUserHaveAuthorityOfRequestService((EmployeeDto)session.getAttribute(Session.USER));
		if(isThisUserHaveAuthorityOfRequest) {
			mv = new ModelAndView(HttpRequestHelper.getJspPath());
			List<MasterCodeDto> masterCodeType = this.deployService.selectMasterCodeOfCategoryService();
			Map<String, List<MasterCodeDto>> categoryMasterCodes = this.deployService.selectCategoryMasterCodesService(masterCodeType);
			CategoryTypeDto categoryType = new CategoryTypeDto();
			mv.addObject("categoryType", categoryType);
			mv.addObject("categoryMasterCodes", categoryMasterCodes);
			return mv;
		}
		else {
			try {
				PrintWriter out;
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('요청권한이 없습니다')");
				out.println("history.back()");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return mv;
		}
	}
		
		
	public ModelAndView viewDeployRequestPage() {
		
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<MasterCodeDto> masterCodeType = this.deployService.selectMasterCodeOfCategoryService();
		Map<String, List<MasterCodeDto>> categoryMasterCodes = this.deployService.selectCategoryMasterCodesService(masterCodeType);
		CategoryTypeDto categoryType = new CategoryTypeDto();
		
		mv.addObject("categoryType", categoryType);
		mv.addObject("categoryMasterCodes", categoryMasterCodes);
		
		return mv;
	}
	
	@PostMapping("/deploy/deployRequest.do")
	public ModelAndView doDeployAction(@Valid @ModelAttribute DeployRequestDto deployRequestDto, Errors errors, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		ArrayList<String> modifiedPrograms = new ArrayList<String>();
		ArrayList<String> modifiedProgramName = new ArrayList<String>();
		ArrayList<String> modifiedResources = new ArrayList<String>();
		
		if ( errors.hasErrors() ) {
			mv.setViewName("redirect:/deploy/deployRequest.do");
//			mv.addObject("deployRequestDto", deployRequestDto);
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
				out.println("alert('요청실패')");
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
		
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<ChainDto> chain = this.deployService.selectSearchAllChainService();
		Map<Long, List<ModifiedProgramsDto>> modifiedProgramsMap = new HashMap<Long, List<ModifiedProgramsDto>>(); 
		Map<Long, List<ModifiedResourcesDto>> modifiedResourcesMap = new HashMap<Long, List<ModifiedResourcesDto>>();
		List<DeployRequestDto> deployRequests = new ArrayList<DeployRequestDto>();
	    CategoryTypeDto categoryType = new CategoryTypeDto();
	    List<MasterCodeDto> masterCodeOfCategory = this.deployService.selectMasterCodeOfCategoryService();
	    Map<String, List<MasterCodeDto>> categoryMasterCodes = this.deployService.selectCategoryMasterCodesService(masterCodeOfCategory);
	    List<ModifiedProgramsDto> modifiedProgramOfDeployNo = new ArrayList<ModifiedProgramsDto>();
	    List<ModifiedResourcesDto> modifiedResourceOfDeployNo = new ArrayList<ModifiedResourcesDto>();
	    Map<String, List<MasterCodeDto>> masterCodeOfSearchTypeMap = this.deployService.selectMasterCodeOfSearchTypeService(categoryType.getSearchTypeString());
	    
	    Long deployNo = 0L;
		
	    if(request.getParameter("searchType") != null && request.getParameter("searchKeyword") != null && request.getParameter("categoryChain") != null && request.getParameter("categoryWorktype") != null && request.getParameter("categoryRequestDate") != null && request.getParameter("categoryDivision") != null && request.getParameter("categoryStatus")!=null) {
	    	  String searchType = request.getParameter("searchType"); 
	    	  String searchKeyword = request.getParameter("searchKeyword");
	    	  String categoryChain = request.getParameter("categoryChain");
		      String categoryWorkType=request.getParameter("categoryWorktype");
		      String categoryRequestDate = request.getParameter("categoryRequestDate");
		      String categoryDivision = request.getParameter("categoryDivision");
		      String categoryStatus = request.getParameter("categoryStatus");
		      categoryType.setSearchType(searchType);
		      categoryType.setSearchKeyword(searchKeyword);
		      categoryType.setCategoryChain(categoryChain);
		      categoryType.setCategoryWorktype(categoryWorkType);
		      categoryType.setCategoryRequestDate(categoryRequestDate);
		      categoryType.setCategoryDivision(categoryDivision);
		      categoryType.setCategoryStatus(categoryStatus);
		      deployRequests = this.deployService.selectCategoryDeployRequestService(categoryType);
	    } else {
	    	 categoryType.setSearchType("검색타입");
	    	 categoryType.setSearchKeyword("");
	         categoryType.setCategoryChain("부문");
	         categoryType.setCategoryWorktype("작업유형");
	         categoryType.setCategoryRequestDate("요청날짜");
	         categoryType.setCategoryDivision("구분");
	         categoryType.setCategoryStatus("상태");
	         deployRequests = this.deployService.selectAllDeployRequestService();
	      }
	      	      
		for(int i=0; i < deployRequests.size(); i++) {
			deployNo = deployRequests.get(i).getDeployNo();
			
			modifiedProgramOfDeployNo = this.deployService.selectModifiedProgramOfDeploNoService(deployNo);
			modifiedProgramsMap.put(deployNo, modifiedProgramOfDeployNo);
			
			modifiedResourceOfDeployNo = this.deployService.selectModifiedResourceOfDeploNoService(deployNo);
			modifiedResourcesMap.put(deployNo, modifiedResourceOfDeployNo);
		}
		
		
		mv.addObject("deployRequests", deployRequests);
		mv.addObject("chain", chain);
		mv.addObject("categoryType", categoryType);
		mv.addObject("categoryMasterCodes",categoryMasterCodes);
		
		mv.addObject("modifiedProgramsMap", modifiedProgramsMap);
		mv.addObject("modifiedResourcesMap", modifiedResourcesMap);
		
		mv.addObject("masterCodeOfSearchTypeMap", masterCodeOfSearchTypeMap);
		return mv;
	}
    
	@GetMapping("/deploy/showDeployRequestDetail.do/{deployNo}")
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

