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
<script src="<c:url value='/js/search/searchProgram.js' />"></script>
</head>
<body>
<h1>serachProgram</h1>
<form:form id="searchProgramFrm" modelAttribute="programTableDto">
ProgramName : <input type="text" name="pageName" id="pageName"><input type="button" id="searchBtn" value="검색"><br><br>
paramChainId : <input type="text" name="paramChainId" id="paramChainId" value="${paramChainId}">
</form:form>

<table border="1" class="table table-hover">
            <tr>
               <td>프로그램Id</td>
               <td>프로그램Name</td>
               <td>선택</td>
            </tr>
         <c:choose>
         <c:when test="${not empty programTableDtoList}">
                  <c:forEach items="${programTableDtoList}" var="program">
                     <tr>
                         <td>${program.pageId}</td>
                         <td>${program.pageName}</td>
                         <td><input type="button" value="사용" onclick="useChain('${program.pageId}' , '${program.pageName}')"> <td>
                         <td><input type="hidden" id="no" value="${no}"></td>
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