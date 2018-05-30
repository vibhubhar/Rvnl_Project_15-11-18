<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
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
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>

<head>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<HTML>
<HEAD>
<TITLE>Report in Excel Format in JSP</TITLE>
<style>
table 
{
mso-displayed-decimal-separator: "\.";
mso-displayed-thousand-separator: "\,";
}

@page 
{
margin: 1.0in .75in 1.0in .75in;
mso-header-margin: .5in;
mso-footer-margin: .5in;
mso-page-orientation: landscape;
}
</style>
</HEAD>
<body>
<br><br>
<!-- Added for appropriate file name to .xls file] START--> 
<%
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "excel.xls");

		}
	%>
<!-- END-->
<%
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String doctype="";
String sqlQuery = "select distinct docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,ram.ActionPerformed,ram.CurrentDate,ram.Document_id,ram.ActionPerformedBy,DATEDIFF(ram.CurrentDate,docm.Date_of_Submission) as Aging, bmax.date1 from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select distinct((select max(ram1.currentdate) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id group by ram1.Document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax where projm.project_id = docm.project_id and ram.Document_id = wfm.Document_id and ram.CurrentDate = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id";
con = ds.getConnection();
stmt = con.createStatement();
rs = stmt.executeQuery(sqlQuery);
%>
<table border=1>
<tr>
<th>Document Id</th>
<th>PIU Name</th>
<th>Project</th>
<th>Project Coordinator</th>
<th>Package Name</th>
<th>Coordinating Department</th>
<th>Designation</th>
<th>Document Type</th>
<th>Document Number</th>
<th>Date of Submission</th>
<th>Action Performed</th>
<th>Current Date</th>
<th>Action PerformedBy</th>
<th>Aging</th>


</tr>
<% 
String document_id = null;
String piuname = null;
String project = null;
String pcor = null;
String packagename = null;
String cdeprt = null;
String desig = null;
String doctype1 = null;
String docno = null;
String dofsub = null;
String actions = null;
String current = null;
String action = null;
String age = null;

%>
<%
while(rs.next()){
	document_id = rs.getString(1);
	piuname = rs.getString(2);
	project = rs.getString(3);
	pcor = rs.getString(4);
	packagename = rs.getString(5);
	cdeprt = rs.getString(6);
	desig = rs.getString(7);
	document_id = rs.getString(8);	
	doctype1 = rs.getString(9);
	docno = rs.getString(10);
	dofsub = rs.getString(11);
	actions = rs.getString(12);
	current = rs.getString(13);
	action = rs.getString(14);
	age = rs.getString(15);
	
	%>
<tr>
<td width="200px"><font color="">
 <%=document_id %>
</td>
<td width="200px">
 <%=piuname %>
</td>
<td width="200px"><%=project%>
</td>
<td width="200px"><%=pcor%>
</td>
<td width="200px"><%=packagename%>
</td>
<td width="200px"><%=cdeprt%>
</td>
<td width="200px"><%=desig%>
</td>
<td width="200px"><%=document_id%>
</td>
<td width="200px"><%=doctype1%>
</td>
<td width="200px"><%=docno%>
</td>
<td width="200px"><%=dofsub%>
</td>
<td width="200px"><%=actions%>
</td><td width="200px"><%=current%>
</td><td width="200px"><%=action%>
</td><td width="200px"><%=age%>

</tr>
<%} 
    try { conn.close(); } catch (Exception e) { /* ignored */ }
%>
</table>

<br>
<%
		if (exportToExcel == null) {
	%>
	<a href="reportExcel.jsp?exportToExcel=YES">Download Report in Excel</a><br><br>
			<a href="reportToPdf.jsp?exportToPdf=YES">Download Report in Pdf</a>
	
	<%
		}
	%>
	<br>
	<br>
	
</body>
</html>