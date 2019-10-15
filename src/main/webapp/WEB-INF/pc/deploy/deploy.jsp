<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>deploy</h1>
 <input type="button" value="요청" onclick="location.href='/deploy/deployRequest.do'">
 <input type="button" value="조회" onclick="location.href='/deploy/deployList.do'">
</body>
</html>