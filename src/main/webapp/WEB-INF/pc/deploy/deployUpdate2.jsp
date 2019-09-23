<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#updateBtn").click(function() {
       $("#updateFrm").attr({
            method:"post",                                         
              action:"/deploy/deployUpdate.do"
       }).submit();
      });
      
   });
</script>
</head>

<body>

수정 페이지 입니다.
<form:form id="updateFrm" modelAttribute="deployDto">
No : <input type="text" name="deployNo" id="deployNo" value="${deployDto.deployNo}"><br>
seqNo : <input type="text" name="seqNo" value="${deployDto.seqNo}"><br>
부문 : <input type="text" name="chainName" value="${deployDto.chainName}"><br>
작업유형 : <input type="text" name="wtype" value="${deployDto.wtype}"><br>
요청날짜 : <input type="date" name="reqDate" value="${deployDto.reqDate}"><br>
요청시간 : <input type="time" name="reqTime" value="${deployDto.reqTime}"><br>
작업자 : <input type="text" name="wEmpNo" value="${deployDto.wEmpNo}"><br>
서비스요청_ID : <input type="text" name="reqServiceId" value="${deployDto.reqServiceId}"><br>
변경내역 : <input type="text" name="wContent" value="${deployDto.wContent}"><br>
변경프로그램목록 : <input type="text" name="pageId" value="${deployDto.wProgram}"><br>
변경소스명 : <input type="text" name="wSource" value="${deployDto.wSource}"><br>
요청자 : <input type="text" name="reqEmpNo" value="${deployDto.reqEmpNo}"><br>
Deploy담당자 : <input type="text" name="deployEmpNo" value="${deployDto.deployEmpNo}"><br>
확인(개발계) : <input type="text" name="devEmpNo" value="${deployDto.devEmpNo}"><br>
확인(태스트계) : <input type="text" name="testEmpNo" value="${deployDto.testEmpNo}"><br>
확인(운영계) : <input type="text" name="prdEmpNo" value="${deployDto.prdEmpNo}"><br>
구분 : <input type="text" name="division" value="${deployDto.division}"><br>
<input type="button" id="updateBtn" value="수정">
</form:form>

</body>
</html>