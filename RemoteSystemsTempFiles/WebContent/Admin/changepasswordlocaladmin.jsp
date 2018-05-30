<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import='javax.servlet.http.*'%>
<%@ page import='com.rvnl.javaSource.*'%>
<%@ page
	import='javax.naming.*,java.sql.*,javax.sql.*,com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/sql' prefix='sql'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>
<%@page import="java.sql.*,java.util.*"%>
<%@include file="included/NewHeader.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="resources/JS/Approval_wf230.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<!-- 	<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />  -->
	

<script type="text/javascript">

function checkPasswordMatch() {
	var password = $("#password1").val();
	var confirmPassword = $("#password2").val();
	
	if(password.length >= 5 && confirmPassword.length >= 5) {
		
		if (password != confirmPassword) {
			$("#divCheckPasswordMatch").html("Passwords do not match!");
			$("#divCheckPasswordMatch").css("color", "red");
			 $('button[type="submit"]').prop('disabled', true);
		} else {
			
			$("#divCheckPasswordMatch").html("Passwords match.");
			$("#divCheckPasswordMatch").css("color", "green");
			 $('button[type="submit"]').prop('disabled', false);
		}
    } else {
       //alert("Please Provide password of atleast 5 chars.");
       //$('button[type="button"]').prop('disabled', false);
       document.getElementById("submit2").disabled = true;
    }

	
}

</script>
<style>

div.absolute {
   	position:absolute;
   	margin-top: 5px;
   	margin-left: 37px;
   	margin-bottom: 20px;
 	padding: 15 px;
    width: auto;
    height: 30px;
    border: 3px double #ff4d4d;
    background-color:#ffe6e6;
        }
    table.center {
    margin-left:auto; 
    margin-right:auto;
  }
</style>
</head>
<body>
<%String user = (String)session.getAttribute("user_name");

String role1=(String)session.getAttribute("role");
String role=(String)session.getAttribute("Type");
String zone_id1=(String)session.getAttribute("zone_id"); 
String piu_id1=(String)session.getAttribute("piu_id"); 
String div_id1=(String)session.getAttribute("Division_Id");

%>


<%-- <div><h4 style='width: 350px; margin-left: 27px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Change Password</h4></div>

<h4 align="left" style='width: 300px; margin-left:27px'><font style="color:red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font color="#99CC00">:&nbsp;<%=(String)session.getAttribute("user_name") %></font></h4>
 --%>
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[Change Password] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>
 <br><br><br><br>
	<form method="post" action="localpassword.jsp"
		style="margin: 40px; text-align: center;">	
		<%
		
		response.setHeader("Cache-control","no-store");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires", -1);
		%>	
		Current Password:<input type="password" name="password" id="password"
			style="margin: 0px 1px 0px 14px;width:270px;"  required /><br></br>
		<div class="td">
			New Password:<input type="password" name="password1" id="password1"
				style="margin: 8px 0px 10px 30px;width:270px;" onkeyup="checkPasswordMatch();"  required/></br> </br>
		</div>
		
		<div class="td">
			Confirm Password:<input type="password" name="password2"
				id="password2" onkeyup="checkPasswordMatch();"
				style="margin: 0px 3px 0px 14px;width:270px;" required/></br> </br> </br>
		</div>
		<div class="registrationFormAlert" id="divCheckPasswordMatch"
			style="margin: -32px 25px 14px 106px; color: red;"></div>
		
		
		<button type="submit" name="submit2" id="submit2"
			class="btn btn-primary" onclick="javascript:validateUser1();"
			style="width: 13%; font-size: inherit; margin: 14px -29px 0px 112px;">Update Password</button>

<div id="dialogid" style="display: none"
								align="center">
								<br> Please Fill All Details<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');">Ok</button>
							</div>
			
				

		<%
			String msg=request.getParameter("msg");
				if (msg!=null){
					%>
					
					<div style="text-align: center;
    /* display: flex; */
    margin: 11px;
    font-size: larger;
    color: RED;">
					
					<%=msg %></div>
					<%					
				}
			String user1 = (String) session.getAttribute("user_name");
		
		%>

	</form>
	
	<br><br>
<h4><span style="color:red; margin-left: 200px;">Note* :</span> Password should be of minimum five length Mandatory !</h4>
</body>
<br><br><br><br><br>
 <%@include file="included/Newfooter.jsp" %>
</html>