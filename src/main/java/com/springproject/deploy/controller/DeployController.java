package com.springproject.deploy.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.springproject.seqtable.dto.SeqTableDto;

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
	public String viewsearchChainPage() {
		return HttpRequestHelper.getJspPath();
	}

	@GetMapping("/search/searchProgram.do")
	public String viewsearchProgramPage() {
		return HttpRequestHelper.getJspPath();
	}

	@GetMapping("/search/searchSeq.do")
	public String viewsearchSeqpage() {
		return HttpRequestHelper.getJspPath();
	}

	@PostMapping("/search/searchEmp.do")
	public ModelAndView doSearchEmpAction(@RequestParam("str") String str, @ModelAttribute EmployeeDto employeeDto) {

		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<EmployeeDto> employeeDtoList = this.deployService.selectSomeDeployService(employeeDto);

		mv.addObject("employeeDtoList", employeeDtoList);
		return mv;
	}

	@PostMapping("/search/searchSeq.do")
	public ModelAndView doSearchSeqAction(@ModelAttribute SeqTableDto seqTableDto) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<SeqTableDto> seqTableDtoList = this.deployService.selectSomeProgramService(seqTableDto);
		mv.addObject("seqTableDtoList", seqTableDtoList);
		return mv;
	}

	@PostMapping("/search/searchChain.do")
	public ModelAndView doSearchChainAction(@ModelAttribute ChainTableDto chainTableDto) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<ChainTableDto> chainTableDtoList = this.deployService.selectSomeChainService(chainTableDto);
		mv.addObject("chainTableDtoList", chainTableDtoList);
		return mv;
	}

	@PostMapping("/search/searchProgram.do")
	public ModelAndView doSearchProgramAction(@ModelAttribute ProgramTableDto programTableDto) {
		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<ProgramTableDto> programTableDtoList = this.deployService.selectSomeProgramService(programTableDto);
		mv.addObject("programTableDtoList", programTableDtoList);
		return mv;
	}

	@PostMapping("/deploy/request.do")
	public ModelAndView doDeployAction(@ModelAttribute DeployDto deployDto) {

		ModelAndView mv = new ModelAndView("redirect:/deploy/deployList.do");

		boolean isSuccess = this.deployService.insertOneDeployService(deployDto);

		return mv;
	}

	@RequestMapping("/deploy/deployList.do")
	public ModelAndView doDeployListAction() {

		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		List<DeployDto> deployDtoList = this.deployService.selectAllDeployService();

		mv.addObject("deployDtoList", deployDtoList);

		return mv;

	}

	@GetMapping("/deploy/deployUpdate.do/{deployNo}")
	public ModelAndView viewDeployUpdatePage(@PathVariable int deployNo) {

		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
		DeployDto deployDto = this.deployService.selectOneDeployService(deployNo);

		mv.addObject("deployDto", deployDto);

		return mv;
	}

	@ResponseBody
	@RequestMapping("/deploy/deployUpdateAjax.do")
	public Map<Object, Object> viewDeployUpdateAjax(@RequestParam("seqNo") int seqNo) {

		logger.info("deployUpdateAjax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		Map<Object, Object> map = new HashMap<Object, Object>();

		DeployDto userDeployDto = this.deployService.selectOneDeployService(seqNo);

		if (userDeployDto == null) {
			logger.info("error!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			String error = "error";
			map.put("error", error);
			return map;
		}
		logger.info("success!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		map.put("userDeployDto", userDeployDto);
		return map;

	}

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
	public void doDeployUpdateAction(@PathVariable int deployNo, @ModelAttribute DeployDto deployDto,
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
	public String doDeployDeleteAction(@PathVariable int deployNo) {

		boolean isSuccess = this.deployService.deleteOneDeployService(deployNo);
		return "redirect:/deploy/deployList.do";
	}
}
