///**
// *
// * 
// */
//
//$(document).ready(function() {
//      $("#deployRequestBtn").click(function() {
//       $("#deployRequestFrm").attr({
//            method:"post",                                         
//              action:"/deploy/deployRequest.do"
//       }).submit();
//      });  
//
//      var i = -1;
//      $('.addModifiedPrograms').click (function () {
//    	  if($("#chainId").val()==""){
//    		  alert("부문선택필수");
//    		  return;
//    	  }
//    	  else
//    		  i=i+1;
//          $('.divModifiedPrograms').append (           
//			$("<input type='text' name='modifiedPrograms_pageId"+i+"'id='modifiedPrograms_pageId"+i+"' readonly='readonly'><input type='text' name='modifiedPrograms_pageName"+i+"'id='modifiedPrograms_pageName"+i+"' readonly='readonly'><input type='button' value='검색' onclick='searchModifiedPrograms("+i+")'><br>")
//          );      
//          $('.removeModifiedPrograms').on('click', function () {     	  
//              $(".divModifiedPrograms").html("");
//              i = -1;
//          });
//      });
//      
//      
//      var j = -1;
//      $('.addModifiedResources').click (function () {
//    	  j=j+1;
//          $('.divModifiedResources').append (           
//			$("<input type='text' name='modifiedResources_wSourceName"+j+"'id='modifiedResources_wSourceName"+j+"' readonly='readonly'><input type='button' value='검색' onclick='searchModifiedResources("+j+")' readonly='readonly'><br>")
//          );      
//          $('.removeModifiedResources').on('click', function () { 
//              $(".divModifiedResources").html("");
//              j = -1;
//          });
//      });
//   });
//   
//    function searchEmployee(employeeSearchWhere){
//	   window.open("/search/searchEmployee.do?employeeSearchWhere="+employeeSearchWhere,"임직원검색", "width=1000, height=800");
//	}
//	function searchChain(){
//	   window.open("/search/searchChain.do","부문검색", "width=1000, height=800");
//	}
//	function searchModifiedPrograms(modifiedProgramsTextNo){
//		var selectedchainId=document.requestFrm.chainId.value;
//	   window.open("/search/searchModifiedPrograms.do?selectedchainId="+selectedchainId+"&modifiedProgramsTextNo="+modifiedProgramsTextNo,"변경프로그램검색", "width=1000, height=800");
//	}
//	function searchModifiedResources(modifiedResourceTextNo){
//		window.open("/search/searchModifiedResource.do?modifiedResourceTextNo="+modifiedResourceTextNo,"변경소스검색", "width=1000, height=800");
//	}