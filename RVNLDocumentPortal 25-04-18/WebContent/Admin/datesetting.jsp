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
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/JS/Approval_wf230.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<!--  <link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" /> -->
<script type="text/javascript"
	src="resources/JS/datasort.js"></script>
	<link
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript"
	src="resources/JS/datasort.js"></script>
	<link
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />
	
<style>
#example_length {
    display: none;
}
#example {
    width: inherit;
}
	</style>
<script type="text/javascript">
var people, asc1 = 1, asc2 = 1, asc3 = 1, asc4 = 1, asc5 = 1, asc6 = 1, asc7 = 1, asc8 = 1;
window.onload = function() {
	people = document.getElementById("people");
}

function sort_table(tbody, col, asc) {
	var rows = tbody.rows, rlen = rows.length, arr = new Array(), i, j, cells, clen;
	// fill the array with values from the table
	for (i = 0; i < rlen; i++) {
		cells = rows[i].cells;
		clen = cells.length;
		arr[i] = new Array();
		for (j = 0; j < clen; j++) {
			arr[i][j] = cells[j].innerHTML;
		}
	}
	// sort the array by the specified column number (col) and order (asc)
	arr.sort(function(a, b) {
		return (a[col] == b[col]) ? 0
				: ((a[col] > b[col]) ? asc : -1 * asc);
	});
	// replace existing rows with new rows created from the sorted array
	for (i = 0; i < rlen; i++) {
		rows[i].innerHTML = "<td>" + arr[i].join("</td><td>") + "</td>";
	}
}


$(document).ready(function() {
    $('#example').DataTable( {
        columnDefs: [ {
            targets: [ 0 ],
            orderData: [ 0, 1 ]
        }, {
            targets: [ 1 ],
            orderData: [ 1, 0 ]
        }, {
            targets: [ 2 ],
            orderData: [ 2, 0 ]
        } ],
			"infoCallback": function( settings, start, end, max, total, pre ) {
			if (max==total) { return "Showing " + (end-start+1) + "  of " +total+" records"}
			else {return "Showing " + (end-start+1) + "  of " +total+" records (filtered from total " + max+" records)"}
		   	}
    } );
} );
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
//String zone_id1=(String)session.getAttribute("zone_id"); 
//String piu_id1=(String)session.getAttribute("piu_id"); 

String user = (String)session.getAttribute("user_name");
//session.removeAttribute("RealdateStatus");
//System.out.println("UZER:"+user);
%>
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[Date/Email Setting] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>
<div class="container" style="position:relative; margin-top:70px;">
	<form id="loginForm12" name="loginForm12" method="post">
	<INPUT TYPE="HIDDEN" NAME="realdateoption">
	<INPUT TYPE="HIDDEN" NAME="profilealertoption">
	<INPUT TYPE="HIDDEN" NAME="docactionalertoption">
	<INPUT TYPE="HIDDEN" NAME="manualalertoption">
	<INPUT TYPE="HIDDEN" NAME="alertPIU">
	<INPUT TYPE="HIDDEN" NAME="actionOption">	
	<INPUT TYPE="HIDDEN" NAME="Project_stage">
	<INPUT TYPE="HIDDEN" NAME="MyProject_stage">		
	
	<c:if test="${(param.Project_stage == null)}">	
	
	<div id="mypass" align="center">
								<br> <br>Special Password: <input type="password" id="mypass1" name="mypass1"  style="margin-left: 30px; width:150px; background-color:yellow;"/><br><br>
								<br><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<button id="appok1" type="button" class="btn btn-primary" onclick="mypasstest();">OK</button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <button id="appcancle" type="button" class="btn btn-primary" onclick="location.href='NewIndex.jsp';">Cancel</button>
							</div>
		
		</c:if>	
<c:if test="${(param.MyProject_stage != null) and (param.Project_stage == '') }">							
	<%
	//System.out.println("inside stage UZER:"+user);
	//String str99=request.getParameter("Project_stage0");
    //if(str99.equalsIgnoreCase("ninetynine")){	
		int count=1;;
		Connection conn = null;
		Statement stmt = null, stmt1=null,stmt2=null, stmt3=null;
		ResultSet rs = null,rs11=null, rs22=null,rs33=null, rs44=null;
		String des2=null, des=null, rdStatus=null, piu_id=null, piuname=null,piu_name=null,dep_name=null,desg_name=null,user_name=null,officername=null,email_id=null,contact_no=null,mailStatus=null,Action=null, Setting=null;
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
		conn = ds.getConnection();
		try {
		String query2 = "select Description from  xx_maintenance where Item='profile_alert'";
		stmt2 = conn.createStatement();
		rs33 = stmt2.executeQuery(query2);
		if (rs33.next()) {
			 des = rs33.getString("Description");
		}
       	%>			
					<table style="margin: -16px 0px 0px 18px;"><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>User's Profile Change Alert Setting :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<select name="profile1" id="profile1" style="width: 105px;">
					<% if (des.equalsIgnoreCase("on")) { %>						
						<option value="on" selected ="selected">On</option>
						<option value="off">Off</option>
						<%} else {%>
						<option value="on">On</option>
						<option value="off" selected ="selected">Off</option>
						<%} %>
				</select><input type="button" id="prof_update" name="prof_update" class="btn btn-primary" value="update" style="margin-left: 30px;" onclick="prof_alert1();"/><br><br></td>	
							
			
			</tr>
			<%
			String query52 = "select Description from  xx_maintenance where Item='doc_action_alert'";
			stmt3 = conn.createStatement();
			rs44 = stmt3.executeQuery(query52);
			if (rs44.next()) {
				 des2 = rs44.getString("Description");
			}
	       	
			%>
					<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Document Action Alert Setting :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				<select name="docActionAlert1" id="docActionAlert1" style="width: 105px;">
					<% if (des2.equalsIgnoreCase("on")) { %>						
						<option value="on" selected ="selected">On</option>
						<option value="off">Off</option>
						<%} else {%>
						<option value="on">On</option>
						<option value="off" selected ="selected">Off</option>
						<%} %>
				</select><input type="button" id="DocAction_update" name="DocAction_update" class="btn btn-primary" value="update" style="margin-left: 30px;" onclick="doc_action_alert1();"/><br><br></td>	
</tr>
			
							<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Real Time Date Setting :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<select name="realdate" id="realdate" style="width: 105px; margin-left:80px;">
											
						<option value="on">On</option>
						<option value="off">Off</option>
				</select><input type="button" id="dateset" name="dateset" class="btn btn-primary" value="update" style="margin-left: 30px;" onclick="realdateset1();"/><br><span style="font-size:12px; color:green; margin-left:50px;">(for actual setting value please see table below)</span><br><br></td>	
							
			
			</tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Auto Alert/Reminder Setting :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<select name="piu" id="piu" style="width: 255px;">
						<option value="">---Select PIU---</option>	
		<%	
		String query1 = "select distinct PIU_Name, PIU_ID from  xx_piu_master order by PIU_Name";
		stmt1 = conn.createStatement();
		rs22 = stmt1.executeQuery(query1);
		while (rs22.next()) {
			 piu_name= rs22.getString("PIU_Name");
			 piu_id = rs22.getString("PIU_Id");
       	 %>
       	 						
						<option value="<%=piu_id %>"><%=piu_name %></option>
			<%
			}
			%>			
				</select>
				<select name="manualAlert" id="manualAlert" style="width: 105px;">
				<option value="on">On</option>
						<option value="off">Off</option>
						</select>
				<br><span style="font-size:12px; color:green; margin-left:50px;">(for actual setting value please see table below)</span></td><td><input type="button" id="dateset1" name="dateset1" class="btn btn-primary" value="update" style="margin-left: 30px; margin-top:-20px;" onclick="manualalertset1();"/></td>	
							
			
			</tr>
			<tr><td><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Delete Duplicate records :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<br><span style="font-size:12px; color:green; margin-left:50px;">(from xx_approval_workflow, xx_record_actions, xx_document_mapping)</span></td><td><input type="button" id="deldoc1" name="deldoc1" class="btn btn-primary" value="confirm delete" style="margin-left: 30px;" onclick="deldocset1();"/></td>	
						
			</tr></table><br><br>
		<%
		String query = "select distinct PM.PIU_Name, usr.MailStatus, usr.RealdateStatus from  xx_piu_master PM, xx_user_master usr  where usr.PIU_ID = PM.PIU_Id order by PM.PIU_Name";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		%>
				
							<table class="table table-hover table-bordered" id="example" class="display"
					style="background-color: #F0FFFF;">
					<thead>
		<tr class="success">
								<th ><b>SNo</b></th> 
									<th style="width: 200px;"><b>PIU Name</b></th>
									<th style="width: 100px;" ><b>Auto Mail Action</b></th>
									<th style="width: 150px;" ><b>Real Time Date Setting</b></th>

								</tr></thead>
								<tbody>
								<%
								while (rs.next()) {
									 piu_name= rs.getString(1);
						        	 mailStatus= rs.getString(2);
						        	 rdStatus= rs.getString(3);
						        	 
							if(mailStatus.equalsIgnoreCase("1")){
								Action="On";
							}else{
								Action="Off";
							}
							if(rdStatus.equalsIgnoreCase("1")){
								Setting="On";
							}else{
								Setting="Off";
							}
							
									%>
									<tr class="active">
			<td><%=count%></td>
			<td><%=piu_name%></td>
			<%if(Action.equalsIgnoreCase("On")) {
			%>
			
			<td style="color:green; font-weight: bold;"><%=Action%></td>
			
			<%}else{
				%>
				
				<td style="color:red;text-decoration:underline;"><%=Action%></td>
				
				<%	
			}
			if(Setting.equalsIgnoreCase("On")) {
				%>
				
				<td style="color:green;font-weight: bold;"><%=Setting%></td>
				
				<%}else{
					%>
					
					<td style="color:red;text-decoration:underline;"><%=Setting%></td>
					
					<%	
				}
			
			count++;}
		} catch(Exception e){
			
			e.printStackTrace();
		}  finally {
			    try { rs44.close(); } catch (Exception e) { /* ignored */ }
			    try { stmt3.close(); } catch (Exception e) { /* ignored */ }
			    try { rs33.close(); } catch (Exception e) { /* ignored */ }
			    try { stmt2.close(); } catch (Exception e) { /* ignored */ }
			    try { rs22.close(); } catch (Exception e) { /* ignored */ }
			    try { stmt1.close(); } catch (Exception e) { /* ignored */ }
			    try { rs.close(); } catch (Exception e) { /* ignored */ }
			    try { stmt.close(); } catch (Exception e) { /* ignored */ }
			    try { conn.close(); } catch (Exception e) { /* ignored */ }
			}
		
							//	conn.close();
   //    }
 %>
							</table>
	

	</c:if>	
	</form>
	</div>
	<div id="dialogid4" style="display: none"
								align="center">
								<br> Are you Sure you want to select Document Action Alert Setting as 'on'<br>
								<br>
								<button id="appok" class="btn btn-primary" onclick="doc_action_alert('on');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="$('#dialogid4').dialog('close');">cancel</button>
							</div>
		<div id="dialogid41" style="display: none"
								align="center">
								<br> Are you Sure You want to select Document Action Alert Setting as 'off'<br>
								<br>
								<button id="appok" class="btn btn-primary" onclick="doc_action_alert('off');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="$('#dialogid41').dialog('close');">cancel</button>
							</div>
	
	<div id="dialogid3" style="display: none"
								align="center">
								<br> Are you Sure you want to select User Profile Change Alert Setting as 'on'<br>
								<br>
								<button id="appok" class="btn btn-primary" onclick="prof_alert('on');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="$('#dialogid3').dialog('close');">cancel</button>
							</div>
							<div id="dialogid31" style="display: none"
								align="center">
								<br> Are you Sure You want to select User Profile Change Alert Setting as 'off'<br>
								<br>
								<button id="appok" class="btn btn-primary" onclick="prof_alert('off');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="$('#dialogid31').dialog('close');">cancel</button>
							</div>
	
	<div id="dialogid" style="display: none"
								align="center">
								<br> Are you Sure you want to select Real Time Date Setting as 'on'<br>
								<br>
								<button id="appok" class="btn btn-primary" onclick="realdateset('on');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="$('#dialogid').dialog('close');">cancel</button>
							</div>
							<div id="dialogid1" style="display: none"
								align="center">
								<br> Are you Sure You want to select Real Time Date Setting as 'off'<br>
								<br>
								<button id="appok" class="btn btn-primary" onclick="realdateset('off');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="$('#dialogid1').dialog('close');">cancel</button>
							</div>
							
		<div id="dialogid28" style="display: none"
								align="center">
								<br> Are you Sure you want to select Manual Alert/reminder Setting as 'on' for this PIU<br>
								<br>
								<button id="appok" class="btn btn-primary" onclick="manualalertset('on');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="$('#dialogid28').dialog('close');">cancel</button>
							</div>
							<div id="dialogid128" style="display: none"
								align="center">
								<br> Are you Sure you want to select Manual Alert/reminder Setting as 'off' for this PIU<br>
								<br>
								<button id="appok" class="btn btn-primary" onclick="manualalertset('off');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="$('#dialogid128').dialog('close');">cancel</button>
							</div>
		<div id="dialogid55" style="display: none"
								align="center">
								<br> Wrong Password !!!!  .. retry .....<br>
								<br>
								<button id="appok" type="button" class="btn btn-primary" onclick="location.reload();">Yes</button>
         <button id="appcancle" class="btn btn-primary" type="button" onclick="$('#dialogid55').dialog('close'); location.href='NewIndex.jsp';">No</button>
							</div>
	
	
	<c:if test="${(param.Project_stage != null) and (param.MyProject_stage != null)}">
							<%
							//System.out.println("112334");
							String sql3=null;
							Connection conn = null;
							String username = (String) session.getAttribute("user_name");
							String str=request.getParameter("Project_stage");
							System.out.println("33333334"+str);
							if (str.equalsIgnoreCase("third") ) {
								String prof_alert2 = request.getParameter("profilealertoption");
								System.out.println("112334"+prof_alert2);
								try {
									Context initCtx = new InitialContext();
									Context envCtx = (Context) initCtx.lookup("java:comp/env");
									DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
									
										
									conn = ds.getConnection();
									if(prof_alert2.equalsIgnoreCase("off")){
									 sql3 = "update xx_maintenance set Description='Off' where Item='profile_alert'";
									}
									else{
										sql3 = "update xx_maintenance set Description='On' where Item='profile_alert'";
									}
									PreparedStatement ps1 = conn.prepareStatement(sql3);
									ps1.executeUpdate();
								}
								catch(Exception e){
									e.printStackTrace();
									
								} finally {
	    						    try { conn.close(); } catch (Exception e) { /* ignored */ }
	    						}
								
							 
							
							%>
							<div class="alert alert-success" align="center" style="margin: 112px 0px 0px 0px;">
				<strong>Success!</strong> User Profile Change Alert Setting Changed Successfully ..... &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				<button type="button" class="btn btn-primary" onclick="location.href='admn_logout.jsp'">Please log out for working with changed setting !</button> 
					</div>	
					<%
					} else if (str.equalsIgnoreCase("fourth") ) {
						String doc_action_alert2 = request.getParameter("docactionalertoption");
						//System.out.println("112334"+prof_alert2);
						try {
							Context initCtx = new InitialContext();
							Context envCtx = (Context) initCtx.lookup("java:comp/env");
							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
							
								
							conn = ds.getConnection();
							if(doc_action_alert2.equalsIgnoreCase("off")){
							 sql3 = "update xx_maintenance set Description='Off' where Item='doc_action_alert'";
							}
							else{
								sql3 = "update xx_maintenance set Description='On' where Item='doc_action_alert'";
							}
							PreparedStatement ps1 = conn.prepareStatement(sql3);
							ps1.executeUpdate();
						}
						catch(Exception e){
							e.printStackTrace();
							
						} finally {
						    try { conn.close(); } catch (Exception e) { /* ignored */ }
						}
						
					 
					
					%>
					<div class="alert alert-success" align="center" style="margin: 112px 0px 0px 0px;">
		<strong>Success!</strong> Document Action Alert Setting Changed Successfully ..... &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
		<button type="button" class="btn btn-primary" onclick="location.href='admn_logout.jsp'">Please log out for working with changed setting !</button> 
			</div>	
			<%
			} else if (str.equalsIgnoreCase("first")) {
						String realdateoption =request.getParameter("realdateoption");			
								try {
									Context initCtx = new InitialContext();
									Context envCtx = (Context) initCtx.lookup("java:comp/env");
									DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
									
										
									conn = ds.getConnection();
									if(realdateoption.equalsIgnoreCase("off")){
									 sql3 = "update xx_user_master set RealdateStatus='0'";
									 //session.setAttribute("RealdateStatus","0");
									}
									else{
										 sql3 = "update xx_user_master set RealdateStatus='1'";	
										// session.setAttribute("RealdateStatus","1");
									}
									PreparedStatement ps1 = conn.prepareStatement(sql3);
									ps1.executeUpdate();
								}
								catch(Exception e){
									e.printStackTrace();
									
								} finally {
	    						    try { conn.close(); } catch (Exception e) { /* ignored */ }
	    						}
								
							 
							
							%>
							<div class="alert alert-success" align="center" style="margin: 112px 0px 0px 0px;">
				<strong>Success!</strong> Date Setting Changed Successfully ..... &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
				<button type="button" class="btn btn-primary" onclick="location.href='admn_logout.jsp'">Please log out for working with changed Date setting !</button> 
					</div>	
					<%
			} else if (str.equalsIgnoreCase("fifth")) {
				int updateQuery = 0;
				int updateQuery2 = 0;
				PreparedStatement p1 =null, p2=null;
				try {
					Context initCtx = new InitialContext();
					Context envCtx = (Context) initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
					
						
					conn = ds.getConnection();
				
					String sql1="DELETE x FROM xx_approval_workflow   x "+
							  " join (select count(*),max(rownum) as maxrow, Document_id, Added_ByUser, Assigned_To, Action, Level, AssignedDays "+
							  " from xx_approval_workflow group by Document_id, Added_ByUser, Assigned_To, Action, Level, AssignedDays "+
							  " having count(*) > 1) y on x.rownum=y.maxrow";
					p1 = conn.prepareStatement(sql1);
                   updateQuery = p1.executeUpdate();
                while (updateQuery != 0) {
                	updateQuery = p1.executeUpdate();
                }
                String sql2="DELETE x FROM xx_record_actions  x "+
                		 " join (SELECT COUNT(*), max(rownum) as maxrow, Document_id, CurrentDate, ActionPerformed, ActionPerformedBy, Information, ActionedOn, AssignedDays "+ 
                		" FROM xx_record_actions GROUP BY Document_id, CurrentDate, ActionPerformed, ActionPerformedBy, Information, ActionedOn, AssignedDays "+
                		" HAVING COUNT(*)>1) y on x.rownum=y.maxrow";

				p2 = conn.prepareStatement(sql2);
             updateQuery2 = p2.executeUpdate();
          while (updateQuery2 != 0) {
          	updateQuery2 = p2.executeUpdate();
          }
					%>
					<sql:update dataSource="jdbc/MySQLDB" var="rs">
			DELETE x FROM xx_record_actions x where x.ActionPerformedBy='null'
	
		</sql:update>
		
		<sql:update dataSource="jdbc/MySQLDB" var="rs">
		DELETE x FROM xx_document_mapping  x JOIN  xx_document_mapping  t ON  x.document_number= t.document_number and x.Document_Name= t.Document_Name and  x.Document_Type= t.Document_Type and x.Submitted_by= t.Submitted_by  and x.Project_ID= t.Project_ID and x.package_ID = t.package_ID  AND t.Document_Map_Id < x.Document_Map_Id
		
		</sql:update>
	<%
					} catch(Exception e){
									e.printStackTrace();
									
								} finally {
	    						    try { conn.close(); } catch (Exception e) { /* ignored */ }
	    						}%>
	    						
	<div class="alert alert-success" align="center" style="margin: 112px 0px 0px 0px;">
		<strong>Success!</strong> Duplicate document records deleted........ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
		<button type="button" class="btn btn-primary" onclick="location.href='NewIndex.jsp';">Please go to home page !</button> 
			</div>	
			<%
					} else if (str.equalsIgnoreCase("second")) {
					String piu_id =request.getParameter("alertPIU");
					String manualalertoption =request.getParameter("manualalertoption");
					
					try {
						Context initCtx = new InitialContext();
						Context envCtx = (Context) initCtx.lookup("java:comp/env");
						DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
											
						conn = ds.getConnection();
						
				if(manualalertoption.equalsIgnoreCase("off")){
							 sql3 = "update xx_user_master set MailStatus='0' where PIU_Id="+piu_id;
							 //session.setAttribute("RealdateStatus","0");
							}
							else{
								 sql3 = "update xx_user_master set MailStatus='1' where PIU_Id="+piu_id;	
								// session.setAttribute("RealdateStatus","1");
							}
							PreparedStatement ps2 = conn.prepareStatement(sql3);
							ps2.executeUpdate();
				
					}
					catch(Exception e){
						e.printStackTrace();
						
					} finally {
					    try { conn.close(); } catch (Exception e) { /* ignored */ }
					}
					
				 
				
				%>
				<div class="alert alert-success" align="center" style="margin: 112px 0px 0px 0px;">
	<strong>Success!</strong> Alerts/Reminders Setting Changed Successfully ..... &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
	<button type="button" class="btn btn-primary" onclick="location.href='datesetting.jsp'">OK</button> 
		</div>	
		<%
		} 
							%>
							</c:if>
	<br><br><br><br><br><br><br><br><br>
	
</body>
<br><br><br><br><br><br><br><br><br><br><br><br>
		      <%@include file="included/footer.jsp" %>
</html>