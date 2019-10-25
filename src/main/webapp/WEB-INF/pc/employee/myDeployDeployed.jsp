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
<h1>MyDeployDeployed</h1>


<table border="1">
<tr>
<td>DeployNo</td>
<td>기안자</td>
<td>기안일</td>
<td>결제내용</td>
<td>결제요청일</td>
<td>결제라인</td>
<td>결제일</td>
<td>결제확인(결제라인)</td>
<td>상세내역</td>
</tr>


<c:choose>
<c:when test="${not empty deployDeployed}">
<c:forEach items="${deployDeployed}" var="deployDeployed">

   <tr>
      <td><input type="text" name="deployNo" value="${deployDeployed.deployNo}" readonly="readonly"></td>
      <td><input type="text" name="employeeName" value="${deployDeployed.deployDrafterName}" readonly="readonly"><input type="hidden" name="deployDrafter" value="${deployDeployed.deployDrafter}"></td>
      <td><input type="text" name="deployDraftDate" value="${deployDeployed.deployDraftDate}" readonly="readonly"></td>
      <td><input type="text" name="codeName" value="${deployPaid.codeName}" readonly="readonly"><input type="hidden" name="deployPayDescription" value="${deployDeployed.deployPayDescription}"></td>
      <td><input type="text" name="deployPayRequestDate" value="${deployDeployed.deployPayRequestDate}" readonly="readonly"></td>
      <td><input type="text" name="deployPayLineName" value="${deployDeployed.deployPayLineName}" readonly="readonly"><input type="hidden" name="deployPayLine" value="${deployDeployed.deployPayLine}"></td>
      <td><input type="text" name="deployPayDate" value="${deployDeployed.deployPayDate}" readonly="readonly"></td>
      <td><input type="text" name="deployPayLineConfirmName" value="${deployDeployed.deployPayLineConfirmName}" readonly="readonly"><input type="hidden" name="deployPayLineConfirm" value="${deployDeployed.deployPayLineConfirm}"></td>
      <td><input type="button" value="상세내역" onclick="showPayDetail(${deployDeployed.deployNo},'myDeploy')"></td>
   </tr>
</c:forEach>

</c:when>
<c:otherwise>
<tr>
<td>배포한 내역이 없습니다</td>
</tr>
</c:otherwise>
</c:choose>


</table>


</body>
</html>