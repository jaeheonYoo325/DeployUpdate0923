/**
 * 
 */

   $(document).ready(function() {
      var str=window.location.search.slice(window.location.search.indexOf('=')+1);
      $("#searchBtn").click(function() {
         $("#searchEmpFrm").attr({
            method:"post",                                         
              action:"/search/searchEmp.do?str="+str
       }).submit();
      });
   });
   
   function useEmp(empNo,empName){
	   var str=window.location.search.slice(window.location.search.indexOf('=')+1);
	   if(str=='req'){
	      opener.document.getElementById("reqServiceId").value=empName
	   }
	   else if(str=='wEmp'){
	      opener.document.getElementById("wEmpNo").value=empName
	   }
	   else if(str=='reqEmp'){
	      opener.document.getElementById("reqEmpNo").value=empName
	   }
	   else if(str=='deployEmp'){
	      opener.document.getElementById("deployEmpNo").value=empName
	   }
	   else if(str=='devEmp'){
	      opener.document.getElementById("devEmpNo").value=empName
	   }
	   else if(str=='testEmp'){
	      opener.document.getElementById("testEmpNo").value=empName
	   }
	   else if(str=='prdEmp'){
	      opener.document.getElementById("prdEmpNo").value=empName
	   }
	   window.close();
	}
  
 	 function test(){
	   var param=window.location.search.slice(window.location.search.indexOf('=')+1);
	   alert(param);
	}