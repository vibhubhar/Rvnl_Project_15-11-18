<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page autoFlush="true" buffer="1094kb"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="java.awt.Color"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>

<%@page import="org.joda.time.DateTime,org.joda.time.Days,org.joda.time.Hours,org.joda.time.Minutes,org.joda.time.Seconds" %>
<%@ page import="com.rvnl.javascript.MySessionCounter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.dt-button.buttons-copy.buttons-html5 {
    display: none;
}
.dt-button.buttons-csv.buttons-html5 {
    display: none;
}
.dt-button.buttons-pdf.buttons-html5 {
    display: none;
}
#example_length {
    display: none;
}
#example {
    width: inherit;
}

table {
	mso-displayed-decimal-separator: "\.";
	mso-displayed-thousand-separator: "\,";
}

@page {
	margin: 1.0in .75in 1.0in .75in;
	mso-header-margin: .5in;
	mso-footer-margin: .5in;
	mso-page-orientation: landscape;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<!-- <title>PIU Level Report</title> -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/JS/validateSysAdmin230.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="http://www.allmyscripts.com/Table_Sort/beta/gs_sortable.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<script src="resources/JS/Approval_wf230.js"></script>
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script type="text/javascript"
	src="resources/JS/datasort.js"></script>
	<link
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />
	
<link href="resources/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css">
<script src="resources/JS/jquery-1.12.4.js"></script>
<script src="resources/JS/jquery.dataTables.min.js"></script>
<script src="resources/JS/dataTables.buttons.min.js"></script>
<script src="resources/JS/buttons.flash.min.js"></script>
<script src="resources/JS/jszip.min.js"></script>
<!-- <script src="resources/JS/pdfmake.min.js"></script> -->
<script src="resources/JS/vfs_fonts.js"></script>
<script src="resources/JS/buttons.print.min.js"></script>
<script src="resources/JS/buttons.html5.min.js"></script>
<script>
function myFunction() {
    window.print();
}
</script>
<script type="text/javascript">
function closeMe()
{
var win = window.open("","_self"); 
win.close();
}
</script>
<script type="text/javascript">
function mywinClose() {
	var sessionTimeout1 = "<%= session.getMaxInactiveInterval() %>";
	setTimeout(function(){var parent1=window.open("","report_master"); parent1.close(); },(sessionTimeout1-10)*1000);
}
</script>


</head>
<body onload="mywinClose();">
	<div style="text-align: center;font-size: 18px;"><b>DOCUMENTS MOVEMENT HISTORY REPORT </b></div>
	<br><br> Active Sessions : <%= MySessionCounter.getActiveSessions() %> <br><br>
	<%
		String exportToExcel = request.getParameter("exportToExcel");
	Connection conn = null;
	Statement stmt = null, stmt11=null;
	ResultSet rs = null,rs11=null;
	String arguments=null, nos_moved_rly=null;
	int i=0;
	try {
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn = ds.getConnection();

	
	//String reportType = request.getParameter("report_type");
	//System.out.println("report:"+reportType);
	//if (reportType.equalsIgnoreCase("zonewise")) {
		String query11="select t.rownum,t.Document_id, t.Added_ByUser, t.Assigned_To, t.Action, t.Level, t.AssignedDays "+
				" from ( select Document_id, Added_ByUser, Assigned_To, Action, Level, AssignedDays from xx_approval_workflow "+ 
						  " group by Document_id, Added_ByUser, Assigned_To, Action, Level, AssignedDays "+
						  " having count(*) > 1) x, xx_approval_workflow t "+
						" where x.Document_id=t.Document_id and x.Added_ByUser= t.Added_ByUser and x.Assigned_To=t.Assigned_To and x.Level=t.Level and x.Action=t.Action and x.AssignedDays=t.AssignedDays "+
						" order by  x.Document_id, x.Added_ByUser, x.Assigned_To, x.Action, x.Level, x.AssignedDays";

		//System.out.println("query:"+query11);
		stmt11 = conn.createStatement();
		rs11 = stmt11.executeQuery(query11);
		
	%>
<br> 
<table > <tr> <td valign="top" width="30%">
<span style="margin-left:20px; color:blue; font-weight:bold; font-size:18px;">Approval Workflow Table - duplicates (1)</span>
		<br>
	<table border=1 class="table table-hover table-bordered"
		style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="10" width="100%">
		<thead> 
		<tr class="success">
			<th style="padding: 0px 14px 24px 0px;">Row No.</th>
			<th style="padding: 0px 18px 17px 14px; ">Document_Id</th>
			<th width="140px">Added By User</th>
			<th width="140px">Assigned_To</th>
			<th width="140px">Action</th>
			<th width="140px">Level</th>
			<th width="140px">Assigned_Days</th>
			</tr></thead>
		<tbody>
		<%
			 i = 1;
			while (rs11.next()) {

				String col1 = rs11.getString(1);
				String col2 = rs11.getString(2);
				String col3 = rs11.getString(3);
				String col4 = rs11.getString(4);
				String col5 = rs11.getString(5);
				String col6 = rs11.getString(6);
				String col7 = rs11.getString(7);
				
						%>
		<tr class="active">
			<td ><%=col1%></td>
			<td ><%=col2%></td>
			<td ><%=col3%></td>
			<td ><%=col4%></td>
			<td ><%=col5%></td>
			<td ><%=col6%></td>
			<td ><%=col7%></td>
			
		</tr>
		<%
			i++;
			}
			rs11.close();
			stmt11.close();
			
		%>
		</tbody>
	</table>
	
	<br>	<br>
	<%
		
				String query="select count(*),max(rownum) as maxrow, Document_id, Added_ByUser, Assigned_To, Action, Level, AssignedDays "+
						  " from xx_approval_workflow group by Document_id, Added_ByUser, Assigned_To, Action, Level, AssignedDays having count(*) > 1";

	stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
</td><td valign="top" width="35%" rowspan="2">
<span style="margin-left:20px; color:blue; font-weight:bold; font-size:18px;">Approval Workflow Table - duplicates (2)</span><br>
	
	<table border=1 class="table table-hover table-bordered"
		style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
		<thead>
		<tr class="success">
			<th style="padding: 0px 14px 24px 0px;">Doc Count</th>
			<th style="padding: 0px 14px 24px 0px;">Max Row No.</th>
			<th style="padding: 0px 18px 17px 14px; ">Document_Id</th>
			<th width="140px">Added By User</th>
			<th width="140px">Assigned_To</th>
			<th width="140px">Action</th>
			<th width="140px">Level</th>
			<th width="140px">Assigned_Days</th>
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
				
						%>
		<tr class="active">
			<td ><%=col1%></td>
			<td ><%=col2%></td>
			<td ><%=col3%></td>
			<td ><%=col4%></td>
			<td ><%=col5%></td>
			<td ><%=col6%></td>
			<td ><%=col7%></td>
			<td ><%=col8%></td>
			
		</tr>
		<%
			i++;
			}
			rs.close();
			stmt.close();
			
		%>
		</tbody>
	</table>
	<br><br>
	<%
//	} else if (reportType.equalsIgnoreCase("piuwise")) {
		
		 query="select t.Rownum, x.Document_id, x.CurrentDate, x.ActionPerformed, x.ActionPerformedBy, x.Information, x.ActionedOn, x.AssignedDays from (SELECT COUNT(*), Document_id, CurrentDate, ActionPerformed, ActionPerformedBy, Information, ActionedOn, AssignedDays "+ 
				" FROM xx_record_actions GROUP BY Document_id, CurrentDate, ActionPerformed, ActionPerformedBy, Information, ActionedOn, AssignedDays "+
				" HAVING COUNT(*)>1) x, xx_record_actions t where x.Document_id = t.Document_id  and x.CurrentDate=t.CurrentDate and  x.ActionPerformed= t.ActionPerformed and  x.ActionPerformedBy= t.ActionPerformedBy and  x.Information= t.Information and x.ActionedOn=t.ActionedOn and x.AssignedDays=t.AssignedDays";

stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
</td></tr>
<tr><td valign="top" width="35%">
<span style="margin-left:20px; color:blue; font-weight:bold; font-size:18px;">Record Actions Table - duplicate (1)</span><br>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
			<th style="padding: 0px 14px 24px 0px;">Row No.</th>
			<th style="padding: 0px 18px 17px 14px; ">Document_Id</th>
			<th width="140px">CurrentDate</th>
			<th width="140px">Action Performed</th>
			<th width="140px">Action Performed By</th>
			<th width="240px">Information</th>
			<th width="140px">Actioned On</th>
			<th width="140px">Assiged Days</th>
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
				
						%>
		<tr class="active">
			<td ><%=col1%></td>
			<td ><%=col2%></td>
			<td ><%=col3%></td>
			<td ><%=col4%></td>
			<td ><%=col5%></td>
			<td ><%=col6%></td>
			<td ><%=col7%></td>
			<td ><%=col8%></td>
			
		</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
	
%>
</tbody>
</table>
<br><br>
<%
//	} else if (reportType.equalsIgnoreCase("project")) {
		
	 query="SELECT COUNT(*), max(rownum) as maxrow, Document_id, CurrentDate, ActionPerformed, ActionPerformedBy, Information, ActionedOn, AssignedDays "+
			" FROM xx_record_actions GROUP BY Document_id, CurrentDate, ActionPerformed, ActionPerformedBy, Information, ActionedOn, AssignedDays HAVING COUNT(*)>1";

stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
</td></tr><tr><td>
<span style="margin-left:80px; color:blue; font-weight:bold; font-size:18px;">Record Actions Table - duplicate (2)</span><br>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
<th width="140px">Doc Count</th>


			<th style="padding: 0px 14px 24px 0px;">Max Row No.</th>
			<th style="padding: 0px 18px 17px 14px; ">Document_Id</th>
		<th width="140px">CurrentDate</th>
			<th width="140px">Action Performed</th>
			<th width="140px">Action Performed By</th>
			<th width="240px">Information</th>
			<th width="140px">Actioned On</th>
			<th width="140px">Assiged Days</th>
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
				
						%>
		<tr class="active">
			<td ><%=col1%></td>
			<td ><%=col2%></td>
			<td ><%=col3%></td>
			<td ><%=col4%></td>
			<td ><%=col5%></td>
			<td ><%=col6%></td>
			<td ><%=col7%></td>
			<td ><%=col8%></td>
			<td ><%=col9%></td>
			
		</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
	
%>
</tbody>
</table>
<br><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
		
 query="select t.rownum,t.Hierarchy_id, t.Document_id, t.zone, t.Document_type, t.Level, t.userid, t.Days "+
		" from ( select Hierarchy_id,Document_id, zone, Document_type, Level, userid, Days "+
				"  from xx_doc_zones_hierarchy   group by Hierarchy_id,Document_id, zone, Document_type, Level, userid, Days having count(*) > 1) x, xx_doc_zones_hierarchy  t "+
			" where x.Hierarchy_id= t.Hierarchy_id and x.Document_id=t.Document_id and x.zone= t.zone and x.Document_type= t.Document_type and x.Level = t.Level and x.userid = t.userid  and x.Days= t.Days "+ 
			" order by x.Hierarchy_id, x.Document_id, x.zone, x.Document_type, x.Level, x.userid, x.Days"; 
 //System.out.println("pk------"+query);
 stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
</td></tr><tr><td>
<span style="margin-left:20px; color:blue; font-weight:bold; font-size:18px;">Doc_Zones_Hierarchy Table - duplicates</span><br>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
			<th style="padding: 0px 14px 24px 0px;">Row No.</th>
				<th width="140px">Hierarchy Id</th>
			<th style="padding: 0px 18px 17px 14px; ">Document_Id</th>
			<th width="140px">Zone</th>
			<th width="140px">Doc Type</th>
			<th width="140px">Level</th>
			<th width="140px">User_Id</th>
			<th width="140px">Days</th>
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
				
						%>
		<tr class="active">
			<td ><%=col1%></td>
			<td ><%=col2%></td>
			<td ><%=col3%></td>
			<td ><%=col4%></td>
			<td ><%=col5%></td>
			<td ><%=col6%></td>
			<td ><%=col7%></td>
			<td ><%=col8%></td>
			
		</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
%>
</tbody>
</table>
</td></tr>
<tr><td colspan="2"><br><br>
<span style="margin-left:250px; color:blue; font-weight:bold; font-size:18px;">Doc_Divisions_Hierarchy Table - duplicates</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
query="select t.rownum,t.Hierarchy_id, t.Document_id, t.Division, t.Document_type, t.Level, t.userid, t.Days "+
 	" from ( select Hierarchy_id,Document_id, Division, Document_type, Level, userid, Days  from xx_doc_divisions_hierarchy "+  
		"  group by Hierarchy_id,Document_id, Division, Document_type, Level, userid, Days  having count(*) > 1) x, xx_doc_divisions_hierarchy  t "+
		" where x.Hierarchy_id= t.Hierarchy_id and x.Document_id=t.Document_id and x.Division= t.Division and x.Document_type= t.Document_type and x.Level = t.Level and x.userid = t.userid  and x.Days= t.Days "+ 
	" order by x.Hierarchy_id, x.Document_id, x.Division, x.Document_type, x.Level, x.userid, x.Days";

//System.out.println("query2:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
			<th style="padding: 0px 14px 24px 0px;">Row No.</th>
				<th width="140px">Hierarchy Id</th>
			<th style="padding: 0px 18px 17px 14px; ">Document_Id</th>
			<th width="140px">Division</th>
			<th width="140px">Doc Type</th>
			<th width="140px">Level</th>
			<th width="140px">User_Id</th>
			<th width="140px">Days</th>
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
				
						%>
		<tr class="active">
			<td ><%=col1%></td>
			<td ><%=col2%></td>
			<td ><%=col3%></td>
			<td ><%=col4%></td>
			<td ><%=col5%></td>
			<td ><%=col6%></td>
			<td ><%=col7%></td>
			<td ><%=col8%></td>
			
		</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
%>
</tbody>
</table>
</td></tr>
<tr><td colspan="2"><br><br>
<span style="margin-left:250px; color:blue; font-weight:bold; font-size:18px;">More_Amendments Table - duplicates</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
query="select t.rownum ,t.document_id, t.document_number, t.status, t.action_performedBy, t.project, t.package, t.action_To, t.Information "+ 
		" from ( select document_id, document_number, status, action_performedBy, project, package, action_To, Information from xx_moreammendments  "+
		  " group by document_id, document_number, status, action_performedBy, project, package, action_To, Information having count(*) > 1) x, xx_moreammendments   t "+
		" where x.Document_id=t.Document_id and x.document_number= t.document_number and x.status= t.status and  x.action_performedBy= t.action_performedBy and x.project= t.project  and x.package= t.package and  x.action_To= t.action_To and x.Information "+ 
		" order by x.document_id, x.document_number, x.status, x.action_performedBy, x.project, x.package, x.action_To, x.Information";

//System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
			<th style="padding: 0px 14px 24px 0px;">Row No.</th>
			<th style="padding: 0px 18px 17px 14px; ">Document_Id</th>
			<th width="140px">Doc No</th>
			<th width="140px">Status</th>
			<th width="140px">Action Performed By</th>
			<th width="140px">Project</th>
			<th width="140px">Package</th>
				<th width="140px">Action To</th>
					<th width="140px">Information</th>
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
				
						%>
		<tr class="active">
			<td ><%=col1%></td>
			<td ><%=col2%></td>
			<td ><%=col3%></td>
			<td ><%=col4%></td>
			<td ><%=col5%></td>
			<td ><%=col6%></td>
			<td ><%=col7%></td>
			<td ><%=col8%></td>
			<td ><%=col9%></td>
			
		</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
%>
</tbody>
</table>
</td></tr>
<tr><td colspan="2"><br><br>
<span style="margin-left:250px; color:blue; font-weight:bold; font-size:18px;">Document Mapping - duplicates (1)</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
query="select t.Document_Map_Id, t.document_number, t.Document_Name, t.Document_Type, t.Submitted_by, t.Project_ID, t.Package_ID from ( select  document_number, Document_Name, Document_Type, Submitted_by, Project_ID, Package_ID "+   
		"  from xx_document_mapping group by  document_number, Document_Name, Document_Type, Submitted_by, Project_ID, Package_ID "+
		"  having count(*) > 1) x, xx_document_mapping  t where  x.document_number= t.document_number and x.Document_Name= t.Document_Name and  x.Document_Type= t.Document_Type and x.Submitted_by= t.Submitted_by  and x.Project_ID= t.Project_ID and x.package_ID = t.package_ID "+   
	" order by x.document_number,  x.Document_Name, x.Document_Type, x.Submitted_by, x.Project_ID, x.Package_ID";  

stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
			<th style="padding: 0px 18px 17px 14px; ">Document_Id</th>
			<th width="140px">Doc No</th>
			<th width="140px">Doc Name</th>
			<th width="140px">Doc Type</th>
			<th width="140px">Submitted By (ID)</th>
			<th width="140px">Project Id</th>
			<th width="140px">Package Id</th>
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
				
						%>
		<tr class="active">
			<td ><%=col1%></td>
			<td ><%=col2%></td>
			<td ><%=col3%></td>
			<td ><%=col4%></td>
			<td ><%=col5%></td>
			<td ><%=col6%></td>
			<td ><%=col7%></td>
		
		</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
%>
</tbody>
</table>
</td></tr>
<tr><td colspan="2"><br><br>
<span style="margin-left:250px; color:blue; font-weight:bold; font-size:18px;">Document Mapping - duplicates (2)</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
		
 query="select t.Document_Map_Id, t.document_number, t.Document_Name, t.Document_Type, t.Submitted_by, t.Project_ID, t.Package_ID from ( select  Document_Name, Project_ID "+   
	   " from xx_document_mapping group by  Document_Name, Project_ID  having count(*) > 1) x, xx_document_mapping  t "+
		"	where   x.Document_Name= t.Document_Name and  x.Project_ID= t.Project_ID order by x.Document_Name,x.Project_ID"; 

stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
			<th style="padding: 0px 18px 17px 14px; ">Document_Id</th>
			<th width="140px">Doc No</th>
			<th width="140px">Doc Name</th>
			<th width="140px">Doc Type</th>
			<th width="140px">Submitted By (ID)</th>
			<th width="140px">Project Id</th>
			<th width="140px">Package Id</th>
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
						
						%>
		<tr class="active">
			<td ><%=col1%></td>
			<td ><%=col2%></td>
			<td ><%=col3%></td>
			<td ><%=col4%></td>
			<td ><%=col5%></td>
			<td ><%=col6%></td>
			<td ><%=col7%></td>
				
		</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
%>
</tbody>
</table>
</td></tr>
<tr><td colspan="2"><br><br>
<span style="margin-left:250px; color:blue; font-weight:bold; font-size:18px;">Portal Documents Summary</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
query="select count(if(Document_Status='Finally Approved' and ShowInReport='Y',1,null)) as Nos_appd, count(if(Document_Status='pending' and forwarded='yes',1,null)) as Nos_pending, count(if(forwarded='No' or forwarded is null,1,null)) as Nos_not_forwd, count(if(Document_Status='Finally Approved' and ShowInReport='N',1,null)) as Nos_hidden from xx_document_mapping";
//"select DATE_format(Last_login,'%d/%m/%Y') as dd, Count(if (Type='MOR',1, null)) AS MOR_Users_logged, Count(if (Type='MOR' and Designation_Id=75,1, null)) AS DRMs_logged,Count(if (Type='MOR' and Designation_Id=115,1, null)) AS GMs_logged, Count(if (Type='RVNL',1, null)) AS RVNL_Users_logged, Count(if (Type='RVNL' and (Role='LocalUser' or Role='System Administrator'),1, null)) AS RVNL_Admins_logged, count(User_id) as Total_Users_logged from xx_user_master where Last_login between DATE_ADD(CURDATE(), INTERVAL -15 day) and now()  group by DATE_format(Last_login,'%d/%m/%Y') order by Last_login";		
//System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
	<th >Nos. not yet forwarded</th>
	<th>Nos. Pending</th>
	<th>Nos. Finally Approved</th>
	<th>Nos. Hidden</th>
	</tr></thead>
<tbody>
<%
	 i = 1;
	while (rs.next()) {

		String col1 = rs.getString(1);
		String col2 = rs.getString(2);
		String col3 = rs.getString(3);
		String col4 = rs.getString(4);
		%>
<tr class="active">
	<td><%=col3%></td>
	<td><%=col2%></td>
	<td><%=col1%></td>
	<td><%=col4%></td>
	</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
%>
</tbody>
</table>
</td></tr>

<tr><td colspan="2"><br><br>
<%
 query="Select count(if(n1>1,1,null)) as nos_moved, count(if(n1=1,1,null)) as nos_not_moved, count(document_id) as nos_total from (select document_id, count(*) as n1 from xx_approval_workflow  group by Document_id) aa";
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
	 i = 1;
	while (rs.next()) {

		 nos_moved_rly = rs.getString(1);
		String nos_not_moved_rly = rs.getString(2);
		String nos_total_appl_wf = rs.getString(3);
	i++;
	}
	rs.close();
	stmt.close();
%>
<span style="margin-left:150px; color:blue; font-weight:bold; font-size:18px;">Document Movement Summary (Overall including hidden documents)</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
		
 query="Select count(if(n1>2,1,null)) as nos_moved, count(if(n1=2,1,null)) as nos_not_moved, count(document_id) as nos_total from (select document_id, count(*) as n1 from xx_record_actions  group by Document_id) aa";
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
	<th style="padding: 0px 14px 24px 0px;">Nos. Moved (Total)</th>
	<th style="padding: 0px 14px 24px 0px;">Nos. Moved (Within Rly)</th>
	<th style="padding: 0px 14px 24px 0px;">Nos. Moved (RVNL to Rly or vice versa)</th>
	<th style="padding: 0px 18px 17px 14px; ">Nos. not moved </th>
	<th style="padding: 0px 18px 17px 14px; ">Total no. of Docs</th>
	</tr></thead>
<tbody>
<%
	 i = 1;
	while (rs.next()) {

		String col1 = rs.getString(1);
		String col2 = rs.getString(2);
		String col3 = rs.getString(3);
	
				%>
<tr class="active">
		<td ><%=col1%></td>
		<td ><%=nos_moved_rly%></td>
		<td ><%=Integer.parseInt(col1)-Integer.parseInt(nos_moved_rly)%></td>
		<td ><%=col2%></td>
		<td ><%=col3%></td>
	</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
%>
</tbody>
</table>
</td>
</tr>
<tr><td><br><br>
<span style="margin-left:250px; color:blue; font-weight:bold; font-size:18px;">Project Documents Movement Summary for last 15 days</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
query="select date(Real_ActionDate) as Date1, count(if(ActionPerformed='Submitted',1,null)) as Nos_Submitted, count(if(ActionPerformed='Resubmitted',1,null)) as Nos_Resubmitted, count(if(ActionPerformed='Pulled back by RVNL',1,null)) as Nos_pulledBack, count(if(ActionPerformed='Forward With Approval',1,null)) as Nos_Fwd_appd, count(if(ActionPerformed='Returned to RVNL with approval',1,null)) as Nos_retnd_appd, count(if(ActionPerformed='Returned to RVNL',1,null)) as Nos_retnd_unappd, count(if(ActionPerformed='Forward without Approval',1,null)) as Nos_Fwd_unappd, count(if(ActionPerformed='Finally Approved',1,null)) as Nos_Finally_Appd from xx_record_actions where date(Real_ActionDate) between  DATE_ADD(CURDATE(), INTERVAL -15 day) and CURDATE()  group by date(Real_ActionDate)";
//"select DATE_format(Last_login,'%d/%m/%Y') as dd, Count(if (Type='MOR',1, null)) AS MOR_Users_logged, Count(if (Type='MOR' and Designation_Id=75,1, null)) AS DRMs_logged,Count(if (Type='MOR' and Designation_Id=115,1, null)) AS GMs_logged, Count(if (Type='RVNL',1, null)) AS RVNL_Users_logged, Count(if (Type='RVNL' and (Role='LocalUser' or Role='System Administrator'),1, null)) AS RVNL_Admins_logged, count(User_id) as Total_Users_logged from xx_user_master where Last_login between DATE_ADD(CURDATE(), INTERVAL -15 day) and now()  group by DATE_format(Last_login,'%d/%m/%Y') order by Last_login";		
//System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
	<th width="100px" >Date</th>
	<th >Nos. Submitted (RVNL)</th>
	<th>Nos. Resubmitted (RVNL)</th>
	<th>Nos. Pulled Back (RVNL)</th>
	<th>Nos. Finally Approved/ Closed (RVNL)</th>
	<th>Nos. Forwarded with approval (Rly)</th>
	<th>Nos. Returned to RVNL with approval (Rly)</th>
	<th>Nos. Returned to RVNL without approval (Rly)</th>
	<th>Nos. Forwarded without approval (Rly)</th>
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
		%>
<tr class="active">
	<td><%=col1%></td>
	<td><%=col2%></td>
	<td><%=col3%></td>
	<td><%=col4%></td>
	<td><%=col9%></td>
	<td><%=col5%></td>
	<td><%=col6%></td>
	<td><%=col7%></td>
	<td><%=col8%></td>
	</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
%>
</tbody>
</table>
</td></tr>
<tr><td><br><br>
<span style="margin-left:250px; color:blue; font-weight:bold; font-size:18px;">Zone and Division wise Project Documents Movement Summary for last 15 days</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
query="select zone,  division, PIU_of_RVNL, count(if(ActionPerformed='Submitted',1,null)) as Nos_Submitted, count(if(ActionPerformed='Resubmitted',1,null)) as Nos_Resubmitted, count(if(ActionPerformed='Pulled back by RVNL',1,null)) as Nos_pulledBack, count(if(ActionPerformed='Finally Approved',1,null)) as Nos_Finally_Appd, count(if(ActionPerformed='Forward With Approval',1,null)) as Nos_Fwd_appd, count(if(ActionPerformed='Returned to RVNL with approval',1,null)) as Nos_retnd_appd, count(if(ActionPerformed='Returned to RVNL',1,null)) as Nos_retnd_unappd, count(if(ActionPerformed='Forward without Approval',1,null)) as Nos_Fwd_unappd from (select a.*, b.zone, c.PIU_of_RVNL, if(u.Type='MOR',if(u.division_ID=86,'Headquarters',d.division_name),b.Division) as division from xx_record_actions a left join xx_document_mapping b on a.Document_id=b.Document_Map_ID left join xx_user_master u on a.ActionPerformedBy=u.User_name left join xx_divisions_master d on u.Division_ID=d.division_id left join xx_projectattributes_master c on c.Project_ID = b.Project_ID  where date(a.Real_ActionDate) between  DATE_ADD(CURDATE(), INTERVAL -15 day) and CURDATE()) as pkq group by zone, division, PIU_of_RVNL";
//System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
	<th width="100px" >Zone</th>
	<th width="100px" >Division</th>
	<th width="100px" >PIU</th>
	<th >Nos. Submitted (RVNL)</th>
	<th>Nos. Resubmitted (RVNL)</th>
	<th>Nos. Pulled Back (RVNL)</th>
	<th>Nos. Finally Approved/ Closed (RVNL)</th>
	<th>Nos. Forwarded with approval (Rly)</th>
	<th>Nos. Returned to RVNL with approval (Rly)</th>
	<th>Nos. Returned to RVNL without approval (Rly)</th>
	<th>Nos. Forwarded without approval (Rly)</th>
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
		%>
<tr class="active">
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
	</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
%>
</tbody>
</table>
</td></tr>

<tr><td><br><br>
<span style="margin-left:250px; color:blue; font-weight:bold; font-size:18px;">Hidden Documents</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
query="select b.PIU_of_RVNL, c.User_name, b.Project, d.package_name, a.zone,a.Division, a.Document_Map_ID, a.Document_Type,a.Document_Number, a.Document_Name, a.Forwarded, a.Document_Status, a.Date_of_Submission, a.DateFinalize, a.ShowInReport  from xx_document_mapping a, xx_projectattributes_master b, xx_user_master c, xx_packages_project d where a.Project_ID = b.Project_ID and a.Submitted_by=c.User_ID and a.Package_ID=d.package_id and a.ShowInReport='N'";
//System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;" id="example" class="display nowrap" cellspacing="0" width="100%">
<thead>
<tr class="success">
	<th >SN</th>
	<th >PIU</th>
	<th >Submitted By</th>
	<th>Project</th>
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
	</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
%>
</tbody>
</table>
</td></tr>
</table>
<br><br>
<%
	}catch(Exception e){
		
		e.printStackTrace();
	}  
	//}
	
%>
		<input type="button" value="close" class="btn btn-primary" onclick="closeMe();" style="margin-left: 50%;"> 
	
	<%
		if (exportToExcel == null) {
	
	
		}
	%>
	<br>
	<!-- <a href="#" onclick="javascript:window.print();">Print this page</a> -->

</body>

</html>
