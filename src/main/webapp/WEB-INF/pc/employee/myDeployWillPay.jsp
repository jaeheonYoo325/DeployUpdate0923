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
function showPayDetail(thisDeployNo,deployPayDetailCode){
   var deployNo=thisDeployNo;
   window.open("/employee/showDeployPayDetail.do/"+deployNo+"/"+deployPayDetailCode,"상세보기", "width=1000, height=800");
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
<td>결제요청일</td>
<td>결제라인</td>
<td>상세내역</td>
</tr>


<c:choose>
<c:when test="${not empty deployPay}">
<c:forEach items="${deployPay}" var="deployPay">

   <tr>
      <td><input type="text" name="deployNo" value="${deployPay.deployNo}" readonly="readonly"></td>
      <td><input type="text" name="deployDrafterName" value="${deployPay.deployDrafterName}" readonly="readonly"><input type="hidden" name="deployDrafter" value="${deployPay.deployDrafter}"></td>
      <td><input type="text" name="deployDraftDate" value="${deployPay.deployDraftDate}" readonly="readonly"></td>
      <td><input type="text" name="codeName" value="${deployPay.codeName}" readonly="readonly"><input type="hidden" name="deployPayDescription" value="${deployPay.deployPayDescription}"></td>
      <td><input type="text" name="deployPayRequestDate" value="${deployPay.deployPayRequestDate}" readonly="readonly"></td>
      <td><input type="text" name="deployPayLineName" value="${deployPay.deployPayLineName}" readonly="readonly"><input type="hidden" name="deployPayLine" value="${deployPay.deployPayLine}"></td>
      <td><input type="button" value="상세내역" onclick="showPayDetail(${deployPay.deployNo},'myDeployPayDetail')"></td>
   </tr>
</c:forEach>

</c:when>
<c:otherwise>
<tr>
<td>결제할 내역이 없습니다</td>
</tr>
</c:otherwise>
</c:choose>


</table>


</body>
</html>