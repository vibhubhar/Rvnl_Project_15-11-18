<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%-- <jsp:include page="Divisions.jsp" flush="true" /> --%>
<%@ page autoFlush="true" buffer="1094kb"%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>
<%@include file="included/NewHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Create User</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.css"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/JS/Approval_wf230.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<!--  <link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" /> -->

<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script src="resources/JS/Headquarter.js"></script>
<script src="resources/JS/Reports230.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script type="text/javascript"> 
/*
var $j = jQuery.noConflict();
$j(function() {
	  var str=$j('.absolute' ).text();
	   var n=str.length
	   //alert("..."+str+".."+n);
	   $j('.absolute' ).css('width',n*6.5);
	   });
*/
 </script>

<style>
div.absolute {
   	position:absolute;
   	margin-top: 5px;
   	margin-left: 55px;
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
<%
response.setHeader("Cache-control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", -1);

String role1=(String)session.getAttribute("role");
String role=(String)session.getAttribute("Type");
String zone_id1=(String)session.getAttribute("zone_id"); 
String piu_id1=(String)session.getAttribute("piu_id"); 
 String user = (String)session.getAttribute("user_name");
//System.out.println("UZER:"+user);
%>
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[Contact Us] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>
<div class="container" style="position:relative; margin-top:70px;">
	<form id="loginForm11" name="loginForm11" method="post">
				
			<%		
			//String dname="";
			Connection conn = null;
			PreparedStatement ps31=null, ps32=null, ps33=null;
			ResultSet  rs31=null, rs32=null, rs33=null;
			String userid=null;
			int sn1=1;
						
						Statement stmt = null;
						try {
							Context initCtx = new InitialContext();
							Context envCtx = (Context) initCtx.lookup("java:comp/env");
							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

							conn = ds.getConnection();
												
							%>
						<h5>	1. For any user profile changes or password reset, please contact Local-Admin of PIU of RVNL linked to your Railway Zone.</h5><br>  
							<div style="margin-left:0px;  font-size:20px; color:blue;"><b>LOCAL-ADMINS:</b></div><br>
							
			
			<!--  	<table class="table table-bordered" style="background-color:#FCFAF9;"><tr style="background-color: lightgray;"><tr><th> 
				S. No.</th><th>PIU of RVNL</th><th>Name</th><th>Designation</th><th>Email-Id</th><th>Mobile No</th><th>Railway Zones</th></tr>
				-->
				<table class="table table-striped"><tr  style="background-color:lightgray;"><th> 
				S. No.</th><th>PIU of RVNL</th><th>Name</th><th>Designation</th><th>Email-Id</th><th>Mobile No</th><th>Railway Zones</th></tr>
				
						<%
								String sql35 = "select b.PIU_Name, a.Officer_Name, 'CPM' as desination_name, a.Email_Id, a.Contact_No, a.User_Id from xx_user_master a, xx_piu_master b where a.PIU_ID = b.PIU_Id and a.Role='localuser' order by b.PIU_Name";
								ps31 = conn.prepareStatement(sql35);
								rs31 = ps31.executeQuery();
								while (rs31.next()) {
									String piu=rs31.getString(1);
									String name=rs31.getString(2);
									String desig=rs31.getString(3);
									String email=rs31.getString(4);
									String mobile=rs31.getString(5);
									 userid=rs31.getString(6);
									 
									 System.out.println(piu+name);
									%>
									<tr><td><%=sn1 %></td>
									<td><%=piu %></td>
									<td> <%=name %></td>
									<td> <%=desig %></td>
									<td> <%=email %> </td>
									<td> <%=mobile %></td>
									<%
									sn1++;
									String sql33 = "select c.Zone_name from xx_user_zone_mapping a, xx_user_master b, xx_zones_master c where a.User_Id = b.User_ID and a.Zone_ID = c.Zone_Id and b.User_Id="+userid;
									ps32 = conn.prepareStatement(sql33);
									rs32 = ps32.executeQuery();
									String zones=null;
									while (rs32.next()) {
										String Zone=rs32.getString(1);

										 System.out.println(Zone);
										
										if (zones !=null ) {
											zones=zones+", "+ Zone;
										} else {
											zones=Zone;
										}
									}
									

										%>
									<td><%=zones %></td></tr>
									
								<%}
								%>
								</table>
							<br><br><br>
						<font color="blue"></font><h5>	2. For any user profile changes or password reset for Local-Admins and Railway Board users or any technical problem, please contact System Administrator at RVNL Corporate Office.</h5><br></font>  
						
								<div style="margin-left:0px; font-size:20px; color:blue;"><b>SYSTEM ADMIN:</b></div><br>
								
					<!-- 			<table class="table table-bordered" style="background-color: #FCFAF9;"><tr style="border:1px solid black; background-color: lightgray;"><th>Name</th><th>Designation</th><th>Email-Id</th><th>Mobile No</th></tr>
						 -->		
								<table class="table table-striped" ><tr style="background-color:lightgray;"><th>Name</th><th>Designation</th><th>Email-Id</th><th>Mobile No</th></tr>				<%
												String sql36 = "select a.Officer_Name, b.Designation_Name, a.Email_Id, a.Contact_No, a.User_Id from xx_user_master a, xx_designation_master b where a.Designation_Id = b.Designation_Id and a.Role='system administrator'";
												ps31 = conn.prepareStatement(sql36);
												rs31 = ps31.executeQuery();
												while (rs31.next()) {
													//String piu=rs31.getString(1);
													String name=rs31.getString(1);
													String desig=rs31.getString(2);
													String email=rs31.getString(3);
													String mobile=rs31.getString(4);
													%>
													
													<tr><td> <%=name %></td>
													<td> <%=desig %></td>
													<td> <%=email %> </td>
													<td> <%=mobile %></td></tr>
													<%
													}
												%>
												</table><br><br><br>
												<%

						}catch(Exception e){
							
							e.printStackTrace();
						}	finally {
						    try { conn.close(); } catch (Exception e) { /* ignored */ }
						} %>
		</form></div>
		<br><br>
		     				
</body>
 <%@include file="included/footer.jsp" %>	
</html>