<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 조회 팝업창</title>
<meta name="viewport" content="width=device-width initial-scale=1">         
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script type="text/javascript">
   $(document).ready(function() {
      
      $("#searchBtn").click(function() {
         $("#searchDepartmentFrm").attr({
            method:"post",                                         
            action:"/search/searchDepartmentPopup.do"
       }).submit();
      });
      
   });
</script>

<script>
function useDepartment(depNo,depName){
   console.log(depNo);
   console.log(depName);
   opener.document.getElementById("depNo").value=depNo
   opener.document.getElementById("depName").value=depName
   window.close();
}
</script>
</head>
<body>
<h1>부서 조회</h1>

<form:form id="searchDepartmentFrm" modelAttribute="departmentDto">
부서명 : <input type="text" name="depName" id="depName"><input type="button" id="searchBtn" value="검색"><br><br>
</form:form>

<table border="1" class="table table-hover">
            <tr>
               <td>부서번호</td>
               <td>부서이름</td>
               <td>선택</td>
            </tr>
         <c:choose>
         <c:when test="${not empty departmentDtoList}">
                  <c:forEach items="${departmentDtoList}" var="department">
                     <tr>
                         <td>${department.depNo}</td>
                         <td>${department.depName}</td>
                         <td><input type="button" value="사용" onclick="useDepartment('${department.depNo}','${department.depName}')"> <td>
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