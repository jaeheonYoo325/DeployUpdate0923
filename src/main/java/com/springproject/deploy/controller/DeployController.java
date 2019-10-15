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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.springproject.chain.dto.ChainTableDto;
import com.springproject.common.utils.HttpRequestHelper;
import com.springproject.deploy.dto.DeployCateListDto;
import com.springproject.deploy.dto.DeployDto;
import com.springproject.deploy.service.DeployService;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.mastertable.dto.MasterTableDto;
import com.springproject.program.dto.ProgramTableDto;
import com.springproject.wprogramtable.dto.WProgramTableDto;
import com.springproject.wsource.dto.WSourceTableDto;

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

	@GetMapping("/deploy/deployRequest.do")
	public String viewDeployRequestPage() {
		return HttpRequestHelper.getJspPath();
	}

	@GetMapping("/search/searchEmp.do")
	public String viewsearchEmpPage(@RequestParam("str") String str) {
		return HttpRequestHelper.getJspPath();
	}
	
	@PostMapping("/search/searchEmp.do")
	public ModelAndView doSearchEmpAction(@RequestParam("str") String str, @ModelAttribute EmployeeDto employeeDto) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<EmployeeDto> employeeDtoList = this.deployService.selectSomeDeployService(employeeDto);
		mv.addObject("employeeDtoList", employeeDtoList);
		return mv;
	}

	@GetMapping("/search/searchChain.do")
	public ModelAndView viewsearchChainPage() {
		ModelAndView mv=new ModelAndView(HttpRequestHelper.getJspPath());
		List<ChainTableDto> chainTableDtoList=this.deployService.selectAllChainService();
		mv.addObject("chainTableDtoList",chainTableDtoList);
		return mv;
	}
	
	@PostMapping("/search/searchChain.do")
	public ModelAndView doSearchChainAction(@ModelAttribute ChainTableDto chainTableDto) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<ChainTableDto> chainTableDtoList = this.deployService.selectSomeChainService(chainTableDto);
		mv.addObject("chainTableDtoList", chainTableDtoList);
		return mv;
	}

	@GetMapping("/search/searchProgram.do")
	   public ModelAndView viewsearchProgramPage(@RequestParam("paramChainId") String paramChainId, @RequestParam("no") int no) {
	      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
	      List<ProgramTableDto> programTableDtoList=this.deployService.selctAllProgramService(paramChainId);
	      mv.addObject("paramChainId",paramChainId);
	      mv.addObject("programTableDtoList",programTableDtoList);
	      mv.addObject("no",no);
	      return mv;
	   }
	
	@PostMapping("/search/searchProgram.do")
	public ModelAndView doSearchProgramAction(@RequestParam("paramChainId") String paramChainId, @ModelAttribute ProgramTableDto programTableDto) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<ProgramTableDto> programTableDtoList = this.deployService.selectSomeProgramService(programTableDto);
		mv.addObject("paramChainId",paramChainId);
		mv.addObject("programTableDtoList", programTableDtoList);	
		return mv;
	}

	@GetMapping("/search/searchSource.do")
	public ModelAndView doSearchSourceAction(@RequestParam("no") int no) {
	      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
	      mv.addObject("no", no);
	      return mv;
			
	}
	
	@PostMapping("/deploy/deployRequest.do")
	public ModelAndView doDeployAction(@ModelAttribute DeployDto deployDto, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = null;
//		ArrayList wProgramArray, pageNameArray, wSourceArray=new ArrayList();
		ArrayList<String> wProgramArray = new ArrayList<String>();
		ArrayList<String> pageNameArray = new ArrayList<String>();
		ArrayList<String> wSourceArray = new ArrayList<String>();
		
		for(int i=0;;i++) {
			if(request.getParameter("wProgram"+i)==null) {
				break;
			}
			wProgramArray.add(request.getParameter("wProgram"+i));
			pageNameArray.add(request.getParameter("pageName"+i));
		}
		
		for(int i=0;;i++) {
			if(request.getParameter("wSource"+i)==null) {
				break;
			}
			wSourceArray.add(request.getParameter("wSource"+i));
		}
		
		boolean DeployInsertSuccess = this.deployService.insertOneDeployService(deployDto, wProgramArray, pageNameArray, wSourceArray);
		
		PrintWriter out;
		if (DeployInsertSuccess) {
			response.setContentType("text/html;charset=UTF-8");

			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('요청완료')");
				out.println("window.opener.location.reload()");
				out.println("window.close()");
				out.println("</script>");
				mv=new ModelAndView("redirect:/deploy/deployList.do");
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
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<ChainTableDto> chainDtoList = this.deployService.selectAllChainService();
		List<List<WProgramTableDto>> wProgramList = new ArrayList<List<WProgramTableDto>>();
		List<List<WSourceTableDto>> wSourceList = new ArrayList<List<WSourceTableDto>>();
		List<DeployDto> deployDtoList = new ArrayList<DeployDto>();
	    DeployCateListDto deployCateListDto = new DeployCateListDto();
	    List<MasterTableDto> statusCodeList = this.deployService.selectAllMasterTableByStatusService();
	    List<MasterTableDto> categoryType = this.deployService.selectCategoryTypeService();
	    List<List<MasterTableDto>> categoryTypeList = this.deployService.selectAllCategoryService(categoryType);
	    
	    if(request.getParameter("cateChain") != null && request.getParameter("cateWtype") != null && request.getParameter("cateReqDate") != null && request.getParameter("cateDivision") != null && request.getParameter("cateStatus")!=null) {
	    	  String cateChain=request.getParameter("cateChain");
		      String cateWtype=request.getParameter("cateWtype");
		      String cateReqDate=request.getParameter("cateReqDate");
		      String cateDivision=request.getParameter("cateDivision");
		      String cateStatus=request.getParameter("cateStatus");
		      deployCateListDto.setCateChain(cateChain);
		      deployCateListDto.setCateWtype(cateWtype);
		      deployCateListDto.setCateReqDate(cateReqDate);
		      deployCateListDto.setCateDivision(cateDivision);
		      deployCateListDto.setCateStatus(cateStatus);
		      deployDtoList = this.deployService.selectSomeDeployCateListService(deployCateListDto);
	    } else {
	         deployCateListDto.setCateChain("부문");
	         deployCateListDto.setCateWtype("작업유형");
	         deployCateListDto.setCateReqDate("요청날짜");
	         deployCateListDto.setCateDivision("구분");
	         deployCateListDto.setCateStatus("상태");
	         deployDtoList = this.deployService.selectAllDeployService();
	      }
	      	      
		for(int i=0; i<deployDtoList.size();i++) {
			int deployNo=deployDtoList.get(i).getDeployNo();
			
			List<WProgramTableDto> wProgramTableList=this.deployService.selectAllWProgramService(deployNo);
			wProgramList.add(wProgramTableList);
			
			List<WSourceTableDto> wSourceTableDtoList=this.deployService.selectAllWSourceService(deployNo);
			wSourceList.add(wSourceTableDtoList);

		}
		mv.addObject("deployDtoList", deployDtoList);
		mv.addObject("wProgramList",wProgramList);
		mv.addObject("wSourceList",wSourceList);
		mv.addObject("chainDtoList", chainDtoList);
		mv.addObject("deployCateListDto", deployCateListDto);
		mv.addObject("statusCodeList", statusCodeList);
		mv.addObject("categoryTypeList",categoryTypeList);
		return mv;
	}
    
	@GetMapping("/deploy/deployUpdate.do/{deployNo}")
	public ModelAndView viewDeployUpdatePage(@PathVariable int deployNo) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		DeployDto deployDto = this.deployService.selectOneDeployService(deployNo);
		List<WProgramTableDto> wProgramTableDtoList=this.deployService.selectAllWProgramService(deployNo);
		List<WSourceTableDto> wSourceTableDtoList=this.deployService.selectAllWSourceService(deployNo);
		List<MasterTableDto> statusCodeList = this.deployService.selectAllMasterTableByStatusService();
		mv.addObject("wProgramTableDtoList",wProgramTableDtoList);
		mv.addObject("wSourceTableDtoList", wSourceTableDtoList);
		mv.addObject("deployDto", deployDto);
		mv.addObject("statusCodeList", statusCodeList);
		return mv;
	}

	@PostMapping("/deploy/deployUpdate.do")
	public void doDeployUpdateAction(@ModelAttribute DeployDto deployDto, HttpServletResponse response, HttpServletRequest request) {
		ArrayList<String> wProgramArray = new ArrayList<String>();
		ArrayList<String> pageNameArray = new ArrayList<String>();
		ArrayList<String> wSourceArray = new ArrayList<String>();
		
		for(int i=0;;i++) {
			if(request.getParameter("wProgram"+i)==null) {
				break;
			}
			wProgramArray.add(request.getParameter("wProgram"+i));
			pageNameArray.add(request.getParameter("pageName"+i));
		}
		
		for(int i=0;;i++) {
			if(request.getParameter("wSource"+i)==null) {
				break;
			}
			wSourceArray.add(request.getParameter("wSource"+i));
		}
				
		boolean isUpdateSuccess = this.deployService.updateOneDeployService(deployDto, wProgramArray, pageNameArray, wSourceArray);
		
		PrintWriter out;
		if (isUpdateSuccess) {
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

	@RequestMapping("/deploy/deployDelete.do/{deployNo}")
	public void doDeployDeleteAction(@PathVariable int deployNo, HttpServletResponse response) {
		boolean isSuccess = this.deployService.deleteOneDeployService(deployNo);
		
		PrintWriter out;
		if (isSuccess) {
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

