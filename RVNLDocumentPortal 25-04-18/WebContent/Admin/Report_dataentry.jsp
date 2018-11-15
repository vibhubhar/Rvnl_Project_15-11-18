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

	<script>
	$(document).ready(function() {
		
		$('#example1').DataTable( {
					});
$('#example2').DataTable( {
			
		});
$('#example3').DataTable( {
	
});
$('#example4').DataTable( {
	
});
$('#example5').DataTable( {
	
});
$('#example6').DataTable( {
	
});
$('#example7').DataTable( {
	
});
$('#example8').DataTable( {
	
});
$('#example9').DataTable( {
	
});
		
	   		$('#example').DataTable( {
	      			
	   		  				   });	
	    
	});
	
	</script>
	

</head>
<body onload="mywinClose();">
	<div style="text-align: center;font-size: 18px;"><b>RVNL DATA ENTRY REPORT </b></div></br>
	<br><br> Active Sessions : <%= MySessionCounter.getActiveSessions() %> <br><br>
	<%
		String exportToExcel = request.getParameter("exportToExcel");
	Connection conn = null;
	Statement stmt = null, stmt11=null;
	ResultSet rs = null,rs11=null;
	String arguments=null;
	int i=0;
	try {
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn = ds.getConnection();

	
	//String reportType = request.getParameter("report_type");
	//System.out.println("report:"+reportType);
	//if (reportType.equalsIgnoreCase("zonewise")) {
		String query11="select z.Zone_Name, count(u.User_name) from xx_zones_master z left join xx_user_master u on z.Zone_Id = u.Zone_ID  group by z.Zone_id order by  z.Zone_Id";
		System.out.println("query:"+query11);
		stmt11 = conn.createStatement();
		rs11 = stmt11.executeQuery(query11);
		
	%>
<br> 

<table > <tr> <td valign="top" width="30%">
<span style="margin-left:20px; color:blue; font-weight:bold; font-size:18px;">Zone wise Users Creation Summary</span><br>
	<table border=1 class="table table-hover table-bordered"
		style="background-color: #F0FFFF; margin-left:20px; table-layout: auto;width: -webkit-fill-available;" id="example" class="display nowrap" cellspacing="10" >
		<thead>
		<tr class="success">
			<th style="padding: 0px 14px 24px 0px;">S.No.</th>
			<th style="padding: 0px 18px 17px 14px; ">Zone</th>
			<th width="140px">Nos. of Users Created</th>
			
			</tr></thead>
		<tbody>
		<%
			 i = 1;
			while (rs11.next()) {

				String zone = rs11.getString(1);
				//String div = rs11.getString(2);
				String noUsers = rs11.getString(2);
				System.out.println("data:"+zone+noUsers);
						%>
		<tr class="active">
			<td ><%=i%></td>
			<td ><%=zone%></td>
			<td ><%=noUsers%></td>
			
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
	//} else if (reportType.equalsIgnoreCase("zonedivwise")) {
		
				//String query="select z.Zone_Name, d.division_name,  count(u.User_name) from xx_zones_master z left join xx_divisions_map d on z.Zone_Id=d.Ext_Zone_Id left join xx_user_master u on d.Division_Id = u.Division_ID where d.Division_Name!='Headquarters' group by z.Zone_name, d.division_name Union all select z.Zone_Name, 'HQ' as division_name,  count(u.User_name) from xx_zones_master z left join xx_user_master u on z.Zone_Id = u.Zone_ID and u.Division_ID =86  group by z.Zone_id order by  Zone_name, Division_Name";
				String query="select c.Zone_Name as Zone, a.Division_Name as Division, b.ucount as Users_Created, b.DRM_GM_Users, d.pcount as Docs_Created from xx_zones_master c left join xx_divisions_map a on c.Zone_Id = a.Ext_Zone_Id left join (select division_id, count(user_Id) as ucount, count(if(designation_id=75,1,null)) as DRM_GM_Users from xx_user_master group by division_id) b on a.Division_Id = b.Division_ID left join (select division, count(document_map_id) as pcount from xx_document_mapping group by division) d on a.Division_name = d.Division where cast(a.division_id as signed) <70  union select c.Zone_Name as Zone,'Headquarters' as Division, b.ucount as Users_Created, b.DRM_GM_Users, d.pcount as Docs_Created from xx_zones_master c left join (select zone_id, count(user_Id) as ucount, count(if(designation_id=115,1,null)) as DRM_GM_Users from xx_user_master  where division_id=86 group by zone_id) b on c.zone_Id = b.zone_ID left join (select zone, count(document_map_id) as pcount from xx_document_mapping group by zone) d on c.zone_name = d.zone  order by Zone, (Division = 'Headquarters') DESC, Division";
				//System.out.println("query:"+query);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>
</td><td valign="top" width="35%" rowspan="2">
<span style="margin-left:20px; color:blue; font-weight:bold; font-size:18px;">Zone/Division wise Users Creation Summary</span><br>
	
	<table border=1 class="table table-hover table-bordered"
		style="background-color: #F0FFFF; margin-left:20px;table-layout: auto;width:-webkit-fill-available;" id="example1" class="display nowrap" cellspacing="0" width="100%">
		<thead>
		<tr class="success">
			<th style="padding: 0px 14px 24px 0px;">S.No.</th>
			<th style="padding: 0px 18px 17px 14px; ">Zone</th>
			<th style="padding: 0px 0px 26px 19px;">Division</th>
			<th width="140px">Nos. of Users Created</th>
			<th width="140px">Nos. of DRMs/GMs Created</th>
			<th width="140px">Nos. of Documents Created</th>
			</tr></thead>
		<tbody>
		<%
			 i = 1;
			while (rs.next()) {

				String zone = rs.getString(1);
				String div = rs.getString(2);
				String noUsers = rs.getString(3);
				String noDRM_GM = rs.getString(4);
				String noDocs = rs.getString(5);
						%>
		<tr class="active">
			<td><%=i%></td>
			<td><%=zone%></td>
			<td><%=div%></td>
			<td><%=noUsers%></td>
			<td><%=noDRM_GM%></td>
			<td><%=noDocs%></td>
			
		</tr>
		<%
			i++;
			}
			rs.close();
			stmt.close();
			
		%>
		</tbody>
	</table>
	<span style="color:red; background-color:yellow; font-style:italic;">Note: 'Nos. of Docs Created' shown against 'Headquarters' in above table is total sum of those created for all divisions of that zone.</span>
	<br><br>
	<%
//	} else if (reportType.equalsIgnoreCase("piuwise")) {
		
		 query="select p.piu_Name,   count(u.User_name) from xx_piu_master p left join xx_user_master u on u.PIU_ID = p.piu_id group by p.piu_name";
//System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
</td></tr>
<tr><td valign="top" width="35%">
<span style="margin-left:20px; color:blue; font-weight:bold; font-size:18px;">PIU wise Users Creation Summary</span><br>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;width: -webkit-fill-available;" id="example9" class="display nowrap" cellspacing="0" >
<thead>
<tr class="success">
	<th style="padding: 0px 14px 24px 0px;">S.No.</th>
	<th style="padding: 0px 18px 17px 14px; ">PIU</th>
	<th width="140px">Nos. of Users Created</th>
	
	</tr></thead>
<tbody>
<%
	 i = 1;
	while (rs.next()) {

		String zone = rs.getString(1);
		//String div = rs.getString(2);
		String noUsers = rs.getString(2);
				%>
<tr class="active">
	<td><%=i%></td>
	<td><%=zone%></td>
	<td><%=noUsers%></td>
	
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
		
	 query="select a.piu_name,   count(b.project), sum(b.PackageOfProject), count(if(b.completed='y',1,null)) from xx_piu_master a left join xx_projectattributes_master b on a.PIU_Name=b.PIU_of_RVNL group by piu_name";
//System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
</td></tr><tr><td>
<span style="margin-left:20px; color:blue; font-weight:bold; font-size:18px;">PIU wise Project-Package Creation Summary</span><br>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;width: -webkit-fill-available;" id="example2" class="display nowrap" cellspacing="0">
<thead>
<tr class="success">
	<th style="padding: 0px 14px 24px 0px;">S.No.</th>
	<th style="padding: 0px 18px 17px 14px; ">PIU</th>
	<th width="140px">Nos. of Projects Created</th>
	<th width="140px">Nos. of Packages</th>
	<th width="140px">Nos. of Packages Created</th>
	</tr></thead>
<tbody>
<%
	 i = 1;
	while (rs.next()) {

		String zone = rs.getString(1);
		//String div = rs.getString(2);
		String noUsers = rs.getString(2);
		String noUsers1 = rs.getString(3);
		String noUsers2 = rs.getString(4);
				%>
<tr class="active">
	<td><%=i%></td>
	<td><%=zone%></td>
	<td><%=noUsers%></td>
	<td><%=noUsers1%></td>
	<td><%=noUsers2%></td>
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
		
 query="select a.piu_name,  count(c.Document_Map_ID), count(if(c.Forwarded='yes',1,null)) from xx_piu_master a left join xx_projectattributes_master b on a.PIU_Name=b.PIU_of_RVNL left join xx_document_mapping c on b.Project_ID = c.Project_ID  group by a.piu_name";
//System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
</td><td>
<span style="margin-left:20px; color:blue; font-weight:bold; font-size:18px;">PIU wise Documents Creation & Forwarding Summary</span><br>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;width: -webkit-fill-available;" id="example3" class="display nowrap" cellspacing="0">
<thead>
<tr class="success">
	<th style="padding: 0px 14px 24px 0px;">S.No.</th>
	<th style="padding: 0px 18px 17px 14px; ">PIU</th>
	<th width="140px">Nos. of Documents Created</th>
	<th width="140px">Nos. of Documents Forwarded to Rlys</th>
	</tr></thead>
<tbody>
<%
	 i = 1;
	while (rs.next()) {

		String zone = rs.getString(1);
		//String div = rs.getString(2);
		String noUsers = rs.getString(2);
		String noUsers1 = rs.getString(3);
				%>
<tr class="active">
	<td><%=i%></td>
	<td><%=zone%></td>
	<td><%=noUsers%></td>
	<td><%=noUsers1%></td>
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
<span style="margin-left:250px; color:blue; font-weight:bold; font-size:18px;">Project Documents Movement Summary for last 15 days</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
query="select date(Real_ActionDate) as Date1, count(if(ActionPerformed='Submitted',1,null)) as Nos_Submitted, count(if(ActionPerformed='Resubmitted',1,null)) as Nos_Resubmitted, count(if(ActionPerformed='Pulled back by RVNL',1,null)) as Nos_pulledBack, count(if(ActionPerformed='Forward With Approval',1,null)) as Nos_Fwd_appd, count(if(ActionPerformed='Returned to RVNL with approval',1,null)) as Nos_retnd_appd, count(if(ActionPerformed='Returned to RVNL',1,null)) as Nos_retnd_unappd, count(if(ActionPerformed='Forward without Approval',1,null)) as Nos_Fwd_unappd from xx_record_actions where date(Real_ActionDate) between  DATE_ADD(CURDATE(), INTERVAL -15 day) and CURDATE()  group by date(Real_ActionDate)";
//"select DATE_format(Last_login,'%d/%m/%Y') as dd, Count(if (Type='MOR',1, null)) AS MOR_Users_logged, Count(if (Type='MOR' and Designation_Id=75,1, null)) AS DRMs_logged,Count(if (Type='MOR' and Designation_Id=115,1, null)) AS GMs_logged, Count(if (Type='RVNL',1, null)) AS RVNL_Users_logged, Count(if (Type='RVNL' and (Role='LocalUser' or Role='System Administrator'),1, null)) AS RVNL_Admins_logged, count(User_id) as Total_Users_logged from xx_user_master where Last_login between DATE_ADD(CURDATE(), INTERVAL -15 day) and now()  group by DATE_format(Last_login,'%d/%m/%Y') order by Last_login";		
System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;width: -webkit-fill-available;" id="example4" class="display nowrap" cellspacing="0">
<thead>
<tr class="success">
	<th width="100px" >Date</th>
	<th >Nos. Submitted (RVNL)</th>
	<th>Nos. Resubmitted (RVNL)</th>
	<th>Nos. Pulled Back (RVNL)</th>
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
<span style="margin-left:250px; color:blue; font-weight:bold; font-size:18px;">Portal User Logins Summary for last 15 days</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
query="select * from xx_logins where Date1 between DATE_ADD(CURDATE(), INTERVAL -15 day) and CURDATE() Union select "+
" DATE(Last_login) as Date1, Count(if (Type='MOR',1, null)) AS Rly_Total, Count(if (Type='MOR' and Designation_Id=75,1, null)) AS Rly_DRM,Count(if (Type='MOR' and Designation_Id=115,1, null)) AS Rly_GM, Count(if (Type='RVNL',1, null)) AS RVNL_Total, Count(if (Type='RVNL' and (Role='LocalUser' or Role='System Administrator'),1, null)) AS RVNL_Admins, count(User_id) as Total_Logins from xx_user_master where DATE(Last_login) = DATE(now()) ";		
System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;width: -webkit-fill-available;" id="example5" class="display nowrap" cellspacing="0" >
<thead>
<tr class="success">
	<th >Date</th>
	<th >Nos. Logged (Rly all)</th>
	<th>Nos. Logged (DRM)</th>
	<th>Nos. Logged (GM)</th>
	<th>Nos. Logged (RVNL all)</th>
	<th>Nos. Logged (RVNL Admins)</th>
	<th>Total Nos. of Users Logged</th>
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
	<td><%=col1%></td>
	<td><%=col2%></td>
	<td><%=col3%></td>
	<td><%=col4%></td>
	<td><%=col5%></td>
	<td><%=col6%></td>
	<td><%=col7%></td>
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
<span style="margin-left:250px; color:blue; font-weight:bold; font-size:18px;">User logins during last 3 days</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
		
 query="select last_login as dd, type, user_name,  Officer_Name, Email_Id, Contact_No from xx_user_master where Last_login between DATE_ADD(CURdate(), INTERVAL -3 day) and now() order by dd, type, User_name";
System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;width: -webkit-fill-available;" id="example6" class="display nowrap" cellspacing="0">
<thead>
<tr class="success">
	<th >Date & Time of Login</th>
	<th>Organization</th>
	<th >User Id</th>
	<th width="140px">Name</th>
	<th width="140px">Email</th>
	<th width="100px">Mobile</th>
	</tr></thead>
<tbody>
<%
	 i = 1;
	while (rs.next()) {

		String dd1 = rs.getString(1);
		String type1 = rs.getString(2);
		String uid = rs.getString(3);
		String name1 = rs.getString(4);
		String email1 = rs.getString(5);
		String mob1 = rs.getString(6);	
				%>
<tr class="active">
	<td><%=dd1%></td>
	<td><%=type1%></td>
	<td><%=uid%></td>
	<td><%=name1%></td>
	<td><%=email1%></td>
	<td><%=mob1%></td>
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
<span style="margin-left:450px; color:blue; font-weight:bold; font-size:18px;">RVNL Users Data Entry Details</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
		
 query="select a.*, b.PIU_Name, e.Department_Name, f.Designation_Name from xx_user_master a, xx_piu_master b,  xx_departments_master e, xx_designation_master f  where a.PIU_ID = b.PIU_Id  and a.Department_id = e.Department_Id and a.Designation_Id = f.Designation_Id order by a.Type, b.PIU_Name, e.Department_Name, a.User_Name";
System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;width: -webkit-fill-available;" id="example7" class="display nowrap" cellspacing="0" >
<thead>
<tr class="success">
	<th style="padding: 0px 14px 24px 0px;">S.No.</th>
	<th style="padding: 0px 18px 17px 14px; ">Type</th>
	<th style="padding: 0px 18px 17px 14px; ">PIU</th>
	<th style="padding: 0px 18px 17px 14px; ">Deptt.</th>
	<th style="padding: 0px 18px 17px 14px; ">User Id</th>
	<th style="padding: 0px 14px 24px 0px;">Regd Id</th>
	<th style="padding: 0px 18px 17px 14px; ">Role</th>
	<th style="padding: 0px 18px 17px 14px; ">Design.</th>
	<th width="140px">Name</th>
	<th width="140px">Email</th>
	<th width="100px">Mobile</th>
	<th width="100px">Mail Status</th>
	<th width="100px">Real Date Status</th>
	<th width="100px">Created By</th>
	<th width="100px">Date Created</th>
	<th width="100px">Theme</th>
	<th width="100px">Last_Login</th>
	</tr></thead>
<tbody>
<%
	 i = 1;
	while (rs.next()) {

		String rid = rs.getString(1);
		String uid = rs.getString(2);
		String role1 = rs.getString(4);
		String type1 = rs.getString(5);
		String piu1 = rs.getString(21);
		String dept1 = rs.getString(22);
		String desgn1 = rs.getString(23);
		String name1 = rs.getString(12);
		String email1 = rs.getString(13);
		String mob1 = rs.getString(14);
		String mailstat1 = rs.getString(15);
		String realdate1 = rs.getString(16);
		String createdby = rs.getString(17);
		String date_created1 = rs.getString(18);
		String theme1 = rs.getString(19);
		String last_login1 = rs.getString(20);
		
				%>
<tr class="active">
	<td><%=i%></td>
	<td><%=type1%></td>
	<td><%=piu1%></td>
	<td><%=dept1%></td>
	<td><%=uid%></td>
	<td><%=rid%></td>
	<td><%=role1%></td>
	<td><%=desgn1%></td>
	<td><%=name1%></td>
	<td><%=email1%></td>
	<td><%=mob1%></td>
	<td><%=mailstat1%></td>
	<td><%=realdate1%></td>
	<td><%=createdby%></td>
	<td><%=date_created1%></td>
	<td><%=theme1%></td>
	<td><%=last_login1%></td>
	</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
%>
</tbody>
</table>

</td></tr><tr>
<td colspan="2"><br><br>
<span style="margin-left:450px; color:blue; font-weight:bold; font-size:18px;">Railway Users Data Entry Details</span><br>
<%
//	} else if (reportType.equalsIgnoreCase("docs")) {
		
 query="select a.*, c.Zone_Name, d.division_name, e.Department_Name, f.Designation_Name from xx_user_master a, xx_zones_master c, xx_divisions_master d, xx_departments_master e, xx_designation_master f  where  a.Zone_ID = c.Zone_Id and a.Division_ID = d.division_id and a.Department_id = e.Department_Id and a.Designation_Id = f.Designation_Id order by a.Type, c.Zone_Name, d.Division_Name='Headquarters' DESC, d.Division_Name, e.Department_Name, a.User_Name";
//System.out.println("query:"+query);
stmt = conn.createStatement();
rs = stmt.executeQuery(query);
%>
<table border=1 class="table table-hover table-bordered"
style="background-color: #F0FFFF; margin-left:20px;width: -webkit-fill-available;" id="example8" class="display nowrap" cellspacing="0" >
<thead>
<tr class="success">
	<th style="padding: 0px 14px 24px 0px;">S.No.</th>
	<th style="padding: 0px 18px 17px 14px; ">Type</th>
	<th style="padding: 0px 18px 17px 14px; ">Zone</th>
	<th style="padding: 0px 18px 17px 14px; ">Division</th>
	<th style="padding: 0px 18px 17px 14px; ">Deptt.</th>
	<th style="padding: 0px 18px 17px 14px; ">User Id</th>
	<th style="padding: 0px 14px 24px 0px;">Regd Id</th>
	<th style="padding: 0px 18px 17px 14px; ">Role</th>
	<th style="padding: 0px 18px 17px 14px; ">Design.</th>
	<th width="140px">Name</th>
	<th width="140px">Email</th>
	<th width="100px">Mobile</th>
	<th width="100px">Mail Status</th>
	<th width="100px">Real Date Status</th>
	<th width="100px">Created By</th>
	<th width="100px">Date Created</th>
	<th width="100px">Theme</th>
	<th width="100px">Last_Login</th>
	</tr></thead>
<tbody>
<%
	 i = 1;
	while (rs.next()) {

		String rid = rs.getString(1);
		String uid = rs.getString(2);
		String role1 = rs.getString(4);
		String type1 = rs.getString(5);
		String zone1 = rs.getString(21);
		String divn1 = rs.getString(22);
		String dept1 = rs.getString(23);
		String desgn1 = rs.getString(24);
		String name1 = rs.getString(12);
		String email1 = rs.getString(13);
		String mob1 = rs.getString(14);
		String mailstat1 = rs.getString(15);
		String realdate1 = rs.getString(16);
		String createdby = rs.getString(17);
		String date_created1 = rs.getString(18);
		String theme1 = rs.getString(19);
		String last_login1 = rs.getString(20);
		
				%>
<tr class="active">
	<td><%=i%></td>
	<td><%=type1%></td>
	<td><%=zone1%></td>
	<td><%=divn1%></td>
	<td><%=dept1%></td>
	<td><%=uid%></td>
	<td><%=rid%></td>
	<td><%=role1%></td>
	<td><%=desgn1%></td>
	<td><%=name1%></td>
	<td><%=email1%></td>
	<td><%=mob1%></td>
	<td><%=mailstat1%></td>
	<td><%=realdate1%></td>
	<td><%=createdby%></td>
	<td><%=date_created1%></td>
	<td><%=theme1%></td>
	<td><%=last_login1%></td>
	</tr>
<%
	i++;
	}
	rs.close();
	stmt.close();
	 try { conn.close(); } catch (Exception e) { /* ignored */ }
%>
</tbody>
</table>
</td>
</tr></table>
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
