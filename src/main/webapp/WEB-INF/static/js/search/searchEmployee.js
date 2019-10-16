///**
// * 
// */
//
//   $(document).ready(function() {
//      var employeeName=window.location.search.slice(window.location.search.indexOf('=')+1);
//      $("#searchEmployeeBtn").click(function() {
//         $("#searchEmpFrm").attr({
//            method:"post",                                         
//              action:"/search/searchEmployee.do?employeeName="+employeeName
//       }).submit();
//      });
//   });
//   
//   function useThisEmployee(employeeNo,employeeName){
//	   var str=window.location.search.slice(window.location.search.indexOf('=')+1);
//	   if(str=='serviceRequestId'){
//	      opener.document.getElementById("serviceRequestId").value=employeeName
//	   }
//	   else if(str=='worker'){
//	      opener.document.getElementById("worker").value=employeeName
//	   }
//	   else if(str=='requester'){
//	      opener.document.getElementById("requester").value=employeeName
//	   }
//	   else if(str=='deployer'){
//	      opener.document.getElementById("deployer").value=employeeName
//	   }
//	   else if(str=='developConfirmer'){
//	      opener.document.getElementById("developConfirmer").value=employeeName
//	   }
//	   else if(str=='testConfirmer'){
//	      opener.document.getElementById("testConfirmer").value=employeeName
//	   }
//	   else if(str=='productionConfirmer'){
//	      opener.document.getElementById("productionConfirmer").value=employeeName
//	   }
//	   window.close();
//	}