<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">	
<title>배포 요청 페이지</title>
<%-- <jsp:include page="/WEB-INF/pc/CommonScript/commonScript.jsp"/> --%>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<link rel="stylesheet" href="<c:url value='/css/common/footer.css' />">
<link rel="stylesheet" href="<c:url value='/css/common/header.css' />">
<%-- <script src="<c:url value='/js/deploy/deployRequest.js' />"></script> --%>
</head>
<script>
$(document).ready(function() {
	
	var modifiedProgramSize = 0;
	var modifiedResourceSize = 0;
	var isModifiedPrograms = true;
	var isModifiedResources = true;
	
    $("#deployRequestBtn").click(function() {
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
			alert("요청자를 검색해서 선택해주세요.")
			return;
		}
		
		if ( division == "구분") {
			alert("구분을 선택해주세요.")
			return;
		}
		
	     $("#deployRequestFrm").attr({
	          method:"post",                                         
	            action:"/deploy/deployRequest.do"
	     }).submit();
    });  

    var i = -1;
    $('.addModifiedPrograms').click (function () {
  	  if($("#chainId").val()==""){
  		  alert("부문선택필수");
  		  return;
  	  }  	
  		i=i+1;
        $('.divModifiedPrograms').append (           
			$("<input type='text' name='modifiedPrograms_pageId"+i+"'id='modifiedPrograms_pageId"+i+"' readonly='readonly'><input type='text' name='modifiedPrograms_pageName"+i+"'id='modifiedPrograms_pageName"+i+"' readonly='readonly'><input type='button' value='검색' onclick='searchModifiedPrograms("+i+")'><br>")
        );
        
        modifiedProgramSize = i;
        isModifiedPrograms = false;
        $('.removeModifiedPrograms').on('click', function () {     	  
            $(".divModifiedPrograms").html("");
            isModifiedPrograms = true;
            i = -1;
        });
    });
    
    
    var j = -1;
    $('.addModifiedResources').click (function () {
    	if($("#chainId").val()==""){
    		  alert("부문선택필수");
    		  return;
    	} 
  	    j=j+1;
        $('.divModifiedResources').append (           
			$("<input type='text' name='modifiedResources_wSourceName"+j+"'id='modifiedResources_wSourceName"+j+"' readonly='readonly'><input type='button' value='검색' onclick='searchModifiedResources("+j+")' readonly='readonly'><br>")
        );
        modifiedResourceSize = j;
        isModifiedResources = false;
        $('.removeModifiedResources').on('click', function () { 
            $(".divModifiedResources").html("");
            isModifiedResources = true;
            j = -1;
        });
    });
 });
 
  	function searchEmployee(employeeSearchWhere){
	   window.open("/search/searchEmployee.do?employeeSearchWhere="+employeeSearchWhere,"임직원검색", "width=1000, height=800");
	}
	function searchChain(){
	   window.open("/search/searchChain.do","부문검색", "width=1000, height=800");
	}
	function searchModifiedPrograms(modifiedProgramsTextNo){
		var selectedchainId=document.deployRequestFrm.chainId.value;
	   window.open("/search/searchModifiedPrograms.do?selectedchainId="+selectedchainId+"&modifiedProgramsTextNo="+modifiedProgramsTextNo,"변경프로그램검색", "width=1000, height=800");
	}
	function searchModifiedResources(modifiedResourceTextNo){
		window.open("/search/searchModifiedResource.do?modifiedResourceTextNo="+modifiedResourceTextNo,"변경소스검색", "width=1000, height=800");
	}
	
</script>
<body>
<jsp:include page="/WEB-INF/pc/common/header.jsp" />
<h1>배포 요청 페이지</h1>
<form:form id="deployRequestFrm" modelAttribute="deployRequestDto" name="deployRequestFrm">
부문 : <input type="text" name="chainId" id="chainId" readonly="readonly" value="${deployRequestDto.chainId}">
     <input type="text" name="chainName" id="chainName" readonly="readonly" value="${deployRequestDto.chainName}">
     <input type="button" value="검색" onclick="searchChain()"><br>
     <form:errors id="errorsChainId" cssStyle="color: red;" path="chainId" /><br>
작업유형 : <select name="workType" id="workType">			
			<c:forEach items="${categoryMasterCodes[categoryType.cateWtypeString]}" varStatus="status">
				<option value="<c:out value='${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}'></c:out>" <c:if test="${deployRequestDto.workType eq categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}</option>
			</c:forEach>
       </select><br>
       <form:errors id="errorsWorkType" cssStyle="color: red;" path="workType" /><br>
요청날짜 : <input type="Date" name="requestDate" id="requestDate" value="${deployRequestDto.requestDate}"><br>
<form:errors id="errorsRequestDate" cssStyle="color: red;" path="requestDate" /><br>

요청시간 : <input type="Time" name="requestTime" id="requestTime" value="${deployRequestDto.requestTime}"><br>
<form:errors id="errorsRequestTime" cssStyle="color: red;" path="requestTime" /><br>

서비스요청_ID : <input type="text" name="serviceRequestId" id="serviceRequestId" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmployee('serviceRequestId')"><br>
작업자 : <input type="text" name="worker" id="worker" readonly="readonly">
       <input type="button" value="검색" onclick="searchEmployee('worker')"><br>
변경내역 : <input type="text" name="modifiedContents" id="modifiedContents" value="${deployRequestDto.modifiedContents}"><br>
<form:errors id="errorsModifiedContents" cssStyle="color: red;" path="modifiedContents" /><br>

변경프로그램목록   : <input type="button" class="addModifiedPrograms" value="추가"><input type='button' class='removeModifiedPrograms'id='removeModifiedPrograms' value='전체삭제'><br>
			<div class="divModifiedPrograms">      		        
			</div>
변경소스명   : <input type="button" class="addModifiedResources" value="추가"><input type='button' class='removeModifiedResources'id='removeModifiedResources' value='전체삭제'><br> 	
		  <div class="divModifiedResources">     
		  </div>
요청자 : <input type="text" name="requesterName" id="requesterName" readonly="readonly"><input type="hidden" id="requester" name="requester" value="${deployRequestDto.requester}">
       <input type="button" value="검색" onclick="searchEmployee('requester')"><br>
<form:errors id="errorsRequester" cssStyle="color: red;" path="requester" /><br>
       
Deploy담당자 : <input type="text" name="deployer" id="deployer" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmployee('deployer')"><br>
확인(개발계) : <input type="text" name="developConfirmer" id="developConfirmer" readonly="readonly">
            <input type="button" value="검색" onclick="searchEmployee('developConfirmer')"><br>
확인(태스트계) : <input type="text" name="testConfirmer" id="testConfirmer" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmployee('testConfirmer')"><br>
확인(운영계) :  <input type="text" name="productionConfirmer" id="productionConfirmer" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmployee('productionConfirmer')"><br>
구분 : <select name="division" id="division">
		<c:forEach items="${categoryMasterCodes[categoryType.cateDivisionString]}" varStatus="status">
			<option value="<c:out value='${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}'></c:out>" <c:if test="${deployRequestDto.division eq categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}</option>
		</c:forEach>
     </select><br>
<input type="hidden" name="statusCode" value="요청">
<input type="button" id="deployRequestBtn" value="요청">
</form:form>
</body>
<jsp:include page="/WEB-INF/pc/common/footer.jsp" />
</html>