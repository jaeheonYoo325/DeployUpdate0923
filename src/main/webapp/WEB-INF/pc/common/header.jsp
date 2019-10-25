<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>    

<nav class="navbar navbar-default">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<c:url value='/main/main.do' />">메인화면</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">				
			<li><a href="<c:url value='/deploy/deployRequest.do' />">요청</a></li>
			<li><a href="<c:url value='/deploy/deployList.do' />">배포 리스트</a></li>				
			<li><a href="<c:url value='/employee/myDeployWillPay.do' />">결제할거</a></li>
			<li><a href="<c:url value='/employee/myDeployPaid.do' />">결제한거</a></li>
			<li><a href="<c:url value='/employee/myDeployWillDeploy.do' />">배포할거</a></li>
			<li><a href="<c:url value='/employee/myDeployDeployed.do' />">배포한거</a></li>
			<li><a href="<c:url value='/employee/employeeRegist.do' />">직원등록(관리자)</a></li>
			<li><a href="<c:url value='/employee/myDeployReturned.do' />">반려함</a></li>
			<li><a href="<c:url value='/employee/myDeployCompleted.do' />">완료함</a></li>
		</ul>

		<c:choose>
			<c:when test="${not empty sessionScope._USER_}">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">${sessionScope._USER_.employeeName}님</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
							aria-haspopup="true" aria-expanded="false">접속중<span class="caret"></span></a>
						<ul class="dropdown-menu">						
<%-- 							<li><a href="<c:url value='/employeer/employeeUpdate.do' />">비밀번호 변경</a></li>											 --%>
							<li><a href="<c:url value='/employee/employeeLogout.do' />">로그아웃</a></li>
						</ul>
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
							aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/employee/employeeLogin.do' />">로그인</a></li>																						
						</ul>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>				
	</div>
</nav>