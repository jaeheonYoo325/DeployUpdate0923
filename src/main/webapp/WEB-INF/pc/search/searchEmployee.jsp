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
<%-- <script src="<c:url value='/js/search/searchEmployee.js' />"></script> --%>
</head>
<script>
$(document).ready(function() {
    var employeeSearchWhere=window.location.search.slice(window.location.search.indexOf('=')+1);
    $("#searchEmployeeBtn").click(function() {
       $("#searchEmpFrm").attr({
          method:"post",                                         
            action:"/search/searchEmployee.do?employeeSearchWhere="+employeeSearchWhere
     }).submit();
    });
 });
 
 function useThisEmployee(employeeNo,employeeName){
	   var employeeSearchWhere=window.location.search.slice(window.location.search.indexOf('=')+1);
	   if(employeeSearchWhere=='serviceRequestId'){
	      opener.document.getElementById("serviceRequestId").value=employeeName
	   }
	   else if(employeeSearchWhere=='worker'){
	      opener.document.getElementById("worker").value=employeeName
	   }
	   else if(employeeSearchWhere=='requester'){
	      opener.document.getElementById("requesterName").value=employeeName
	      opener.document.getElementById("requester").value=employeeNo
	   }
	   else if(employeeSearchWhere=='deployer'){
	      opener.document.getElementById("deployer").value=employeeName
	   }
	   else if(employeeSearchWhere=='developConfirmer'){
	      opener.document.getElementById("developConfirmer").value=employeeName
	   }
	   else if(employeeSearchWhere=='testConfirmer'){
	      opener.document.getElementById("testConfirmer").value=employeeName
	   }
	   else if(employeeSearchWhere=='productionConfirmer'){
	      opener.document.getElementById("productionConfirmer").value=employeeName
	   }
	   window.close();
	}
</script>
<body>
<h1>serachEmp</h1>
<form:form id="searchEmpFrm" modelAttribute="employeeDto">
EmployeeName : <input type="text" name="employeeName" id="employeeName"><input type="button" id="searchEmployeeBtn" value="검색"><br><br>
</form:form>

<table border="1" class="table table-hover">
            <tr>
               <td>사원번호</td>
               <td>사원이름</td>
               <td>선택</td>
            </tr>
         <c:choose>
         <c:when test="${not empty searchEmployees}">
                  <c:forEach items="${searchEmployees}" var="employee">
                     <tr>
                         <td>${employee.employeeNo}</td>
                         <td>${employee.employeeName}</td>
                         <td><input type="button" value="사용" onclick="useThisEmployee(${employee.employeeNo},'${employee.employeeName}')"> <td>
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