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
<meta name="viewport" content="width=device-width initial-scale=1">	
<title>Insert title here</title>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<link rel="stylesheet" href="<c:url value='/css/common/footer.css' />">
<link rel="stylesheet" href="<c:url value='/css/common/header.css' />">
<script type="text/javascript">
   $(document).ready(function() {
     
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
	   window.open("/employee/showDeployPayDetail.do/"+deployNo+"/"+deployPayDetailCode,"상세보기", "width=1000, height=800");
	}
</script>

</head>
<body>
<jsp:include page="/WEB-INF/pc/common/header.jsp" />
	<h1>List</h1>
	<form:form name="listFrm" id="listFrm">
	<select name="searchType" id="searchType">
<%-- 			<c:forEach items="${masterCodeOfSearchTypeMap[categoryType.searchTypeString]}" varStatus="status"> --%>
<%-- 				<option value="<c:out value='${masterCodeOfSearchTypeMap[categoryType.searchTypeString][status.index].codeName}'></c:out>" <c:if test="${categoryType.searchType eq masterCodeOfSearchTypeMap[categoryType.searchTypeString][status.index].codeName}">selected="selected"</c:if>>${masterCodeOfSearchTypeMap[categoryType.searchTypeString][status.index].codeName}</option> --%>
<%-- 			</c:forEach> --%>
			<option value="검색타입" <c:if test="${categoryType.searchType eq '검색타입'}">selected="selected"</c:if>>검색타입</option>
			<option value="requester" <c:if test="${categoryType.searchType eq 'requester'}">selected="selected"</c:if>>요청자</option>
			<option value="modifiedPrograms" <c:if test="${categoryType.searchType eq 'modifiedPrograms'}">selected="selected"</c:if>>변경프로그램목록</option>
			<option value="modifiedResources" <c:if test="${categoryType.searchType eq 'modifiedResources'}">selected="selected"</c:if>>변경소스명</option>
		</select> 

		<input type="text" name="searchKeyword" id="searchKeyword" value="${categoryType.searchKeyword}">
		<input type="button" value="검색" id="searchBtn">
		<table border="1" class="table table-hover">
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
				<td>상세보기</td>
				<td><select name="categoryStatus" id="categoryStatus">
					<c:forEach items="${categoryMasterCodes[categoryType.cateStatusString]}" varStatus="status">
						<option value="<c:out value='${categoryMasterCodes[categoryType.cateStatusString][status.index].codeValue}'></c:out>" <c:if test="${categoryType.categoryStatus eq categoryMasterCodes[categoryType.cateStatusString][status.index].codeValue}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateStatusString][status.index].codeName}</option>
					</c:forEach>
				</select></td>
			</tr>
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
					<td><input type="button" value="상세내역" onclick="showPayDetail(${deployPaid.deployNo},'myDeploy')"></td>
					<td>	
						<c:forEach items="${categoryMasterCodes[categoryType.cateStatusString]}" begin="1" varStatus="status">
							<input type="radio" name="statusCode${deploy.deployNo}"  <c:if test="${deploy.statusCode eq categoryMasterCodes[categoryType.cateStatusString][status.index].codeValue}">checked="checked"</c:if>disabled="disabled">${categoryMasterCodes[categoryType.cateStatusString][status.index].codeName}
						</c:forEach>		
					</td>
				</tr>
			</c:forEach>
		</table>
	</form:form>
</body>
<jsp:include page="/WEB-INF/pc/common/footer.jsp" />
</html>