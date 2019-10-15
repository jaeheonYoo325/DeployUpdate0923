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
<script src="<c:url value='/js/search/searchEmp.js' />"></script>
</head>
<body>
<h1>serachEmp</h1>
<form:form id="searchEmpFrm" modelAttribute="employeeDto">
EmpName : <input type="text" name="empName" id="empName"><input type="button" id="searchBtn" value="검색"><br><br>
</form:form>

<table border="1" class="table table-hover">
            <tr>
               <td>사원번호</td>
               <td>사원이름</td>
               <td>선택</td>
            </tr>
         <c:choose>
         <c:when test="${not empty employeeDtoList}">
                  <c:forEach items="${employeeDtoList}" var="employee">
                     <tr>
                         <td>${employee.empNo}</td>
                         <td>${employee.empName}</td>
                         <td><input type="button" value="사용" onclick="useEmp(${employee.empNo},'${employee.empName}')"> <td>
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