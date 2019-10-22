<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">	
<title>메인화면</title>
<%-- <jsp:include page="/WEB-INF/pc/CommonScript/commonScript.jsp"/> --%>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<link rel="stylesheet" href="<c:url value='/css/common/footer.css' />">
<link rel="stylesheet" href="<c:url value='/css/common/header.css' />">
<script src="<c:url value='/js/common/common.js' />"></script>
<script src="<c:url value='/js/main/main.js' />"></script>
</head>
<body>
<jsp:include page="/WEB-INF/pc/common/header.jsp" />
 <h1>메인화면</h1>
<%--  <c:choose> --%>
<%--  	<c:when test="${not empty sessionScope._USER_}"> --%>
<%--  		<a href="#">${sessionScope._USER_.empName}님 로그인 하셨습니다.</a> --%>
<%--  	</c:when> --%>
<%--  	<c:otherwise> --%>
<!--  		<a href="#">계정 없음</a> -->
<%--  	</c:otherwise> --%>
<%--  </c:choose> --%>
<!--  <a href="/employee/employeeLogout.do">로그아웃</a><br> -->
<!--  <input type="button" value="배포" class="btn btn-primary" onclick="location.href='/deploy/deploy.do'"><br> -->
<!--  <input type="button" value="사원등록"  class="btn btn-primary" onclick="location.href='/employee/employeeRegist.do'"><br> -->
<!--  <input type="button" value="사원등록팝업"  class="btn btn-default" id="employeeRegistPupupBtn"><br> -->
	<h2>내용</h2>
	<h2>내용</h2>
	<h2>내용</h2>
	<h2>내용</h2>
	<h2>내용</h2>
	<h2>내용</h2>
	<h2>내용</h2>
	<h2>내용</h2>
	<h2>내용</h2>
	<h2>내용</h2>
<!-- <input type="button" value="My배포결제" onclick="location.href='/employee/myDeployPay.do'"> -->
<jsp:include page="/WEB-INF/pc/common/footer.jsp" />
</body>
</html>