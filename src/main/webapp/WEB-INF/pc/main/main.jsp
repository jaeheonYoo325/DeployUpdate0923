<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<meta name="viewport" content="width=device-width initial-scale=1">			
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<script src="<c:url value='/js/common/common.js' />"></script>
<script src="<c:url value='/js/main/main.js' />"></script>
</head>
<body>
 <h1>메인화면</h1>
 <c:choose>
 	<c:when test="${not empty sessionScope._USER_}">
 		<a href="#">${sessionScope._USER_.empName}님 로그인 하셨습니다.</a>
 	</c:when>
 	<c:otherwise>
 		<a href="#">계정 없음</a>
 	</c:otherwise>
 </c:choose>
 
 <a href="/employee/employeeLogout.do">로그아웃</a><br>
 <input type="button" value="배포" class="btn btn-primary" onclick="location.href='/deploy/deploy.do'"><br>
 <input type="button" value="사원등록"  class="btn btn-primary" onclick="location.href='/employee/employeeRegist.do'"><br>
 <input type="button" value="사원등록팝업"  class="btn btn-default" id="employeeRegistPupupBtn"><br>
</body>
</html>