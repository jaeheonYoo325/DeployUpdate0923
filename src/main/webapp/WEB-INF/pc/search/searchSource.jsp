<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function searchSource(){
	  var str=document.getElementById("wSource").value;
	  var no=document.getElementById("no").value;
      opener.document.getElementById("wSource"+no).value=str;
      window.close();
   }
</script>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<script src="<c:url value='/js/search/searchSource.js' />"></script>
</head>
<body>
<h1>searchSource</h1>
<input type="text" id="wSource"><input type="button" value="사용 " onclick="searchSource()">
<input type="hidden" id="no" value="${no}">
</body>
</html>