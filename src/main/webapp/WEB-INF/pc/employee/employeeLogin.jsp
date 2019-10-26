<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>로그인</title>
	<!-- Custom fonts for this template-->
	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/vendor/fontawesome-free/css/all.min.css' />">
  	<!-- Custom styles for this template-->
  	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/css/sb-admin.css' />">
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery/jquery.min.js' />"></script>
<%-- 	<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script> --%>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery-easing/jquery.easing.min.js' />"></script>
	<script src="<c:url value='/js/common/common.js' />"></script>
	<script src="<c:url value='/js/employee/employeeLogin.js' />"></script>
	
</head>
<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">로그인</div>
      <div class="card-body">
        <form:form id="employeeLoginFrm" modelAttribute="employeeDto">
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="employeeNo" name="employeeNo" class="form-control" placeholder="사원번호" required="required" autofocus="autofocus">
              <label for="employeeNo">사원번호</label>
              <form:errors id="errorsEmployeeNo" cssStyle="color: red;" path="employeeNo" /><br>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="employeePassWord" name="employeePassWord" class="form-control" placeholder="비밀번호" required="required">
              <label for="employeePassWord">비밀번호</label>
              <form:errors id="errorsEmployeePassWord" cssStyle="color: red;" path="employeePassWord" /><br>
            </div>
          </div>        
<!--           <a class="btn btn-primary btn-block" href="index.html">Login</a> -->
          <input type="button" class="btn btn-primary btn-block" id="employeeLoginBtn" value="로그인">
        </form:form>      
      </div>
    </div>
  </div>
</html>