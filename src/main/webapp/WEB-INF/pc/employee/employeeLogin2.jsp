<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%-- <jsp:include page="/WEB-INF/pc/CommonScript/commonScript.jsp"/> --%>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<script src="<c:url value='/js/common/common.js' />"></script>
<script src="<c:url value='/js/employee/employeeLogin.js' />"></script>
</head>
<body>
<h1>로그인</h1>
<form:form id="employeeLoginFrm" modelAttribute="employeeDto">
사원번호 : <input type="text" id="employeeNo" name="employeeNo"> <br>
비밀번호 : <input type="text" id="employeePassWord" name="employeePassWord"> <br>
<input type="button" id="employeeLoginBtn" value="로그인">
</form:form>
</body>
</html>