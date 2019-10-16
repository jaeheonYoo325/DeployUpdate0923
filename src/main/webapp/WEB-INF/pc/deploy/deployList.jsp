<%@page import="com.springproject.mastercode.dto.MasterCodeDto"%>
<%@page import="com.springproject.deploy.dto.CategoryTypeDto"%>
<%@page import="com.springproject.chain.dto.ChainDto"%>
<%@page
	import="com.springproject.modifiedresources.dto.ModifiedResourcesDto"%>
<%@page
	import="com.springproject.modifiedprograms.dto.ModifiedProgramsDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.springproject.deploy.dto.DeployRequestDto"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width initial-scale=1">
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script src="<c:url value='/bootstrap/js/bootstrap.js' />"></script>
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/bootstrap.css' />">
<script type="text/javascript">
   $(document).ready(function() {
      
       $("#deployRequestOfcategoryBtn").click(function() {
           $("#listFrm").attr({
                method:"post",                                         
                  action:"/deploy/deployList.do"
           }).submit();
          });  
    });
</script>

<script>
function showDeployRequestDetail(thisDeployNo){
   var deployNo=thisDeployNo;
   window.open("/deploy/showDeployRequestDetail.do/"+deployNo,"상세보기", "width=1000, height=800");
}
</script>
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<DeployRequestDto> deployRequests = (ArrayList<DeployRequestDto>) request
			.getAttribute("deployRequests");//a
	ArrayList<ArrayList<ModifiedProgramsDto>> modifiedPrograms = (ArrayList<ArrayList<ModifiedProgramsDto>>) request
			.getAttribute("modifiedPrograms");//b
	ArrayList<ArrayList<ModifiedResourcesDto>> modifiedResources = (ArrayList<ArrayList<ModifiedResourcesDto>>) request
			.getAttribute("modifiedResources");
	ArrayList<ChainDto> chain = (ArrayList<ChainDto>) request.getAttribute("chain");
	CategoryTypeDto categoryType = (CategoryTypeDto) request.getAttribute("categoryType");
	ArrayList<MasterCodeDto> statusCodeList = (ArrayList<MasterCodeDto>) request.getAttribute("statusCodeList");
	ArrayList<ArrayList<MasterCodeDto>> categoryMasterCodes = (ArrayList<ArrayList<MasterCodeDto>>) request
			.getAttribute("categoryMasterCodes");
%>
</head>
<body>
	<h1>List</h1>
	<form name="listFrm" id="listFrm">
		<input type="button" value="카테고리검색" id="deployRequestOfcategoryBtn">
		<table border="1" class="table table-hover">
			<tr>
				<td>No</td>
				<td><select name="categoryChain" id="categoryChain">
						<option value="부문"
							<%if (categoryType.getCategoryChain().equals("부문")) {%>
							selected="selected" <%}%>>부문</option>
						<%
							for (int i = 0; i < chain.size(); i++) {
						%>
						<option value="<%=chain.get(i).getChainId()%>"
							<%if (categoryType.getCategoryChain().equals(chain.get(i).getChainId())) {%>
							selected="selected" <%}%>><%=chain.get(i).getChainName()%></option>
						<%
							}
						%>
				</select></td>
				<td><select name="categoryWorktype" id="categoryWorktype">
						<%
							for (int i = 0; i < categoryMasterCodes.size(); i++) {
								//                                                             categoryMasterCodes.get(categoryType.getCateWtypeString());
								if (categoryMasterCodes.get(i).get(0).getCodeType().equals(categoryType.getCateWtypeString())) {
									for (int j = 0; j < categoryMasterCodes.get(i).size(); j++) {
						%>
						<option
							value="<%=categoryMasterCodes.get(i).get(j).getCodeName()%>"
							<%if (categoryType.getCategoryWorktype().equals(categoryMasterCodes.get(i).get(j).getCodeName())) {%>
							selected="selected" <%}%>><%=categoryMasterCodes.get(i).get(j).getCodeName()%></option>
						<%
							}
									}

								}
						%>
				</select></td>
				<td><select name="categoryRequestDate" id="categoryRequestDate">
						<%
							for (int i = 0; i < categoryMasterCodes.size(); i++) {
									if (categoryMasterCodes.get(i).get(0).getCodeType().equals(categoryType.getCateReqDateString())) {
										for (int j = 0; j < categoryMasterCodes.get(i).size(); j++) {
						%>
						<option
							value="<%=categoryMasterCodes.get(i).get(j).getCodeName()%>"
							<%if (categoryType.getCategoryRequestDate().equals(categoryMasterCodes.get(i).get(j).getCodeName())) {%>
							selected="selected" <%}%>><%=categoryMasterCodes.get(i).get(j).getCodeName()%></option>
						<%
							}
									}

								}
						%>
				</select></td>
				<td>요청시간</td>
				<td>서비스요청ID</td>
				<td>작업자</td>
				<td>변경내역</td>
				<td>변경프로그램목록</td>
				<td>변경소스명</td>
				<td>요청자</td>
				<td>Deploy담당자</td>
				<td>확인(개발계)</td>
				<td>확인(테스트계)</td>
				<td>확인(운영계)</td>
				<td><select name="categoryDivision" id="categoryDivision">
						<%
							for (int i = 0; i < categoryMasterCodes.size(); i++) {
									if (categoryMasterCodes.get(i).get(0).getCodeType().equals(categoryType.getCateDivisionString())) {
										for (int j = 0; j < categoryMasterCodes.get(i).size(); j++) {
						%>
						<option
							value="<%=categoryMasterCodes.get(i).get(j).getCodeName()%>"
							<%if (categoryType.getCategoryDivision()
									.equals(categoryMasterCodes.get(i).get(j).getCodeName())) {%>
							selected="selected" <%}%>><%=categoryMasterCodes.get(i).get(j).getCodeName()%></option>
						<%
							}
									}

								}
						%>
				</select></td>
				<td>상세보기</td>
				<td><select name="categoryStatus" id="categoryStatus">
						<%
							for (int i = 0; i < categoryMasterCodes.size(); i++) {
									if (categoryMasterCodes.get(i).get(0).getCodeType().equals(categoryType.getCateStatusString())) {
										for (int j = 0; j < categoryMasterCodes.get(i).size(); j++) {
						%>
						<option
							value="<%=categoryMasterCodes.get(i).get(j).getCodeValue()%>"
							<%if (categoryType.getCategoryStatus().equals(categoryMasterCodes.get(i).get(j).getCodeValue())) {%>
							selected="selected" <%}%>><%=categoryMasterCodes.get(i).get(j).getCodeName()%></option>
						<%
							}
									}

								}
						%>
				</select></td>
			</tr>
			<%
				for (int i = 0; i < deployRequests.size(); i++) {
						ArrayList<ModifiedProgramsDto> modifiedProgramInmodifiedPrograms = (ArrayList<ModifiedProgramsDto>) modifiedPrograms.get(i);
						ArrayList<ModifiedResourcesDto> modifiedResourceInmodifiedResources = (ArrayList<ModifiedResourcesDto>) modifiedResources.get(i);
			%>
			<tr>
				<td><%=deployRequests.get(i).getDeployNo()%></td>
				<td><%=deployRequests.get(i).getChainName()%></td>
				<td><%=deployRequests.get(i).getWorkType()%></td>
				<td><%=deployRequests.get(i).getRequestDate()%></td>
				<td><%=deployRequests.get(i).getRequestTime()%></td>
				<td><%=deployRequests.get(i).getServiceRequestId()%></td>
				<td><%=deployRequests.get(i).getWorker()%></td>
				<td><%=deployRequests.get(i).getModifiedContents()%></td>
				<td>
					<%
						for (int j = 0; j < modifiedProgramInmodifiedPrograms.size(); j++) {
					%> <%=modifiedProgramInmodifiedPrograms.get(j).getModifiedPrograms_pageId()%>(<%=modifiedProgramInmodifiedPrograms.get(j).getModifiedPrograms_pageName()%>)<br>
					<%
						}
					%>
				</td>
				<td>
					<%
						for (int j = 0; j < modifiedResourceInmodifiedResources.size(); j++) {
					%> <%=modifiedResourceInmodifiedResources.get(j).getModifiedResources_wSourceName()%><br> <%
 	}
 %>
				</td>

				<td><%=deployRequests.get(i).getRequester()%></td>
				<td><%=deployRequests.get(i).getDeployer()%></td>
				<td><%=deployRequests.get(i).getDevelopConfirmer()%></td>
				<td><%=deployRequests.get(i).getTestConfirmer()%></td>
				<td><%=deployRequests.get(i).getProductionConfirmer()%></td>
				<td><%=deployRequests.get(i).getDivision()%></td>
				<td><input type="button" value="상세보기"
					onclick="showDeployRequestDetail(<%=deployRequests.get(i).getDeployNo()%>)"></td>
				<td>
					<%
 						for (int k = 0; k < statusCodeList.size(); k++) { 
					%> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio"
					name="statusCode<%=deployRequests.get(i)%>"
					<%if (deployRequests.get(i).getStatusCode().equals(statusCodeList.get(k).getCodeValue())) {%>
					checked="checked" <%}%> disabled="disabled"><%=statusCodeList.get(k).getCodeName()%>
					<%
  				} 
 					%> 
					

				</td>
			</tr>
			<%
				}
				
				
			%>
		</table>
	</form>
</body>
</html>