<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width initial-scale=1">         
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script type="text/javascript">
   $(document).ready(function() {
      var str=window.location.search.slice(window.location.search.indexOf('=')+1);
      $("#searchBtn").click(function() {
         $("#searchEmpFrm").attr({
            method:"post",                                         
              action:"/search/searchEmp.do?str="+str
       }).submit();
      });
      
   });
</script>

<script>
function useEmp(empNo,empName){
   var str=window.location.search.slice(window.location.search.indexOf('=')+1);
   if(str=='req'){
      opener.document.getElementById("reqServiceId").value=empName
   }
   else if(str=='wEmp'){
      opener.document.getElementById("wEmpNo").value=empName
   }
   else if(str=='reqEmp'){
      opener.document.getElementById("reqEmpNo").value=empName
   }
   else if(str=='deployEmp'){
      opener.document.getElementById("deployEmpNo").value=empName
   }
   else if(str=='devEmp'){
      opener.document.getElementById("devEmpNo").value=empName
   }
   else if(str=='testEmp'){
      opener.document.getElementById("testEmpNo").value=empName
   }
   else if(str=='prdEmp'){
      opener.document.getElementById("prdEmpNo").value=empName
   }
   window.close();
}
</script>

<script>
function test(){
   var param=window.location.search.slice(window.location.search.indexOf('=')+1);
   alert(param);
}
</script>
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