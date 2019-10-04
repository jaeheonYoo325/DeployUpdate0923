package com.springproject.deploy.controller;

import java.io.IOException;

import java.io.PrintWriter;
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
import com.springproject.deploy.dto.DeployDto;
import com.springproject.deploy.service.DeployService;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.program.dto.ProgramTableDto;
import com.springproject.wprogramtable.dto.WProgramTableDto;

@Controller
public class DeployController {

	private Logger logger = LoggerFactory.getLogger(DeployController.class);

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

	@GetMapping("/deploy/request.do")
	public String viewDeployRequestPage() {
		return HttpRequestHelper.getJspPath();
	}

	@GetMapping("/search/searchEmp.do")
	public String viewsearchEmpPage(@RequestParam("str") String str) {
		return HttpRequestHelper.getJspPath();
	}

	@GetMapping("/search/searchChain.do")
	public ModelAndView viewsearchChainPage() {
		ModelAndView mv=new ModelAndView(HttpRequestHelper.getJspPath());
		List<ChainTableDto> chainTableDtoList=this.deployService.selectAllChainService();
		mv.addObject("chainTableDtoList",chainTableDtoList);
		return mv;
	}

	@GetMapping("/search/searchProgram.do")
	   public ModelAndView viewsearchProgramPage(@RequestParam("paramChainId") String paramChainId, HttpServletRequest request) {
		  int no=Integer.parseInt(request.getParameter("no"));
	      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
	      List<ProgramTableDto> programTableDtoList=this.deployService.selctAllProgramService(paramChainId);
	      mv.addObject("paramChainId",paramChainId);
	      mv.addObject("programTableDtoList",programTableDtoList);
	      mv.addObject("no",no);
	      return mv;
	   }


	@PostMapping("/search/searchEmp.do")
	public ModelAndView doSearchEmpAction(@RequestParam("str") String str, @ModelAttribute EmployeeDto employeeDto) {

		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<EmployeeDto> employeeDtoList = this.deployService.selectSomeDeployService(employeeDto);

		mv.addObject("employeeDtoList", employeeDtoList);
		return mv;
	}
//

	@PostMapping("/search/searchChain.do")
	public ModelAndView doSearchChainAction(@ModelAttribute ChainTableDto chainTableDto) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<ChainTableDto> chainTableDtoList = this.deployService.selectSomeChainService(chainTableDto);
		mv.addObject("chainTableDtoList", chainTableDtoList);
		return mv;
	}
//
	@PostMapping("/search/searchProgram.do")
	public ModelAndView doSearchProgramAction(@ModelAttribute ProgramTableDto programTableDto, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		String paramChainId=request.getParameter("paramChainId");
		List<ProgramTableDto> programTableDtoList = this.deployService.selectSomeProgramService(programTableDto);
		mv.addObject("paramChainId",paramChainId);
		mv.addObject("programTableDtoList", programTableDtoList);	
		return mv;
	}
	
	@GetMapping("/search/searchSource.do")
	public ModelAndView doSearchSourceAction(HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
	      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
	      mv.addObject("no", no);
	      return mv;
			
	}
	
	

	@PostMapping("/deploy/request.do")
	public ModelAndView doDeployAction(@ModelAttribute DeployDto deployDto, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/deploy/deployList.do");
		String wProgram=request.getParameter("wProgram");
		String[] wProgramArray=wProgram.split("\n");
		String pageName=request.getParameter("pageName");
		String[] pageNameArray=pageName.split("\n");
		boolean success = this.deployService.insertOneDeployService(deployDto, wProgramArray, pageNameArray);
		return mv;
	}

	@RequestMapping("/deploy/deployList.do")
	public ModelAndView doDeployListAction() {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<DeployDto> deployDtoList = this.deployService.selectAllDeployService();
		List wProgramList=new ArrayList();
		for(int i=0; i<deployDtoList.size();i++) {
			int deployNo=deployDtoList.get(i).getDeployNo();
			System.out.println(deployNo);
			List<WProgramTableDto> wProgramTableList=this.deployService.selectAllWProgramService(deployNo);
			wProgramList.add(wProgramTableList);
		}	
		mv.addObject("deployDtoList", deployDtoList);
		mv.addObject("wProgramList",wProgramList);
		return mv;
	}
    
	//상세보기
	@GetMapping("/deploy/deployUpdate.do/{deployNo}")
	public ModelAndView viewDeployUpdatePage(@PathVariable int deployNo) {

		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		DeployDto deployDto = this.deployService.selectOneDeployService(deployNo);
		List<WProgramTableDto> wProgramTableDtoList=this.deployService.selectAllWProgramService(deployNo);
        
		mv.addObject("wProgramTableDtoList",wProgramTableDtoList);
		mv.addObject("deployDto", deployDto);

		return mv;
	}
//
//	@ResponseBody
//	@RequestMapping("/deploy/deployUpdateAjax.do")
//	public Map<Object, Object> viewDeployUpdateAjax(@RequestParam("seqNo") int seqNo) {
//
//		logger.info("deployUpdateAjax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		Map<Object, Object> map = new HashMap<Object, Object>();
//
//		DeployDto userDeployDto = this.deployService.selectOneDeployService(seqNo);
//
//		if (userDeployDto == null) {
//			logger.info("error!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//			String error = "error";
//			map.put("error", error);
//			return map;
//		}
//		logger.info("success!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		map.put("userDeployDto", userDeployDto);
//		return map;
//
//	}

	/*
	 * @PostMapping("/deploy/deployUpdate.do/{seqNo}") public ModelAndView
	 * doDeployUpdateAction(
	 * 
	 * @PathVariable int seqNo , @ModelAttribute DeployDto deployDto) {
	 * 
	 * ModelAndView mv = new ModelAndView("redirect:/deploy/deployList.do"); boolean
	 * isSuccess = this.deployService.updateOneDeploy_Service(deployDto);
	 * 
	 * return mv; }
	 */

	@PostMapping("/deploy/deployUpdate.do")
	public void doDeployUpdateAction(@ModelAttribute DeployDto deployDto,
			HttpServletResponse response) {
		boolean isSuccess = this.deployService.updateOneDeployService(deployDto);
		PrintWriter out;
		if (isSuccess) {
			response.setContentType("text/html;charset=UTF-8");

			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정완료')");
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

