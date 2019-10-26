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
<title>Insert title here</title>
<%-- <jsp:include page="/WEB-INF/pc/CommonScript/commonScript.jsp"/> --%>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<script src="<c:url value='/js/deploy/deployUpdate.js' />"></script>
</head>
<script>
$(document).ready(function() {
	
	var modifiedProgramSize = $("#moodifiedProgramSize").val();
// 	var modifiedProgramSize = 0;
	var modifiedResourceSize = $("#modifiedResourceSize").val();
// 	var modifiedResourceSize = 0;
	var isModifiedPrograms = false;
	var isModifiedResources = false;
	
	$("#deployRequestUpdateBtn").click(function() {
		var chainId = $("#chainId").val();
		var chainName = $("#chainName").val();
		var workType = $("#workType").val();
		var requestDate = $("#requestDate").val();
		var requestTime = $("#requestTime").val();
		var modifiedContents = $("#modifiedContents").val();
		var requesterName = $("#requesterName").val();
		var division = $("#division").val();
	
	
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
		
		if ( requestDate == "") {
			alert("요청날짜를 선택해주세요.");
			return;
		}
		
		if ( requestTime == "") {
			alert("요청시간을 선택해주세요.");
			return;
		}
		
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
    	
		if ( requesterName == "") {
			alert("요청자를 검색해서 선택해주세요.");
			return;
		}
		
		if ( division == "구분") {
			alert("구분을 선택해주세요.");
			return;
		}
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
        isModifiedPrograms = false;
		$('.divModifiedPrograms').append (           
			$("<input type='text' name='modifiedPrograms_pageId"+i+"'id='modifiedPrograms_pageId"+i+"' readonly='readonly'><input type='text' name='modifiedPrograms_pageName"+i+"'id='modifiedPrograms_pageName"+i+"' readonly='readonly'><input type='button' value='검색' onclick='searchModifiedPrograms("+i+")'><br>")
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
        isModifiedResources = false;
		 $('.divModifiedResources').append (           
			$("<input type='text' name='modifiedResources_wSourceName"+j+"'id='modifiedResources_wSourceName"+j+"' readonly='readonly'><input type='button' value='검색' onclick='searchModifiedResources("+j+")' readonly='readonly'><br>")
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
	function searchModifiedResources(modifiedResourceTextNo){
		window.open("/search/searchModifiedResource.do?modifiedResourceTextNo="+modifiedResourceTextNo,"변경소스검색", "width=1000, height=800");
	}
</script>
<h1>수정페이지</h1>
<form:form id="deployRequestDetailFrm" modelAttribute="deployRequestDto" name="deployRequestDetailFrm">
No : <input type="text" name="deployNo" id="deployNo" value="${deployRequestDto.deployNo}" readonly="readonly"><br>
부문 :  <input type="text" name="chainId" id="chainId" value="${deployRequestDto.chainId}" readonly="readonly">
	  <input type="text" name="chainName" id="chainName" value="${deployRequestDto.chainName}" readonly="readonly">
	  <input type="button" value="검색" onclick="searchChain()"><br>
	  <form:errors id="errorsChainId" cssStyle="color: red;" path="chainId" /><br>
작업유형 : <select name="workType" id="workType">
			<c:forEach items="${categoryMasterCodes[categoryType.cateWtypeString]}" varStatus="status">
				<option value="<c:out value='${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}'></c:out>" <c:if test="${deployRequestDto.workType eq categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}</option>
			</c:forEach>			
       </select><br>
요청날짜 : <input type="date" name="requestDate" id="requestDate" value="${deployRequestDto.requestDate}"><br>
<form:errors id="errorsRequestDate" cssStyle="color: red;" path="requestDate" /><br>

요청시간 : <input type="time" name="requestTime" id="requestTime" value="${deployRequestDto.requestTime}"><br>
<form:errors id="errorsRequestTime" cssStyle="color: red;" path="requestTime" /><br>

서비스요청_ID : <input type="text" name="serviceRequestId" id="serviceRequestId" value="${deployRequestDto.serviceRequestId}" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmployee('serviceRequestId')"><br>
작업자 : <input type="text" name="worker" id="worker" value="${deployRequestDto.worker}" readonly="readonly">
       <input type="button" value="검색" onclick="searchEmployee('worker')"><br>
변경내역 : <input type="text" name="modifiedContents" id="modifiedContents" value="${deployRequestDto.modifiedContents}"><br>
<form:errors id="errorsModifiedContents" cssStyle="color: red;" path="modifiedContents" /><br>

변경프로그램목록 : <input type="button" class="addModifiedPrograms" value="추가"><input type='button' class='removeModifiedPrograms'id='removeModifiedPrograms' value='전체삭제'><br>
			<div class="divModifiedPrograms"> 
				<c:forEach items="${modifiedProgramOfDeployNo}" varStatus="status">
					<input type="text" name="modifiedPrograms_pageId${status.index}" id="modifiedPrograms_pageId${status.index}" value="<c:out value="${modifiedProgramOfDeployNo[status.index].modifiedPrograms_pageId}" />" readonly="readonly">					
					<input type="text" name="modifiedPrograms_pageName${status.index}" id="modifiedPrograms_pageName${status.index}" value="<c:out value="${modifiedProgramOfDeployNo[status.index].modifiedPrograms_pageName}" />" readonly="readonly">
					<input type="button" value="검색" onclick="searchModifiedPrograms(${status.index})"><br>								
				</c:forEach> 
				<input type="hidden" name="lastModifiedProgram" id="lastModifiedProgram" value="${fn:length(modifiedProgramOfDeployNo)-1}">            
				<input type="hidden" name="moodifiedProgramSize" id="moodifiedProgramSize" value="${fn:length(modifiedProgramOfDeployNo)}">            
			</div>
변경소스명 : <input type="button" class="addModifiedResources" value="추가"><input type='button' class='removeModifiedResources'id='removeModifiedResources' value='전체삭제'><br> 	
		 <div class="divModifiedResources">  
		 	<c:forEach items="${modifiedResourceOfDeployNo}" varStatus="status">
				<input type="text" name="modifiedResources_wSourceName${status.index}" id="modifiedResources_wSourceName${status.index}" value="<c:out value="${modifiedResourceOfDeployNo[status.index].modifiedResources_wSourceName}" />" readonly="readonly">									
				<input type="button" value="검색" onclick="searchModifiedResources(${status.index})"><br>								
			</c:forEach> 
			<input type="hidden" name="lastModifiedResources" id="lastModifiedResources" value="${fn:length(modifiedResourceOfDeployNo)-1}">
			<input type="hidden" name="modifiedResourceSize" id="modifiedResourceSize" value="${fn:length(modifiedResourceOfDeployNo)}">
		</div>
요청자 : <input type="text" name="requester" id="requester" value="${deployRequestDto.requester}" readonly="readonly">
      <input type="button" value="검색" onclick="searchEmployee('requester')"><br>
      
      
Deploy담당자 : <input type="text" name="deployer" id="deployer" value="${deployRequestDto.deployer}" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmployee('deployer')"><br>
확인(개발계) : <input type="text" name="developConfirmer" id="developConfirmer" value="${deployRequestDto.developConfirmer}" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmployee('developConfirmer')"><br>
확인(태스트계) : <input type="text" name="testConfirmer" id="testConfirmer" value="${deployRequestDto.testConfirmer}" readonly="readonly">
           <input type="button" value="검색" onclick="searchEmployee('testConfirmer')"><br>
확인(운영계) : <input type="text" name="productionConfirmer" id="productionConfirmer" value="${deployRequestDto.productionConfirmer}" readonly="readonly">
            <input type="button" value="검색" onclick="searchEmployee('productionConfirmer')"><br>
구분 : <select name="division" id="division">
		<c:forEach items="${categoryMasterCodes[categoryType.cateDivisionString]}" varStatus="status">
			<option value="<c:out value='${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}'></c:out>" <c:if test="${deployRequestDto.division eq categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}</option>
		</c:forEach>
     </select><br>
<!-- 상태 코드 : -->
<%-- 		<c:forEach items="${categoryMasterCodes[categoryType.cateStatusString]}" begin="1" varStatus="status"> --%>
<%-- 			<input type="radio" name="statusCode" value="0${status.index}" <c:if test="${deployRequestOfDeployNo.statusCode eq categoryMasterCodes[categoryType.cateStatusString][status.index].codeValue}">checked="checked"</c:if>>${categoryMasterCodes[categoryType.cateStatusString][status.index].codeName} --%>
<%-- 		</c:forEach> --%>
<!-- 		<br>		 -->
<input type="button" id="deployRequestUpdateBtn" value="재요청하기">
<%-- <input type="button" id="DeployRequestDeleteBtn" value="삭제" onclick="location.href='/deploy/deployRequestDelete.do/'+${deployRequestOfDeployNo.deployNo}"/> --%>
</form:form>
</body>
</html>