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
<h1>MyDeployWillDeploy</h1>



<table border="1">
<tr>
<td>DeployNo</td>
<td>기안자</td>
<td>기안일</td>
<td>결제내용</td>
<td>결제요청일</td>
<td>배포권한자</td>
<td>상세내역</td>
</tr>


<c:choose>
<c:when test="${not empty deployWillDeploy}">
<c:forEach items="${deployWillDeploy}" var="deployWillDeploy">
   <tr>
      <td><input type="text" name="deployNo" value="${deployWillDeploy.deployNo}" readonly="readonly"></td>
      <td><input type="text" name="deployDrafterName" value="${deployWillDeploy.deployDrafterName}" readonly="readonly"><input type="hidden" name="deployDrafter" value="${deployWillDeploy.deployDrafter}"></td>
      <td><input type="text" name="deployDraftDate" value="${deployWillDeploy.deployDraftDate}" readonly="readonly"></td>
      <td><input type="text" name="codeName" value="${deployWillDeploy.codeName}" readonly="readonly"><input type="hidden" name="deployPayDescription" value="${deployWillDeploy.deployPayDescription}"></td>
      <td><input type="text" name="deployPayRequestDate" value="${deployWillDeploy.deployPayRequestDate}" readonly="readonly"></td>
      <td><input type="text" name="deployPayLineName" value="${deployWillDeploy.deployPayLineName}" readonly="readonly"><input type="hidden" name="deployPayLine" value="${deployWillDeploy.deployPayLine}" readonly="readonly"></td>
      <td><input type="button" value="상세내역" onclick="showPayDetail(${deployWillDeploy.deployNo},'myDeployWillDeploy')"></td>
   </tr>
</c:forEach>

</c:when>
<c:otherwise>
<tr>
<td>배포할 내역이 없습니다</td>
</tr>
</c:otherwise>
</c:choose>


</table>


</body>
</html>