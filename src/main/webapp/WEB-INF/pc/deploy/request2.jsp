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
      $("#requestBtn").click(function() {
       $("#requestFrm").attr({
            method:"post",                                         
              action:"/deploy/request.do"
       }).submit();
      });
      
   });
</script>

<script>
function searchEmp(str){
   window.open("/search/searchEmp.do?str="+str,"Employee검색", "width=1000, height=800");
}
</script>
</head>

<body>

request 페이지 입니다.
<form:form id="requestFrm" modelAttribute="deployDto">
seqNo : <input type="text" name="seqNo"><br>
부문 : <input type="text" name="chainID"><br>
작업유형 : <select name="wtype">
         <option value="">작업유형</option>
         <option value="">정기</option>
         <option value="">수시</option>
       </select><br>
요청날짜 : <input type="date" name="reqDate"><br>
요청시간 : <input type="time" name="reqTime"><br>
서비스요청_ID : <input type="text" name="reqServiceName" id="reqServiceName" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('req')"><br>
작업자 : <input type="text" name="wEmpName" id="wEmpName" readonly="readonly">
       <input type="button" value="검색" onclick="searchEmp('wEmp')"><br>
변경내역 : <input type="text" name="wContent"><br>
변경프로그램목록 : <input type="text" name="wProgram"><br>
변경소스명 : <input type="text" name="wSource"><br>
요청자 : <input type="text" name="reqEmpNmae" id="reqEmpName" readonly="readonly">
       <input type="button" value="검색" onclick="searchEmp('reqEmp')"><br>
Deploy담당자 : <input type="text" name="deployEmpName" id="deployEmpName" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('deployEmp')"><br>
확인(개발계) : <input type="text" name="devEmpName" id="devEmpName" readonly="readonly">
            <input type="button" value="검색" onclick="searchEmp('devEmp')"><br>
확인(태스트계) : <input type="text" name="testEmpName" id="testEmpName" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('testEmp')"><br>
확인(운영계) :  <input type="text" name="prdEmpName" id="prdEmpName" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('prdEmp')"><br>
구분 : <select name="division">
      <option value="">구분</option>
      <option value="">신규</option>
      <option value="">변경</option>
     </select><br>
<input type="button" id="requestBtn" value="요청">
</form:form>

</body>
</html>