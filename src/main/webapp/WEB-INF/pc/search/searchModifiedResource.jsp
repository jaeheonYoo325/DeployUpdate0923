<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function searchModifiedReSources(){
	  var modifiedResources_wSourceName=document.getElementById("modifiedResources_wSourceName").value;
	  var modifiedResourceTextNo=document.getElementById("modifiedResourceTextNo").value;
      opener.document.getElementById("modifiedResources_wSourceName"+modifiedResourceTextNo).value=modifiedResources_wSourceName;
      window.close();
   }
</script>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<%-- <script src="<c:url value='/js/search/searchModifiedResource.js' />"></script> --%>
</head>
<body>
<h1>searchSource</h1>
<input type="text" id="modifiedResources_wSourceName"><input type="button" value="사용 " onclick="searchModifiedReSources()">
<input type="hidden" id="modifiedResourceTextNo" value="${modifiedResourceTextNo}">
</body>
</html>