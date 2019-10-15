/**
 * 
 */

   $(document).ready(function() {
      
       $("#cateBtn").click(function() {
           $("#listFrm").attr({
                method:"post",                                         
                  action:"/deploy/deployList.do"
           }).submit();
          });  
    });

function deployDetail(str) {
	 var deployNo=str;
	 window.open("/deploy/deployUpdate.do/"+deployNo,"상세보기", "width=1000, height=800");
}

