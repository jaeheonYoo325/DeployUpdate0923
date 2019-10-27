<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
<title>메인화면</title>
<%-- <jsp:include page="/WEB-INF/pc/CommonScript/commonScript.jsp"/> --%>
<%-- <script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script> --%>
<%-- <script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script> --%>
<%-- <link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />"> --%>
<%-- 	<link rel="stylesheet" href="<c:url value='/css/common/footer.css' />"> --%>
<%-- 	<link rel="stylesheet" href="<c:url value='/css/common/header.css' />"> --%>

	<!-- Custom fonts for this template-->
	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/vendor/fontawesome-free/css/all.min.css' />">
  	<!-- Custom styles for this template-->
  	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/css/sb-admin.css' />">
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery/jquery.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery-easing/jquery.easing.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/js/sb-admin.min.js' />"></script>
	<script src="<c:url value='/js/common/common.js' />"></script>
	<script src="<c:url value='/js/main/main.js' />"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#sidebarToggle").on('click', function(e) {
			    e.preventDefault();
			    $("body").toggleClass("sidebar-toggled");
			    $(".sidebar").toggleClass("toggled");
			 });
		});
	</script>
</head>
<body id="page-top">
	<jsp:include page="/WEB-INF/pc/common/header.jsp" />
	<div id="wrapper">
		<jsp:include page="/WEB-INF/pc/common/sidebar.jsp" />
		<div id="content-wrapper">
			<div class="container-fluid">
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
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/pc/common/footer.jsp" />
</body>
</html>