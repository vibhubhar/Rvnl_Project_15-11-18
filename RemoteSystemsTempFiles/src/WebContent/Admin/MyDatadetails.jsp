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
function showtable1() {
	//document.loginForm112.MyProject_stage.value="first";
		document.loginForm112.Project_stage.value="first"
	document.getElementById("loginForm112").submit();
}
function showtable2() {
	//document.loginForm112.MyProject_stage.value="second";
		document.loginForm112.Project_stage.value="second"
	document.getElementById("loginForm112").submit();
}

function showtable3() {
	//document.loginForm112.MyProject_stage.value="second";
		document.loginForm112.Project_stage.value="third"
	document.getElementById("loginForm112").submit();
}

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
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[Data View/Updation] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>
<div class="container" style="position:relative; margin-top:70px;">
	<form id="loginForm112" name="loginForm112" method="post">
	<INPUT TYPE="HIDDEN" NAME="realdateoption">
	<INPUT TYPE="HIDDEN" NAME="profilealertoption">
	<INPUT TYPE="HIDDEN" NAME="docactionalertoption">
	<INPUT TYPE="HIDDEN" NAME="manualalertoption">
	<INPUT TYPE="HIDDEN" NAME="alertPIU">
	<INPUT TYPE="HIDDEN" NAME="actionOption">	
	<INPUT TYPE="HIDDEN" NAME="Project_stage">
	<INPUT TYPE="HIDDEN" NAME="MyProject_stage">		
	<c:if test="${(param.MyProject_stage == null)}">	
	
	<div id="mypass" align="center">
								<br> <br>Special Password: <input type="password" id="mypass1" name="mypass1"  style="margin-left: 30px; width:150px; background-color:yellow;"/><br><br>
								<br><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<button id="appok1" type="button" class="btn btn-primary" onclick="mypasstest2();">OK</button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <button id="appcancle" type="button" class="btn btn-primary" onclick="location.href='NewIndex.jsp';">Cancel</button>
							</div>
							
							
</c:if>	
	<br><br><br><br>
												
		<div id="dialogid45" style="display: none;" align="center">
								<br> Wrong Password !!!!  .. retry .....<br>
								<br>
								<button id="appok3" type="button" class="btn btn-primary" onclick="location.reload();">Yes</button>
         <button id="appcancle3" class="btn btn-primary" type="button" onclick="$('#dialogid45').dialog('close'); location.href='NewIndex.jsp';">No</button>
							</div>
	
		<c:if test="${(param.MyProject_stage != null) and ((param.Project_stage ==  null) or (param.Project_stage == ''))}">
		
<table class="table table-hover table-bordered" style="background-color: rgb(240, 255, 255); margin: -16px 0px 0px 18px; width:90%;"><tr><td  width="15%"><strong>Item Description</strong>
</td><td width="55%" ><strong>Table Name / Query Definition</strong>
</td><td width="25%" ><strong>Filter Criteria</strong>
</td><td width="5%" ><strong>Action</strong>&nbsp;&nbsp;</td>	
							
				</tr>
				<tr><td  width="15%">Document Details:
</td><td width="55%" ><div NAME="div1" id="div1">select b.PIU_of_RVNL, c.User_name,a.Project_Id, b.Project, a.Package_Id,d.package_name, a.zone,a.Division, a.Document_Map_ID, a.Document_Type,a.Document_Number, a.Document_Name, a.Forwarded, a.Document_Status, a.Date_of_Submission, a.DateFinalize, a.ShowInReport  from xx_document_mapping a, xx_projectattributes_master b, xx_user_master c, xx_packages_project d where a.Project_ID = b.Project_ID and a.Submitted_by=c.User_ID and a.Package_ID=d.package_id </div> 	
</td><td width="25%" ><INPUT TYPE="Text" NAME="filt1" id="filt1" style="width:100%;">
</td><td width="5%" ><input type="button" id="mytable1" name="mytable1" class="btn btn-primary" value="Show" style="margin-left: 30px;" onclick="showtable1();"/><br><br></td>	
							
				</tr><tr>		
				<td >Table:
</td><td><select name="table2" id="table2" style="width: 70%;">
<%
							Connection conn3 = null;
							
								try {
									Context initCtx = new InitialContext();
									Context envCtx = (Context) initCtx.lookup("java:comp/env");
									DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
									String query3=null;
									int i=1;
									conn3 = ds.getConnection();
									 query3="show tables like 'xx_%'";
									//System.out.println("1 query"+query+" filt:"+filt1);
									Statement stmt3 = conn3.createStatement();
									ResultSet rs3 = stmt3.executeQuery(query3);
												while (rs3.next()) {
													
													String colp3 = rs3.getString(1);
													%>
													<option value="<%=colp3 %>"><%=colp3 %></option>
								
									<%
												}
												rs3.close();
												stmt3.close();
											%>
										</select>
											<%
							}
								catch(Exception e){
									e.printStackTrace();
								} finally {
	    						    try { conn3.close(); } catch (Exception e) { /* ignored */ }
	    						}
%>	
</td><td  ><INPUT TYPE="Text" NAME="filt2" id="filt2" style="width:100%;">
</td><td ><input type="button" id="mytable2" name="mytable2" class="btn btn-primary" value="Show" style="margin-left: 30px;" onclick="showtable2();"/><br><br></td>	
							
				</tr>
				<tr>		
				<td >Query :
</td><td colspan="2"><input type="Text" name="table3" id="table3" style="width: 100%;">
</td><td ><input type="button" id="mytable3" name="mytable3" class="btn btn-primary" value="Show" style="margin-left: 30px;" onclick="showtable3();"/><br><br></td>	
							
				</tr>
				
								</table>
									<br>
		<input type="button" value="close" class="btn btn-primary" onclick="location.href='NewIndex.jsp';" style="margin-left: 50%;"> 
	<br><br>

	</c:if>	
	</form>
	</div>
	<c:if test="${(param.MyProject_stage != null) and (param.Project_stage != '')}">
						<%
							//System.out.println("112334");
							Connection conn = null;
							String username = (String) session.getAttribute("user_name");
							String stage1=request.getParameter("Project_stage");
							//String ptype=request.getParameter("MyProject_stage");
							System.out.println("33333334"+stage1);
							
								try {
									Context initCtx = new InitialContext();
									Context envCtx = (Context) initCtx.lookup("java:comp/env");
									DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
									String query=null;
									int i=1;
									conn = ds.getConnection();
									if (stage1.equalsIgnoreCase("first") ) {
										String filt1=request.getParameter("filt1");
									if (filt1!=null) {
									 query="select b.PIU_of_RVNL, c.User_name,a.Project_Id, b.Project, a.Package_Id,d.package_name, a.zone,a.Division, a.Document_Map_ID, a.Document_Type,a.Document_Number, a.Document_Name, a.Forwarded, a.Document_Status, a.Date_of_Submission, a.DateFinalize, a.ShowInReport  from xx_document_mapping a, xx_projectattributes_master b, xx_user_master c, xx_packages_project d where a.Project_ID = b.Project_ID and a.Submitted_by=c.User_ID and a.Package_ID=d.package_id " + filt1;
									} else {//System.out.println("query:"+query);
									 query="select b.PIU_of_RVNL, c.User_name,a.Project_Id, b.Project, a.Package_Id,d.package_name, a.zone,a.Division, a.Document_Map_ID, a.Document_Type,a.Document_Number, a.Document_Name, a.Forwarded, a.Document_Status, a.Date_of_Submission, a.DateFinalize, a.ShowInReport  from xx_document_mapping a, xx_projectattributes_master b, xx_user_master c, xx_packages_project d where a.Project_ID = b.Project_ID and a.Submitted_by=c.User_ID and a.Package_ID=d.package_id";
									}
									//System.out.println("1 query"+query+" filt:"+filt1);
									Statement stmt = conn.createStatement();
									ResultSet rs = stmt.executeQuery(query);
							%>	
									
									<table border=1 class="table table-hover table-bordered"
											style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
											<thead>
											<tr class="success">
											<th >SN</th>
												<th >PIU</th>
												<th >Submitted By</th>
												<th>Project Id</th>
												<th>Project</th>
												<th>Package Id</th>
												<th>Package</th>
												<th>Zone</th>
												<th>Division</th>
												<th>Document Id</th>
												<th>Doc Type</th>
												<th>Doc Number</th>
												<th>Doc Name</th>
												<th>Forwarded</th>
												<th>Status</th>
												<th>Submission Date</th>
												<th>Finalization Date</th>
												<th>Show in Report</th>
												</tr></thead>
											<tbody>
											<%
												 i = 1;
												while (rs.next()) {

													String col1 = rs.getString(1);
													String col2 = rs.getString(2);
													String col3 = rs.getString(3);
													String col4 = rs.getString(4);
													String col5 = rs.getString(5);
													String col6 = rs.getString(6);
													String col7 = rs.getString(7);
													String col8 = rs.getString(8);
													String col9 = rs.getString(9);
													String col10 = rs.getString(10);
													String col11 = rs.getString(11);
													String col12 = rs.getString(12);
													String col13 = rs.getString(13);
													String col14 = rs.getString(14);
													String col15 = rs.getString(15);
													String col16 = rs.getString(16);
													String col17 = rs.getString(17);
													%>
											<tr class="active">
											<td><%=i%></td>
												<td><%=col1%></td>
												<td><%=col2%></td>
												<td><%=col3%></td>
												<td><%=col4%></td>
												<td><%=col5%></td>
												<td><%=col6%></td>
												<td><%=col7%></td>
												<td><%=col8%></td>
												<td><%=col9%></td>
												<td><%=col10%></td>
												<td><%=col11%></td>
												<td><%=col12%></td>
												<td><%=col13%></td>
												<td><%=col14%></td>
												<td><%=col15%></td>
												<td><%=col16%></td>
												<td><%=col17%></td>
												</tr>
											<%
												i++;
												}
												rs.close();
												stmt.close();
											%>
											</tbody>
											</table>
			<%
									} else if (stage1.equalsIgnoreCase("second") ) {
										String filt2=request.getParameter("filt2");
										String table2=request.getParameter("table2");
										String colnames="SELECT COLUMN_NAME  FROM INFORMATION_SCHEMA.COLUMNS  WHERE table_name = '"+table2+"' AND table_schema = 'MYSQL2'";
										if (filt2!=null) {
										 query="Select a.* from "+table2+" as a " + filt2;
										 } else {//System.out.println("query:"+query);
											 query="Select * from "+table2;
											 }
										System.out.println("1 query"+query+" filt:"+filt2+" colnames:"+colnames);
										int	colno=1;							
										Statement stmt1 = conn.createStatement();
										ResultSet rs1 = stmt1.executeQuery(colnames);
								%>	
										
										<table border=1 class="table table-hover table-bordered"
												style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
												<thead>
												<tr class="success">
												<th >SN</th>
												<%
													while (rs1.next()) {
														String head1 = rs1.getString("COLUMN_NAME");
														%>
													<th ><%=head1 %></th>
													<%
													colno++;
													}
												rs1.close();
												stmt1.close();
												//System.out.println("you are here 111");
													%>
													</tr></thead>
													<tbody>
												<%
													 
										Statement stmt = conn.createStatement();
										ResultSet rs = stmt.executeQuery(query);
								%>	
										
																			
												<%
													int row = 1;
													while (rs.next()) {
														%>
														<tr class="active">
														<td><%=row%></td>
														<%
														//System.out.println("2 query"+query+" row:"+row+" colno:"+colno);
										for (int n = 1; n < colno; n+=1) {
										String col1 = rs.getString(n);
													
												 %>
													<td><%=col1%></td>
												<%
												}
												%>
													</tr>
												<%
													row++;
													}
													rs.close();
													stmt.close();
												%>
												</tbody>
												</table>
				<%
								} else if (stage1.equalsIgnoreCase("third") ) {
									//String filt2=request.getParameter("filt3");
									String table3=request.getParameter("table3");
									int	colno=1;				
									//System.out.println("3 query"+table3);
									PreparedStatement stmt3 = conn.prepareStatement(table3);
									stmt3.executeUpdate();
									
									%>
									<br>
		<div> Query executed successfully.............</div> 
	<br><br>
	<%
								}
									%>
									<br>
		<input type="button" value="Back" class="btn btn-primary" onclick="document.loginForm112.MyProject_stage.value='NinetyNine'; document.loginForm112.Project_stage.value=''; document.getElementById('loginForm112').submit();" style="margin-left: 50%;"> 
	<br><br>
	<%
									}
								catch(Exception e){
									e.printStackTrace();
									%>
									<div> Wrong filter criteria...... please recheck... </div>
									<% 
								} finally {
	    						    try { conn.close(); } catch (Exception e) { /* ignored */ }
	    						}
				
												
							%>
								</c:if>
	<br><br><br><br><br><br><br><br><br>
	
</body>
<br><br><br><br><br><br><br><br><br><br><br><br>
		      <%@include file="included/Newfooter.jsp" %>
</html>