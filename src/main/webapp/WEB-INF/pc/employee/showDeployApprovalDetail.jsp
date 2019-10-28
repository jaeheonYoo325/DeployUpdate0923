<%@page import="com.springproject.modifiedresources.dto.ModifiedResourcesDto"%>
<%@page import="com.springproject.modifiedprograms.dto.ModifiedProgramsDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">	
	<title>상세 내역</title>
	<!-- Custom fonts for this template-->
	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/vendor/fontawesome-free/css/all.min.css' />">
  	<!-- Custom styles for this template-->
  	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/css/sb-admin.css' />">
  	<!-- Page level plugin CSS-->
  	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/vendor/datatables/dataTables.bootstrap4.css' />">
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery/jquery.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery-easing/jquery.easing.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/js/sb-admin.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/datatables/jquery.dataTables.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/datatables/dataTables.bootstrap4.js' />"></script>
	<script src="<c:url value='/js/deploy/deployUpdate.js' />"></script>
<%-- <jsp:include page="/WEB-INF/pc/CommonScript/commonScript.jsp"/> --%>
	
</head>
<body id="page-top">
		<div id="wrapper">
			<div id="content-wrapper">
		        <div class="card mb-3">
		        	<div class="card-header">
			            <i class="fas fa-table"></i>
			            	상세 내역
			        </div>
			        <div class="card-body">
		        		<div class="table-responsive">
		        			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		        				<thead>
		        					<tr>
		        						<td>No</td>
		        						<td>부문</td>
		        						<td>작업유형</td>
		        						<td>요청날짜</td>
		        						<td>요청시간</td>
		        						<td>서비스요청 ID</td>
		        						<td>작업자</td>
		        						<td>변경내역</td>
		        						<td>변경프로그램목록</td>
		        						<td>변경소스명</td>
		        						<td>요청자</td>
		        						<td>Deploy 담당자</td>
		        						<td>개발계 담당자</td>
		        						<td>테스트계 담당자</td>
		        						<td>운영계 담당자</td>
		        						<td>구분</td>
		        					</tr>
		        					<tr>
		        						<td>${deployRequestOfDeployNo.deployNo}</td>
		        						<td>${deployRequestOfDeployNo.chainName}</td>
		        						<td>${deployRequestOfDeployNo.workType}</td>
		        						<td>${deployRequestOfDeployNo.requestDate}</td>
		        						<td>${deployRequestOfDeployNo.requestTime}</td>
		        						<td>${deployRequestOfDeployNo.serviceRequestId}</td>
		        						<td>${deployRequestOfDeployNo.worker}</td>
		        						<td>${deployRequestOfDeployNo.modifiedContents}</td>
		        						<td>
											<c:forEach items="${modifiedProgramOfDeployNo}" varStatus="status">
												${modifiedProgramOfDeployNo[status.index].modifiedPrograms_pageId}(${modifiedProgramOfDeployNo[status.index].modifiedPrograms_pageName})
								            </c:forEach>  
		        						</td>
		        						<td>
											<c:forEach items="${modifiedResourceOfDeployNo}" varStatus="status">
												${modifiedResourceOfDeployNo[status.index].modifiedResources_wSourceName}												                          
											</c:forEach> 
		        						</td>
		        						<td>${deployRequestOfDeployNo.requester}</td>
		        						<td>${deployRequestOfDeployNo.deployer}</td>
		        						<td>${deployRequestOfDeployNo.developConfirmer}</td>
		        						<td>${deployRequestOfDeployNo.testConfirmer}</td>
		        						<td>${deployRequestOfDeployNo.productionConfirmer}</td>
		        						<td>${deployRequestOfDeployNo.division}</td>
		        					</tr>
		        				</thead>
		        			</table>
		        			<c:if test="${deployApprovalDetailCode eq 'myDeployApprovalDetail'}">
								<input type="button" value="결제하기" class="btn btn-primary" onclick="location.href='/employee/MyDeployDoingApproval.do/${deployRequestOfDeployNo.deployNo}'">
								<input type="button" value="반려하기" class="btn btn-danger" onclick="location.href='/employee/MyDeployDoingReturn.do/${deployRequestOfDeployNo.deployNo}'">   
							</c:if>    
							 
							<c:if test="${deployApprovalDetailCode eq 'myDeployWillDeploy'}">
								<input type="button" value="배포하기" class="btn btn-primary" onclick="location.href='/employee/myDeployDoingDeploy.do/${deployRequestOfDeployNo.deployNo}'">
								<input type="button" value="반려하기" class="btn btn-danger" onclick="location.href='/employee/MyDeployDoingReturn.do/${deployRequestOfDeployNo.deployNo}'">   
							</c:if>
		        		</div>
			        </div>
		        </div>
			</div>
		</div>
	</body>
</html>