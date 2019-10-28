<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">	
	<title>변경 소스 페이지</title>
	<!-- Custom fonts for this template-->
	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/vendor/fontawesome-free/css/all.min.css' />">
  	<!-- Custom styles for this template-->
  	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/css/sb-admin.css' />">
  	<!-- Page level plugin CSS-->
  	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/vendor/datatables/dataTables.bootstrap4.css' />">
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery/jquery.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery-easing/jquery.easing.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/js/sb-admin.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/datatables/jquery.dataTables.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/datatables/dataTables.bootstrap4.js' />"></script>
	<%-- <script src="<c:url value='/js/search/searchModifiedResource.js' />"></script> --%>
	
</head>	
<script type="text/javascript">
function searchModifiedReSources(){
	  var modifiedResources_wSourceName=document.getElementById("modifiedResources_wSourceName").value;
	  var modifiedResourceTextNo=document.getElementById("modifiedResourceTextNo").value;
      opener.document.getElementById("modifiedResources_wSourceName"+modifiedResourceTextNo).value=modifiedResources_wSourceName;
      window.close();
   }
</script>
<body>
<h1>변경 소스</h1>
<input type="text" id="modifiedResources_wSourceName"><input type="button" class="btn btn-info" value="사용 " onclick="searchModifiedReSources()">
<input type="hidden" id="modifiedResourceTextNo" value="${modifiedResourceTextNo}">
</body>
</html>