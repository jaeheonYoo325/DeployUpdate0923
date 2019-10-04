<%@page import="com.springproject.wprogramtable.dto.WProgramTableDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.springproject.deploy.dto.DeployDto"%>
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

<script>
$(document).ready(function(){
	  $("#wtpye").each(function(){
	    if($(this).val()==${deployDto.wtype}){
	      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
	    }
	  });
	});
</script>

<script>
function searchEmp(str){
   window.open("/search/searchEmp.do?str="+str,"Employee검색", "width=1000, height=800");
}
function searchChain(){
   window.open("/search/searchChain.do","Chain검색", "width=1000, height=800");
}
function searchProgram(){
	var str=document.updateFrm.d_chainId.value;
   window.open("/search/searchProgram.do?paramChainId="+str,"Program검색", "width=1000, height=800");
}
function searchSeq(){
   window.open("/search/searchSeq.do","Seq검색", "width=1000, height=800");
}
</script>
</head>
<%DeployDto deployDto=(DeployDto)request.getAttribute("deployDto");
ArrayList<WProgramTableDto> wPro=(ArrayList<WProgramTableDto>)request.getAttribute("wProgramTableDtoList");
%>

<h1>수정페이지</h1>
<form:form id="updateFrm" modelAttribute="deployDto">
No : <input type="text" name="deployNo" id="deployNo" value="${deployDto.deployNo}" readonly="readonly"><br>
부문 :  <input type="text" name="d_chainId" id="d_chainId" value="${deployDto.d_chainId}" readonly="readonly">
	  <input type="text" name="chainName" id="chainName" value="${deployDto.chainName}" readonly="readonly">
	  <input type="button" value="검색" onclick="searchChain()"><br>
작업유형 : <select name="wtype" id="wtype">
         <option value="">작업유형</option>
         <option value="정기" <%if(deployDto.getWtype().equals("정기")){%>selected="selected"<%}%> >정기</option>
         <option value="수시" <%if(deployDto.getWtype().equals("수시")){%>selected="selected"<%}%> >수시</option>
       </select><br>
요청날짜 : <input type="date" name="reqDate" value="${deployDto.reqDate}"><br>
요청시간 : <input type="time" name="reqTime" value="${deployDto.reqTime}"><br>
서비스요청_ID : <input type="text" name="reqServiceId" id="reqServiceId" value="${deployDto.reqServiceId}" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('req')"><br>
작업자 : <input type="text" name="wEmpNo" id="wEmpNo" value="${deployDto.wEmpNo}" readonly="readonly">
       <input type="button" value="검색" onclick="searchEmp('wEmp')"><br>
변경내역 : <input type="text" name="wContent" value="${deployDto.wContent}"><br>
<!-- 변경프로그램목록 : <br> -->
<!-- 			 <textarea name="wProgram" id="wProgram" rows="10" readonly="readonly"> -->
<%-- 				 <c:forEach items="${wProgramTableDtoList}" var="wPro">${wPro.wProNo_pageId}</c:forEach> --%>
<!-- 			 </textarea> -->

<!-- 			 <textarea name="pageName" id="pageName" rows="10" cols="40" readonly="readonly"> -->
<%-- 			 	<c:forEach items="${wProgramTableDtoList}" var="wPro">${wPro.wProNo_pageName}</c:forEach> --%>
<!-- 			 </textarea> -->
<!--              <input type="button" value="검색" onclick="searchProgram()"><br> -->
변경소스명 : <input type="text" name="wSource" value="${deployDto.wSource}"><br>
요청자 : <input type="text" name="reqEmpNo" id="reqEmpNo" value="${deployDto.reqEmpNo}" readonly="readonly">
      <input type="button" value="검색" onclick="searchEmp('reqEmp')"><br>
Deploy담당자 : <input type="text" name="deployEmpNo" id="deployEmpNo" value="${deployDto.deployEmpNo}" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('deployEmp')"><br>
확인(개발계) : <input type="text" name="devEmpNo" id="devEmpNo" value="${deployDto.devEmpNo}" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('devEmp')"><br>
확인(태스트계) : <input type="text" name="testEmpNo" id="testEmpNo" value="${deployDto.testEmpNo}" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('testEmp')"><br>
확인(운영계) : <input type="text" name="prdEmpNo" id="prdEmpNo" value="${deployDto.prdEmpNo}" readonly="readonly">
            <input type="button" value="검색" onclick="searchEmp('prdEmp')"><br>
구분 : <select name="division">
      <option value="">구분</option>
      <option value="신규" <%if(deployDto.getWtype().equals("신규")){%>selected="selected"<%}%> >신규</option>
      <option value="변경" <%if(deployDto.getWtype().equals("변경")){%>selected="selected"<%}%> >변경</option>
     </select><br>
<input type="button" id="updateBtn" value="수정">
<td><input type="button" id="requestDeleteBtn" value="삭제" onclick="location.href='/deploy/deployDelete.do/'+${deployDto.deployNo}"/></td>
</form:form>

</body>
</html>