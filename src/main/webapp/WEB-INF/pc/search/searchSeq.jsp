<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $("#searchBtn").click(function() {
         $("#searchSeqFrm").attr({
            method:"post",                                         
              action:"/search/searchSeq.do"
       }).submit();
      });
      
   });
</script>

<script>
function useSeq(seqtableNo,seqNo,chainId){
      opener.document.getElementById("seqtableNo").value=seqtableNo
      opener.document.getElementById("seqNo").value=seqNo
      opener.document.getElementById("chainId").value=chainId
      window.close();
   }
</script>

</head>
<body>
<h1>serachSeq</h1>

<form:form id="searchSeqFrm" modelAttribute="seqTableDto">
seqNo : <input type="text" name="seqNo" id="seqNo"><input type="button" id="searchBtn" value="검색"><br><br>
</form:form>

<table border="1" class="table table-hover">
            <tr>
               <td>seqtableNo</td>
               <td>seqNo</td>
               <td>chainId</td>
               <td>선택</td>
            </tr>
         <c:choose>
         <c:when test="${not empty seqTableDtoList}">
                  <c:forEach items="${seqTableDtoList}" var="seq">
                     <tr>
                         <td>${seq.seqtableNo}</td>
                         <td>${seq.seqNo}</td>
                         <td>${seq.chainId}</td>
                         <td><input type="button" value="사용" onclick="useSeq('${seq.seqtableNo}' , '${seq.seqNo}' , '${seq.chainId}')"> <td>
                     </tr>
                  </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td>등록된 게시글이 없습니다.</td>
               </tr>
            </c:otherwise>
            </c:choose>
 </table>      
</body>
</html>