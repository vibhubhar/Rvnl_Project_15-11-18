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

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />
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
	            targets: [ 4 ],
	            orderData: [ 4, 0 ]
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
String zone_id1=(String)session.getAttribute("zone_id"); 
String piu_id1=(String)session.getAttribute("piu_id"); 

String user = (String)session.getAttribute("user_name");
//System.out.println("UZER:"+user);
%>
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[Mail Action] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>
<div class="container" style="position:relative; margin-top:70px;">
	<form id="loginForm11" name="loginForm11" method="post">
	<INPUT TYPE="HIDDEN" NAME="mailoption">
	<INPUT TYPE="HIDDEN" NAME="Project_stage">		
	<c:if test="${param.Project_stage == null}">	
	
							<table style="margin: -16px 0px 0px 18px;"><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Automatic Mail Action :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<select name="mail" id="mail" style="width: 205px;">
											
						<option value="on">On</option>
						<option value="off">Off</option>
				</select></td>
						
				<td><input type="button" id="mailsent" name="mailsent" class="btn btn-primary" value="update" style="margin-left: 30px;" onclick="mailschedular();"/></td>	
						
			
			
			</tr></table><br><br>
		<%
		int count=1;;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null,rs11=null;
		String piuname=null,piu_name=null,dep_name=null,desg_name=null,user_name=null,officername=null,email_id=null,contact_no=null,mailStatus=null,Action=null;
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

		conn = ds.getConnection();
		String sql ="select * from xx_piu_master where piu_id='"+piu_id1+"'";	   
		    PreparedStatement ps1 = conn.prepareStatement(sql);   	           
	         ResultSet rs1 = ps1.executeQuery();
	         while(rs1.next()){
	        	 piuname=rs1.getString("PIU_Name")	; 
	         }
		String query = "select PM.PIU_Name,dep.Department_Name,des.Designation_Name,usr.User_name,usr.Officer_Name,usr.Email_Id,usr.Contact_No,usr.MailStatus from  xx_departments_master dep , xx_piu_master PM , xx_user_master usr  LEFT Join xx_designation_master des on des.Designation_Id = usr.Designation_Id where usr.department_id = dep.Department_Id and usr.PIU_ID = PM.PIU_Id and PM.PIU_Name ='"+piuname+"'";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		%>
				
							<table class="table table-hover table-bordered" id="example" class="display"
					style="background-color: #F0FFFF;">
					<thead>
		<tr class="success">
								<th ><b>SNo</b></th> 
									<th style="width: 350px;"><b>Department</b></th>
									<th style="width: 350px;"><b>UserId</b></th>
									<th style="width: 350px;"><b>Officer Name</b></th>
									<th style="width: 350px;"><b>Designation</b></th>
									<th style="width: 350px;"><b>Email Id</b></th>
									<th width="200"><b>Contact No</b></th>
									
									<th ><b>Auto Mail Action</b></th>

								</tr></thead>
								<tbody>
								<%
								while (rs.next()) {
									 piu_name= rs.getString(1);
						        	 dep_name= rs.getString(2);
						        	 desg_name= rs.getString(3);
						        	 user_name= rs.getString(4);
						        	 officername= rs.getString(5);
						        	 email_id= rs.getString(6);
						        	 contact_no= rs.getString(7);
						        	 mailStatus= rs.getString(8);
							if(mailStatus.equalsIgnoreCase("1")){
								Action="On";
							}else{
								Action="Off";
							}
									%>
									<tr class="active">
			<td><%=count%></td>
			<td><%=dep_name%></td>
			<td><%=user_name%></td>
			<td><%=officername%></td>
			<td><%=desg_name%></td>
			<td><%=email_id%></td>
			<td><%=contact_no%></td>
			<%if(Action.equalsIgnoreCase("On")) {
			%>
			
			<td style="color:green;text-decoration:underline;"><%=Action%></td>
			
			<%}else{
				%>
				
				<td style="color:red;text-decoration:underline;"><%=Action%></td>
				
				<%	
			}
			
			
			count++;}
								conn.close();
 %>
							</table>
						
				


	</c:if>	
	</form>
	</div>
	<div id="dialogid" style="display: none"
								align="center">
								<br> Are you Sure you want to On Mail Action<br>
								<br>
								<button id="appok" class="btn btn-primary" onclick="SendMail('<%=piu_id1%>');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="$('#dialogid').dialog('close');">cancel</button>
							</div>
							<div id="dialogid1" style="display: none"
								align="center">
								<br> Are you Sure You want to Off Mail Action<br>
								<br>
								<button id="appok" class="btn btn-primary" onclick="SendMail('<%=piu_id1%>');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="$('#dialogid1').dialog('close');">cancel</button>
							</div>
							<c:if test="${param.Project_stage != null}">
							<%
							String sql3=null;
							
							Connection conn = null;
								String username = (String) session.getAttribute("user_name");
								String piuid=request.getParameter("Project_stage");
								String mailstatus=request.getParameter("mailoption");
								
								try {
									Context initCtx = new InitialContext();
									Context envCtx = (Context) initCtx.lookup("java:comp/env");
									DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
									
										
									conn = ds.getConnection();
									if(mailstatus.equalsIgnoreCase("off")){
									 sql3 = "update xx_user_master set MailStatus='0' where PIU_ID='"+ piuid + "'";
									}
									else{
										 sql3 = "update xx_user_master set MailStatus='1' where PIU_ID='"+ piuid + "'";	
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
				<strong>Success!</strong> Action Performed Successfully By.
				<%=username %>. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-primary" onclick="location.href='mailaction.jsp'">Want to change Status !</button>
			</div>
							</c:if>
							
	<br><br><br><br><br><br><br><br><br>
	
</body>
<br><br><br><br><br><br><br><br><br><br><br><br>
		      <%@include file="included/Newfooter.jsp" %>
</html>