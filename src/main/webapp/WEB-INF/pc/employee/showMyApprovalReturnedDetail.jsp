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
	<title>상세내역 & 재요청</title>
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
<script>
$(document).ready(function() {
	
	var modifiedProgramSize = $("#moodifiedProgramSize").val();
	var modifiedResourceSize = $("#modifiedResourceSize").val();
	var isModifiedPrograms = false;
	var isModifiedResources = false;
	
	$("#deployRequestUpdateBtn").click(function() {
		var chainId = $("#chainId").val();
		var chainName = $("#chainName").val();
		var workType = $("#workType").val();
		var requestDate = $("#requestDate").val();
		var requestTime = $("#requestTime").val();
		var modifiedContents = $("#modifiedContents").val();
// 		var requesterName = $("#requesterName").val();
// 		var division = $("#division").val();
	
	
		if ( chainId == "" ) {
    		alert("부문을 검색해서 선택해주세요.");
    		return;
    	}
    	
    	if ( chainName == "" ) {
    		alert("부문을 검색해서 선택해주세요.");
    		return;
    	}

		if ( workType == "작업유형") {
			alert("작업유형을 선택해주세요.");
			return;
		}
		
// 		if ( requestDate == "") {
// 			alert("요청날짜를 선택해주세요.");
// 			return;
// 		}
		
// 		if ( requestTime == "") {
// 			alert("요청시간을 선택해주세요.");
// 			return;
// 		}
		
		if ( modifiedContents == "") {
			alert("변경내역을 작성해주세요.");
			return;
		}

		var k= 0;
		for(k=0; k <= modifiedProgramSize; k++) {
    		if ( $("#modifiedPrograms_pageId" + k).val() == "" && $("#modifiedPrograms_pageName" + k).val() == "") {
    			alert((k+1) + "번째 변경된 프로그램 목록을 검색해서 사용해주세요.");
    			return;
    		}
    	}
    	
    	for(k=0; k <= modifiedResourceSize; k++) {
    		if ( $("#modifiedResources_wSourceName" + k).val() == "") {
    			alert((k+1) +"번째 변경된 소스명을 사용해주세요.");
    			return;
    		}    		
    	}
    	
   		if ( isModifiedPrograms == true ) {
   			alert("변경된 프로그램 목록은 필수 입력 값입니다.");
   			return;
   		}	
    	if ( isModifiedResources == true ) {
			alert("변경된 소스명은 필수 입력 값입니다.");
			return;
		}
    	
// 		if ( requesterName == "") {
// 			alert("요청자를 검색해서 선택해주세요.");
// 			return;
// 		}
		
// 		if ( division == "구분") {
// 			alert("구분을 선택해주세요.");
// 			return;
// 		}
	$("#deployRequestDetailFrm").attr({
	   method:"post",                                         
	     action:"/employee/showMyApprovalReturnedDetail.do"
	}).submit();
	
// 	$("#deployRequestDetailFrm").attr({
// 	   method:"post",                                         
// 	     action:"/deploy/deployRequestModify.do"
// 	}).submit();
});

	var lastModifiedProgram=$("#lastModifiedProgram").val();
	var lastModifiedResources=$("#lastModifiedResources").val();
	var i=lastModifiedProgram;
	
	if(i==lastModifiedProgram) {
		i=lastModifiedProgram;
		i*=1;
	}
	else {
		i=-1;
		i*=1;
	}
	
	$('.removeModifiedPrograms').on('click', function () {     	  
		$(".divModifiedPrograms").html("");
		isModifiedPrograms = true;
		i = -1;
	});

	$('.addModifiedPrograms').click (function () {
		if($("#chainId").val()==""){
			alert("부문선택필수");
			return;
	 	}
	 	i=i+1;
	 	modifiedProgramSize = i;
	 	console.log("modifiedProgramSize : " + i);
        isModifiedPrograms = false;
		$('.divModifiedPrograms').append (           
			$("<input type='text' name='modifiedPrograms_pageId"+i+"'id='modifiedPrograms_pageId"+i+"' readonly='readonly'><input type='text' name='modifiedPrograms_pageName"+i+"'id='modifiedPrograms_pageName"+i+"' readonly='readonly'><input type='button' class='btn btn-primary' value='검색' onclick='searchModifiedPrograms("+i+")'><br>")
		);
	});

	var j=lastModifiedResources;
	if(j==lastModifiedResources) {
		j=lastModifiedResources;
		j*=1;
	}
	else {
		j=-1;
		j*=1;
	}	      
	$('.removeModifiedResources').on('click', function () { 
		$(".divModifiedResources").html("");
		isModifiedResources = true;
		j = -1;
	});

	$('.addModifiedResources').click (function () {
		if($("#chainId").val()==""){
			alert("부문선택필수");
			return;
	 	}
	 	j=j+1;
	 	modifiedResourceSize = j;
	 	console.log("modifiedResourceSize : " + j);
        isModifiedResources = false;
		 $('.divModifiedResources').append (           
// 			$("<input type='text' name='modifiedResources_wSourceName"+j+"'id='modifiedResources_wSourceName"+j+"' readonly='readonly'><input type='button' class='btn btn-primary' value='검색' onclick='searchModifiedResources("+j+")' readonly='readonly'><br>")
			$("<input type='text' name='modifiedResources_wSourceName"+j+"'id='modifiedResources_wSourceName"+j+"'><br>")
		 );      
	});
});

function searchEmployee(employeeSearchWhere){
	   window.open("/search/searchEmployee.do?employeeSearchWhere="+employeeSearchWhere,"임직원검색", "width=1000, height=800");
	}
	function searchChain(){
	   window.open("/search/searchChain.do","부문검색", "width=1000, height=800");
	}
	function searchModifiedPrograms(modifiedProgramsTextNo){
		var selectedchainId=document.deployRequestDetailFrm.chainId.value;
	   window.open("/search/searchModifiedPrograms.do?selectedchainId="+selectedchainId+"&modifiedProgramsTextNo="+modifiedProgramsTextNo,"변경프로그램검색", "width=1000, height=800");
	}
// 	function searchModifiedResources(modifiedResourceTextNo){
// 		window.open("/search/searchModifiedResource.do?modifiedResourceTextNo="+modifiedResourceTextNo,"변경소스검색", "width=1000, height=800");
// 	}
	function set(){
		var workType=document.getElementById("workType").value;
		var d=new Date();
		var NowDate= d.toLocaleDateString();
		var NowTime= d.toLocaleTimeString();
		if(workType=="정기"){
			document.getElementById("requestDate").value=NowDate;
			document.getElementById("requestTime").value="오후 3:30:00";
		}
		if(workType=="수시"){
			document.getElementById("requestDate").value=NowDate;
			document.getElementById("requestTime").value=NowTime;
		}
	}
</script>
<body id="page-top">
		<div id="wrapper">
			<div id="content-wrapper">
		        <div class="card mb-3">
		        	<div class="card-header">
			            <i class="fas fa-table"></i>
			            	상세 내역 & 재요청
			        </div>
			        <div class="card-body">
		        		<div class="table-responsive">
		        			<form:form id="deployRequestDetailFrm" modelAttribute="deployRequestDto" name="deployRequestDetailFrm">
		        				<div>
		        					<form:errors id="errorsChainId" cssStyle="color: red;" path="chainId" />
		        					<form:errors id="errorsRequestDate" cssStyle="color: red;" path="requestDate" />
		        					<form:errors id="errorsRequestTime" cssStyle="color: red;" path="requestTime" />
		        					<form:errors id="errorsModifiedContents" cssStyle="color: red;" path="modifiedContents" />
		        				</div>
			        			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			        				<thead>
			        					<tr>
			        						<td>No</td>
			        						<td colspan="6">${deployRequestDto.deployNo}<input type="hidden" name="deployNo" id="deployNo" value="${deployRequestDto.deployNo}"></td>		        						
			        					</tr>
			        					<tr>
											<td>부문</td>
			        						<td colspan="6">
			        							<input type="text" name="chainId" id="chainId" value="${deployRequestDto.chainId}" readonly="readonly">
		  										<input type="text" name="chainName" id="chainName" value="${deployRequestDto.chainName}" readonly="readonly">
		  										<input type="button" class="btn btn-primary" value="검색" onclick="searchChain()">
			        						</td>		        						
			        					</tr>
			        					<tr>
											<td>작업유형</td>
											<td colspan="6">
												<select name="workType" id="workType" onchange="set()">
													<c:forEach items="${categoryMasterCodes[categoryType.cateWtypeString]}" varStatus="status">
														<option value="<c:out value='${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}'></c:out>" <c:if test="${deployRequestDto.workType eq categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}</option>
													</c:forEach>			
										       </select>
											</td>
			        					</tr>
			        					<tr>
			        						<td>요청날짜</td>
			        						<td>
			        							<input type="text" name="requestDate" id="requestDate" value="${deployRequestDto.requestDate}" readonly="readonly"><br>
												
			        						</td>
			        						<td>요청시간</td>
			        						<td>
			        							<input type="text" name="requestTime" id="requestTime" value="${deployRequestDto.requestTime}" readonly="readonly">
			        						</td>
			        					</tr>
			        					<tr>
			        						<td>변경작업자</td>
			        						<td><input type="text" name="worker" id="worker" value="${deployRequestDto.worker}" readonly="readonly"></td>
			        					</tr>
			        					<tr>
			        						<td>변경내역</td>
			        						<td colspan="6">
			        							<input type="text" name="modifiedContents" id="modifiedContents" value="${deployRequestDto.modifiedContents}" style="width: 900px">
			        						</td>
			        					</tr>
			        					<tr>
			        						<td>변경프로그램 목록</td>
			        						<td colspan="6">
			        							<input type="button" class="addModifiedPrograms btn btn-info" value="추가"><input type="button" class="removeModifiedPrograms btn btn-danger" id='removeModifiedPrograms' value="전체삭제"><br>
												<div class="divModifiedPrograms"> 
													<c:forEach items="${modifiedProgramOfDeployNo}" varStatus="status">
														<input type="text" name="modifiedPrograms_pageId${status.index}" id="modifiedPrograms_pageId${status.index}" value="<c:out value="${modifiedProgramOfDeployNo[status.index].modifiedPrograms_pageId}" />" readonly="readonly">					
														<input type="text" name="modifiedPrograms_pageName${status.index}" id="modifiedPrograms_pageName${status.index}" value="<c:out value="${modifiedProgramOfDeployNo[status.index].modifiedPrograms_pageName}" />" readonly="readonly">
														<input type="button" class="btn btn-primary" value="검색" onclick="searchModifiedPrograms(${status.index})"><br>								
													</c:forEach> 
													<input type="hidden" name="lastModifiedProgram" id="lastModifiedProgram" value="${fn:length(modifiedProgramOfDeployNo)-1}">            
													<input type="hidden" name="moodifiedProgramSize" id="moodifiedProgramSize" value="${fn:length(modifiedProgramOfDeployNo)}">            
												</div>
			        						</td>
			        					</tr>
			        					<tr>
			        						<td>변경 소스명</td>
			        						<td colspan="6">
			        							<input type="button" class="addModifiedResources btn btn-info" value="추가"><input type="button" class="removeModifiedResources btn btn-danger" id="removeModifiedResources" value="전체삭제"><br> 	
												<div class="divModifiedResources">  
												 	<c:forEach items="${modifiedResourceOfDeployNo}" varStatus="status">
														<input type="text" name="modifiedResources_wSourceName${status.index}" id="modifiedResources_wSourceName${status.index}" value="<c:out value="${modifiedResourceOfDeployNo[status.index].modifiedResources_wSourceName}" />"><br>									
<%-- 														<input type="button" class="btn btn-primary" value="검색" onclick="searchModifiedResources(${status.index})"><br>								 --%>
													</c:forEach> 
													<input type="hidden" name="lastModifiedResources" id="lastModifiedResources" value="${fn:length(modifiedResourceOfDeployNo)-1}">
													<input type="hidden" name="modifiedResourceSize" id="modifiedResourceSize" value="${fn:length(modifiedResourceOfDeployNo)}">
												</div>
			        						</td>
			        					</tr>
<!-- 			        					<tr> -->
<!-- 			        						<td>요청자</td> -->
<!-- 			        						<td colspan="6"> -->
<%-- 			        							<input type="text" name="requesterName" id="requesterName" value="${deployRequestDto.employeeName}" readonly="readonly"><input type="hidden" id="requester" name="requester" value="${deployRequestDto.requester}"> --%>
<!-- 	      										<input type="button" class="btn btn-primary" value="검색" onclick="searchEmployee('requester')"> -->
<!-- 			        						</td> -->
<!-- 			        					</tr> -->
			        					<tr>
			        						<td>배포담당자</td>
			        						<td colspan="6">
			        							<input type="text" name="deployer" id="deployer" value="${deployRequestDto.deployer}" readonly="readonly">
<!-- 	             								<input type="button" class="btn btn-primary" value="검색" onclick="searchEmployee('deployer')"> -->
			        						</td>
			        					</tr>
<!-- 			        					<tr> -->
<!-- 			        						<td>개발계 담당자</td>		        						 -->
<!-- 			        						<td colspan="6"> -->
<%-- 			        							<input type="text" name="developConfirmer" id="developConfirmer" value="${deployRequestDto.developConfirmer}" readonly="readonly"> --%>
<!-- 	             								<input type="button" class="btn btn-primary" value="검색" onclick="searchEmployee('developConfirmer')"> -->
<!-- 	             							</td> -->
<!-- 			        					</tr> -->
<!-- 			        					<tr> -->
<!-- 			        						<td>테스트계 담당자</td> -->
<!-- 			        						<td colspan="6"> -->
<%-- 			        							<input type="text" name="testConfirmer" id="testConfirmer" value="${deployRequestDto.testConfirmer}" readonly="readonly"> --%>
<!-- 	           									<input type="button" class="btn btn-primary" value="검색" onclick="searchEmployee('testConfirmer')"> -->
<!-- 			        						</td> -->
<!-- 			        					</tr> -->
<!-- 			        					<tr> -->
<!-- 			        						<td>운영계 담당자</td> -->
<!-- 			        						<td colspan="6"> -->
<%-- 			        							<input type="text" name="productionConfirmer" id="productionConfirmer" value="${deployRequestDto.productionConfirmer}" readonly="readonly"> --%>
<!-- 	            								<input type="button" class="btn btn-primary" value="검색" onclick="searchEmployee('productionConfirmer')"> -->
<!-- 			        						</td> -->
<!-- 			        					</tr> -->
<!-- 			        					<tr> -->
<!-- 			        						<td>구분</td> -->
<!-- 			        						<td colspan="6"> -->
<!-- 			        							<select name="division" id="division"> -->
<%-- 													<c:forEach items="${categoryMasterCodes[categoryType.cateDivisionString]}" varStatus="status"> --%>
<%-- 														<option value="<c:out value='${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}'></c:out>" <c:if test="${deployRequestDto.division eq categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}</option> --%>
<%-- 													</c:forEach> --%>
<!-- 											    </select> -->
<!-- 			        						</td> -->
<!-- 			        					</tr> -->
			        				</thead>
			        			</table>
			        			<input type="button" id="deployRequestUpdateBtn" class="btn btn-primary" value="재요청하기">
		        			</form:form>
		        		</div>
			        </div>
		        </div>
			</div>
		</div>
	</body>
</html>