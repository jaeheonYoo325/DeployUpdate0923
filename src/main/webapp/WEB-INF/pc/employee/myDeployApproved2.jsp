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
<h1>MyDeployApproved</h1>


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
<c:when test="${not empty deployApproved}">
<c:forEach items="${deployApproved}" var="deployApproved">

   <tr>
      <td><input type="text" name="deployNo" value="${deployApproved.deployNo}" readonly="readonly"></td>
      <td><input type="text" name="deployDrafterName" value="${deployApproved.deployDrafterName}" readonly="readonly"><input type="hidden" name="deployDrafter" value="${deployApproved.deployDrafter}"></td>
      <td><input type="text" name="deployDraftDate" value="${deployApproved.deployDraftDate}" readonly="readonly"></td>
      <td><input type="text" name="codeName" value="${deployApproved.codeName}" readonly="readonly"><input type="hidden" name="deployApprovalDescription" value="${deployApproved.deployApprovalDescription}"></td>
      <td><input type="text" name="deployApprovalRequestDate" value="${deployApproved.deployApprovalRequestDate}" readonly="readonly"></td>
      <td><input type="text" name="deployApprovalLineName" value="${deployApproved.deployApprovalLineName}" readonly="readonly"><input type="hidden" name="deployApprovalLine" value="${deployApproved.deployApprovalLine}" readonly="readonly"></td>
      <td><input type="text" name="deployApprovalDate" value="${deployApproved.deployApprovalDate}" readonly="readonly"></td>
      <td><input type="text" name="deployApprovalLineConfirmName" value="${deployApproved.deployApprovalLineConfirmName}" readonly="readonly"><input type="hidden" name="deployApprovalLineConfirm" value="${deployApproved.deployApprovalLineConfirm}" readonly="readonly"></td>
      <td><input type="button" value="상세내역" onclick="showApprovalDetail(${deployApproved.deployNo},'myDeploy')"></td>
   </tr>
</c:forEach>

</c:when>
<c:otherwise>
<tr>
<td>결제한 내역이 없습니다</td>
</tr>
</c:otherwise>
</c:choose>


</table>


</body>
</html>