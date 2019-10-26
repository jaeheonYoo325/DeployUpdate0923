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
function showApprovalDetail(thisDeployNo,deployApprovalDetailCode){
   var deployNo=thisDeployNo;
   window.open("/employee/showDeployApprovalDetail.do/"+deployNo+"/"+deployApprovalDetailCode,"상세보기", "width=1000, height=800");
}

</script>
<body>
<h1>MyDeployApproval</h1>



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
<c:when test="${not empty deployApproval}">
<c:forEach items="${deployApproval}" var="deployApproval">

   <tr>
      <td><input type="text" name="deployNo" value="${deployApproval.deployNo}" readonly="readonly"></td>
      <td><input type="text" name="deployDrafterName" value="${deployApproval.deployDrafterName}" readonly="readonly"><input type="hidden" name="deployDrafter" value="${deployApproval.deployDrafter}"></td>
      <td><input type="text" name="deployDraftDate" value="${deployApproval.deployDraftDate}" readonly="readonly"></td>
      <td><input type="text" name="codeName" value="${deployApproval.codeName}" readonly="readonly"><input type="hidden" name="deployApprovalDescription" value="${deployApproval.deployApprovalDescription}"></td>
      <td><input type="text" name="deployApprovalRequestDate" value="${deployApproval.deployApprovalRequestDate}" readonly="readonly"></td>
      <td><input type="text" name="deployApprovalLineName" value="${deployApproval.deployApprovalLineName}" readonly="readonly"><input type="hidden" name="deployApprovalLine" value="${deployApproval.deployApprovalLine}"></td>
      <td><input type="button" value="상세내역" onclick="showApprovalDetail(${deployApproval.deployNo},'myDeployApprovalDetail')"></td>
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