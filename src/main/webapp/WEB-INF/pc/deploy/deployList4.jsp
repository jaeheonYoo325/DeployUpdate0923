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
      
       $("#updateBtn").attr({
            method:"post",                                         
              action:"/deploy/deployUpdate.do"
       }).submit();
      
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
ArrayList stList=(ArrayList)request.getAttribute("statusList");
%>
</head>
<body>
      <h1>List</h1>
   <form>
      <table border="1" class="table table-hover">
            <tr>
               <td>No</td>
               <td>부문</td>
               <td>작업유형</td>
               <td>요청날짜</td>
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
               <td>구분</td>
               <td>상세보기</td>
               <td>상태</td>
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
                     
                     <%-- <td>
                     <%
                       String[] stval={"","","","",""};
                       for(int j=0; j<st.size();j++){
                    	   stval[j]=st.get(j).getSt_status();
                       }
                     %>
                                                  요청 1차 2차 최종 배포<br>
                     &nbsp;&nbsp;&nbsp;<input type="checkbox" name="st1" id="st1" <%if(stval[0].equals("요청")){%>checked="checked"<%} %> disabled="disabled">
                     &nbsp;&nbsp;&nbsp;<input type="checkbox" name="st2" id="st2" <%if(stval[1].equals("1차")){%>checked="checked"<%} %> disabled="disabled">
                     &nbsp;&nbsp;&nbsp;<input type="checkbox" name="st3" id="st3" <%if(stval[2].equals("2차")){%>checked="checked"<%} %> disabled="disabled">
                     &nbsp;&nbsp;&nbsp;<input type="checkbox" name="st4" id="st4" <%if(stval[3].equals("최종")){%>checked="checked"<%} %> disabled="disabled">
                     &nbsp;&nbsp;&nbsp;<input type="checkbox" name="st5" id="st5" <%if(stval[4].equals("배포")){%>checked="checked"<%} %> disabled="disabled">
                     </td> --%>
                 <%
                 }  
            %>
      </table>
   <form>
</body>
</html>