/**
 * 
 */

var controller = $.extend(new $.CommonObj(), {
	eventInit:function() {
		
	}, onCreate:function() {
		
		$("#employeeRegistPupupBtn").click(function() {
			controller.employeeRegist();			
		});
	}, employeeRegist : function() {
		window.open("/employee/employeeRegistPopup.do","사원 등록 팝업창", "width=1000, height=800");;
	}
	
});


$(document).ready(function() {
	controller.init();
});
