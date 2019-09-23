/**
 *  Author : Yoo jaeheon
 *  
 */



var controller = $.extend(new $.CommonObj(),  {
	eventInit:function() {
		
	},
	onCreate:function() {
		$("#employeeLoginBtn").click(function() {
			
			if ( controller.validationLoginCheck() == true ) {
				return;
			} else {				
				 $("#employeeLoginFrm").attr({
						method:"post", 					     				     	
				     	action:"/employee/employeeLogin.do"
				 }).submit();
			}			
		});
		
	}, validationLoginCheck : function() {
		
		if( $("#empNo").val() == "" ) {
			alert("사원번호를 입력해주세요.");
			return true;
		}
		
		if ( $("#empPw").val() == "" ) {
			alert("비밀번호를 입력해주세요.");
			return true;
		}
		
	}
	
});



$(document).ready(function() {
	controller.init();
});