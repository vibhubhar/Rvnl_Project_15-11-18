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
			document.final_approve.stage.value="first";
			document.final_approve.doc_id.value=document_id;
			//document.final_approve.user_id.value=user_id;
			//alert(user_id);
			if (PrintOpt=="Y") {
				document.final_approve.showinreport1.value="N";
			} else {
				document.final_approve.showinreport1.value="Y";
			}
			document.getElementById("final_approve").submit();
			alert("Show in Report status for document Id="+docid+" changed....");
	}
function frezedate(id, startDate) {
		jQuery.noConflict();

		var idof = id;
		//alert(startDate);
		var chunks = startDate.split('/');
		var formattedDate = [ chunks[1], chunks[0], chunks[2] ].join("/");

		$("#" + idof).datepicker({

			dateFormat : 'dd/mm/yy',
			minDate : formattedDate,
			maxDate : '0', changeYear: true

		}).datepicker("show").val();
		//var today = new Date(); var dd = today.getDate(); 

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
		jQuery.extend( jQuery.fn.dataTableExt.oSort, {
		    "date-uk-pre": function ( a ) {
		        if (a == null || a == "") {
		            return 0;
		        }
		        var ukDatea = a.split('-');
		        return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
		    },
		 
		    "date-uk-asc": function ( a, b ) {
		        return ((a < b) ? -1 : ((a > b) ? 1 : 0));
		    },
		 
		    "date-uk-desc": function ( a, b ) {
		        return ((a < b) ? 1 : ((a > b) ? -1 : 0));
		    }
		} );
		
		
	    $('#example').DataTable( {
	        columnDefs: [ {  type: 'date-uk', targets: [6,7]}, {
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
 
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Approved Documents] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div><br>	
	<%
		response.setHeader("Cache-control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
		session.removeAttribute("backurl");
		String user1 = (String) session.getAttribute("user_name");
		
	%>
	<%
		Date submittedDate;
		String stage1 = request.getParameter("stage");
		String userid1 = request.getParameter("user_id");
		String docid = request.getParameter("doc_id");
		String show1 = request.getParameter("showinreport1");
		
	%>
		
	


	<form id="final_approve" name="final_approve" method="post">
		<input type="hidden" name="stage"> <input type="hidden"
			name="doc_id"> <input type="hidden" name="user_id">
			<input type="hidden" name="approvaldate">	
			<input type="hidden" name="showinreport1">


		<c:if test="${param.stage == null}">
		
			<br>
			<table class="table table-hover table-bordered"
				style="background-color: #F0FFFF" id="example" class="display" border="1">
				<thead>
					<tr class="success">
						<th><b>SNo</b></th>
						<th><b>Project Name</b></th>
						<th><b>Package Name</b></th>
						
						<th><b>Document Type</b></th>
						<th><b>Document	No.</b></th>
						<th><b>Document Name</b></th>
					
						<th><b>Submitted date</b></th>
							 
							 
														
						<th><b>Approval Date</b></th>
						<th><b>Log Details</b></th>
						<th><b>Show in Report</b></th>
				</thead>
				<tbody id="people">
					<%
					Connection conn = null;
					ResultSet rsm=null;
					Date frezedate=null;
					String frezestr=null;
                    		int count=1;	

							try {
								
								Context initCtx = new InitialContext();
								Context envCtx = (Context) initCtx.lookup("java:comp/env");
								DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
								String userid = null;

								conn = ds.getConnection();
								String sql3 = "select User_ID from xx_user_master where User_name='"
										+ user1 + "'";
								PreparedStatement ps1 = conn.prepareStatement(sql3);
								ResultSet rs1 = ps1.executeQuery();

								if (rs1.next()) {
									userid = rs1.getString("User_ID");
									
								}
							
							
								
								String  documentno = null, documentname = null, documentType = null, project_idd = null, piu_id = null, project_id = null, document_id = null;
								Date submitiondate = null;
								String submitedbyq = "select * from xx_document_mapping where Submitted_by='"
										+ userid
										+ "' and Forwarded='yes' and Document_Status='Finally Approved' ORDER BY Date_of_Submission";

								PreparedStatement ps2 = conn.prepareStatement(submitedbyq);
								ResultSet rs2 = ps2.executeQuery();

								while (rs2.next()) {
									documentname = rs2.getString("Document_Name");
									documentno = rs2.getString("Document_Number");
									String documentType12 = rs2.getString("Document_Type");
									documentType = URLEncoder.encode(documentType12, "UTF-8");
									document_id = rs2.getString("Document_Map_ID");
									
									project_idd = rs2.getString("Project_ID");
									
									submittedDate = rs2.getDate("Date_of_Submission");
									String sD = "-";
									
									sD = new SimpleDateFormat("dd-MM-yyyy")
											.format(submittedDate);
									
									
									
									String sql12="select * from xx_record_actions where Document_id='"+document_id+"'";
									PreparedStatement psdat = conn.prepareStatement(sql12);
									ResultSet rsdat = psdat.executeQuery();
									while(rsdat.next()){
										frezedate=rsdat.getDate("Actionedon");
										
									}
									String Package_name=null;
									String sql112="select * from xx_packages_project where project_id='"+project_idd+"'";
									PreparedStatement psdat1 = conn.prepareStatement(sql112);
									ResultSet rsdat1 = psdat1.executeQuery();
									while(rsdat1.next()){
										
										 Package_name=rsdat1.getString("Package_name");										
									}
									
									frezestr = new SimpleDateFormat("dd-MM-yyyy")
									.format(frezedate);	
									String piuq = "select PIU_of_RVNL,Project from xx_projectattributes_master where project_id='"
											+ project_idd + "'";

									PreparedStatement ps3 = conn.prepareStatement(piuq);
									ResultSet rs3 = ps3.executeQuery();
									while (rs3.next()) {

										piu_id = rs3.getString("PIU_of_RVNL");
										project_id = rs3.getString("Project");

										
					%>

					<tr>
					<td><%=count%></td>
						<td><%=project_id%></td>
						<td><%=Package_name %></td>
						<td><%=documentType12%></td>
						<td><%=documentno%></td>
						<td><%=documentname%></td>
							<td><%=sD%></td>
							<td><%=frezestr%></td>
						<td><a href="recordReport.jsp?Document_Type=<%=documentType%>&doc_id=<%=document_id%>" target="_blank">
					Log Details </a></td>
			
						<%-- <td><%=piu_id%></td> --%>
<td> <select name="ShowInReport" id="ShowInReport" style="width: 205px" onchange="Showinrept('<%=document_id%>','<%=rs2.getString("ShowInReport") %>')">					 
 <%  if(rs2.getString("ShowInReport").equalsIgnoreCase("y")){ %>
 <option selected="<%=rs2.getString("ShowInReport") %>"><%=rs2.getString("ShowInReport") %></option>
 
						<!-- <option value="Y">Y</option> -->
						<option value="N">N</option>  
						
						<%}
 else {%>
  <option selected="<%=rs2.getString("ShowInReport") %>"><%=rs2.getString("ShowInReport") %></option>
 
						<!-- <option value="Y">Y</option> -->
						<option value="Y">Y</option>  
						<%} %>
						
						</select></td>

					</tr>

					<%
						
						}
								
								count++;	
								}
																	
					%>
				</tbody>
			</table>
			
				<%
				conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
			%>
		</c:if>


		<c:if test="${param.stage != null}">
	
			<%
				Connection conn = null;
					String username = (String) session.getAttribute("user_name");
					try {
						Context initCtx = new InitialContext();
						Context envCtx = (Context) initCtx.lookup("java:comp/env");
						DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
						
						conn = ds.getConnection();
						String sql3 = "update xx_document_mapping set ShowInReport='" + show1 + "' where Document_Map_ID='"
								+ docid + "'";
						PreparedStatement ps1 = conn.prepareStatement(sql3);
						ps1.executeUpdate();
											
					conn.close();
					} catch (Exception e) {
						e.printStackTrace();

					}
					response.sendRedirect("FinallyApprovedShow.jsp");
			%>
			<!--   <div class="alert alert-success" align="center">
				<strong>Success!</strong> Document Printing Status has been changed to
				<%=username %>.
				</div> -->
			

	
	</c:if>
		<br>
		<br>
	</form>
</body>

</html>