<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@include file="sessionCheck.jsp"%>
<%@include file="included/NewHeader.jsp"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approval WorkFlow</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<link href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.css"/>
<script type="text/javascript" src="resources/JS/backButton.js"></script>
<script type="text/javascript" src="resources/JS/validate230.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script type="text/javascript" src="http://www.allmyscripts.com/Table_Sort/beta/gs_sortable.js"></script>

 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> 
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
     <script type="text/javascript"
	src="resources/JS/datasort.js"></script>
	<link
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css" rel="stylesheet" type="text/css" /> 
  
<script src="resources/JS/Approval_wf230.js"></script>
<style>
.ui-datepicker-year {
   background-color: #cc0000;
 padding-left:20px;
}
</style>

<script type="text/javascript">

function frezedate(id,startDate){
	jQuery.noConflict();
	
	var idof=id;
	//alert(startDate);
	var chunks = startDate.split('/');
var formattedDate = [chunks[1],chunks[0],chunks[2]].join("/");
	
	$("#"+idof).datepicker({
		
		dateFormat : 'dd/mm/yy',
		minDate:formattedDate,
		maxDate:'0', changeYear: true
		
		
	}).datepicker( "show").val();
	//var today = new Date(); var dd = today.getDate(); 
	
}

</script>

<script type="text/javascript">
	var people, asc1 = 1, asc2 = 1, asc3 = 1;
	asc4 = 1;
	asc5 = 1;
	asc6 = 1;
	asc7 = 1;
	asc8 = 1;
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
</script>
<script>	
	
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
		
		
		
	    $('#my_table').DataTable( {
	         	       
  			"infoCallback": function( settings, start, end, max, total, pre ) {
				if (max==total) { return "Showing " + (end-start+1) + "  of " +total+" records"}
				else {return "Showing " + (end-start+1) + "  of " +total+" records (filtered from total " + max+" records)"}
			   	},
	 
	  dom: 'ftip',
			    columnDefs:   [ {  type: 'date-uk', targets: [7,9]}, { targets: [10,11,12,13,14],"orderable":false }  ]
	    } );
	} );
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
   
	<%
		String user = (String) session.getAttribute("user_name");
		user=user.trim();
		session.removeAttribute("backurl"); 
		
	%>
	<%-- <h4 align="left" style='width: 300px;'>
		<font >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;My Task&nbsp;</font><font color="#99CC00">&nbsp;</font>
	</h4>
	
	<h3 align="left" style='width: 300px; margin-left: 10px'>
		<font style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font
			color="#99CC00">:&nbsp;<%=(String) session.getAttribute("user_name")%></font>
	</h3> --%>
	
	<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[My Task] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div><br>
	<div class="container" style="    margin-top: 44px;
    margin-left: 24px;">
		<form action="" id="Apprwfl" name="Apprwfl" >
			<INPUT TYPE="HIDDEN" NAME="Stage"> 
			<INPUT TYPE="HIDDEN" NAME="Doc_Id"> 
			<INPUT TYPE="HIDDEN" NAME="Doc_no"> 
			<INPUT TYPE="HIDDEN" NAME="RequestedBy">
			<INPUT TYPE="HIDDEN" NAME="Action">
			<INPUT TYPE="HIDDEN" NAME="AddedBy">
			<INPUT TYPE="HIDDEN" NAME="usern">

			<%
				String document_id_i = null;
				String requested_by_b = null;
				String doc_no_n = null;
				String rdstatus = (String) session.getAttribute("RealdateStatus");
			%>

			<c:if test="${param.Stage == null}">
				<%
				Connection conn = null;
				String pendingfrm1=null,pendingfrm2=null;
				PreparedStatement ps = null, ps2 = null, hierPS = null,ps11=null;
				ResultSet rs = null, rs2 = null, hierRS = null,rs11=null;
				
				String document_id = null, added_by = null, zone_hierarchy_id = null, assigned_to = null, div_hierarchy_id = null;
				String doc_no = null, doc_name = null, docType = null, hier_type = null, requested_by = null, division = null;
				String remark = null;
				Date submittedDate,pendingfrm=null;
			try {
					Context initCtx = new InitialContext();
						Context envCtx = (Context) initCtx.lookup("java:comp/env");
						DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
						conn = ds.getConnection();
						String sql1 = "select * from xx_document_mapping DM, xx_approval_workflow AW where DM.Document_Map_ID = AW.Document_id and AW.action ='N' and AW.assigned_to = '"+user+"'";
						ps = conn.prepareStatement(sql1);
						rs = ps.executeQuery();
										
				%>
				<div class='scrollit' style='overflow-x: scroll;width: 115%;position:relative;'>
				<table class="table table-hover table-bordered"	id="my_table" style="background-color:#F0FFFF;" class="display" width="100%">
					<thead><tr class="success">
					<!--  
					<th onclick="sort_table(people, 0, asc1); asc1 *= -1; asc2 = 1; asc3 = 1;"><b style="text-decoration: underline;">SNo </b>&#8593;&nbsp;&#8595;</th>
					
					<th onclick="sort_table(people, 1, asc2); asc1 *= -1; asc2 = 1; asc3 = 1;"><b style="text-decoration: underline;">PIU Name </b>&#8593;&nbsp;&#8595;</th>
						
						<th onclick="sort_table(people, 3, asc4); asc3 *= -1; asc4 = 1; asc1 = 1;"><b style="text-decoration: underline;" >Project Name  </b>&nbsp;&nbsp;&nbsp;&#8593;&nbsp;&#8595;</th>
						<th onclick="sort_table(people, 2, asc3);asc5 *= -1; asc6 = 1; asc7 = 1;"><b style="text-decoration: underline;">Package Name  </b>&nbsp;&nbsp;&nbsp;&#8593;&nbsp;&#8595;</th>
						<th onclick="sort_table(people, 4, asc5); asc2 *= -1; asc3 = 1; asc4 = 1;"><b style="text-decoration: underline;">Document Number</b>&nbsp;&nbsp;&nbsp;&#8593;&nbsp;&#8595;</th>
						<th onclick="sort_table(people, 5, asc6); asc5 *= -1; asc6 = 1; asc7 = 1;"><b style="text-decoration: underline;">Document Type </b>&nbsp;&nbsp;&nbsp;&#8593;&nbsp;&#8595;</th>
						<th onclick="sort_table(people, 6, asc7); asc2 *= -1; asc3 = 1; asc4 = 1;"><b style="text-decoration: underline;">Document Name</b>&nbsp;&nbsp;&nbsp;&#8593;&nbsp;&#8595;</th>
						<th onclick="sort_table(people, 7, asc8); asc6 *= -1; asc7 = 1; asc1 = 1;"><b style="text-decoration: underline;">Submission Date</b>&nbsp;&nbsp;&#8595;</th>
						<th onclick="sort_table(people, 8, asc9); asc6 *= -1; asc7 = 1; asc1 = 1;"><b style="text-decoration: underline;">Requested By</b>&nbsp;&nbsp;&nbsp;&#8593;&nbsp;&#8595;</th>
						<th sort_table(people, 2, asc3); asc3 *= -1; asc4 = 1; asc5 = 1;"><b style="text-decoration: underline;">Pending since</b>&nbsp;&nbsp;&nbsp;&#8593;&nbsp;&#8595;</th> -->
						
						<th><b >SNo </b></th>
						<th><b >PIU Name </b></th>
						<th><b  >Project Name  </b></th>
						<th><b >Package Name  </b></th>
						<th><b >Document Number</b></th>
						<th><b >Document Type </b></th>
						<th><b >Document Name</b></th>
						<th><b >Submission Date</b></th>
						<th><b >Requested By</b></th>
						<th><b >Pending since</b></th> 					
						<th>Log Details </b></th>
						
						<th><b >Action Date</b></th>
						<th style="text-align:center;">Action 1</th>
						<th style="text-align:center;">Action 2</th>
						<th style="text-align:center;">Action 3</th> 
						</tr></thead>
						<tbody id="people">
						<%
						int count=0;
							String hier_id = null, c_level = null;
								while (rs.next()) {
									document_id = rs.getString(1);
									added_by = rs.getString(8);
									c_level = rs.getString(23);
									String zh_id = rs.getString(12);
									String dh_id = rs.getString(13);
									
									if(document_id !=null){
										
										String q1="select * from xx_record_actions where document_id = '"+document_id+"'";
										ps11 = conn.prepareStatement(q1);
										rs11 = ps11.executeQuery();
										while(rs11.next())
											
										{
											pendingfrm=rs11.getDate("CurrentDate");
											
											
										}
										
										pendingfrm1 = new SimpleDateFormat("dd-MM-yyyy")
										.format(pendingfrm);
										 pendingfrm2 = new SimpleDateFormat("MM/dd/yyyy")
										.format(pendingfrm);
										
										
										
									}
									
									

									if (zh_id != null) {
										hier_id = rs.getString(12);
										String getHier = "select * from xx_doc_zones_hierarchy where hierarchy_id = '"
												+ hier_id + "'";
										hierPS = conn.prepareStatement(getHier);
										hierRS = hierPS.executeQuery();
										String level = null;
										while (hierRS.next()) {
											level = hierRS.getString("level");
										}
									} else if (dh_id != null) {
										hier_id = rs.getString(13);
										String getHier = "select * from xx_doc_divisions_hierarchy where hierarchy_id = '"
												+ hier_id + "'";
										hierPS = conn.prepareStatement(getHier);
										hierRS = hierPS.executeQuery();
										String level = null;
										while (hierRS.next()) {
											level = hierRS.getString("level");
										}
									}
									
									String sql2 = "select user_name from xx_user_master where user_id = '"
											+ added_by + "'";
									ps2 = conn.prepareStatement(sql2);
									rs2 = ps2.executeQuery();

									zone_hierarchy_id = rs.getString(12);
									assigned_to = rs.getString(19);
									div_hierarchy_id = rs.getString(13);
									doc_no = rs.getString(2);
									docType = rs.getString(3);
									doc_name = rs.getString(4);
									submittedDate = rs.getDate(6);
									division = rs.getString(16);
									String SD = new SimpleDateFormat("dd-MM-yyyy")
											.format(submittedDate);

									hier_type = rs.getString("hierarchyType");

									while (rs2.next()) {
										requested_by = rs2.getString(1);

									}
									String packane=null;
									
									String sqlprojectid = "select Project_ID,Package_ID,Document_Type from xx_document_mapping where Document_Map_ID='"
											+ document_id + "'";
									PreparedStatement pspid = conn
											.prepareStatement(sqlprojectid);
									ResultSet rspid = pspid.executeQuery();
									String project = "", piu = "",documentType=null;
									while (rspid.next()) {
										
										String Projectid = rspid.getString("Project_ID");
										String Packageid = rspid.getString("Package_ID");
										String documentType2=rspid.getString("Document_Type");
										documentType = URLEncoder.encode(documentType2, "UTF-8");
										String pack="select * from xx_packages_project where package_id='"+ Packageid + "'";
										PreparedStatement pspro1 = conn
												.prepareStatement(pack);
										ResultSet rspro1 = pspro1.executeQuery();
										while(rspro1.next())
										{
											packane=rspro1.getString("package_name");
											
										}	
										String sqlproject = "select Project,PIU_of_RVNL from xx_projectattributes_master where project_ID='"+ Projectid + "'";
										PreparedStatement pspro = conn
												.prepareStatement(sqlproject);
										ResultSet rspro = pspro.executeQuery();
										while (rspro.next()) {
											project = rspro.getString("Project");
											piu = rspro.getString("PIU_of_RVNL");
                                          count=count+1;
										}
									}
						%>
					<tr  class="active">
					<td><%=count%></td>
					<td><%=piu%></td>
                        
						<td><%=project%></td>
						<td><%=packane%></td>
						<td><%=doc_no%></td>
						<td><%=doc_name%></td>
						<td><%=docType%> <INPUT TYPE="HIDDEN" NAME="C_Level"
							id="C_Level" Value="<%=c_level%>"></td>

						<td><%=SD%></td>
						<td><%=requested_by%></td>
						
						<!-- <td><button id ="Approve" type="button" class="btn btn-primary" onclick="approved('<%=document_id%>','<%=added_by%>','<%=c_level%>')">Approve</button></td> -->
						<td><%=pendingfrm1 %></td>	
						<td><a href="recordReport.jsp?Document_Type=<%=documentType%>&doc_id=<%=document_id%>" target="_blank">
					Log Details </a>
			</td>
<%
SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
String rd = df.format(new Date());
	//System.out.print("Real Date Status"+rdstatus+rd);
if (rdstatus.equalsIgnoreCase("0")) { 
%>			
			<td><input  type="text" id="ApprovalDate<%=document_id %>" name="ApprovalDate<%=document_id %>" class="mydatepickers" readonly="true" onclick="frezedate('ApprovalDate<%=document_id %>','<%=pendingfrm2%>')"
							style="width: 100px"></td>
					<%
} else {
%>
<td><input type="text" id="ApprovalDate<%=document_id%>"
							name="ApprovalDate<%=document_id%>"  readonly="true"
							style="width: 100px; background-color: lightgray;" value=<%=rd %>></td>
<%
}
%>	
	
						<td><input style="font-size:14px;" type="button" class="btn btn-primary" id="btnShow<%=document_id%>" value="Forward 
								With Approval"  onclick="lforward('<%=document_id%>','<%=requested_by%>','<%=doc_no%>','<%=user%>','<%=division%>','Forward With Approval')"/>
								
								
								
					 <div id="dialog<%=document_id%>" style="display: none" align="center">
					 <br>
        Are You Sure You Want To Forward<br><br>
        <button id="ok" class="btn btn-primary" onclick="lforward2nd('<%=document_id%>','<%=requested_by%>','<%=doc_no%>','<%=user%>','<%=division%>','Forward With Approval')" >ok</button>
         <button id="cancle" class="btn btn-primary" onclick="$('#dialog<%=document_id%>').dialog('close');">cancel</button>
    </div>
   
    </td>
    
    <!--   second popup code------------------------------------------------------ -->  
    <td><input style="font-size:14px;"  type="button" class="btn btn-primary" id="btnShownt<%=document_id%>" value="Forward
								Without Approval" onclick="lforward('<%=document_id%>','<%=requested_by%>','<%=doc_no%>','<%=user%>','<%=division%>','Forward Without Approval')"/>
								
								
								
					 <div id="dialognt<%=document_id%>" style="display: none" align="center">
					 <br>
        Are you sure you want to Forward Without Approval<br><br>
        <button id="ok" class="btn btn-primary" onclick="lforward2nd('<%=document_id%>','<%=requested_by%>','<%=doc_no%>','<%=user%>','<%=division%>','Forward Without Approval')">ok</button>
         <button id="cancle" class="btn btn-primary" onclick="$('#dialognt<%=document_id%>').dialog('close');">cancel</button>
    </div>
   
    </td>
     <!--   END of Second  popup code------------------------------------------------------ --> 
      <!--   Third  popup code of return------------------------------------------------------ -->   
      
       <td><input style="font-size:14px;" type="button" class="btn btn-primary" id="btnShowret<%=document_id%>" value="Return To RVNL (Without Approval)" onclick="returned('<%=document_id%>','<%=requested_by%>','<%=doc_no%>','<%=user%>','<%=division%>','return')" />
								
								
								
					 <div id="dialogret<%=document_id%>" style="display: none" align="center">
					 <br>
        Are You Sure You Want To Return<br><br>
        <button id="ok" class="btn btn-primary" onclick="returned2nd('<%=document_id%>','<%=requested_by%>','<%=doc_no%>','<%=user%>','<%=division%>','return')">ok</button>
         <button id="cancle" class="btn btn-primary" onclick="$('#dialogret<%=document_id%>').dialog('close');">cancel</button>
    </div>
   
    </td>
     					</tr>
					<%
						}

								try {
									//if (document_id.equals("")) {
										if (count==0) {
										%>

										<div style="color:RED;text-align:center;margin-bottom: 29px;
							margin-top: 0px;"><b> There is no document pending for your approval..... </b></div>

										<%
									}
								} catch (Exception e) {
			
				e.printStackTrace();

								}
								
			} catch(Exception e){
				
				e.printStackTrace();
			} finally {
						
			    try { rs.close(); } catch (Exception e) { /* ignored */ }
			    try { rs2.close(); } catch (Exception e) { /* ignored */ }
			    try { rs11.close(); } catch (Exception e) { /* ignored */ }
			    try { hierRS.close(); } catch (Exception e) { /* ignored */ }
			    try { ps.close(); } catch (Exception e) { /* ignored */ }
			    try { ps2.close(); } catch (Exception e) { /* ignored */ }
			    try { ps11.close(); } catch (Exception e) { /* ignored */ }
			    try { hierPS.close(); } catch (Exception e) { /* ignored */ }
			    try { conn.close(); } catch (Exception e) { /* ignored */ }
			}
							//	conn.close();
					%>
				</tbody></table>
				</div>
				
				 <div id="dapprovaldate" style="display: none" align="center">
					 <br>
       Please Fill Action Date.<br><br>
        <button id="appok" class="btn btn-primary" onclick="$('#dapprovaldate').dialog('close');">ok</button>
         <button id="appcancle" class="btn btn-primary" onclick="$('#dapprovaldate').dialog('close');">cancel</button>
    </div>
			</c:if>
			<c:if test="${param.Stage != null}">
				<%
					String remark = request.getParameter("remark");
						if (request.getParameter("Stage").equalsIgnoreCase("actioned")) {
							if (request.getParameter("Action").equalsIgnoreCase(
									"approved")) {
								String doc_id = request.getParameter("Doc_Id");
								String document_id = request
										.getParameter("document_id");
								String addedBy = request.getParameter("AddedBy");
								
								PreparedStatement getLevelPS = null, getUserPS = null, MaxPS = null, getUser = null;
								ResultSet getLevelRS = null, getUserRS = null, MaxRS = null, UserRs = null;
								Connection conn = null;
								try {
								Context initCtx = new InitialContext();
								Context envCtx = (Context) initCtx
										.lookup("java:comp/env");
								DataSource ds = (DataSource) envCtx
										.lookup("jdbc/MySQLDB");
								
								conn = ds.getConnection();
								String getLevel = "select * from xx_approval_workflow where document_id = '"
										+ doc_id + "'";
								getLevelPS = conn.prepareStatement(getLevel);
								getLevelRS = getLevelPS.executeQuery();
								String zh_id = null, hier_id = null, dh_id = null, assigned_to = null;

								String c_levels = request.getParameter("C_Level");
								int c_level = Integer.parseInt(c_levels);
								if (getLevelRS.next()) {
									zh_id = getLevelRS.getString(4);
									assigned_to = getLevelRS.getString(5);
									dh_id = getLevelRS.getString(6);

									PreparedStatement hierPS = null;
									ResultSet hierRS = null;

									
									if (zh_id != null) {
										hier_id = getLevelRS.getString(4);
										String getMax = "select MAX(CAST(level AS SIGNED)) from xx_doc_zones_hierarchy where hierarchy_id ='"
												+ hier_id + "'";
										MaxPS = conn.prepareStatement(getMax);
										MaxRS = MaxPS.executeQuery();
										int level = 0;
										String slevel = null;
										while (MaxRS.next()) {
											slevel = MaxRS.getString(1);
											level = Integer.parseInt(slevel);
										}
										if (c_level < level) {
											int c_level2 = c_level + 1;
											String getHier = "select * from xx_doc_zones_hierarchy where hierarchy_id ='"
													+ hier_id
													+ "' and level = '"
													+ c_level2 + "'";
											hierPS = conn.prepareStatement(getHier);
											hierRS = hierPS.executeQuery();
											String zone = null, dept = null, desg = null;
											while (hierRS.next()) {
												zone = hierRS.getString(4);
												dept = hierRS.getString(6);
												desg = hierRS.getString(7);
											}
											String getU = "select user_name from xx_user_master where zone_id =(select zone_id from xx_zones_master where zone_name = '"
													+ zone
													+ "') and division_id = 86 and department_id =  (select department_id from xx_departments_master where department_name = '"
													+ dept
													+ "') and Designation_Id = (select designation_id from xx_designation_master where designation_name ='"
													+ desg + "')";
											getUser = (PreparedStatement) conn
													.prepareStatement(getU);
											getUser = (PreparedStatement) conn
													.prepareStatement(getU);
											UserRs = getUser.executeQuery();
											String assign_to = null;
											while (UserRs.next()) {
												assign_to = UserRs.getString(1);
											}
											Date dNow = new Date();
											SimpleDateFormat ft = new SimpleDateFormat(
													"dd/MM/yyyy");
											ft.format(dNow);
											

											Statement insertStmt = (Statement) conn
													.createStatement();
											String insertStg = "insert into xx_approval_workflow (Document_id,Added_byUser,zone_hierarchy_id,Assigned_To,Action,CurrentDate,level) Values ('"
													+ doc_id
													+ "','"
													+ addedBy
													+ "','"
													+ hier_id
													+ "','"
													+ assign_to
													+ "','N',CURDATE(),'"
													+ c_level2
													+ "')";
											insertStmt.executeUpdate(insertStg);
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
                    update xx_approval_workflow set action ='Y' where document_id =<%=doc_id%> and level ='<%=c_level%>'
                  </sql:update>
				<%
					}
									} else if (dh_id != null) {
										hier_id = getLevelRS.getString(6);
										
										String getMax = "select MAX(CAST(level AS SIGNED)) from xx_doc_divisions_hierarchy where hierarchy_id ='"
												+ hier_id + "'";
										MaxPS = conn.prepareStatement(getMax);
										MaxRS = MaxPS.executeQuery();
										int level = 0;
										String slevel = null;
										while (MaxRS.next()) {
											slevel = MaxRS.getString(1);
											
											level = Integer.parseInt(slevel);
										}
										if (c_level < level) {
											int c_level2 = c_level + 1;
											String getHier = "select * from xx_doc_divisions_hierarchy where hierarchy_id ='"
													+ hier_id
													+ "' and level = '"
													+ c_level2 + "'";
											hierPS = conn.prepareStatement(getHier);
											hierRS = hierPS.executeQuery();

											String division = null, dept = null, desg = null;
											while (hierRS.next()) {
												division = hierRS.getString(4);
												dept = hierRS.getString(6);
												desg = hierRS.getString(7);
												
											}
											String getU = "select user_name from xx_user_master where division_id =(select division_id from xx_divisions_map where division_name ='"
													+ division
													+ "') and department_id = (select department_id from xx_departments_master where department_name = '"
													+ dept
													+ "') and Designation_Id = (select designation_id from xx_designation_master where designation_name ='"
													+ desg + "')";
											getUser = (PreparedStatement) conn
													.prepareStatement(getU);
											UserRs = getUser.executeQuery();
											String assign_to = null;
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
       update xx_approval_workflow set action ='Y' where document_id ="doc_id+" and level ='"+c_level+"'
     </sql:update>		
     		out.println("LevelZ9.."+c_level);
     	<sql:update dataSource="jdbc/MySQLDB" var="rs">
       insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Real_ActionDate) Values ('<%=doc_id%>',CURDATE(),'approved','<%=user%>', now())
     </sql:update>


				<%
					while (UserRs.next()) {
												assign_to = UserRs.getString(1);
												
											}
											Statement insertStmt = (Statement) conn
													.createStatement();
											String insertStg = "insert into xx_approval_workflow (Document_id,Added_byUser,division_hierarchy_id,Assigned_To,CurrentDate,Action,level) Values ('"
													+ doc_id
													+ "','"
													+ addedBy
													+ "','"
													+ hier_id
													+ "','"
													+ assign_to
													+ "',CURDATE(),'N','"
													+ c_level2
													+ "')";
											insertStmt.executeUpdate(insertStg);
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
       insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Information,Real_ActionDate) Values ("+doc_id+",CURDATE(),'assigned','<%=user%>','<%=document_id%>',now())
     
     </sql:update>
				<%
					}
									}

								}
								

								String query = "insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Information,Real_ActionDate) Values ("
										+ doc_id
										+ ",CURDATE(),'assigned','"
										+ user
										+ "','" + remark + "', now())";
								conn.createStatement().executeUpdate(query);
								} catch(Exception e){
	    							
	    							e.printStackTrace();
	    						} finally {
	    							try { getLevelRS.close(); } catch (Exception e) { /* ignored */ }
	    						    try { getUserRS.close(); } catch (Exception e) { /* ignored */ }
	    						    try { MaxRS.close(); } catch (Exception e) { /* ignored */ }
	    						    try { UserRs.close(); } catch (Exception e) { /* ignored */ }
	    						    try { getLevelPS.close(); } catch (Exception e) { /* ignored */ }
	    						    try { getUserPS.close(); } catch (Exception e) { /* ignored */ }
	    						    try { MaxPS.close(); } catch (Exception e) { /* ignored */ }
	    						    try { getUser.close(); } catch (Exception e) { /* ignored */ }
	    						    try { conn.close(); } catch (Exception e) { /* ignored */ }
	    						}
								//conn.close();
				%>
				<div class="alert alert-success" align="center">
					<strong>Success!</strong> Document has been approved.
				</div>
				<%
					} else if (request.getParameter("Action").equalsIgnoreCase(
									"rejected")) {
								String doc_id = request.getParameter("Doc_Id");
								String c_levels = request.getParameter("C_Level");
								int c_level = Integer.parseInt(c_levels);
								
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
  update xx_approval_workflow set action ='Y' where document_id =<%=doc_id%> and level ='<%=c_level%>'
</sql:update>

				<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Real_ActionDate) Values ('<%=doc_id%>',CURDATE(),'rejected','<%=user%>',now())
</sql:update>

				<%
					} else if (request.getParameter("Action").equalsIgnoreCase(
									"return")) {
								String doc_id = request.getParameter("Doc_Id");
								
								String c_levels = request.getParameter("C_Level");

								int c_level = Integer.parseInt(c_levels);
				%>



				<sql:update dataSource="jdbc/MySQLDB" var="rs">
  update xx_approval_workflow set action ='Y' where document_id =<%=doc_id%> and level ='<%=c_level%>'
</sql:update>

				<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Real_ActionDate) Values ('<%=doc_id%>',now(),'return','<%=user%>',now())
</sql:update>
				<%
				Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				try {
					Context initCtx = new InitialContext();
								Context envCtx = (Context) initCtx
										.lookup("java:comp/env");
								DataSource ds = (DataSource) envCtx
										.lookup("jdbc/MySQLDB");
								
								conn = ds.getConnection();
								String sql = "select PM.project,PM.project_Coordinator,PP.package_name,PP.package_director from xx_document_mapping DM,xx_packages_project PP,"
										+ "xx_projectattributes_master PM where DM.Project_ID = PM.Project_ID  and PP.package_id = DM.Package_ID and DM.Document_Map_ID ='"
										+ doc_id + "'";
								ps = conn.prepareStatement(sql);
								rs = ps.executeQuery();
								String project = null, pCoordinator = null, package_name = null, package_director = null;
								while (rs.next()) {
									project = rs.getString(1);
									pCoordinator = rs.getString(2);
									package_name = rs.getString(3);
									package_director = rs.getString(4);
								}
								String doc_no = request.getParameter("Doc_no");
								String RequestedBy = request
										.getParameter("RequestedBy");
				
							//	conn.close();
				%>


				<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_moreammendments (Document_id,status,action_performedBy,project,package,projectCoordinator,packageDirector,action_to,document_number) Values ('<%=doc_id%>','return','<%=user%>','<%=project%>','<%=package_name%>','<%=pCoordinator%>','<%=package_director%>','<%=RequestedBy%>','<%=doc_no%>')
</sql:update>



				<div class="alert alert-success" align="center">
					<strong> Document has been returned for more Information.</strong>
				</div>
				<%
} catch(Exception e){
					
					e.printStackTrace();
				} finally {
					try { rs.close(); } catch (Exception e) { /* ignored */ }
				    try { ps.close(); } catch (Exception e) { /* ignored */ }
				    try { conn.close(); } catch (Exception e) { /* ignored */ }
				}
					}

						}

						if (request.getParameter("Stage").equalsIgnoreCase("forwardto")) {
				%>

				<%
					String Doc_Id = request.getParameter("Doc_Id");
							String Doc_no = request.getParameter("Doc_no");
							String usern = request.getParameter("usern");
							String RequestedBy = request.getParameter("RequestedBy");
				%>
				<c:redirect url="Forward_MOR.jsp">
					<c:param name="usern" value="<%=usern%>"></c:param>
					<c:param name="Doc_Id" value="<%=Doc_Id%>"></c:param>
					<c:param name="Doc_no" value="<%=Doc_no%>"></c:param>
					<c:param name="RequestedBy" value="<%=RequestedBy%>"></c:param>
				</c:redirect>

				<%
					}
				%>
			</c:if>


		</form>
	</div>
</body>
<br><br><br><br><br><br><br><br><br><br>	      
<%@include file="included/footer.jsp" %>
</html>