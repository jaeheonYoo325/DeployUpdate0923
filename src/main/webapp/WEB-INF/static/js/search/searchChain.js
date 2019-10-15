/**
 * 
 * 
 */
 $(document).ready(function() {
      $("#searchBtn").click(function() {
         $("#searchChainFrm").attr({
            method:"post",                                         
              action:"/search/searchChain.do"
       }).submit();
      });
   });
   
   function useChain(chainId,chainName){
       opener.document.getElementById("d_chainId").value=chainId
       opener.document.getElementById("chainName").value=chainName
       window.close();
    }