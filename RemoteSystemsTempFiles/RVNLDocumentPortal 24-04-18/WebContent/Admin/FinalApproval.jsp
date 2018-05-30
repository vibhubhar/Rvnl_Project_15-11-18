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
	<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />
	
<script src="resources/JS/Approval_wf230.js"></script>
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
	</style>
<script type="text/javascript">
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
<script type="text/javascript"
	src="resources/JS/datasort.js"></script>
	<link
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />

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
	        columnDefs: [{  type: 'date-uk', targets: [6] }, {
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

<title>Final Approval</title>
</head>
<body>
<!-- <div><h4 style='width: 400px; margin-left: 27px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Documents Under Approval</h4></div>
 -->
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Documents Under Approval] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>
 
 	<%
		response.setHeader("Cache-control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
		session.removeAttribute("backurl"); 
		String user1 = (String) session.getAttribute("user_name");
		String rdstatus = (String) session.getAttribute("RealdateStatus");

		Date submittedDate;
		String stage1 = request.getParameter("stage");
		String userid1 = request.getParameter("user_id");
		String docid = request.getParameter("doc_id");
		
	%>
		
	<%-- <h4 align="left" style='width: 300px; margin-left: 27px'>
		<font style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font
			color="#99CC00">:&nbsp;<%=(String) session.getAttribute("user_name")%></font>
	</h4> --%>



	<form id="final_approve" name="final_approve" method="post">
		<input type="hidden" name="stage"> <input type="hidden"
			name="doc_id"> <input type="hidden" name="user_id">
			<input type="hidden" name="approvaldate">	


		<c:if test="${param.stage == null}">
		
			<br>
			<table class="table table-hover table-bordered" width="100%"
				style="background-color: #F0FFFF" id="example" class="display">
				<thead>
					<tr class="success">
						<th><b>SNo</b></th>
						<th><b>Project Name</b></th>	
						<th><b>Package Name</b></th>
						
						<th><b>Document Type</b></th>
						<th><b>Document No.</b></th>
						<th><b>Document Name</b></th>
					
						<th><b>Submitted date</b></th>
						<th><b>Log Details</b></th>
						<th><b>Approval Date</b></th>
						<th><b>Change Status</b></th>
				</thead>
				<tbody id="people">
					<%
					int x = 0;
						Connection conn = null;
					ResultSet rsm=null;
					Date frezedate=null;
					String frezestr=null;
					SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
					String rd = df.format(new Date());
                    

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
							
								
								String q1="select * from xx_moreammendments where status ='return' AND action_to ='"+ user1 +"'";
								
								Statement statement = conn.createStatement();
								rsm = statement.executeQuery(q1);
								java.util.ArrayList<String> al=new java.util.ArrayList<String>();
	                            while(rsm.next()){
								 docid=rsm.getString("document_id");

								al.add(docid);
	                            }
								for(String obj:al) { 
								  
								}

								
								String documentno = null, documentname = null, documentType = null, project_idd = null, piu_id = null, project_id = null, document_id = null;
								Date submitiondate = null;
								String submitedbyq = "select * from xx_document_mapping where Submitted_by='"
										+ userid
										+ "' and Forwarded='yes' and Document_Status='pending' ORDER BY Date_of_Submission";
								
								PreparedStatement ps2 = conn.prepareStatement(submitedbyq);
								ResultSet rs2 = ps2.executeQuery();
								String packageid=null;
								while (rs2.next()) {
									documentname = rs2.getString("Document_Name");
									documentno = rs2.getString("Document_Number");
									String documentType12 = rs2.getString("Document_Type");
									documentType = URLEncoder.encode(documentType12, "UTF-8");
									document_id = rs2.getString("Document_Map_ID");
									
                                    packageid=rs2.getString("Package_ID");
									project_idd = rs2.getString("Project_ID");
									project_idd = rs2.getString("Project_ID");
									
									submittedDate = rs2.getDate("Date_of_Submission");
									String sD = "-";
									sD = new SimpleDateFormat("dd-MM-yyyy")
											.format(submittedDate);
									
									
									
									String sql12="select * from xx_record_actions where Document_id='"+document_id+"'";
									
									PreparedStatement psdat = conn.prepareStatement(sql12);
									ResultSet rsdat = psdat.executeQuery();
									while(rsdat.next()){
										frezedate=rsdat.getDate("CurrentDate");
										
									}
									String Package_name=null;
									String sql112="select * from xx_packages_project where package_id='"+packageid+"'";
									
									PreparedStatement psdat1 = conn.prepareStatement(sql112);
									ResultSet rsdat1 = psdat1.executeQuery();
									while(rsdat1.next()){
										
										 Package_name=rsdat1.getString("Package_name");										
									}
									 SimpleDateFormat AppDateFormat = new SimpleDateFormat("MM/dd/yyyy");
									frezestr = AppDateFormat.format(frezedate);	
									String piuq = "select PIU_of_RVNL,Project from xx_projectattributes_master where project_id='"
											+ project_idd + "'";
									
									PreparedStatement ps3 = conn.prepareStatement(piuq);
									ResultSet rs3 = ps3.executeQuery();
									while (rs3.next()) {

										piu_id = rs3.getString("PIU_of_RVNL");
										project_id = rs3.getString("Project");


										x = x + 1;
					%>

					<tr><td><%=x%></td>
						<td><%=project_id%></td>
						<td><%=Package_name %></td>
						<td><%=documentType12%></td>
						<td><%=documentno%></td>
						<td><%=documentname%></td>
							<td><%=sD%></td>
							<td><a href="recordReport.jsp?Document_Type=<%=documentType%>&doc_id=<%=document_id%>" target="_blank">
					Log Details </a>
			</td>
	<%
	//System.out.print("Real Date Status"+rdstatus+rd);
	//System.out.print("Cut off date"+frezedate+frezestr);
if (rdstatus.equalsIgnoreCase("0")) { 
%>			
						<%-- <td><%=piu_id%></td> --%>

						<td><input type="text" id="ApprovalDate<%=document_id%>"
							name="ApprovalDate<%=document_id%>" class="mydatepickers" readonly="true" 
							onclick="frezedate('ApprovalDate<%=document_id%>','<%=frezestr%>')"
							style="width: 150px"></td>
<%
} else {
%>
<td><input type="text" id="ApprovalDate<%=document_id%>"
							name="ApprovalDate<%=document_id%>"  readonly="true"
							style="width: 150px; background-color: lightgray;" value=<%=rd %>></td>
<%
}
 if(al.contains(document_id))
							{
							
							%>
						<!-- <td><button id ="FinalApp" type="button" class="btn btn-primary" style="color:white;" onclick="FinalApproval('<%=document_id%>','<%=userid%>')">Finally Approved</button></td> -->
						<td><input type="button" class="btn btn-primary"
							id="btnShownt<%=document_id%>" value="Finally Approved"
							onclick="FinalApproval('<%=document_id%>','<%=userid%>')" style="background:green;"/>

                          <% } else {%>
                          
                          
                          <td><input type="button" class="btn btn-primary"
							id="btnShownt<%=document_id%>" value="Finally Approved"
							onclick="FinalApproval('<%=document_id%>','<%=userid%>')" disabled style="background:#d3d3d3;color: grey;"/>
                         
                          <% }%>
                         
							<div id="dialogid<%=document_id%>" style="display: none"
								align="center">
								<br> Are You Sure You Want To Finally Approve<br>
								<br>
								<button id="ok" class="btn btn-primary"
									onclick="finalapproval2nd('<%=document_id%>','<%=userid%>');">ok</button>
								<button id="cancle" class="btn btn-primary"
									onclick="var $j=jQuery.noConflict();$j('#dialogid<%=document_id%>').dialog('close');">cancel</button>
							</div></td>

					</tr>

					<%
						}
									
								}
					%>
				</tbody>
			</table>
			<div id="dapprovaldate" style="display: none" align="center">
					 <br>
       Please Fill Approval Date.<br><br>
        <button id="appok" class="btn btn-primary" onclick="var $j=jQuery.noConflict();$j('#dapprovaldate').dialog('close');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="var $j=jQuery.noConflict();$j('#dapprovaldate').dialog('close');">cancel</button>
    </div>
			<%
				//conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
					    try { conn.close(); } catch (Exception e) { /* ignored */ }
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
						String userid = null;
						String approvaldate=request.getParameter("approvaldate");
						Date date =new SimpleDateFormat("dd/MM/yyyy").parse(approvaldate);
						java.sql.Date approvaldate1 = new java.sql.Date(date.getTime());
						
						conn = ds.getConnection();

						String sql3 = "update xx_document_mapping set Document_Status='Finally Approved' where Document_Map_ID='"
								+ docid + "'";
						PreparedStatement ps1 = conn.prepareStatement(sql3);
						ps1.executeUpdate();

						String sql4 = "update xx_approval_workflow set Action='Y' where Document_id='"
								+ docid + "'";
						PreparedStatement ps2 = conn.prepareStatement(sql4);
						ps2.executeUpdate();

						%>
						
						<sql:update dataSource="jdbc/MySQLDB" var="rs">
  update xx_moreammendments set status ='Approved' where document_id =<%=docid%>
				</sql:update>
						<%
						
						String sql6 = "update xx_record_actions set ActionPerformed='Finally Approved',ActionedOn='"+approvaldate1+"',Information='Finally Approved', Real_ActionDate=now() where Document_id='"+docid+"' and ActionPerformed='pending'";
						PreparedStatement ps4 = conn.prepareStatement(sql6);
						ps4.executeUpdate();

/*						String sql5 = "insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Real_ActionDate) Values ('"
								+ docid
								+ "','"+approvaldate1+"','Finally Approved','"
								+ username
								+ "' now())";
						PreparedStatement ps3 = conn.prepareStatement(sql5);
						ps3.executeUpdate();  */

						//conn.close();
					} catch (Exception e) {
						e.printStackTrace();

					} finally {
					    try { conn.close(); } catch (Exception e) { /* ignored */ }
					}
			%>
			<div class="alert alert-success" align="center" style="margin: 112px 0px 0px 0px;">
				<strong>Success!</strong> Document has been finally approved by
				<%=username %>. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-primary" onclick="location.href='FinalApproval.jsp'">Want to Approve More Documents !</button>
			</div>

		</c:if>
		<br>
		<br>
	</form>
	
	<br>
	<br>
	<br>
	<br>
	<%@include file="included/Newfooter.jsp"%>
	
</body>

</html>