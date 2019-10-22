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
    $("#deployRequestBtn").click(function() {
    	var chainId = $("#chainId").val();
    	var chainName = $("#chainName").val();
    	
//     	if ( chainId == "" ) {
//     		alert("부문 ID를 검색해서 선택해주세요.");
//     		return;
//     	}
    	
//     	if ( chainName == "" ) {
//     		alert("부문 이름을 검색해서 선택해주세요.");
//     		return;
//     	}
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
  	  else
  		  i=i+1;
        $('.divModifiedPrograms').append (           
			$("<input type='text' name='modifiedPrograms_pageId"+i+"'id='modifiedPrograms_pageId"+i+"' readonly='readonly'><input type='text' name='modifiedPrograms_pageName"+i+"'id='modifiedPrograms_pageName"+i+"' readonly='readonly'><input type='button' value='검색' onclick='searchModifiedPrograms("+i+")'><br>")
        );      
        $('.removeModifiedPrograms').on('click', function () {     	  
            $(".divModifiedPrograms").html("");
            i = -1;
        });
    });
    
    
    var j = -1;
    $('.addModifiedResources').click (function () {
  	  j=j+1;
        $('.divModifiedResources').append (           
			$("<input type='text' name='modifiedResources_wSourceName"+j+"'id='modifiedResources_wSourceName"+j+"' readonly='readonly'><input type='button' value='검색' onclick='searchModifiedResources("+j+")' readonly='readonly'><br>")
        );      
        $('.removeModifiedResources').on('click', function () { 
            $(".divModifiedResources").html("");
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
부문 : <input type="text" name="chainId" id="chainId" readonly="readonly">
     <input type="text" name="chainName" id="chainName" readonly="readonly">
     <input type="button" value="검색" onclick="searchChain()"><br>
     <form:errors id="errorsChainId" cssStyle="color: red;" path="chainId" /><br>
작업유형 : <select name="workType" id="workType">
			<c:forEach items="${categoryMasterCodes[categoryType.cateWtypeString]}" varStatus="status">
				<option value="<c:out value='${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}'></c:out>" <c:if test="${deployRequestOfDeployNo.workType eq categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}</option>
			</c:forEach>
       </select><br>
<%--        <form:errors id="errorsWorkType" cssStyle="color: red;" path="workType" /><br> --%>
요청날짜 : <input type="Date" name="requestDate"><br>
요청시간 : <input type="Time" name="requestTime"><br>
서비스요청_ID : <input type="text" name="serviceRequestId" id="serviceRequestId" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmployee('serviceRequestId')"><br>
작업자 : <input type="text" name="worker" id="worker" readonly="readonly">
       <input type="button" value="검색" onclick="searchEmployee('worker')"><br>
변경내역 : <input type="text" name="modifiedContents"><br>
변경프로그램목록   : <input type="button" class="addModifiedPrograms" value="추가"><input type='button' class='removeModifiedPrograms'id='removeModifiedPrograms' value='전체삭제'><br>
			<div class="divModifiedPrograms">      		        
			</div>
변경소스명   : <input type="button" class="addModifiedResources" value="추가"><input type='button' class='removeModifiedResources'id='removeModifiedResources' value='전체삭제'><br> 	
		  <div class="divModifiedResources">     
		  </div>
요청자 : <input type="text" name="requester" id="requester" readonly="readonly">
       <input type="button" value="검색" onclick="searchEmployee('requester')"><br>
Deploy담당자 : <input type="text" name="deployer" id="deployer" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmployee('deployer')"><br>
확인(개발계) : <input type="text" name="developConfirmer" id="developConfirmer" readonly="readonly">
            <input type="button" value="검색" onclick="searchEmployee('developConfirmer')"><br>
확인(태스트계) : <input type="text" name="testConfirmer" id="testConfirmer" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmployee('testConfirmer')"><br>
확인(운영계) :  <input type="text" name="productionConfirmer" id="productionConfirmer" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmployee('productionConfirmer')"><br>
구분 : <select name="division">
		<c:forEach items="${categoryMasterCodes[categoryType.cateDivisionString]}" varStatus="status">
			<option value="<c:out value='${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}'></c:out>" <c:if test="${deployRequestOfDeployNo.division eq categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}</option>
		</c:forEach>
     </select><br>
<input type="hidden" name="statusCode" value="요청">
<input type="button" id="deployRequestBtn" value="요청">
</form:form>
</body>
<jsp:include page="/WEB-INF/pc/common/footer.jsp" />
</html>