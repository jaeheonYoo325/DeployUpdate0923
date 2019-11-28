<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
		<ul class="sidebar navbar-nav">
		  <li class="nav-item">
	        <a class="nav-link" href="<c:url value='/deploy/deployList.do' />">
	          <i class="fas fa-fw fa-tachometer-alt"></i>
	          <span>메인</span>
	        </a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <i class="fas fa-fw fa fa-file"></i>
	          <span>배포 요청</span>
	        </a>
	        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
<!-- 	          <h6 class="dropdown-header">배포</h6> -->
	          <a class="dropdown-item" href="<c:url value='/deploy/deployRequest.do' />">배포 요청 등록</a>
	          <a class="dropdown-item" href="<c:url value='/deploy/deployList.do' />">배포 요청 현황</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <i class="fas fa-fw fa fa-edit"></i>
	          <span>결재</span>
	        </a>
	        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
<!-- 	          <h6 class="dropdown-header">결재</h6> -->
	          <a class="dropdown-item" href="<c:url value='/employee/myDeployWillApproval.do' />">결재</a>
	          <a class="dropdown-item" href="<c:url value='/employee/myDeployApproved.do' />">결재내역</a>
	          <a class="dropdown-item" href="<c:url value='/employee/myDeployCompleted.do' />">완료함</a>
	          <a class="dropdown-item" href="<c:url value='/employee/myDeployReturned.do' />">반려함</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <i class="fas fa-fw fa fa-check-square"></i>
	          <span>배포</span>
	        </a>
	        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
<!-- 	          <h6 class="dropdown-header">배포</h6> -->
	          <a class="dropdown-item" href="<c:url value='/employee/myDeployWillDeploy.do' />">배포</a>
	          <a class="dropdown-item" href="<c:url value='/employee/myDeployDeployed.do' />">배포내역</a>
	        </div>
	      </li>
	      
<!-- 	      <li class="nav-item dropdown"> -->
<!-- 	        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 	          <i class="fas fa-fw fa-folder"></i> -->
<!-- 	          <span>결재함</span> -->
<!-- 	        </a> -->
<!-- 	        <div class="dropdown-menu" aria-labelledby="pagesDropdown"> -->
<!-- 	          <h6 class="dropdown-header">완료</h6> -->
<%-- 	          <a class="dropdown-item" href="<c:url value='/employee/myDeployCompleted.do' />">완료함</a> --%>
<!-- 	          <div class="dropdown-divider"></div> -->
<!-- 	          <h6 class="dropdown-header">반려</h6> -->
<%-- 	          <a class="dropdown-item" href="<c:url value='/employee/myDeployReturned.do' />">반려함</a> --%>
<!-- 	        </div> -->
<!-- 	      </li> -->
	      
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <i class="fas fa-fw fa fa-male"></i>
	          <span>관리자</span>
	        </a>
	        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
<!-- 	          <h6 class="dropdown-header">직원 관리</h6> -->
	          <a class="dropdown-item" href="<c:url value='/employee/employeeRegist.do' />">직원 등록</a>	
	          <a class="dropdown-item" href="<c:url value='/employee/programRegist.do' />">변경프로그램 등록</a>          
	        </div>
	      </li>	      
		</ul>