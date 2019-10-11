<%@page import="com.springproject.mastertable.dto.MasterTableDto"%>
<%@page import="com.springproject.deploy.dto.DeployCateListDto"%>
<%@page import="com.springproject.chain.dto.ChainTableDto"%>
<%@page import="com.springproject.wsource.dto.WSourceTableDto"%>
<%@page import="com.springproject.wprogramtable.dto.WProgramTableDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.springproject.deploy.dto.DeployDto"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%request.setCharacterEncoding("utf-8"); %>
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
   $(document).ready(function() {
	   
       $("#cateBtn").click(function() {
           $("#listFrm").attr({
                method:"post",                                         
                  action:"/deploy/deployList.do"
           }).submit();
          });  
    });
</script>

<script>
function deployDetail(str){
   var deployNo=str;
   window.open("/deploy/deployUpdate.do/"+deployNo,"상세보기", "width=1000, height=800");
}
</script>
<%
request.setCharacterEncoding("utf-8");
ArrayList<DeployDto> a=(ArrayList<DeployDto>)request.getAttribute("deployDtoList");
ArrayList b=(ArrayList)request.getAttribute("wProgramList");
ArrayList wSoList=(ArrayList)request.getAttribute("wSourceList");
ArrayList<ChainTableDto> cateChain=(ArrayList<ChainTableDto>)request.getAttribute("chainDtoList");
DeployCateListDto deployCateListDto=(DeployCateListDto)request.getAttribute("deployCateListDto");
ArrayList<MasterTableDto> statusCodeList = (ArrayList<MasterTableDto>) request.getAttribute("statusCodeList");

// ArrayList stList=(ArrayList)request.getAttribute("statusList");
%>
</head>
<body>
      <h1>List</h1>
   <form name="listFrm" id="listFrm">
   	  <input type="button" value="cateTest" id="cateBtn">
      <table border="1" class="table table-hover">
            <tr>
               <td>No</td>
                <td>
	                <select name="cateChain" id="cateChain">
	                    <option value="전체" <%if(deployCateListDto.getCateChain().equals("전체")){%>selected="selected"<%}%>>부문</option>
	                   <%for(int i=0; i<cateChain.size(); i++){
	                   %>
	                    <option value="<%=cateChain.get(i).getChainId()%>" <%if(deployCateListDto.getCateChain().equals(cateChain.get(i).getChainId())){%>selected="selected"<%}%>><%=cateChain.get(i).getChainName()%></option>
	                   <%   
	                   }
	                   %>
	               </select>
               </td>
               <td>
                   <select name="cateWtype" id="cateWtype">
                      <option value="전체" <%if(deployCateListDto.getCateWtype().equals("전체")){%>selected="selected"<%}%>>작업유형</option>
                      <option value="정기" <%if(deployCateListDto.getCateWtype().equals("정기")){%>selected="selected"<%}%>>정기</option>
                      <option value="수시" <%if(deployCateListDto.getCateWtype().equals("수시")){%>selected="selected"<%}%>>수시</option>
                   </select>
               </td>
               <td>
                   <select name="cateReqDate" id="cateReqDate">
						<option value="전체" <%if(deployCateListDto.getCateReqDate().equals("전체")){%>selected="selected"<%}%>>요청날짜</option>
						<option value="오름차순" <%if(deployCateListDto.getCateReqDate().equals("오름차순")){%>selected="selected"<%}%>>오름차순</option>
						<option value="내림차순" <%if(deployCateListDto.getCateReqDate().equals("내림차순")){%>selected="selected"<%}%>>내림차순</option>
                   </select>
               </td>
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
               <td>
					<select name="cateDivision" id="cateDivision">
						<option value="전체" <%if(deployCateListDto.getCateDivision().equals("전체")){%>selected="selected"<%}%>>구분</option>
						<option value="신규" <%if(deployCateListDto.getCateDivision().equals("신규")){%>selected="selected"<%}%>>신규</option>
						<option value="변경" <%if(deployCateListDto.getCateDivision().equals("변경")){%>selected="selected"<%}%>>변경</option>
					</select>
               </td>
               <td>상세보기</td>
               <td>
                   <select name="cateStatus" id="cateStatus">
                      <option value="전체"<%if(deployCateListDto.getCateStatus().equals("전체")){%>selected="selected"<%}%>>상태</option>
                      <option value="ST0001"<%if(deployCateListDto.getCateStatus().equals("ST0001")){%>selected="selected"<%}%>>요청</option>
                      <option value="ST0002"<%if(deployCateListDto.getCateStatus().equals("ST0002")){%>selected="selected"<%}%>>1차</option>
                      <option value="ST0003"<%if(deployCateListDto.getCateStatus().equals("ST0003")){%>selected="selected"<%}%>>2차</option>
                      <option value="ST0004"<%if(deployCateListDto.getCateStatus().equals("ST0004")){%>selected="selected"<%}%>>배포</option>
                      <option value="ST0005"<%if(deployCateListDto.getCateStatus().equals("ST0005")){%>selected="selected"<%}%>>최종</option>                      
                   </select>
               </td>
            </tr>
            <%for(int i=0; i<a.size();i++){ 
            	  ArrayList<WProgramTableDto> c=(ArrayList<WProgramTableDto>)b.get(i);
            	  ArrayList<WSourceTableDto> wSo=(ArrayList<WSourceTableDto>)wSoList.get(i);
//             	  ArrayList<StatusTableDto> st=(ArrayList<StatusTableDto>)stList.get(i);
            %>
              <tr>
                 <td><%=a.get(i).getDeployNo()%></td>
                 <td><%=a.get(i).getChainName()%></td>
                 <td><%=a.get(i).getWtype()%></td>
                 <td><%=a.get(i).getReqDate()%></td>
                 <td><%=a.get(i).getReqTime()%></td>
                 <td><%=a.get(i).getReqServiceId()%></td>
                 <td><%=a.get(i).getwEmpNo()%></td>
                 <td><%=a.get(i).getwContent()%></td>
                 <td>
                 <%for(int j=0; j<c.size(); j++){
                	%>
                	 <%=c.get(j).getwProNo_pageId()%>(<%=c.get(j).getwProNo_pageName()%>)<br>
                	<%
                                                } 
                  %>
                 </td>
                 <td>
                 <%for(int j=0;j<wSo.size();j++){
                	 %>
                	 <%=wSo.get(j).getwSo_wSourceName()%><br>
                	 <%
                									 }
                 %>
                 </td>
                 
                     <td><%=a.get(i).getReqEmpNo()%></td>
                     <td><%=a.get(i).getDeployEmpNo()%></td>
                     <td><%=a.get(i).getDevEmpNo()%></td>
                     <td><%=a.get(i).getTestEmpNo()%></td>
                     <td><%=a.get(i).getPrdEmpNo()%></td>
                     <td><%=a.get(i).getDivision()%></td>
                     <td><input type="button" value="상세보기" onclick="deployDetail(<%=a.get(i).getDeployNo()%>)"></td>
                     <td>
                     <%for(int k=0; k < statusCodeList.size(); k++) {
                    	 %>
	                      &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="statusCode<%=a.get(i)%>"<%if(a.get(i).getStatusCode().equals(statusCodeList.get(k).getCodeValue())){%>checked="checked"<%}%>disabled="disabled"><%=statusCodeList.get(k).getCodeName() %>
	                      <%
                     }
	                      %>
<%-- 						  &nbsp;&nbsp;&nbsp;<input type="radio" name="statusCode<%=a.get(i)%>"<%if(a.get(i).getStatusCode().equals("01")){%>checked="checked"<%}%>disabled="disabled">요청 --%>
<%-- 	                      &nbsp;&nbsp;&nbsp;<input type="radio" name="statusCode<%=a.get(i)%>"<%if(a.get(i).getStatusCode().equals("02")){%>checked="checked"<%}%>disabled="disabled">1차 --%>
<%-- 	                      &nbsp;&nbsp;&nbsp;<input type="radio" name="statusCode<%=a.get(i)%>"<%if(a.get(i).getStatusCode().equals("03")){%>checked="checked"<%}%>disabled="disabled">2차 --%>
<%-- 	                      &nbsp;&nbsp;&nbsp;<input type="radio" name="statusCode<%=a.get(i)%>"<%if(a.get(i).getStatusCode().equals("04")){%>checked="checked"<%}%>disabled="disabled">배포 --%>
<%-- 	                      &nbsp;&nbsp;&nbsp;<input type="radio" name="statusCode<%=a.get(i)%>"<%if(a.get(i).getStatusCode().equals("05")){%>checked="checked"<%}%>disabled="disabled">최종 --%>
                     </td>
                 <%
                 }  
            %>
      </table>      			   
   </form>
</body>
</html>