<%@page import="com.springproject.wsource.dto.WSourceTableDto"%>
<%@page import="com.springproject.wprogramtable.dto.WProgramTableDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.springproject.deploy.dto.DeployDto"%>
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
<h1>수정페이지</h1>
<form:form id="updateFrm" modelAttribute="deployDto" name="updateFrm">
No : <input type="text" name="deployNo" id="deployNo" value="${deployDto.deployNo}" readonly="readonly"><br>
부문 :  <input type="text" name="d_chainId" id="d_chainId" value="${deployDto.d_chainId}" readonly="readonly">
	  <input type="text" name="chainName" id="chainName" value="${deployDto.chainName}" readonly="readonly">
	  <input type="button" value="검색" onclick="searchChain()"><br>
작업유형 : <select name="wtype" id="wtype">
         <option value="작업유형" <c:if test="${deployDto.wtype eq ''}">selected="selected"</c:if>>작업유형</option> 
         <option value="정기" <c:if test="${deployDto.wtype eq '정기'}">selected="selected"</c:if>>정기</option> 
         <option value="수시" <c:if test="${deployDto.wtype eq '수시'}">selected="selected"</c:if>>수시</option>          
       </select><br>
요청날짜 : <input type="date" name="reqDate" value="${deployDto.reqDate}"><br>
요청시간 : <input type="time" name="reqTime" value="${deployDto.reqTime}"><br>
서비스요청_ID : <input type="text" name="reqServiceId" id="reqServiceId" value="${deployDto.reqServiceId}" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('req')"><br>
작업자 : <input type="text" name="wEmpNo" id="wEmpNo" value="${deployDto.wEmpNo}" readonly="readonly">
       <input type="button" value="검색" onclick="searchEmp('wEmp')"><br>
변경내역 : <input type="text" name="wContent" value="${deployDto.wContent}"><br>
변경프로그램목록 : <input type="button" class="btnAddP" value="추가"><input type='button' class='removeP'id='removeP' value='전체삭제'><br>
			<div class="buttonsP"> 
				<c:forEach items="${wProgramTableDtoList}" varStatus="status">
					<input type="text" name="wProgram${status.index}" id="wProgram${status.index}" value="<c:out value="${wProgramTableDtoList[status.index].wProNo_pageId}" />" readonly="readonly">					
					<input type="text" name="pageName${status.index}" id="pageName${status.index}" value="<c:out value="${wProgramTableDtoList[status.index].wProNo_pageName}" />" readonly="readonly">
					<input type="button" value="검색" onclick="searchProgram(${status.index})"><br>								
				</c:forEach> 
				<input type="hidden" name="lastwPro" id="lastwPro" value="${fn:length(wProgramTableDtoList)-1}">            
			</div>
변경소스명 : <input type="button" class="btnAddS" value="추가"><input type='button' class='removeS'id='removeS' value='전체삭제'><br> 	
		 <div class="buttonsS">  
		 	<c:forEach items="${wSourceTableDtoList}" varStatus="status">
				<input type="text" name="wSource${status.index}" id="wSource${status.index}" value="<c:out value="${wSourceTableDtoList[status.index].wSo_wSourceName}" />" readonly="readonly">									
				<input type="button" value="검색" onclick="searchSource(${status.index})"><br>								
			</c:forEach> 
			<input type="hidden" name="lastwSo" id="lastwSo" value="${fn:length(wSourceTableDtoList)-1}">
		</div>
요청자 : <input type="text" name="reqEmpNo" id="reqEmpNo" value="${deployDto.reqEmpNo}" readonly="readonly">
      <input type="button" value="검색" onclick="searchEmp('reqEmp')"><br>
Deploy담당자 : <input type="text" name="deployEmpNo" id="deployEmpNo" value="${deployDto.deployEmpNo}" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('deployEmp')"><br>
확인(개발계) : <input type="text" name="devEmpNo" id="devEmpNo" value="${deployDto.devEmpNo}" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('devEmp')"><br>
확인(태스트계) : <input type="text" name="testEmpNo" id="testEmpNo" value="${deployDto.testEmpNo}" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('testEmp')"><br>
확인(운영계) : <input type="text" name="prdEmpNo" id="prdEmpNo" value="${deployDto.prdEmpNo}" readonly="readonly">
            <input type="button" value="검색" onclick="searchEmp('prdEmp')"><br>
구분 : <select name="division">
      <option value="" <c:if test="${deployDto.division eq ''}">selected="selected"</c:if>>구분</option>       
      <option value="신규" <c:if test="${deployDto.division eq '신규'}">selected="selected"</c:if>>신규</option>       
      <option value="변경" <c:if test="${deployDto.division eq '변경'}">selected="selected"</c:if>>변경</option>                         
     </select><br>
상태 코드 :
		<c:forEach items="${statusCodeList}" var="statusCode" varStatus="status">
			<input type="radio" name="statusCode" value="0${status.index + 1}" <c:if test="${deployDto.statusCode eq statusCode.codeValue}">checked="checked"</c:if>>${statusCode.codeName}
		</c:forEach>
		<br>		
<input type="button" id="updateBtn" value="수정">
<td><input type="button" id="requestDeleteBtn" value="삭제" onclick="location.href='/deploy/deployDelete.do/'+${deployDto.deployNo}"/></td>
</form:form>
</body>
</html>