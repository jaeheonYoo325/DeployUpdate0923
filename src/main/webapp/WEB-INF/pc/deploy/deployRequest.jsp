<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">	
	<title>배포요청</title>
	<!-- Custom fonts for this template-->
	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/vendor/fontawesome-free/css/all.min.css' />">
  	<!-- Custom styles for this template-->
  	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/css/sb-admin.css' />">
  	<!-- Page level plugin CSS-->
  	<link rel="stylesheet" href="<c:url value='/bootstrapUiTemplate/vendor/datatables/dataTables.bootstrap4.css' />">
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery/jquery.min.js' />"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/jquery-easing/jquery.easing.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/js/sb-admin.min.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/datatables/jquery.dataTables.js' />"></script>
	<script src="<c:url value='/bootstrapUiTemplate/vendor/datatables/dataTables.bootstrap4.js' />"></script>
	<script src="<c:url value='/js/common/jquery.bpopup.min.js' />"></script>
	<style type="text/css">
		#popupLayer {display:none;border:5px solid #cccccc;margin:0;padding:5px;background-color:#ffffff;z-index:5;}
        #popupLayer .b-close {position:absolute;top:10px;right:25px;color:#f37a20;font-weight:bold;cursor:hand;}
        #popupLayer .popupContent {margin:0;padding:0;text-align:center;border:0;}
		#popupLayer .popupContent iframe {width:1000px;height:800px;border:0;padding:0px;margin:0;z-index:10;}
	</style>
		
	<%-- <script src="<c:url value='/js/deploy/deployRequest.js' />"></script> --%>
	
<%-- <jsp:include page="/WEB-INF/pc/CommonScript/commonScript.jsp"/> --%>
<%-- <script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script> --%>
<%-- <script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script> --%>
<%-- <link rel="stylesheet" href="<c:url value='/bootstrap/css/bootstrap.css' />"> --%>
<%-- <link rel="stylesheet" href="<c:url value='/css/common/footer.css' />"> --%>
<%-- <link rel="stylesheet" href="<c:url value='/css/common/header.css' />"> --%>

</head>
<script>
$(document).ready(function() {
	
	var modifiedProgramSize = 0;
	var modifiedResourceSize = 0;
	var isModifiedPrograms = true;
	var isModifiedResources = true;
	
    $("#deployRequestBtn").click(function() {
    	var chainId = $("#chainId").val();
    	var chainName = $("#chainName").val();
    	var workType = $("#workType").val();
    	var requestDate = $("#requestDate").val();
    	var requestTime = $("#requestTime").val();
    	var modifiedContents = $("#modifiedContents").val();
    	var requesterName = $("#requesterName").val();
    	var division = $("#division").val();
    	
    	if ( chainId == "" ) {
    		alert("부문을 검색해서 선택해주세요.");
    		return;
    	}
    	
    	if ( chainName == "" ) {
    		alert("부문을 검색해서 선택해주세요.");
    		return;
    	}

		if ( workType == "작업유형") {
			alert("작업유형을 선택해주세요.");
			return;
		}
		
		if ( requestDate == "") {
			alert("요청날짜를 선택해주세요.");
			return;
		}
		
		if ( requestTime == "") {
			alert("요청시간을 선택해주세요.");
			return;
		}
		
		if ( modifiedContents == "") {
			alert("변경내역을 작성해주세요.");
			return;
		}

		var k= 0;
		for(k=0; k <= modifiedProgramSize; k++) {
    		if ( $("#modifiedPrograms_pageId" + k).val() == "" && $("#modifiedPrograms_pageName" + k).val() == "") {
    			alert((k+1) + "번째 변경된 프로그램 목록을 검색해서 사용해주세요.");
    			return;
    		}
    	}
    	
    	for(k=0; k <= modifiedResourceSize; k++) {
    		if ( $("#modifiedResources_wSourceName" + k).val() == "") {
    			alert((k+1) +"번째 변경된 소스명을 사용해주세요.");
    			return;
    		}    		
    	}
    	
    	if ( isModifiedPrograms == true ) {
			alert("변경된 프로그램 목록은 필수 입력 값입니다.");
			return;
		}
    	
    	if ( isModifiedResources == true ) {
			alert("변경된 소스명은 필수 입력 값입니다.");
			return;
		}
    	
		if ( requesterName == "") {
			alert("요청자를 검색해서 선택해주세요.")
			return;
		}
		
		if ( division == "구분") {
			alert("구분을 선택해주세요.")
			return;
		}
		
	     $("#deployRequestFrm").attr({
	          method:"post",                                         
	            action:"/deploy/deployRequest.do"
	     }).submit();
    });  

    var i = -1;
    $('.addModifiedPrograms').click (function () {
  	  if($("#chainId").val()==""){
  		  alert("부문을 먼저 선택해주세요.");
		  $("#chainName").focus();
  		  return;
  	  }  	
  		i=i+1;
        $('.divModifiedPrograms').append (           
			$("<input type='text' name='modifiedPrograms_pageId"+i+"'id='modifiedPrograms_pageId"+i+"' readonly='readonly'><input type='text' name='modifiedPrograms_pageName"+i+"'id='modifiedPrograms_pageName"+i+"' readonly='readonly'><input type='button' class='btn btn-primary' value='검색' onclick='searchModifiedPrograms("+i+")'><br>")
        );
        
        modifiedProgramSize = i;
        isModifiedPrograms = false;
        $('.removeModifiedPrograms').on('click', function () {     	  
            $(".divModifiedPrograms").html("");
            isModifiedPrograms = true;
            i = -1;
        });
    });
    
    
    var j = -1;
    $('.addModifiedResources').click (function () {
    	if($("#chainId").val()==""){
    		  alert("부문을 먼저 선택해주세요.");
    		  $("#chainName").focus();
    		  return;
    	} 
  	    j=j+1;
        $('.divModifiedResources').append (           
			$("<input type='text' name='modifiedResources_wSourceName"+j+"'id='modifiedResources_wSourceName"+j+"'><br>")
// 			$("<input type='text' name='modifiedResources_wSourceName"+j+"'id='modifiedResources_wSourceName"+j+"' readonly='readonly'><input type='button' class='btn btn-primary' value='검색' onclick='searchModifiedResources("+j+")' readonly='readonly'><br>")
        );
        modifiedResourceSize = j;
        isModifiedResources = false;
        $('.removeModifiedResources').on('click', function () { 
            $(".divModifiedResources").html("");
            isModifiedResources = true;
            j = -1;
        });
    });
    
    $("#sidebarToggle").on('click', function(e) {
	    e.preventDefault();
	    $("body").toggleClass("sidebar-toggled");
	    $(".sidebar").toggleClass("toggled");
	 });
 });
 
  	function searchChain() {
  		var url = "/search/searchChain.do";

  		$("#popupLayer").bPopup({
        	modalClose: false,
            content:'iframe',
            iframeAttr:'frameborder="auto"',
            iframeAttr:'frameborder="0"',
            contentContainer:'.popupContent',
            loadUrl: url,            
            onOpen: function() {
            	$("#popupLayer").append("<div class='popupContent'></div><div class='b-close'><img src='<c:url value='/images/employee/layerPopupCancel.jpg'/>' width='30' height='30'></div>");            	
            }, 
            onClose: function() {
            	$("#popupLayer").html("");
            }
        },
        function() {
        });
    }
  	
  	function searchModifiedPrograms(modifiedProgramsTextNo){
  		var selectedchainId = $("#chainId").val();
  		var url = "/search/searchModifiedPrograms.do?selectedchainId=" + selectedchainId + "&modifiedProgramsTextNo="+modifiedProgramsTextNo;
  		
  		$("#popupLayer").bPopup({
        	modalClose: false,
            content:'iframe',
            iframeAttr:'frameborder="auto"',
            iframeAttr:'frameborder="0"',
            contentContainer:'.popupContent',
            loadUrl: url,            
            onOpen: function() {
            	$("#popupLayer").append("<div class='popupContent'></div><div class='b-close'><img src='<c:url value='/images/employee/layerPopupCancel.jpg'/>' width='30' height='30'></div>");            	
            }, 
            onClose: function() {
            	$("#popupLayer").html("");
            }
        },
        function() {
        });
	}
 
//   	function searchEmployee(employeeSearchWhere){
// 	   window.open("/search/searchEmployee.do?employeeSearchWhere="+employeeSearchWhere,"임직원검색", "width=1000, height=800");
// 	}
// 	function searchChain(){
// 	   window.open("/search/searchChain.do","부문검색", "width=1000, height=800");
// 	}
// 	function searchModifiedPrograms(modifiedProgramsTextNo){
// 		var selectedchainId=document.deployRequestFrm.chainId.value;
// 	   window.open("/search/searchModifiedPrograms.do?selectedchainId="+selectedchainId+"&modifiedProgramsTextNo="+modifiedProgramsTextNo,"변경프로그램검색", "width=1000, height=800");
// 	}
// 	function searchModifiedResources(modifiedResourceTextNo){
// 		window.open("/search/searchModifiedResource.do?modifiedResourceTextNo="+modifiedResourceTextNo,"변경소스검색", "width=1000, height=800");
// 	}
	
	function set(){
		var workType=document.getElementById("workType").value;
		var d=new Date();
		var NowDate= d.toLocaleDateString();
		var NowTime= d.toLocaleTimeString();
		if(workType=="정기"){
			document.getElementById("requestDate").value=NowDate;
			document.getElementById("requestTime").value="오후 3:30:00";
		}
		if(workType=="수시"){
			document.getElementById("requestDate").value=NowDate;
			document.getElementById("requestTime").value=NowTime;
		}
	}
	
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
			            	배포 요청
			        </div>
			        <div class="card-body">
						<div class="table-responsive">
							<div id="popupLayer"></div>
		        			<form:form id="deployRequestFrm" modelAttribute="deployRequestDto" name="deployRequestFrm" autocomplete="off">
			        			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			        				<thead>
			        					<tr>
											<td>부문</td>
			        						<td colspan="6">
		        								<input type="hidden" name="chainId" id="chainId" readonly="readonly" value="${deployRequestDto.chainId}">
						     					<input type="text" name="chainName" id="chainName" placeholder="부문 선택" readonly="readonly" value="${deployRequestDto.chainName}">
							    				 <input type="button" class="btn btn-primary" value="검색" onclick="searchChain()">
						 				    	<form:errors id="errorsChainId" cssStyle="color: red;" path="chainId" />
			        						</td>		        						
			        					</tr>
			        					<tr>
											<td>작업유형</td>
											<td colspan="6">
												 <select name="workType" id="workType" onchange="set()">			
													<c:forEach items="${categoryMasterCodes[categoryType.cateWtypeString]}" varStatus="status">
														<option value="<c:out value='${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}'></c:out>" <c:if test="${deployRequestDto.workType eq categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateWtypeString][status.index].codeName}</option>
													</c:forEach>
							     			     </select>
							       						<form:errors id="errorsWorkType" cssStyle="color: red;" path="workType" />
											</td>
			        					</tr>
			        					<tr>
			        						<td>요청날짜</td>
			        						<td>
			        							<input type="text" name="requestDate" id="requestDate" value="${deployRequestDto.requestDate}" placeholder="작업유형 선택" readonly="readonly">
												<form:errors id="errorsRequestDate" cssStyle="color: red;" path="requestDate" />
			        						</td>
			        					</tr>
			        					<tr>
			        							<td>요청시간</td>
			        						<td>
			        							<input type="text" name="requestTime" id="requestTime" value="${deployRequestDto.requestTime}" placeholder="작업유형 선택" readonly="readonly">
												<form:errors id="errorsRequestTime" cssStyle="color: red;" path="requestTime" />
			        						</td>
			        					</tr>
			        					<tr>
			        						<td>변경작업자</td>
			        						<td>
			        							 <input type="text" name="worker" id="worker" value="${sessionScope._USER_.employeeName}" readonly="readonly">
<!-- 							   				 <input type="button" class="btn btn-primary" value="검색" onclick="searchEmployee('worker')"><br> -->
			        						</td>
			        					</tr>
			        					<tr>
			        						<td>변경내역</td>
			        						<td colspan="6">
			        								<textarea id="modifiedContents" name="modifiedContents" cols="100" rows="5" placeholder="변경내역을 입력해주세요.">${deployRequestDto.modifiedContents}</textarea>
<%-- 			        							 <input type="text" name="modifiedContents" id="modifiedContents" value="${deployRequestDto.modifiedContents}" style="width: 1000px"> --%>
												 <form:errors id="errorsModifiedContents" cssStyle="color: red;" path="modifiedContents" />
			        						</td>
			        					</tr>
			        					<tr>
			        						<td>변경프로그램 목록</td>
			        						<td colspan="6">
			        							<input type="button" class="addModifiedPrograms btn btn-info" value="추가"><input type='button' class='removeModifiedPrograms btn btn-danger' id='removeModifiedPrograms' value='전체삭제'><br>
												<div class="divModifiedPrograms">      		        
												</div>
			        						</td>
			        					</tr>
			        					<tr>
			        						<td>변경 소스명</td>
			        						<td colspan="6">
												 <input type="button" class="addModifiedResources btn btn-info" value="추가"><input type='button' class='removeModifiedResources btn btn-danger' id='removeModifiedResources' value='전체삭제'><br> 	
												 <div class="divModifiedResources">     
												 </div>
			        						</td>
			        					</tr>
			        					<tr>
			        						<td>요청자</td>
			        						<td colspan="6">
			        							<input type="text" name="requesterName" id="requesterName" value="${sessionScope._USER_.employeeName}"><input type="hidden" id="requester" name="requester" value="${sessionScope._USER_.employeeNo}">
<!-- 							    			 <input type="button" class="btn btn-primary" value="검색" onclick="searchEmployee('requester')"><br> -->
<%-- 												 <form:errors id="errorsRequester" cssStyle="color: red;" path="requester" /><br> --%>
			        						</td>
			        					</tr>
			        					<tr>
			        						<td>배포담당자</td>
			        						<td colspan="6">
			        						 	<input type="text" name="deployer" id="deployer" value="${sessionScope._USER_.employeeName}" readonly="readonly">
<!-- 							   			    <input type="button" class="btn btn-primary" value="검색" onclick="searchEmployee('deployer')"><br> -->
			        						</td>
			        					</tr>
<!-- 			        					<tr> -->
<!-- 			        						<td>개발계 담당자</td>		        						 -->
<!-- 			        						<td colspan="6"> -->
<%-- 			        							<input type="text" name="developConfirmer" id="developConfirmer" value="${deployRequestDto.developConfirmer}" readonly="readonly"> --%>
<!-- 	             								<input type="button" class="btn btn-primary" value="검색" onclick="searchEmployee('developConfirmer')"> -->
<!-- 	             							</td> -->
<!-- 			        					</tr> -->
<!-- 			        					<tr> -->
<!-- 			        						<td>테스트계 담당자</td> -->
<!-- 			        						<td colspan="6"> -->
<%-- 			        							<input type="text" name="testConfirmer" id="testConfirmer" value="${deployRequestDto.testConfirmer}" readonly="readonly"> --%>
<!-- 	           									<input type="button" class="btn btn-primary" value="검색" onclick="searchEmployee('testConfirmer')"> -->
<!-- 			        						</td> -->
<!-- 			        					</tr> -->
<!-- 			        					<tr> -->
<!-- 			        						<td>운영계 담당자</td> -->
<!-- 			        						<td colspan="6"> -->
<%-- 			        							<input type="text" name="productionConfirmer" id="productionConfirmer" value="${deployRequestDto.productionConfirmer}" readonly="readonly"> --%>
<!-- 	            								<input type="button" class="btn btn-primary" value="검색" onclick="searchEmployee('productionConfirmer')"> -->
<!-- 			        						</td> -->
<!-- 			        					</tr> -->
<!-- 			        					<tr> -->
<!-- 			        						<td>구분</td> -->
<!-- 			        						<td colspan="6"> -->
<!-- 			        							<select name="division" id="division"> -->
<%-- 													<c:forEach items="${categoryMasterCodes[categoryType.cateDivisionString]}" varStatus="status"> --%>
<%-- 														<option value="<c:out value='${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}'></c:out>" <c:if test="${deployRequestDto.division eq categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}">selected="selected"</c:if>>${categoryMasterCodes[categoryType.cateDivisionString][status.index].codeName}</option> --%>
<%-- 													</c:forEach> --%>
<!-- 											    </select> -->
<!-- 			        						</td> -->
<!-- 			        					</tr> -->
			        				</thead>
			        			</table>
			        			<input type="hidden" name="statusCode" value="요청">
								<input type="button" class="btn btn-primary" id="deployRequestBtn" value="요청">
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