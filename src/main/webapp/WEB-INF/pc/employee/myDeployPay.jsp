<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />">
<script>
$(document).ready(function() {
   $("#MyDeployDoingPayBtn").click(function() {
      $("#MyDeployPayFrm").attr({
         method:"post",                                         
           action:"/employee/MyDeployDoingPay.do"
      }).submit();
      });
   
   $("#MyDeployDoingReturnBtn").click(function() {
      $("#MyDeployPayFrm").attr({
         method:"post",                                         
           action:"/employee/MyDeployDoingReturn.do"
      }).submit();
      });
});

   
function showMyDeployPayDetail(thisDeployNo){
   var deployNo=thisDeployNo;
   window.open("/employee/showMyDeployPayDetail.do/"+deployNo,"상세보기", "width=1000, height=800");
}

</script>
<body>
<h1>MyDeployPay</h1>



<table border="1">
<tr>
<td>DeployNo</td>
<td>기안자</td>
<td>기안일</td>
<td>결제내용</td>
<td>결제권한</td>
<td>결제요청일</td>
<td>결제/반려일</td>
<td>상세내역</td>
<!-- <td>결제하기</td> -->
<!-- <td>반려하기</td> -->
</tr>


<c:choose>
<c:when test="${not empty deployPay}">
<c:forEach items="${deployPay}" var="deployPay">

   <tr>
   <form:form id="MyDeployPayFrm" modelAttribute="deployPayDto" name="MyDeployPayFrm">
      <td><input type="text" name="deployNo" value="${deployPay.deployNo}" readonly="readonly"></td>
      <td><input type="text" name="employeeName" value="${deployPay.employeeName}" readonly="readonly"><input type="hidden" name="deployDrafter" value="${deployPay.deployDrafter}"></td>
      <td><input type="text" name="deployDraftDate" value="${deployPay.deployDraftDate}" readonly="readonly"></td>
      <td>NEED</td>
      <td><input type="text" name="deployPayer" value="${deployPay.deployPayer}" readonly="readonly"></td>
      <td><input type="text" name="deployPayRequestDate" value="${deployPay.deployPayRequestDate}" readonly="readonly"></td>
      <td><input type="text" name="deployPayDate" value="${deployPay.deployPayDate}" readonly="readonly"></td>
      <td><input type="button" value="상세보기" onclick="showMyDeployPayDetail(${deployPay.deployNo})"></td>
<!--       <td><input type="button" id="MyDeployDoingPayBtn" name="MyDeployDoingPayBtn" value="결제하기"></td> -->
<!--       <td><input type="button" id="MyDeployDoingReturnBtn" name="MyDeployDoingReturnBtn" value="반려하기"></td> -->
   </form:form>
      
   </tr>

</c:forEach>

</c:when>
<c:otherwise>
<tr>
<td>결제할 문서가없습니다</td>
</tr>
</c:otherwise>
</c:choose>


</table>


</body>
</html>