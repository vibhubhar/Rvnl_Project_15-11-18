<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page session="true"%>
<%@include file="sessionCheck.jsp"%>
<%@include file="included/NewHeader.jsp"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page
	import='javax.naming.*,java.sql.*,javax.sql.*,com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/sql' prefix='sql'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<html>
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<script src="resources/JS/UserIndex.js"></script>
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
<script src="resources/JS/Approval_wf230.js"></script>
<script type="text/javascript"
	src="resources/JS/datasort.js"></script>
	<link
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />
	
<style>
.ui-datepicker-year {
   background-color: #cc0000;
 padding-left:20px;
}
#example_length {
    display: none;
}
#example {
    width: inherit;
}
	

div.absolute {
   	position:absolute;
   	margin-top: 5px;
   	margin-left: 13px;
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
<script type="text/javascript">

function Showinrept(document_id,PrintOpt) {
	//alert("you are bold......"+document_id+"print choice="+PrintOpt);
			document.delete_doc_form.stage.value="first";
			document.delete_doc_form.doc_id.value=document_id;
			//document.delete_doc_form.user_id.value=user_id;
			//alert(user_id);
			if (PrintOpt=="Y") {
				document.delete_doc_form.showinreport1.value="N";
			} else {
				document.delete_doc_form.showinreport1.value="Y";
			}
			document.delete_doc_form.stage.value="first";
			document.getElementById("delete_doc_form").submit();
	}
	
function modidoc(document_id) {
		var url="C_documents1.jsp?Document_Map_ID="+document_id;
		window.open(url);
		}
</script>


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



<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<title>Final Approval</title>
</head>
<body>
<!-- <div><h4 style='width: 400px; margin-left: 27px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Documents Under Approval</h4></div>
 -->
 
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Modify Documents] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div><br>	
	<%
		response.setHeader("Cache-control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
		session.removeAttribute("backurl");
		String user1 = (String) session.getAttribute("user_name");
		String stage1 = request.getParameter("stage");
		String userid1 = request.getParameter("user_id");
		String docid = request.getParameter("doc_id");
		String show1 = request.getParameter("showinreport1");
		
	%>
	<form id="delete_doc_form" name="delete_doc_form" method="post">
		<input type="hidden" name="stage"> <input type="hidden"
			name="doc_id"> <input type="hidden" name="user_id">
			<input type="hidden" name="approvaldate">	
			<input type="hidden" name="showinreport1">
			<INPUT TYPE="HIDDEN" NAME="MyProject_stage">
			<input type="hidden" name="username" id="username">

<c:if test="${(param.MyProject_stage == null)}">	
	
	<div id="mypass" align="center">
								<br> <br>Special Password: <input type="password" id="mypass1" name="mypass1"  style="margin-left: 30px; width:150px; background-color:yellow;"/><br><br>
								
								<br><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<button id="appok1" type="button" class="btn btn-primary" onclick="mypasstest1();">OK</button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <button id="appcancle" type="button" class="btn btn-primary" onclick="location.href='NewIndex.jsp';">Cancel</button>
							</div>
							
							
</c:if>	
	
		<c:if test="${(param.MyProject_stage != null) and (param.stage == '')}">
		
			<br>
			<table class="table table-hover table-bordered"
				style="background-color: #F0FFFF" id="example" class="display" border="1">
				<thead>
					<tr class="success">
						<th><b>SNo</b></th>
						<th><b>PIU</b></th>
						<th><b>Submitted By</b></th>
						<th><b>Project Name</b></th>
						<th><b>Package Name</b></th>
						<th><b>Zone</b></th>
						<th><b>Division</b></th>
						<th><b>Document Type</b></th>
						<th><b>Document	Id</b></th>
						<th><b>Document	No.</b></th>
						<th><b>Document Name</b></th>
						<th><b>Date Finalized</b></th>
						<th><b>Submitted date</b></th>
						<th><b>Doc Status</b></th>
						<th><b>Forwarded</b></th>
						<th><b>Log Details</b></th>
						 <th><b>Show in Report</b></th> 
						 <th><b>Action</b></th> 
				</thead>
				<tbody id="people">
					<%
					Connection conn = null;
					String username=null;
					
					int count=1;	

							try {
								
								Context initCtx = new InitialContext();
								Context envCtx = (Context) initCtx.lookup("java:comp/env");
								DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
								String userid = null;
								String  piu=null, documentno = null, project=null, zone=null, divn=null, packagename=null, documentname = null, documentType = null, status=null, showinreport=null, fwd=null, document_id = null;
								Date submittedDate = null, datefinal=null;
								
								conn = ds.getConnection();
								String query="select b.PIU_of_RVNL, c.User_name, b.Project, d.package_name, a.zone,a.Division, a.Document_Map_ID, a.Document_Type,a.Document_Number, a.Document_Name, a.Forwarded, a.Document_Status, a.Date_of_Submission, a.DateFinalize, a.ShowInReport  from xx_document_mapping a, xx_projectattributes_master b, xx_user_master c, xx_packages_project d where a.Project_ID = b.Project_ID and a.Submitted_by=c.User_ID and a.Package_ID=d.package_id ";
								//System.out.println("query:"+query);
								Statement stmt = conn.createStatement();
								ResultSet rs3 = stmt.executeQuery(query);

								while (rs3.next()) {
									piu = rs3.getString("PIU_of_RVNL");
									username = rs3.getString("User_name");
									documentname = rs3.getString("Document_Name");
									documentno = rs3.getString("Document_Number");
									documentType = rs3.getString("Document_Type");
									// documentType = URLEncoder.encode(documentType12, "UTF-8");
									document_id = rs3.getString("Document_Map_ID");
									status = rs3.getString("Document_Status");
									fwd = rs3.getString("Forwarded");
									zone = rs3.getString("zone");
									divn = rs3.getString("Division");
									//showinreport = rs3.getString("ShowInReport");
									project = rs3.getString("Project");
									packagename = rs3.getString("package_name");
									
									submittedDate = rs3.getDate("Date_of_Submission");
									String sD = "-";
									
									sD = new SimpleDateFormat("dd/MM/yyyy")
											.format(submittedDate);
									
									datefinal =rs3.getDate("DateFinalize");
										
									String FD = "-";
									
									FD = new SimpleDateFormat("dd/MM/yyyy")
											.format(datefinal);
									String showrpt=rs3.getString("ShowInReport");
									if (fwd!=null) {
										if (fwd.equalsIgnoreCase("Yes") &&  showrpt.equalsIgnoreCase("Y")) { 								
					%>

					<tr style="background-color:white;">
					<%
									} else if (fwd.equalsIgnoreCase("Yes") &&  showrpt.equalsIgnoreCase("N")) {
										%>

										<tr style="background-color:#f5f9f7;">
										<%
									} else if (fwd.equalsIgnoreCase("No") ) {
										%>

										<tr style="background-color:pink;">
										<%
									} else  {
										%>

										<tr style="background-color:pink;">
										<%
									} 
									} else  {
										%>

										<tr style="background-color:pink;">
										<%
									}
									%>
					<td><%=count%></td>
						<td><%=piu%></td>
						<td><%=username%></td>
						<td><%=project%></td>
						<td><%=packagename %></td>
						<td><%=zone%></td>
						<td><%=divn%></td>
						<td><%=documentType%></td>
						<td><%=document_id%></td>
						<td><%=documentno%></td>
						<td><%=documentname%></td>
							<td><%=FD%></td>
							<td><%=sD%></td>
						<td><%=status%></td>
						<td><%=fwd%></td>
						<td><a href="recordReport.jsp?Document_Type=<%=documentType%>&doc_id=<%=document_id%>" target="_blank">
					Log Details </a></td>
					<td><%=rs3.getString("ShowInReport")%></td>
<td><input type="button" class="btn btn-primary"
							id="btnShownt<%=document_id%>" value="Modify Doc"
							onclick="Revision('<%=document_id%>','<%=username%>')"/>
							<div id="dialogid<%=document_id%>" style="display: none"
								align="center">
								<br> Are You sure... You want to modify the document<br>
								<br>
								<button id="ok" class="btn btn-primary"
									onclick="modidoc('<%=document_id%>');">ok</button>
								<button id="cancle" class="btn btn-primary"
									onclick="var $j=jQuery.noConflict();$j('#dialogid<%=document_id%>').dialog('close');">cancel</button>
							</div></td>
					</tr>

					<%
											
								count++;	
								}
																	
					%>
				</tbody>
			</table>
				<br>
<input type="button" value="close" class="btn btn-primary" onclick="location.href='NewIndex.jsp';" style="margin-left: 50%;"> 
<br><br>		
				<%
				//conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
					    try { conn.close(); } catch (Exception e) { /* ignored */ }
					}
			%>
			
		</c:if>

	<br><br><br><br>
												
		<div id="dialogid45" style="display: none;" align="center">
								<br> Wrong Password !!!!  .. retry .....<br>
								<br>
								<button id="appok3" type="button" class="btn btn-primary" onclick="location.reload();">Yes</button>
         <button id="appcancle3" class="btn btn-primary" type="button" onclick="$j('#dialogid45').dialog('close'); location.href='NewIndex.jsp';">No</button>
							</div>
							</form>	

	</body>
	<br><br><br><br><br><br><br><br><br><br><br><br>
		      <%@include file="included/Newfooter.jsp" %>
	

</html>
