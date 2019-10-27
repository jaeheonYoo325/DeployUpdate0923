<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">	
	<title>변경 프로그램 목록 조회 페이지</title>
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
	<%-- <script src="<c:url value='/js/search/searchModifiedPrograms.js' />"></script> --%>
	
<%-- <script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script> --%>
<%-- <script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script> --%>
<%-- <link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />"> --%>

</head>
<script>
$(document).ready(function() {
    $("#searchModifiedProgramsBtn").click(function() {
       $("#searchModifiedProgramsFrm").attr({
          method:"post",                                         
            action:"/search/searchModifiedPrograms.do"
     }).submit();
    });
 });
 
 function useThismodifiedPrograms(modifiedPrograms_pageId,modifiedPrograms_pageName){
	  var modifiedProgramsTextNo=document.getElementById("modifiedProgramsTextNo").value;
	  
     opener.document.getElementById("modifiedPrograms_pageId"+modifiedProgramsTextNo).value=modifiedPrograms_pageId;
     opener.document.getElementById("modifiedPrograms_pageName"+modifiedProgramsTextNo).value=modifiedPrograms_pageName;
     window.close();
  }
</script>
	<body id="page-top">
		<div id="wrapper">
			<div id="content-wrapper">
				<!-- Breadcrumbs-->
		        <ol class="breadcrumb">
		          <li class="breadcrumb-item">
		            <a href="#">Dashboard</a>
		          </li>
		          <li class="breadcrumb-item active">Overview</li>
		        </ol>
		        <div class="card mb-3">
		        	<div class="card-header">
			            <i class="fas fa-table"></i>
			            	부문 조회
			        </div>
			        <div class="card-body">
			        	<form:form id="searchModifiedProgramsFrm" modelAttribute="programDto">
			        		<div id="modifiedProgramearchDiv">
			        			변경 프로그램 조회 : <input type="text" name="pageName" id="pageName"><input type="button" id="searchModifiedProgramsBtn" value="검색"><br>
			        		</div>
			        		<div id="selectedchainIdDiv">
			        			선택된 부문 ID : <input type="text" name="selectedchainId" id="selectedchainId" value="${selectedchainId}" readonly="readonly">
			        		</div>
			        		<div id="modifiedProgramsTextNoDiv">
			        			<input type="hidden" name="modifiedProgramsTextNo" id="modifiedProgramsTextNo" value="${modifiedProgramsTextNo}">
			        		</div>			        	
			        		
			        		<div class="table-responsive">
			        			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			        				<thead>
										<tr>
							               <td>프로그램 ID</td>
							               <td>프로그램 이름</td>
							               <td>선택</td>
							               <td></td>
							            </tr>
			        				</thead>
			        				<tbody>
										<c:choose>
											<c:when test="${not empty Programs}">
												<c:forEach items="${Programs}" var="program">
													<tr>
														<td>${program.pageId}</td>
														<td>${program.pageName}</td>
														<td><input type="button" class="btn btn-primary" value="사용" onclick="useThismodifiedPrograms('${program.pageId}' , '${program.pageName}')"></td>
														<td><input type="hidden" id="modifiedProgramsTextNo" value="${modifiedProgramsTextNo}"></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
											   <tr>
											      <td colspan="4">등록된 게시글이 없습니다.</td>
											   </tr>
											</c:otherwise>
										</c:choose>
			        				</tbody>
			        			</table>
			        		</div>
						</form:form>
			        </div>
		        </div>
			</div>
		</div>
	</body>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
    	<i class="fas fa-angle-up"></i>
  	</a>
</html>