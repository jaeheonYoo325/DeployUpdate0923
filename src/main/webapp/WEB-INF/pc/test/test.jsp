<%@page import="com.springproject.wprogramtable.dto.WProgramTableDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.springproject.deploy.dto.DeployDto"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>    
    <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <meta charset="UTF-8">        
    <title>Add More Elements</title>        
    <script src="<c:url value='/js/common/jquery-3.1.1.min.js' />"></script>
    <script>                      
    $(document).ready (function () {                
        $('.btnAdd').click (function () {                                        
            $('.buttons').append (
            	var no=0;
                '<input type="text" name="txt'+no+'"> <input type="button" class="btnRemove" value="Remove"><br>'
                no=no+1;
            ); // end append                            
            $('.btnRemove').on('click', function () { 
                $(this).prev().remove (); // remove the textbox
                $(this).next ().remove (); // remove the <br>
                $(this).remove (); // remove the button
            });
        }); // end click                                            
    }); // end ready        
</script>           
    </head>    
    <body>        
        <div class="buttons">            
			<input type="button" class="btnAdd" value="Add"><br>        
        </div>    
    </body>
</html>