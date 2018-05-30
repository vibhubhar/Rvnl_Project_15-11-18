<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
        <%@ page import ="java.text.SimpleDateFormat,java.util.*"%>
     <%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
    <%@ page import ="java.text.SimpleDateFormat,java.text.DateFormat"%>
    <%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@ page import="javax.servlet.*"%>
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
 <%@include file="sessionCheck.jsp"%>
<%@page import="org.joda.time.DateTime,org.joda.time.Days,org.joda.time.Hours,org.joda.time.Minutes,org.joda.time.Seconds" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>PDAMS - Document Log</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<!-- <title>Report</title> -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
function closeMe()
{
var win = window.open("","_self"); /* url = “” or “about:blank”; target=”_self” */
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
<div style="text-align: center;font-size: 14px;"><b>RVNL DOCUMENT PORTAL </b></div></br>
<div style="text-align: center; text-decoration: underline; font-size: 18px;"><b>Document Movement Log </b></div></br>

		
<%
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "excel.xls");

		}
	%>

<%

String doctype = request.getParameter("Document_Type");
String docid = request.getParameter("doc_id");
String back= (String)session.getAttribute( "BackUrl" ) ;
String backurl= (String)session.getAttribute( "backurl" ) ;
String backurl1= (String)session.getAttribute( "backurl" ) ;

String doctype1=null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
java.sql.Date subdate=null;
java.sql.Date currentdate=null;
//String docnameq="select "


//String query = "select a.PIU_of_RVNL,a.Project,a.Department,b.Document_Type,b.Document_Status,b.Document_Name,b.Document_Number,DATEDIFF(c.CurrentDate,b.Date_of_Submission) as Age,b.Date_of_Submission,c.Assigned_To,c.Level from xx_projectattributes_master as a,xx_document_mapping as b,xx_approval_workflow as c where a.Project_ID=b.Project_ID and a.PIU_of_RVNL='"+piu+"' and b.Document_Status='"+status+"'";
	//out.println(query);
	//String query = "select a.PIU_of_RVNL,a.Project,a.Designation,b.package_name,c.Document_Type,c.Document_Name,c.Date_of_Submission,c.Document_Number,d.ActionPerformed,d.ActionPerformedBy,d.CurrentDate,d.ActionedOn,IFNULL(DATEDIFF(d.ActionedOn,d.CurrentDate),0) as Aging,d.Information,DATEDIFF(NOW(),d.CurrentDate) AS DaysSince from xx_projectattributes_master as a,xx_packages_project as b,xx_document_mapping as c,xx_record_actions as d where c.Document_Map_ID = d.Document_id and b.package_id = c.Package_ID and a.Project_ID = c.Project_ID and Document_Type='"+doctype+"' and c.Document_Map_ID='"+docid+"'";
String query="select a.PIU_of_RVNL,a.Project,a.Designation,b.package_name,c.Document_Type,c.Document_Name,c.Date_of_Submission,c.Document_Number,d.ActionPerformed,d.ActionPerformedBy,d.CurrentDate,d.ActionedOn,DATEDIFF(ifnull(d.ActionedOn,now()),ifnull(d.CurrentDate,c.date_of_submission)) as Aging,d.Information,IFNULL(DATEDIFF(ifnull(d.ActionedOn,now()),c.date_of_submission),0) AS DaysSince, loc1.Major_Section, c.From_Km, c.To_Km,  loc1.Station_Name, loc1.Station_Km, d.AssignedDays from xx_projectattributes_master as a,xx_packages_project as b,xx_document_mapping as c,xx_record_actions as d, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1 where c.Document_Map_ID = d.Document_id and b.package_id = c.Package_ID and a.Project_ID = c.Project_ID  and c.Document_Map_ID = loc1.Document_Map_ID  and Document_Type='"+doctype+"' and c.Document_Map_ID='"+docid+"'";
//"select a.PIU_of_RVNL,a.Project,a.Designation,b.package_name,c.Document_Type,c.Document_Name,c.Date_of_Submission,c.Document_Number,d.ActionPerformed,d.ActionPerformedBy,d.CurrentDate,d.ActionedOn,DATEDIFF(ifnull(d.ActionedOn,now()),ifnull(d.CurrentDate,c.date_of_submission)) as Aging,d.Information,IFNULL(DATEDIFF(ifnull(d.ActionedOn,now()),c.date_of_submission),0) AS DaysSince from xx_projectattributes_master as a,xx_packages_project as b,xx_document_mapping as c,xx_record_actions as d where c.Document_Map_ID = d.Document_id and b.package_id = c.Package_ID and a.Project_ID = c.Project_ID and Document_Type='"+doctype+"' and c.Document_Map_ID='"+docid+"'";

Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	 

	conn = ds.getConnection();
stmt = conn.createStatement();
Statement stmthed = conn.createStatement();
rs = stmt.executeQuery(query);
String SD=null;
ResultSet rshed=stmthed.executeQuery(query);
if(rshed.next()){
	String piu = rshed.getString(1);
	String pro = rshed.getString(2);
	String proc = rshed.getString(3);
	String packn = rshed.getString(4);
	String doctypes = rshed.getString(5);
	String docname = rshed.getString(6);
	subdate = rshed.getDate(7);
	SD =new SimpleDateFormat("dd/MM/yyyy").format(subdate);
	
	String docno = rshed.getString(8);
	String majsec = rshed.getString(16);
	String frmkm = rshed.getString(17);
	String tokm = rshed.getString(18);
	String stn = rshed.getString(19);
	String stnkm = rshed.getString(20);
	String assigndays=rshed.getString(21);
String proc1=proc+"/RVNL/"+piu;
%>
	

<%if(doctype!=""){%><br>
<table border=0 class="table table-hover table-bordered" style="background-color: #FFFFF;text-align:center">
<tr class="success"><th width="200px" ><font size=3px>
Document Id : <%=docid %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Document Name :<b> <%=docname %></b></font></th></tr></table>
<%}

%>

<table class="table table-hover table-bordered" style="background-color: #fff">
<tr width=100% align="center">

<%

%>
</tr>
<tr  class="" style="background-color:#fff;">

<td width="120px"><b>PIU Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><%=piu %></td>
<td width="200px"><b>Project :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=pro %></td></tr>
<tr class="" style="background-color:#fff;"><td width="250px"><b>Project Coordinator :</b>&nbsp;&nbsp;&nbsp;&nbsp;<%=proc1 %></td>
<td width="140px"><b>Package Name :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;<%=packn %></td></tr>
<tr  class="" style="background-color:#fff;"><td width="100px"><b>Document Type :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=doctype %></td>
<td width="140px"><b>Document Number :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=docno %></td>
</tr>
<tr  class="" style="background-color:#fff;"><td width="152px"><b>Major Section :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=majsec %></td>
<td width="200px">
<% 
if (frmkm != null || tokm != null) {
%>
<b>From KM :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=frmkm %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>To KM :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=tokm %>
<% 
}
if (stn != null) {
%>
<b>Station :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=stn %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<b>KM :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=stnkm %>)
<%
}
%>
</td></tr>
<tr  class="" style="background-color:#fff;"><td width="170px"><b>Submitted Date :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=SD %></td>
<td><b>Assignees ::</b>&nbsp;&nbsp;&nbsp;&nbsp;


<!--  table align="center">

<tr style="background-color:#fff;text-align:center;"><div style="text-align:center;"></div></tr><br-->

<%


String sqlq ="select HierarchyType from xx_document_mapping where Document_Map_ID="+docid;
Statement stmt1 = conn.createStatement();
ResultSet rs1 = stmt1.executeQuery(sqlq);
String hierarchytyp =null;
if(rs1.next()){
	hierarchytyp=rs1.getString("HierarchyType");
}
if(hierarchytyp.equalsIgnoreCase("Zone")){
	String hierarchyid=null,zone=null,dept=null,desig=null,userid=null;
	String sqlq1 ="select Zone_HierarchyId  from xx_document_mapping where Document_Map_ID="+docid;
	Statement stmt2 = conn.createStatement();
	ResultSet rs2 = stmt2.executeQuery(sqlq1);
	if(rs2.next()){
		hierarchyid=rs2.getString("Zone_HierarchyId");
	}
	
	String sqlq2 ="select * from xx_doc_zones_hierarchy where Hierarchy_id="+hierarchyid;
	Statement stmt3 = conn.createStatement();
	ResultSet rs3 = stmt3.executeQuery(sqlq2);
	%>
	
	&nbsp;&nbsp;&nbsp;&nbsp;<b>Zone</b> -
	<%
	String idList3=null;
	java.util.List<String> ids3 = new java.util.ArrayList<String>();
	String csv3=null;
	while(rs3.next()){
		userid=rs3.getString("userid");
		//zone=rs3.getString("Zone");
		//dept=rs3.getString("Department");
		//desig=rs3.getString("Designation");
		
		ids3.add(userid);
		 idList3 = ids3.toString();
		
	
	}
	
csv3 = idList3.substring(1, idList3.length() - 1).replace(", ", ", "); %>

		 <%=csv3 %>	
	
	
	
<%}

if(hierarchytyp.equalsIgnoreCase("Division")){
	String hierarchyid=null,dept=null,desig=null,Division=null,userid=null ;
	String sqlq1 ="select Division_HierarchyId  from xx_document_mapping where Document_Map_ID="+docid;
	Statement stmt2 = conn.createStatement();
	ResultSet rs2 = stmt2.executeQuery(sqlq1);
	if(rs2.next()){
		hierarchyid=rs2.getString("Division_HierarchyId");
	}
	String sqlq2 ="select * from xx_doc_divisions_hierarchy where Hierarchy_id="+hierarchyid;
	Statement stmt3 = conn.createStatement();
	ResultSet rs3 = stmt3.executeQuery(sqlq2);
	
	%>
	
	&nbsp;&nbsp;&nbsp;&nbsp;<b>Division</b> - 
	<%
	
	
	String idList2=null;
	java.util.List<String> ids2 = new java.util.ArrayList<String>();
	String csv2=null;
	
	
	while(rs3.next()){
		userid=rs3.getString("userid");
		//Division=rs3.getString("Division");
		//dept=rs3.getString("Department");
		//desig=rs3.getString("Designation");
		ids2.add(userid);
		 idList2 = ids2.toString();
		
	
	}
	
csv2 = idList2.substring(1, idList2.length() - 1).replace(",", ", "); %>

		 <%=csv2 %>	
	
		
		
	
	
	<%

}
%>

<%
if(hierarchytyp.equalsIgnoreCase("Both")){
	String divhierarchyid=null,zonhierarchyid=null,dept=null,desig=null,Division=null,userid=null ;
	/*
	String sqlq1 ="select Division_HierarchyId,Zone_HierarchyId  from xx_document_mapping where Document_Map_ID="+docid;
	Statement stmt2 = conn.createStatement();
	ResultSet rs2 = stmt2.executeQuery(sqlq1);
	if(rs2.next()){
		divhierarchyid=rs2.getString("Division_HierarchyId");
		zonhierarchyid=rs2.getString("Zone_HierarchyId");
	}
	*/
	String sqlq2 ="select * from xx_doc_divisions_hierarchy where Document_id="+docid;
	Statement stmt3 = conn.createStatement();
	ResultSet rs3 = stmt3.executeQuery(sqlq2);
	

	String sqlq21 ="select * from xx_doc_zones_hierarchy where Document_id="+docid;
	Statement stmt31 = conn.createStatement();
	ResultSet rs31 = stmt31.executeQuery(sqlq21);
	%>
		
		
	&nbsp;&nbsp;&nbsp;&nbsp;<b>Division</b> -
	
	<%
	
	String idList1=null;
	java.util.List<String> ids1 = new java.util.ArrayList<String>();
	String csv1=null;
	int fl=0;
	while(rs3.next()){
		userid=rs3.getString("userid");
		//Division=rs3.getString("Division");
		//dept=rs3.getString("Department");
		//desig=rs3.getString("Designation");
		ids1.add(userid);
		 idList1 = ids1.toString();
		fl=1;
	
	}
	if(fl==1){
 csv1 = idList1.substring(1, idList1.length() - 1).replace(", ", ", "); 
}else{
csv1="";
}
	%>
		 <%=csv1 %>	

	


	<%
%>
	
	&nbsp;&nbsp;&nbsp;&nbsp;<b>Zone</b> - 
	<%
	String idList=null;
	java.util.List<String> ids = new java.util.ArrayList<String>();
	String csv=null;
	int flz=0;
	while(rs31.next()){
		userid=rs31.getString("userid");
		ids.add(userid);
		 idList = ids.toString();
		 flz=1;
		 
	}
	if(flz==1){	
	
 csv = idList.substring(1, idList.length() - 1).replace(", ", ", "); 
}else {
	csv="";
	
}
	%>
		 <%=csv %>	
		 <%
}



%>
</td>

</tr>

</table>

<!-- /table-->


<%
}
%>


<table width="700px"class="table table-hover table-bordered" style="background-color: #F0FFFF">

<tr width="700px" style="text-align:center;">

<td width="140px"><b>Action Performed By</b></td>
<td width="120px"><b>Action Performed</b></td>
<td width="100px"><b>Received Date</b></td>
<td width="100px"><b>Action Date</b></td>
<td width="180px"><b>Remarks</b></td>
<td width="100px"><center><b>Target for Approval (days)</b></center></td>
<td width="120px"><b>Days Taken</b></td>
<td width="100px"><b>Days Since</b></td>
</tr>
<%
int diffDay=0;
String diffdaystr=null;
while(rs.next()){
	
	

String prev = null;
String next = null;
java.sql.Date ActionedOn=null;
int diff = 0;
String AO1=null;

	String action = rs.getString(9);
	String actionperformed = rs.getString(10);
    currentdate = rs.getDate(11);
    ActionedOn=rs.getDate(12);
    String info = rs.getString(14);
String aging = rs.getString(13);
String DaysSince=rs.getString(15);
String assigndays1 = rs.getString(21);
/*
	next = aging;
	
	if(prev==null){
		
	diff = Integer.parseInt(next);
	}
	else{
		diff = Integer.parseInt(next)-Integer.parseInt(prev);

	}
	prev = next;
*/
	 String SD1=null;
	 
	 if(currentdate==null){
		 SD1="";
	//	 aging="0";
	//	 diffdaystr="0";
		}else{
			SD1 =new SimpleDateFormat("dd/MM/yyyy").format(currentdate);
		
		
		}
	 
	if(ActionedOn==null){
		AO1="";
		
	}else{
	 AO1 =new SimpleDateFormat("dd/MM/yyyy").format(ActionedOn);
	 
	 
	}

	 if(info==null || info.equalsIgnoreCase("null")){
		 
	 
 %>

<tr>

<td><%=actionperformed %></td>
<td><%=action %> </td>
<td style="text-align:center;"><%=SD1 %></td>
<td style="text-align:center;"><%=AO1 %></td>
<td>---</td>
<%if(assigndays1!=null){
 %>
<td style="text-align:center;"><%=assigndays1 %></td>
<%} else { %>
<td style="text-align:center;">---</td>
<%} %>
<td style="text-align:center;"><%=aging %></td>
<td style="text-align:center;"><%=DaysSince %></td>

</tr>
<%
	 }else{
		 
		 %>

		 <tr>
		 
		 <td><%=actionperformed %></td>
		 <td><%=action %> </td>
		 <td style="text-align:center;"><%=SD1 %></td>
		 <td style="text-align:center;"><%=AO1 %></td>
		 <td><%=info %> </td>
		<%if(assigndays1!=null){
 %>
<td style="text-align:center;"><%=assigndays1 %></td>
<%} else { %>
<td style="text-align:center;">---</td>
<%} %>
	
		 <td style="text-align:center;"><%=aging %></td>
		 <td style="text-align:center;"><%=DaysSince %></td>

		 </tr>
		 <%
	 }
	 
	 
	 }
session.removeAttribute("backurl"); 
session.removeAttribute("back"); 
    try { conn.close(); } catch (Exception e) { /* ignored */ }
%>
</table>
<br>
<%
		if (exportToExcel == null) {
	%>
<!-- 	<a href="recordReport.jsp?exportToExcel=YES">Download Report in Excel</a><br><br>-->
	
	<%
		}
	%>
	<br>

     <input type="button" href="#" onclick="javascript:window.print();" class="btn btn-primary" value="Print this page" style="float:right;">
 <%   if(backurl1==null){ %>
 <input type="button" class="btn btn-primary" value="Back" style="width:8%;" onclick="closeMe();"/>
 <%
 
 }
 
 else if(backurl==null){%>
	<input type="button" class="btn btn-primary" value="Back" style="width:8%;" onclick="location.href='<%=back%>'"/>
<%}else{%> 

	<input type="button" class="btn btn-primary" value="Back" style="width:8%;" onclick="location.href='<%=back%>'"/>
<%}%>
     
     
     

</body>
</html>