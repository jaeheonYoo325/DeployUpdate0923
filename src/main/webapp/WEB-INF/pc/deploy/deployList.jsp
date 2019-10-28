<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.springproject.mastercode.dto.MasterCodeDto"%>
<%@page import="com.springproject.deploy.dto.CategoryTypeDto"%>
<%@page import="com.springproject.chain.dto.ChainDto"%>
<%@page
	import="com.springproject.modifiedresources.dto.ModifiedResourcesDto"%>
<%@page
	import="com.springproject.modifiedprograms.dto.ModifiedProgramsDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.springproject.deploy.dto.DeployRequestDto"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">	
	<title>배포 요청 현황 페이지</title>
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
<script type="text/javascript">
   $(document).ready(function() {
     
	   $("#sidebarToggle").on('click', function(e) {
		    e.preventDefault();
		    $("body").toggleClass("sidebar-toggled");
		    $(".sidebar").toggleClass("toggled");
		});
	   
       $("#categoryChain").change(function(){
    	  var categoryChain = $(this).val();
    	  commonDeployListSubmit();    	  
       });
       
       $("#categoryWorktype").change(function(){
     	  var categoryWorktype = $(this).val();
     	  commonDeployListSubmit();
        });
       
       $("#categoryRequestDate").change(function(){
     	  var categoryChain = $(this).val();
     	  commonDeployListSubmit();
        });
       
       $("#categoryDivision").change(function(){
     	  var categoryChain = $(this).val();
     	  commonDeployListSubmit();
        });
       
       $("#categoryStatus").change(function(){
     	 var categoryChain = $(this).val();
     	 commonDeployListSubmit();
			
        });
       
       $("#searchBtn").click(function(e) {
    	   e.preventDefault();
    	   var searchType = $("#searchType").val();
    	   var searchKeyword = $("#searchKeyword").val();
    	   
    	   if ( searchType != "검색타입" && searchKeyword == "") {
    		   alert("검색타입과 검색 키워드 모두 사용해주세요.");
    		   return;
    	   }
    	   if ( searchType == "검색타입" && searchKeyword != "") {
    		   alert("검색타입과 검색 키워드 모두 사용해주세요.");
    		   return;
    	   }

    	   commonDeployListSubmit();    	  
    	   
       });       
    });
   
   function commonDeployListSubmit() {
	   $("#listFrm").attr({
           method:"post",                                         
             action:"/deploy/deployList.do"
      }).submit();
   }
</script>

<script>
function showPayDetail(thisDeployNo,deployPayDetailCode){
	   var deployNo=thisDeployNo;
	   window.open("/employee/showDeployApprovalDetail.do/"+deployNo+"/"+deployPayDetailCode,"상세보기", "width=1000, height=800");
	}
</script>

</head>
<body id="page-top">
	<jsp:include page="/WEB-INF/pc/common/header.jsp" />
	<div id="wrapper">
		<jsp:include page="/WEB-INF/pc/common/sidebar.jsp" />
		<div id="content-wrapper">
			<div class="container-fluid">				 
				 <div class="card mb-3">
					<div class="card-header">
			            <i class="fas fa-table"></i>
			            	배포 요청 현황
			        </div>
			        <div class="card-body">
			        	<form:form name="listFrm" id="listFrm">
			        		<select name="searchType" id="searchType">
								<c:forEach items="${masterCodeOfSearchTypeMap[categoryType.searchTypeString]}" varStatus="status">
									<option value="<c:out value='${masterCodeOfSearchTypeMap[categoryType.searchTypeString][status.index].codeName}'></c:out>" <c:if test="${categoryType.searchType eq masterCodeOfSearchTypeMap[categoryType.searchTypeString][status.index].codeName}">selected="selected"</c:if>>${masterCodeOfSearchTypeMap[categoryType.searchTypeString][status.index].codeName}</option>
								</c:forEach>
							</select> 
							<input type="text" name="searchKeyword" id="searchKeyword" value="${categoryType.searchKeyword}">
							<input type="button" class="btn btn-primary" value="검색" id="searchBtn">
							
							<div class="table-responsive">
				        		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				        			<thead>
										<tr>
											<td>No</td>
											<td><select name="categoryChain" id="categoryChain">
												<option value="부문" <c:if test="${categoryType.categoryChain eq '부문'}">selected="selected"</c:if>>부문</option> 
												<c:forEach items="${chain}" varStatus="status">
													<option value="<c:out value='${chain[status.index].chainId}'></c:out>" <c:if test="${categoryType.categoryChain eq chain[status.index].chainId}">selected="selected"</c:if>>${chain[status.index].chainName}</option>
												</c:forEach>  
											</select></td>
											<td><select name="categoryWorktype" id="categoryWorktype">
												<c:forEach items="${categoryMasterCodes[categoryType.cateWtypeString]}" varStatus="status">
													<option value="<c:out value='${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}'></c:out>" <c:if test="${categoryType.categoryWorktype eq categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}</option>
												</c:forEach>
											</select></td>
											<td><select name="categoryRequestDate" id="categoryRequestDate">
												<c:forEach items="${categoryMasterCodes[categoryType.cateReqDateString]}" varStatus="status">
													<option value="<c:out value='${categoryMasterCodes[categoryType.cateReqDateString][status.index].codeName}'></c:out>" <c:if test="${categoryType.categoryRequestDate eq categoryMasterCodes[categoryType.cateReqDateString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateReqDateString][status.index].codeName}</option>
												</c:forEach>	
											</select></td>
											<td>요청시간</td>
											<td>서비스요청ID</td>
											<td>작업자</td>
											<td>변경내역</td>
											<td>변경프로그램목록</td>
											<td>변경소스명</td>
											<td>요청자</td>
											<td>Deploy담당자</td>
											<td>확인(개발계)</td>
											<td>확인(테스트계)</td>
											<td>확인(운영계)</td>
											<td><select name="categoryDivision" id="categoryDivision">
												<c:forEach items="${categoryMasterCodes[categoryType.cateDivisionString]}" varStatus="status">
													<option value="<c:out value='${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}'></c:out>" <c:if test="${categoryType.categoryDivision eq categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}</option>
												</c:forEach>	
											</select></td>
											<td><select name="categoryStatus" id="categoryStatus">
												<c:forEach items="${categoryMasterCodes[categoryType.cateStatusString]}" varStatus="status">
													<option value="<c:out value='${categoryMasterCodes[categoryType.cateStatusString][status.index].codeValue}'></c:out>" <c:if test="${categoryType.categoryStatus eq categoryMasterCodes[categoryType.cateStatusString][status.index].codeValue}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateStatusString][status.index].codeName}</option>
												</c:forEach>
											</select></td>
										</tr>
				        			</thead>
				        			<tbody>
										<c:forEach items="${deployRequests}" var="deploy">
											<tr>
												<td>${deploy.deployNo}</td>	
												<td>${deploy.chainName}</td>	
												<td>${deploy.workType}</td>	
												<td>${deploy.requestDate}</td>	
												<td>${deploy.requestTime}</td>	
												<td>${deploy.serviceRequestId}</td>	
												<td>${deploy.worker}</td>	
												<td>${deploy.modifiedContents}</td>	
												<td>
													<c:forEach items="${modifiedProgramsMap[deploy.deployNo]}" varStatus="status">
														<c:out value="${modifiedProgramsMap[deploy.deployNo][status.index].modifiedPrograms_pageId}(${modifiedProgramsMap[deploy.deployNo][status.index].modifiedPrograms_pageName})"></c:out><br>
													</c:forEach>
												</td>
												<td>
													<c:forEach items="${modifiedResourcesMap[deploy.deployNo]}" varStatus="status">
														<c:out value="${modifiedResourcesMap[deploy.deployNo][status.index].modifiedResources_wSourceName}"></c:out><br>
													</c:forEach>
												</td>
												<td>${deploy.employeeName} <input type="hidden" value="${deploy.requester}"></td>
												<td>${deploy.deployer}</td>
												<td>${deploy.developConfirmer}</td>
												<td>${deploy.testConfirmer}</td>
												<td>${deploy.productionConfirmer}</td>
												<td>${deploy.division}</td>
												<td>	
													<c:forEach items="${categoryMasterCodes[categoryType.cateStatusString]}" begin="1" varStatus="status">
														<input type="radio" name="statusCode${deploy.deployNo}"  <c:if test="${deploy.statusCode eq categoryMasterCodes[categoryType.cateStatusString][status.index].codeValue}">checked="checked"</c:if>disabled="disabled">
                                          				<c:if test="${deploy.statusCode eq categoryMasterCodes[categoryType.cateStatusString][status.index].codeValue}"><font color="red">${categoryMasterCodes[categoryType.cateStatusString][status.index].codeName}</font></c:if>
                                          				<c:if test="${deploy.statusCode ne categoryMasterCodes[categoryType.cateStatusString][status.index].codeValue}">${categoryMasterCodes[categoryType.cateStatusString][status.index].codeName}</c:if>
													</c:forEach>		
												</td>
											</tr>
										</c:forEach>				        			
				        			</tbody>
				        		</table>
				        	</div>
			        	</form:form>
			        </div>
				 </div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/pc/common/footer.jsp" />
</body>
</html>