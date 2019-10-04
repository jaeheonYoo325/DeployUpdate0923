<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function searchSource(){
	  var str=document.getElementById("wSource").value;
	  var no=document.getElementById("no").value;
      opener.document.getElementById("wSource"+no).value=str;
      window.close();
   }
</script>
</head>
<body>
<h1>searchSource</h1>
<input type="text" id="wSource"><input type="button" value="사용 " onclick="searchSource()">
<input type="hidden" id="no" value="${no}">
</body>
</html>