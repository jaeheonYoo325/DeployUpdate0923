<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<%-- <script src="<c:url value='/js/search/searchModifiedPrograms.js' />"></script> --%>
</head>
<script>
$(document).ready(function() {
    $("#searchModifiedProgramsBtn").click(function() {
       $("#searchModifiedProgramsFrm").attr({
          method:"post",                                         
            action:"/search/searchModifiedPrograms.do"
     }).submit();
    });
 });
 
 function useThismodifiedPrograms(modifiedPrograms_pageId,modifiedPrograms_pageName){
	  var modifiedProgramsTextNo=document.getElementById("modifiedProgramsTextNo").value;
	  
     opener.document.getElementById("modifiedPrograms_pageId"+modifiedProgramsTextNo).value=modifiedPrograms_pageId;
     opener.document.getElementById("modifiedPrograms_pageName"+modifiedProgramsTextNo).value=modifiedPrograms_pageName;
     window.close();
  }
</script>
<body>
<h1>serachhModifiedPrograms</h1>
<form:form id="searchModifiedProgramsFrm" modelAttribute="programDto">
pageId : <input type="text" name="pageName" id="pageName"><input type="button" id="searchModifiedProgramsBtn" value="검색"><br><br>
selectedchainId : <input type="text" name="selectedchainId" id="selectedchainId" value="${selectedchainId}" readonly="readonly">
<input type="hidden" name="modifiedProgramsTextNo" id="modifiedProgramsTextNo" value="${modifiedProgramsTextNo}">
</form:form>

<table border="1" class="table table-hover">
            <tr>
               <td>프로그램Id</td>
               <td>프로그램Name</td>
               <td>선택</td>
            </tr>
         <c:choose>
         <c:when test="${not empty Programs}">
                  <c:forEach items="${Programs}" var="program">
                     <tr>
                         <td>${program.pageId}</td>
                         <td>${program.pageName}</td>
                         <td><input type="button" value="사용" onclick="useThismodifiedPrograms('${program.pageId}' , '${program.pageName}')"> <td>
                         <td><input type="hidden" id="modifiedProgramsTextNo" value="${modifiedProgramsTextNo}"></td>
                     </tr>
                  </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td>등록된 게시글이 없습니다.</td>
               </tr>
            </c:otherwise>
            </c:choose>
 </table>      
</body>
</html>