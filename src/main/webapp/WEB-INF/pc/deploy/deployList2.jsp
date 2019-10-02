<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript">
   $(document).ready(function() {
      
       $("#updateBtn").attr({
            method:"post",                                         
              action:"/deploy/deployUpdate.do"
       }).submit();
      
    });
</script>

<script>
function deployDetail(str){
   var deployNo=str;
   window.open("/deploy/deployUpdate.do/"+deployNo,"상세보기", "width=1000, height=800");
   
}
</script>

</head>
<body>
      <h1>List</h1>
   <form:form id="listFrm" >
      <table border="1" class="table table-hover">
            <tr>
               <td>No</td>
               <td>부문</td>
               <td>작업유형</td>
               <td>요청날짜</td>
               <td>요청시간</td>
               <td>서비스요청ID</td>
               <td>작업자</td>
               <td>변경내역</td>
               <td>변경프로그램목록</td>
               <td>변경소스명</td>
               <td>요청자</td>
               <td>Deploy담당자</td>
               <td>확인(개발계)</td>
               <td>확인(테스트계)</td>
               <td>확인(운영계)</td>
               <td>구분</td>
               <td>상세보기</td>
               <td>삭제</td>
            </tr>
         <c:choose>
               <c:when test="${not empty deployDtoList}">
                  <c:forEach items="${deployDtoList}" var="deploy" varStatus="status">
                     <tr>
                        <td>${deploy.deployNo}</td>
                        <td>${deploy.chainName}(${deploy.d_chainId})</td>
                        <td>${deploy.wtype}</td>
                        <td>${deploy.reqDate}</td>
                        <td>${deploy.reqTime}</td>
                        <td>${deploy.reqServiceId}</td>
                        <td>${deploy.wEmpNo}</td>
                        <td>${deploy.wContent}</td>
                        <c:forEach begin="${status.index}" end="${status.index}" var="wPro" items="${wProgramList}">
<%--                         <td>${wPro.wPro_pageId}/${wPro.wPro_pageName }</td> --%>
							 <td>${wPro.wProNo_pageId}</td>
                        </c:forEach>
                        <td>${deploy.wSource}</td>
                        <td>${deploy.reqEmpNo}</td>
                        <td>${deploy.deployEmpNo}</td>
                        <td>${deploy.devEmpNo}</td>
                        <td>${deploy.testEmpNo}</td>
                        <td>${deploy.prdEmpNo}</td>
                        <td>${deploy.division}</td>
                        <td><input type="button" value="상세보기" onclick="deployDetail(${deploy.deployNo})"></td>
                        <td><input type="button" id="requestDeleteBtn" value="삭제" onclick="location.href='/deploy/deployDelete.do/'+ ${deploy.deployNo}"/></td>
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
   </form:form>
</body>
</html>