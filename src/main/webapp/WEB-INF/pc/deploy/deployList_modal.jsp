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
	/*window.onload = function(){
		alert('ddf');
	};*/

	$(document).ready(function() {
	//window.onload = function(){
		//alert('df2d');
		$("#requestUpdateBtn").click(function(e) {
			
			alert("진입");
			e.preventDefault();
			var seqNo = $("#seqNo").val();
			var url = "/deploy/deployUpdateAjax.do/";
			var param = {
					"seqNo" : seqNo
			};
			
			$.ajax({
				url : url,
				type : "GET",
				dataType : "json",
				data : param,
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					$("#modalBody").empty();
					console.log('aaaa');
					console.log(seqNo);
				},
				success : function(response) {
					console.log("bbbb");
					console.log(param);
					console.log(response.userDeployDto);
					
					var deployDto = response.userDeployDto;
					
					if ( deployDto != null ) {
						alert("모달열기진입");
						var modalBody = $("#modalBody");
						modalBody.append('<form:form id="updateFrm" modelAttribute="deployDto">');
						modalBody.append('부문 : ');
						modalBody.append($("<input type='text' name='field' value='"+deployDto.field+"'> <br>'"));
						modalBody.append('작업유형 : ');
						modalBody.append($("<input type='text' name='type' value='"+deployDto.type+"'> <br>'"));
						modalBody.append('요청날짜 : ');
						modalBody.append($("<input type='text' name='reqDate' value='"+deployDto.reqDate+"'> <br>'"));
						modalBody.append('요청시간 : ');
						modalBody.append($("<input type='text' name='reqTime' value='"+deployDto.reqTime+"'> <br>'"));
						modalBody.append('서비스요청_ID : ');
						modalBody.append($("<input type='text' name='reqServiceId' value='"+deployDto.reqServiceId+"'> <br>'"));
						modalBody.append('변경내역 : ');
						modalBody.append($("<input type='text' name='wContent' value='"+deployDto.wContent+"'> <br>'"));
						modalBody.append('변경프로그램목록 : ');
						modalBody.append($("<input type='text' name='wProgram' value='"+deployDto.wProgram+"'> <br>'"));
						modalBody.append('변경소스명 : ');
						modalBody.append($("<input type='text' name='wSource' value='"+deployDto.wSource+"'> <br>'"));
						modalBody.append('요청자 : ');
						modalBody.append($("<input type='text' name='req_empNo' value='"+deployDto.req_empNo+"'> <br>'"));
						modalBody.append('Deploy담당자 : ');
						modalBody.append($("<input type='text' name='deploy_empNo' value='"+deployDto.deploy_empNo+"'> <br>'"));
						modalBody.append('확인(개발계) : ');
						modalBody.append($("<input type='text' name='dev_empNo' value='"+deployDto.dev_empNo+"'> <br>'"));
						modalBody.append('확인(태스트계) : ');
						modalBody.append($("<input type='text' name='test_empNo' value='"+deployDto.test_empNo+"'> <br>'"));
						modalBody.append('확인(운영계) : ');
						modalBody.append($("<input type='text' name='prd_empNo' value='"+deployDto.prd_empNo+"'> <br>'"));
						modalBody.append('구분 : ');
						modalBody.append($("<input type='text' name='division' value='"+deployDto.division+"'> <br>'"));

						modalBody.append('</form:form>');
						
						$("#updateModalPopup").modal("show");
					} 
				}
			});
		});
		
		 $("#updateBtn").attr({
				method:"post", 					     				     	
		     	action:"/deploy/deployUpdate.do"
		 }).submit();
		
	});
</script>
</head>
<body>
	   <h1>List</h1>
   <form:form id="listFrm" >
      <table border="1" class="table table-hover">
      	<thead>
	         <tr>
	            <td>SEQ</td>
	            <td>부문</td>
	            <td>작업유형</td>
	            <td>요청날짜</td>
	            <td>요청시간</td>
	            <td>서비스요청ID</td>
	            <td>변경내역</td>
	            <td>변경프로그램목록</td>
	            <td>변경소스명</td>
	            <td>요청자</td>
	            <td>Deploy담당자</td>
	            <td>확인(개발계)</td>
	            <td>확인(테스트계)</td>
	            <td>확인(운영계)</td>
	            <td>구분</td>
	            <td>수정</td>
	            <td>삭제</td>
	            <td></td>
	         </tr>
		</thead>
		<tbody>
			<c:choose>
	            <c:when test="${not empty deployDtoList}">
	               <c:forEach items="${deployDtoList}" var="deploy">
	                  <tr>
	                  	 <td>${deploy.seqNo}</td>
	                     <td>${deploy.field}</td>
	                     <td>${deploy.type}</td>
	                     <td>${deploy.reqDate}</td>
	                     <td>${deploy.reqTime}</td>
	                     <td>${deploy.reqServiceId}</td>
	                     <td>${deploy.wContent}</td>
	                     <td>${deploy.wProgram}</td>
	                     <td>${deploy.wSource}</td>
	                     <td>${deploy.req_empNo}</td>
	                     <td>${deploy.deploy_empNo}</td>
	                     <td>${deploy.dev_empNo}</td>
	                     <td>${deploy.test_empNo}</td>
	                     <td>${deploy.prd_empNo}</td>
	                     <td>${deploy.division}</td>
	                     <!-- <td><input type="button" class="btn btn-default" id="requestUpdateBtn" value="수정"></td> -->	                
	                     <td><a class="btn btn-default" id="requestUpdateBtn">수정</a></td>
	                     <%-- <td><input type="button" id="requestUpdateBtn" value="수정" onclick="location.href='/deploy/deployUpdate.do/'+ ${deploy.seqNo}"/></td> --%>
	                     <td><input type="button" id="requestDeleteBtn${deploy.seqNo }" value="삭제" onclick="location.href='/deploy/deployDelete.do/'+ ${deploy.seqNo}"/></td>
	                     <td><input type="hidden" id="seqNo" value="${deploy.seqNo}"></td>
	                  </tr>
	               </c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td>등록된 게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
	         </c:choose>
         </tbody>
      </table>
   </form:form>
	<div class="modal fade" id="updateModalPopup">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">Modal title</h4>
				</div>
				<div class="modal-body" id="modalBody">
					<p>One fine body&hellip;</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
</html>