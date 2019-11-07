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
   <title>사원등록</title>
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
   <script src="<c:url value='/js/common/common.js' />"></script>
   <script src="<c:url value='/js/employee/employeeRegist.js' />"></script>
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
</head>
<script>
   $(document).ready(function() {
      $("#sidebarToggle").on('click', function(e) {
          e.preventDefault();
          $("body").toggleClass("sidebar-toggled");
          $(".sidebar").toggleClass("toggled");
      }); 
      
	$("#programRegistBtn").click(function() {
		if(document.getElementById("chainId").value=="부문"){
			alert("부문을 선택하세요");
			return;
		}
			$("#programRegistFrm").attr({
				method:"post", 					     				     	
			    	action:"/employee/programRegist.do"
			}).submit();
	});
   });
</script>
<body id="page-top">
   <jsp:include page="/WEB-INF/pc/common/header.jsp" />
   <div id="wrapper">
      <jsp:include page="/WEB-INF/pc/common/sidebar.jsp" />
      <div id="content-wrapper">
         <div class="container-fluid">
            <div class="card mb-3">
               <div class="card-header">
                     <i class="fas fa-table"></i>
                        	프로그램등록
                 </div>
                 <div class="card-body">
                    <div class="table-responsive">
                      <form:form id="programRegistFrm" modelAttribute="programDto">
                      	<div id="errorsDiv">
							<form:errors id="errorsPageId" cssStyle="color: red;" path="pageId" />
							<form:errors id="errorsPageName" cssStyle="color: red;" path="pageName" />
                       </div>
                       <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                          <thead>
                          	<tr> 
                          		<td>프로그램번호</td>
                          		<td><input type="text" id="pageId" name="pageId" value="${programDto.pageId}"></td>
                          	</tr>
                          	<tr> 
                          		<td>프로그램이름</td>
                          		<td><input type="text" id="pageName" name="pageName" value="${programDto.pageName}"></td>
                          	</tr>
                          	<tr> 
                          		<td>관련체인</td>
                          		<td>
                          			<select name="chainId" id="chainId">
                          				<option value="부문">부문</option> 
										<c:forEach items="${chain}" varStatus="status">
											<option value="<c:out value='${chain[status.index].chainId}'></c:out>">${chain[status.index].chainName}</option>
										</c:forEach> 
									</select>			 
                          		</td>
                          	</tr>
                          </thead>
                       </table>
                       <div class="modal-footer" align="center">
                          <input type="button" id="programRegistBtn" class="btn btn-primary" value="변경프로그램등록">
                       </div>
                      </form:form>
                    </div>
                 </div>
            </div>
         </div>
      </div>
   </div>
   <jsp:include page="/WEB-INF/pc/common/footer.jsp" />
   
</body>
</html>