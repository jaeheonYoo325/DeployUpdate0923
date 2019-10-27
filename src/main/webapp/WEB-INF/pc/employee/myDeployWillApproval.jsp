<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">	
	<title>결재선 페이지</title>
	<!-- Custom fonts for this template-->
	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/vendor/fontawesome-free/css/all.min.css' />">
  	<!-- Custom styles for this template-->
  	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/css/sb-admin.css' />">
  	<!-- Page level plugin CSS-->
  	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/vendor/datatables/dataTables.bootstrap4.css' />">
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery/jquery.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery-easing/jquery.easing.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/js/sb-admin.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/datatables/jquery.dataTables.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/datatables/dataTables.bootstrap4.js' />"></script>
</head>

<%-- <script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script> --%>
<%-- <script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script> --%>
<%-- <link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />"> --%>
<script> 
	$(document).ready(function() {
		$("#sidebarToggle").on('click', function(e) {
		    e.preventDefault();
		    $("body").toggleClass("sidebar-toggled");
		    $(".sidebar").toggleClass("toggled");
		});	
	});
	
	function showApprovalDetail(thisDeployNo,deployApprovalDetailCode){
	   var deployNo=thisDeployNo;
	   window.open("/employee/showDeployApprovalDetail.do/"+deployNo+"/"+deployApprovalDetailCode,"상세보기", "width=1000, height=800");
	}

</script>
<body id="page-top">
	<jsp:include page="/WEB-INF/pc/common/header.jsp" />
	<div id="wrapper">
		<jsp:include page="/WEB-INF/pc/common/sidebar.jsp" />
		<div id="content-wrapper">
			<div class="container-fluid">
				<!-- Breadcrumbs-->
		        <ol class="breadcrumb">
		          <li class="breadcrumb-item">
		            <a href="#">Dashboard</a>
		          </li>
		          <li class="breadcrumb-item active">Overview</li>
		        </ol>
				<div class="card mb-3">
					<div class="card-header">
			            <i class="fas fa-table"></i>
			            	결재선
			        </div>
			        <div class="card-body">
			        	<div class="table-responsive">
			        		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			        			<thead>
			        				<tr>
										<td>DeployNo</td>
										<td>기안자</td>
										<td>기안일</td>
										<td>결제내용</td>
										<td>결제요청일</td>
										<td>결제라인</td>
										<td>상세내역</td>
									</tr>
			        			</thead>
			        			<tbody>
			        				<c:choose>
										<c:when test="${not empty deployApproval}">
											<c:forEach items="${deployApproval}" var="deployApproval">
												<tr>													
													<td>${deployApproval.deployNo}</td>
													<td>${deployApproval.deployDrafterName}</td>
													<td>${deployApproval.deployDraftDate}</td>
													<td>${deployApproval.codeName}</td>
													<td>${deployApproval.deployApprovalRequestDate}</td>
													<td>${deployApproval.deployApprovalLineName}</td>
													<td><input type="button" value="상세내역" class="btn btn-primary" onclick="showApprovalDetail(${deployApproval.deployNo},'myDeployApprovalDetail')"></td>													  													
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="7">결제할 내역이 없습니다</td>
											</tr>
										</c:otherwise>
									</c:choose>
			        			</tbody>
			        		</table>
			        	</div>
			        </div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/pc/common/footer.jsp" />
</body>
</html>