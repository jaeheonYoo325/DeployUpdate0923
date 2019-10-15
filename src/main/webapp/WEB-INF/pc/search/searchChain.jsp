<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<script src="<c:url value='/js/search/searchChain.js' />"></script>
</head>
<body>
<h1>serachChain</h1>
<form:form id="searchChainFrm" modelAttribute="chaintableDto">
chainName : <input type="text" name="chainName" id="chainName"><input type="button" id="searchBtn" value="검색"><br><br>
</form:form>

<table border="1" class="table table-hover">
            <tr>
               <td>체인번호</td>
               <td>체인이름</td>
               <td>선택</td>               
            </tr>
         <c:choose>
         <c:when test="${not empty chainTableDtoList}">
                  <c:forEach items="${chainTableDtoList}" var="chain">
                     <tr>
                         <td>${chain.chainId}</td>
                         <td>${chain.chainName}</td>
                         <td><input type="button" value="사용" onclick="useChain('${chain.chainId}','${chain.chainName}')"><td>
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