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
<h1>MyDeployDetail</h1>
No : <input type="text" name="deployNo" id="deployNo" value="${deployRequestOfDeployNo.deployNo}" readonly="readonly"><br>
부문 :  <input type="text" name="chainId" id="chainId" value="${deployRequestOfDeployNo.chainId}" readonly="readonly">
     <input type="text" name="chainName" id="chainName" value="${deployRequestOfDeployNo.chainName}" readonly="readonly"><br>
작업유형 : <select name="workType" id="workType">
         <option value="작업유형" <c:if test="${deployRequestOfDeployNo.workType eq ''}" >selected="selected"</c:if>>작업유형</option> 
         <option value="정기" <c:if test="${deployRequestOfDeployNo.workType eq '정기'}" >selected="selected"</c:if>>정기</option> 
         <option value="수시" <c:if test="${deployRequestOfDeployNo.workType eq '수시'}" >selected="selected"</c:if>>수시</option>          
       </select><br>
요청날짜 : <input type="date" name="requestDate" value="${deployRequestOfDeployNo.requestDate}"><br>
요청시간 : <input type="time" name="requestTime" value="${deployRequestOfDeployNo.requestTime}"><br>
서비스요청_ID : <input type="text" name="serviceRequestId" id="serviceRequestId" value="${deployRequestOfDeployNo.serviceRequestId}" readonly="readonly"><br>
작업자 : <input type="text" name="worker" id="worker" value="${deployRequestOfDeployNo.worker}" readonly="readonly"><br>
변경내역 : <input type="text" name="modifiedContents" value="${deployRequestOfDeployNo.modifiedContents}"><br>
변경프로그램목록 : <br>
         <div class="divModifiedPrograms"> 
            <c:forEach items="${modifiedProgramOfDeployNo}" varStatus="status">
               <input type="text" name="modifiedPrograms_pageId${status.index}" id="modifiedPrograms_pageId${status.index}" value="<c:out value="${modifiedProgramOfDeployNo[status.index].modifiedPrograms_pageId}" />" readonly="readonly">               
               <input type="text" name="modifiedPrograms_pageName${status.index}" id="modifiedPrograms_pageName${status.index}" value="<c:out value="${modifiedProgramOfDeployNo[status.index].modifiedPrograms_pageName}" />" readonly="readonly">
            </c:forEach> 
            <input type="hidden" name="lastModifiedProgram" id="lastModifiedProgram" value="${fn:length(modifiedProgramOfDeployNo)-1}">            
         </div>
변경소스명 : <br>    
       <div class="divModifiedResources">  
          <c:forEach items="${modifiedResourceOfDeployNo}" varStatus="status">
            <input type="text" name="modifiedResources_wSourceName${status.index}" id="modifiedResources_wSourceName${status.index}" value="<c:out value="${modifiedResourceOfDeployNo[status.index].modifiedResources_wSourceName}" />" readonly="readonly">                           
         </c:forEach> 
         <input type="hidden" name="lastModifiedResources" id="lastModifiedResources" value="${fn:length(modifiedResourceOfDeployNo)-1}">
      </div>
요청자 : <input type="text" name="requester" id="requester" value="${deployRequestOfDeployNo.requester}" readonly="readonly"><br>
Deploy담당자 : <input type="text" name="deployer" id="deployer" value="${deployRequestOfDeployNo.deployer}" readonly="readonly"><br>
확인(개발계) : <input type="text" name="developConfirmer" id="developConfirmer" value="${deployRequestOfDeployNo.developConfirmer}" readonly="readonly"><br>
확인(태스트계) : <input type="text" name="testConfirmer" id="testConfirmer" value="${deployRequestOfDeployNo.testConfirmer}" readonly="readonly"><br>
확인(운영계) : <input type="text" name="productionConfirmer" id="productionConfirmer" value="${deployRequestOfDeployNo.productionConfirmer}" readonly="readonly"><br>
구분 : <select name="division">
      <option value="" <c:if test="${deployRequestOfDeployNo.division eq ''}" >selected="selected"</c:if>>구분</option>       
      <option value="신규" <c:if test="${deployRequestOfDeployNo.division eq '신규'}" >selected="selected"</c:if>>신규</option>       
      <option value="변경" <c:if test="${deployRequestOfDeployNo.division eq '변경'}" >selected="selected"</c:if>>변경</option>                         
     </select><br>
     
 <c:if test="${deployApprovalDetailCode eq 'myDeployApprovalDetail'}">
<input type="button" value="결제하기" onclick="location.href='/employee/MyDeployDoingApproval.do/${deployRequestOfDeployNo.deployNo}'">
<input type="button" value="반려하기" onclick="location.href='/employee/MyDeployDoingReturn.do/${deployRequestOfDeployNo.deployNo}'">   
 </c:if>    
 
 <c:if test="${deployApprovalDetailCode eq 'myDeployWillDeploy'}">
 <input type="button" value="배포하기" onclick="location.href='/employee/myDeployDoingDeploy.do/${deployRequestOfDeployNo.deployNo}'">
<input type="button" value="반려하기" onclick="location.href='/employee/MyDeployDoingReturn.do/${deployRequestOfDeployNo.deployNo}'">   
 </c:if>  
</body>
</html>