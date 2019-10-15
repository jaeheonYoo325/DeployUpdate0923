/**
 *
 * 
 */

$(document).ready(function() {
      $("#requestBtn").click(function() {
       $("#requestFrm").attr({
            method:"post",                                         
              action:"/deploy/deployRequest.do"
       }).submit();
      });  

      var i = -1;
      $('.btnAddP').click (function () {
    	  if($("#d_chainId").val()==""){
    		  alert("부문선택필수");
    		  return;
    	  }
    	  else
    		  i=i+1;
          $('.buttonsP').append (           
			$("<input type='text' name='wProgram"+i+"'id='wProgram"+i+"' readonly='readonly'><input type='text' name='pageName"+i+"'id='pageName"+i+"' readonly='readonly'><input type='button' value='검색' onclick='searchProgram("+i+")'><br>")
          );      
          $('.removeP').on('click', function () {     	  
              $(".buttonsP").html("");
              i = -1;
          });
      });
      
      
      var j = -1;
      $('.btnAddS').click (function () {
    	  j=j+1;
          $('.buttonsS').append (           
			$("<input type='text' name='wSource"+j+"'id='wSource"+j+"' readonly='readonly'><input type='button' value='검색' onclick='searchSource("+j+")' readonly='readonly'><br>")
          );      
          $('.removeS').on('click', function () { 
              $(".buttonsS").html("");
              j = -1;
          });
      });
   });
   
    function searchEmp(str){
	   window.open("/search/searchEmp.do?str="+str,"Employee검색", "width=1000, height=800");
	}
	function searchChain(){
	   window.open("/search/searchChain.do","Chain검색", "width=1000, height=800");
	}
	function searchProgram(no){
		var str=document.requestFrm.d_chainId.value;
	   window.open("/search/searchProgram.do?paramChainId="+str+"&no="+no,"Program검색", "width=1000, height=800");
	}
	function searchSource(no){
		window.open("/search/searchSource.do?no="+no,"Source검색", "width=1000, height=800");
	}