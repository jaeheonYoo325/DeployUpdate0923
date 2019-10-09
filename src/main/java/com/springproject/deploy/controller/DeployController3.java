//package com.springproject.deploy.controller;
//
//import java.io.IOException;
//
//import java.io.PrintWriter;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpRequest;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.springproject.chain.dto.ChainTableDto;
//import com.springproject.common.utils.HttpRequestHelper;
//import com.springproject.deploy.dto.DeployDto;
//import com.springproject.deploy.service.DeployService;
//import com.springproject.employee.dto.EmployeeDto;
//import com.springproject.program.dto.ProgramTableDto;
//import com.springproject.wprogramtable.dto.WProgramTableDto;
//import com.springproject.wsource.dto.WSourceTableDto;
//
//@Controller
//public class DeployController3 {
//
//	private Logger logger = LoggerFactory.getLogger(DeployController3.class);
//
//	@Autowired
//	private DeployService deployService;
//
//	@GetMapping("/main/main.do")
//	public String viewMainPage() {
//		return HttpRequestHelper.getJspPath();
//	}
//
//	@GetMapping("/deploy/deploy.do")
//	public String viewDeployPage() {
//		return HttpRequestHelper.getJspPath();
//	}
//
//	@GetMapping("/deploy/request.do")
//	public String viewDeployRequestPage() {
//		return HttpRequestHelper.getJspPath();
//	}
//
//	@GetMapping("/search/searchEmp.do")
//	public String viewsearchEmpPage(@RequestParam("str") String str) {
//		return HttpRequestHelper.getJspPath();
//	}
//
//	@GetMapping("/search/searchChain.do")
//	public ModelAndView viewsearchChainPage() {
//		ModelAndView mv=new ModelAndView(HttpRequestHelper.getJspPath());
//		List<ChainTableDto> chainTableDtoList=this.deployService.selectAllChainService();
//		mv.addObject("chainTableDtoList",chainTableDtoList);
//		return mv;
//	}
//
//	@GetMapping("/search/searchProgram.do")
//	   public ModelAndView viewsearchProgramPage(@RequestParam("paramChainId") String paramChainId, HttpServletRequest request) {
//		  int no=Integer.parseInt(request.getParameter("no"));
//	      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
//	      List<ProgramTableDto> programTableDtoList=this.deployService.selctAllProgramService(paramChainId);
//	      mv.addObject("paramChainId",paramChainId);
//	      mv.addObject("programTableDtoList",programTableDtoList);
//	      mv.addObject("no",no);
//	      return mv;
//	   }
//
//
//	@PostMapping("/search/searchEmp.do")
//	public ModelAndView doSearchEmpAction(@RequestParam("str") String str, @ModelAttribute EmployeeDto employeeDto) {
//
//		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
//		List<EmployeeDto> employeeDtoList = this.deployService.selectSomeDeployService(employeeDto);
//
//		mv.addObject("employeeDtoList", employeeDtoList);
//		return mv;
//	}
////
//
//	@PostMapping("/search/searchChain.do")
//	public ModelAndView doSearchChainAction(@ModelAttribute ChainTableDto chainTableDto) {
//		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
//		List<ChainTableDto> chainTableDtoList = this.deployService.selectSomeChainService(chainTableDto);
//		mv.addObject("chainTableDtoList", chainTableDtoList);
//		return mv;
//	}
////
//	@PostMapping("/search/searchProgram.do")
//	public ModelAndView doSearchProgramAction(@ModelAttribute ProgramTableDto programTableDto, HttpServletRequest request) {
//		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
//		String paramChainId=request.getParameter("paramChainId");
//		List<ProgramTableDto> programTableDtoList = this.deployService.selectSomeProgramService(programTableDto);
//		mv.addObject("paramChainId",paramChainId);
//		mv.addObject("programTableDtoList", programTableDtoList);	
//		return mv;
//	}
//	
//	@GetMapping("/search/searchSource.do")
//	public ModelAndView doSearchSourceAction(HttpServletRequest request) {
//		int no = Integer.parseInt(request.getParameter("no"));
//	      ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
//	      mv.addObject("no", no);
//	      return mv;
//			
//	}
//	
//	
//
//	@PostMapping("/deploy/request.do")
//	public ModelAndView doDeployAction(@ModelAttribute DeployDto deployDto, HttpServletRequest request) {
//		ModelAndView mv = new ModelAndView("redirect:/deploy/deployList.do");
//		ArrayList wProgramArray = new ArrayList();
//		ArrayList pageNameArray = new ArrayList();
//		ArrayList wSourceArray = new ArrayList();
////		ArrayList statusArray= new ArrayList();
//		
//		for(int i=0;;i++) {
//			if(request.getParameter("wProgram"+i)==null) {
//				break;
//			}
//			wProgramArray.add(request.getParameter("wProgram"+i));
//			pageNameArray.add(request.getParameter("pageName"+i));
//		}
//		
//		for(int i=0;;i++) {
//			if(request.getParameter("wSource"+i)==null) {
//				break;
//			}
//			wSourceArray.add(request.getParameter("wSource"+i));
//		}
//		
//		
////        statusArray.add(request.getParameter("d_status"));
////        statusArray.add("공란");
////        statusArray.add("공란");
////        statusArray.add("공란");
////        statusArray.add("공란");
//		
////        System.out.println("statusArray5개할당한 size출력"+statusArray.size());
//		
//		boolean success = this.deployService.insertOneDeployService(deployDto, wProgramArray, pageNameArray, wSourceArray);
//		return mv;
//	}
//
//	@RequestMapping("/deploy/deployList.do")
//	public ModelAndView doDeployListAction() {
//		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
//		List<DeployDto> deployDtoList = this.deployService.selectAllDeployService();
//		List wProgramList=new ArrayList();
//		List wSourceList=new ArrayList();
////		List statusList=new ArrayList(5);
//		
//		for(int i=0; i<deployDtoList.size();i++) {
//			int deployNo=deployDtoList.get(i).getDeployNo();
//			
//			List<WProgramTableDto> wProgramTableList=this.deployService.selectAllWProgramService(deployNo);
//			wProgramList.add(wProgramTableList);
//			
//			List<WSourceTableDto> wSourceTableDtoList=this.deployService.selectAllWSourceService(deployNo);
//			wSourceList.add(wSourceTableDtoList);
//			
////			List<StatusTableDto> statusTableDtoList=new ArrayList<StatusTableDto>(5);
////			statusTableDtoList=this.deployService.selectAllStatusService(deployNo);
////			statusList.add(statusTableDtoList);
//		}
//		
//		mv.addObject("deployDtoList", deployDtoList);
//		mv.addObject("wProgramList",wProgramList);
//		mv.addObject("wSourceList",wSourceList);
////		mv.addObject("statusList",statusList);
//		return mv;
//	}
//    
//	//상세보기
//	@GetMapping("/deploy/deployUpdate.do/{deployNo}")
//	public ModelAndView viewDeployUpdatePage(@PathVariable int deployNo) {
//
//		ModelAndView mv = new ModelAndView(HttpRequestHelper.getJspPath());
//		DeployDto deployDto = this.deployService.selectOneDeployService(deployNo);
//		List<WProgramTableDto> wProgramTableDtoList=this.deployService.selectAllWProgramService(deployNo);
//		List<WSourceTableDto> wSourceTableDtoList=this.deployService.selectAllWSourceService(deployNo);
////		List<StatusTableDto> statusTableDtoList=new ArrayList<StatusTableDto>(5);
////		statusTableDtoList=this.deployService.selectAllStatusService(deployNo);
//		
////		System.out.println("상세보기눌렀을 때 가져온 status사이즈"+statusTableDtoList.size());
//		
//	    System.out.println("Controller-각DtoList");
//	    System.out.println("프로그램List: "+wProgramTableDtoList.size());
//	    System.out.println("소스List : "+wSourceTableDtoList.size());
////	    System.out.println("상태List: "+statusTableDtoList.size());
//	    
//		mv.addObject("wProgramTableDtoList",wProgramTableDtoList);
//		mv.addObject("wSourceTableDtoList", wSourceTableDtoList);
////		mv.addObject("statusTableDtoList", statusTableDtoList);
//		mv.addObject("deployDto", deployDto);
//
//		return mv;
//	}
////
////	@ResponseBody
////	@RequestMapping("/deploy/deployUpdateAjax.do")
////	public Map<Object, Object> viewDeployUpdateAjax(@RequestParam("seqNo") int seqNo) {
////
////		logger.info("deployUpdateAjax!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
////		Map<Object, Object> map = new HashMap<Object, Object>();
////
////		DeployDto userDeployDto = this.deployService.selectOneDeployService(seqNo);
////
////		if (userDeployDto == null) {
////			logger.info("error!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
////			String error = "error";
////			map.put("error", error);
////			return map;
////		}
////		logger.info("success!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
////		map.put("userDeployDto", userDeployDto);
////		return map;
////
////	}
//
//	/*
//	 * @PostMapping("/deploy/deployUpdate.do/{seqNo}") public ModelAndView
//	 * doDeployUpdateAction(
//	 * 
//	 * @PathVariable int seqNo , @ModelAttribute DeployDto deployDto) {
//	 * 
//	 * ModelAndView mv = new ModelAndView("redirect:/deploy/deployList.do"); boolean
//	 * isSuccess = this.deployService.updateOneDeploy_Service(deployDto);
//	 * 
//	 * return mv; }
//	 */
//
//	@PostMapping("/deploy/deployUpdate.do")
//	public void doDeployUpdateAction(@ModelAttribute DeployDto deployDto,
//			HttpServletResponse response, HttpServletRequest request) {
//		int deployNo=Integer.parseInt(request.getParameter("deployNo"));
//		ArrayList wProgramArray = new ArrayList();
//		ArrayList pageNameArray = new ArrayList();
//		ArrayList wSourceArray = new ArrayList();
//		
//		for(int i=0;;i++) {
//			if(request.getParameter("wProgram"+i)==null) {
//				break;
//			}
//			wProgramArray.add(request.getParameter("wProgram"+i));
//			pageNameArray.add(request.getParameter("pageName"+i));
//		}
//		
//		for(int i=0;;i++) {
//			if(request.getParameter("wSource"+i)==null) {
//				break;
//			}
//			wSourceArray.add(request.getParameter("wSource"+i));
//			System.out.println("request.getParameter : " + request.getParameter("wSource"+i));
//		}
//				
//		boolean totalSuccess = true;
//		boolean isUpdateSuccess = this.deployService.updateOneDeployService(deployDto, wProgramArray, pageNameArray, wSourceArray);
//		totalSuccess= totalSuccess && isUpdateSuccess;
//		System.out.println("Controller - totalSuccess : " + totalSuccess);
//		
//		PrintWriter out;
//		if (totalSuccess) {
//			response.setContentType("text/html;charset=UTF-8");
//
//			try {
//				out = response.getWriter();
//				out.println("<script>");
//				out.println("alert('수정완료')");
//				out.println("window.opener.location.reload()");
//				out.println("window.close()");
//				out.println("</script>");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		} else {
//			try {
//				out = response.getWriter();
//				out.println("<script>");
//				out.println("alert('수정실패')");
//				out.println("history.back()");
//				out.println("</script>");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//
//	@RequestMapping("/deploy/deployDelete.do/{deployNo}")
//	public void doDeployDeleteAction(@PathVariable int deployNo, HttpServletResponse response) {
//
//		boolean isSuccess = this.deployService.deleteOneDeployService(deployNo);
//		
//		PrintWriter out;
//		if (isSuccess) {
//			response.setContentType("text/html;charset=UTF-8");
//
//			try {
//				out = response.getWriter();
//				out.println("<script>");
//				out.println("alert('삭제완료')");
//				out.println("window.close()");
//				out.println("</script>");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		} else {
//			try {
//				out = response.getWriter();
//				out.println("<script>");
//				out.println("alert('수정실패')");
//				out.println("history.back()");
//				out.println("</script>");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//}
//
