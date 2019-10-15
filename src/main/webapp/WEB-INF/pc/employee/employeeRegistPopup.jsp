<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 등록 팝업창</title>
<jsp:include page="/WEB-INF/pc/CommonScript/commonScript.jsp"/>
<script src="<c:url value='/js/common/common.js' />"></script>
<script src="<c:url value='/js/employee/employeeRegist.js' />"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<form:form id="employeeRegistFrm" modelAttribute="employeeDto">
	      <div class="modal-body">        
				사원번호 : <input type="text" id="empNo" name="empNo" placeholder="사원번호"> <br>
				비밀번호 : <input type="text" id="empPw" name="empPw" placeholder="비밀번호"> <br>
				사원이름 : <input type="text" id="empName" name="empName" placeholder="사원이름"> <br>
				전화번호 : <input type="text" id="empPh" name="empPh" placeholder="전화번호"> <br>
				우편번호 : <input type="text" id="empPc" name="empPc" placeholder="우편번호" /><input type="button" id="addressBtn" name="addressBtn" value="우편번호 찾기" /> <br>
				주소 : <input type="text" id="empCad" name="empCad" placeholder="주소" /> <br>
				상세주소 : <input type="text" id="empDad" name="empDad" placeholder="상세주소" /> <br>
				회사 전화번호 : <input type="text" id="empCph" name="empCph" placeholder="전화번호" /> <br>
				이메일 : <input type="text" id="empEmail" name="empEmail" placeholder="이메일" /> <br>
				입사일 : <input type="date" id="empJoinDate" name="empJoinDate" placeholder="입사일" /> <br>
				부서 : <input type="text" id="depNo" name="depNo" placeholder="부서번호" /><input type="text" id="depName" name="depName" placeholder="부서명" /> <!-- <input type="button" id="searchDepartmentBtn" class="form-control" value="부서 조회"/><br> -->
					 <input type="button" value="부서 조회" id="searchDepartmentPopupBtn"><br>
				<!-- 직급번호 : <input type="text" id="positionNo" name="positionNo" placeholder="직급번호" /> <br> -->
				직급번호 : <select name="positionNo" id="positionNo">
							<option value="1">사원</option>
							<option value="2">대리</option>
							<option value="3">과장</option>
							<option value="4">차장</option>
							<option value="5">부장</option>
						</select>		
	      </div>
	      <div>
	      	<input type="button" id="employeeRegistBtn" class="btn btn-primary" value="사원등록">
	      </div>
	</form:form>
</body>
</html>