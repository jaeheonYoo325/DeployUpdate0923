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

      var i = -1;
      $('.btnAddP').click (function () {
    	  if($("#d_chainId").val()==""){
    		  alert("부문선택필수");
    		  return;
    	  }
    	  else
    		  i=i+1;
          $('.buttonsP').append (           
			$("<input type='text' name='wProgram"+i+"'id='wProgram"+i+"' readonly='readonly'><input type='text' name='pageName"+i+"'id='pageName"+i+"' readonly='readonly'><input type='button' value='검색' onclick='searchProgram("+i+")'><br>")
          );      
          $('.removeP').on('click', function () {     	  
              $(".buttonsP").html("");
              i = -1;
          });
      });
      
      
      var j = -1;
      $('.btnAddS').click (function () {
    	  j=j+1;
          $('.buttonsS').append (           
			$("<input type='text' name='wSource"+j+"'id='wSource"+j+"' readonly='readonly'><input type='button' value='검색' onclick='searchSource("+j+")' readonly='readonly'><br>")
          );      
          $('.removeS').on('click', function () { 
              $(".buttonsS").html("");
              j = -1;
          });
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
function searchProgram(no){
	var str=document.requestFrm.d_chainId.value;
   window.open("/search/searchProgram.do?paramChainId="+str+"&no="+no,"Program검색", "width=1000, height=800");
}
function searchSource(no){
	window.open("/search/searchSource.do?no="+no,"Source검색", "width=1000, height=800");
}
</script>
</head>

<body>

<h1>request</h1>
<form:form id="requestFrm" modelAttribute="deployDto" name="requestFrm">
부문 : <input type="text" name="d_chainId" id="d_chainId" readonly="readonly">
     <input type="text" name="chainName" id="chainName" readonly="readonly">
     <input type="button" value="검색" onclick="searchChain()"><br>
작업유형 : <select name="wtype" id="wtype">
         <option value="">작업유형</option>
         <option value="정기">정기</option>
         <option value="수시">수시</option>
       </select><br>
요청날짜 : <input type="date" name="reqDate"><br>
요청시간 : <input type="time" name="reqTime"><br>
서비스요청_ID : <input type="text" name="reqServiceId" id="reqServiceId" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('req')"><br>
작업자 : <input type="text" name="wEmpNo" id="wEmpNo" readonly="readonly">
       <input type="button" value="검색" onclick="searchEmp('wEmp')"><br>
변경내역 : <input type="text" name="wContent"><br>
변경프로그램목록   : <input type="button" class="btnAddP" value="추가"><input type='button' class='removeP'id='removeP' value='전체삭제'><br>
			<div class="buttonsP">      		        
			</div>
			
변경소스명   : <input type="button" class="btnAddS" value="추가"><input type='button' class='removeS'id='removeS' value='전체삭제'><br> 	
<div class="buttonsS">     
</div>
요청자 : <input type="text" name="reqEmpNo" id="reqEmpNo" readonly="readonly">
       <input type="button" value="검색" onclick="searchEmp('reqEmp')"><br>
Deploy담당자 : <input type="text" name="deployEmpNo" id="deployEmpNo" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('deployEmp')"><br>
확인(개발계) : <input type="text" name="devEmpNo" id="devEmpNo" readonly="readonly">
            <input type="button" value="검색" onclick="searchEmp('devEmp')"><br>
확인(태스트계) : <input type="text" name="testEmpNo" id="testEmpNo" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('testEmp')"><br>
확인(운영계) :  <input type="text" name="prdEmpNo" id="prdEmpNo" readonly="readonly">
             <input type="button" value="검색" onclick="searchEmp('prdEmp')"><br>
구분 : <select name="division">
      <option value="">구분</option>
      <option value="신규">신규</option>
      <option value="변경">변경</option>
     </select><br>
<input type="hidden" name="d_status" value="요청">
<input type="button" id="requestBtn" value="요청">
</form:form>

</body>
</html>