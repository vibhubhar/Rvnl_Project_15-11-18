<!DOCTYPE html >
<html>
<head>
		<link href="http://adobe.github.io/Spry/widgets/accordion/SpryAccordion.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="resources/css/form-style.css">
		<%@ page import ="java.text.SimpleDateFormat"%>
 <%@ page import ="java.util.Date"%>
 <%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
//String theme1 = request.getParameter("myTheme");

//String theme1 = (String) pageContext.getAttribute("myTheme", PageContext.SESSION_SCOPE);
String theme1 = (String) session.getAttribute("myTheme");
//System.out.println("My Theme="+theme1);
//String theme1="brown";
if (theme1!=null) {
if (theme1.equalsIgnoreCase("brown") ) { %>
		<link rel="stylesheet" type="text/css" href="resources/css/ThmBrown.css">
		<% } else if (theme1.equalsIgnoreCase("blue")) { %> 
		<link rel="stylesheet" type="text/css" href="resources/css/ThmBlue.css">
		<%} else if (theme1.equalsIgnoreCase("green")) { %> 
		<link rel="stylesheet" type="text/css" href="resources/css/ThmGreen.css">
		<%} else if (theme1.equalsIgnoreCase("magenta")) { %> 
		<link rel="stylesheet" type="text/css" href="resources/css/Thmmagenta.css">
		<%} 
} else {%>
<link rel="stylesheet" type="text/css" href="resources/css/ThmBrown.css">
		<%} %>
<meta charset="ISO-8859-1">
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<title>PDAMS - Dashboard</title>
<script language="JavaScript" type="text/javascript" src="http://adobe.github.io/Spry/widgets/accordion/SpryAccordion.js"></script>

	<%@include file="included/NewHeader.jsp"%>
	<%@ page session="true" %>   
 <%@include file="sessionCheck.jsp"%>
		<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>  
		
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
/*
$(function () {
	$("#chartContainer").CanvasJSChart({ //Pass chart options
		data: [
		{
		type: "column", //change it to column, spline, line, pie, etc
		dataPoints: [
			{ x: 10, y: 10 },
			{ x: 20, y: 14 },
			{ x: 30, y: 18 },
			{ x: 40, y: 22 },
			{ x: 50, y: 18 },
			{ x: 60, y: 28 }
		]
	}
	]
});

});
*/
</script>
 
 <style>
.white-marquee {
   font-family: serif, calibri, "Times New Roman", Times;
	font-size: 16px;
	color: blue;
	//margin-left:50px;
	//width:50%;
	font-weight:bold;
	padding:10px;
	padding-bottom:5px;
}
div #menu2 {
margin-top: 0px;
margin-left:20px;
padding-right:20px;
}
</style>
 
<script>

$(document).ready(function() {
	$( "#menu ul" ).append( "<li><a href='admn_logout.jsp'>Logout</a></li>");

	var usr1=document.getElementById("menu1").value;
$("#menu11").append('<h8><span style="text-align:center;margin-top:4px; margin-left:30%;font-size: x-large; color:white; padding:5px; "><b>D A S H B O A R D</u></b></span><font style="color:hotpink; margin-left: 24%; font-weight:normal; font-size: medium;">&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#fff; font-weight:normal">:&nbsp;'+usr1+'&nbsp;&nbsp;</h8>');
});

function changeTheme(n, thm) {
	// Check browser support
/*
	if (typeof(Storage) !== "undefined") {
    // Store
    localStorage.setItem("Theme2", thm);
    // Retrieve
   // document.getElementById("myTheme").innerHTML = localStorage.getItem("Theme1");
} else {
    //document.getElementById("result").innerHTML = "Sorry, your browser does not support Web Storage...";
alert("Sorry, your browser does not support Web Storage...");
}
*/ 
//document.getElementById("myTheme").value=thm;
var xmlhttp;
//var k=document.getElementById(element).value;
var urls="Themes.jsp?ThmType="+thm+"&ThmNo="+n;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4)
    {
        document.getElementById("thm").innerHTML=xmlhttp.responseText;
 setTimeout(function() {location.reload(true);},1000);
  }
}
xmlhttp.open("GET",urls,true);
xmlhttp.send();

}
</script>
</head>
<body>
<%
String role1=(String)session.getAttribute("role");
String role=(String)session.getAttribute("Type");
String zone_id1=(String)session.getAttribute("zone_id"); 
String piu_id1=(String)session.getAttribute("piu_id"); 
String div_id1=(String)session.getAttribute("Division_Id");
//String org_id1=(String)session.getAttribute("Org_Id");
String user = (String) session.getAttribute("user_name");
String filter1 = null, filter11=null, Zone=null, divn=null, piu=null;
int code=1;
Connection conn = null;
PreparedStatement ps31=null, ps32=null, ps33=null;
ResultSet  rs31=null, rs32=null, rs33=null;
Statement stmt = null, stmt1=null, stmt2=null, stmt3=null, stmt4=null;
ResultSet rs = null,rs11=null, rs51=null, rs12=null, rs13=null, rs14=null;
String arguments=null;
%>
<sql:update dataSource="jdbc/MySQLDB" var="rs">
	UPDATE xx_user_master SET Last_login=now() where User_name='<%=user%>'                                 
</sql:update>
<%

try {
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

conn = ds.getConnection();

//System.out.println(",,,,,"+role1+role+zone_id1+piu_id1+div_id1+user);
 if(role.equalsIgnoreCase("MOR") && zone_id1.equalsIgnoreCase("18")){
	 filter1=""; code=1;
}else if(role.equalsIgnoreCase("MOR")){
	if 	(!zone_id1.equalsIgnoreCase(null)){
			String sql31 = "select Zone_Name from xx_zones_master  where Zone_Id="+zone_id1; 
			ps31 = conn.prepareStatement(sql31);
			rs31 = ps31.executeQuery();
		if (rs31.next()) {
			Zone=rs31.getString("Zone_Name");
			filter1="Zone='"+Zone+"'";
		}
	}
	if 	(!div_id1.equalsIgnoreCase(null) && !div_id1.equalsIgnoreCase("86") ){
		String sql32 = "select division_name from xx_divisions_master  where division_id="+div_id1; 
		ps32 = conn.prepareStatement(sql32);
		rs32 = ps32.executeQuery();
	if (rs32.next()) {
		divn=rs32.getString("division_name");
		filter11=filter1+" and BMR.division='"+divn+"'";
		filter1=filter1+" and Division='"+divn+"'";
		
	}
}
	code=2;
 }else if(role.equalsIgnoreCase("RVNL") && piu_id1.equalsIgnoreCase("27")){
	 filter1=""; 
	 if (role.equalsIgnoreCase("RVNL") && role1.equalsIgnoreCase("System Administrator")) {
		 code=3;
			 } else { 
				 code=1;
			 }
	  } else {
	 if 	(!piu_id1.equalsIgnoreCase(null)){
			String sql33 = "select PIU_Name from xx_piu_master  where PIU_Id="+piu_id1; 
			ps33 = conn.prepareStatement(sql33);
			rs33 = ps33.executeQuery();
		if (rs33.next()) {
			piu=rs33.getString("PIU_Name");
			filter1="PIU_of_RVNL='"+piu+"'";
		}
	}
	 if (role.equalsIgnoreCase("RVNL") && role1.equalsIgnoreCase("LocalUser")) {
 code=4;
	 } else { 
		 code=5;
	 }
 }
 
String nrly1=null, nrvnl1=null, nothers1=null, ndivn1=null;
String query = "select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,docm.Document_status,ram.CurrentDate,ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,bmr.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy";
if (filter1 != "") {
	query=query+" and document_status='pending' and "+filter1;
} else {
	query=query+" and document_status='pending'";
}
String 	query1="select Count(if (Type='MOR', 1 , null)) as nrly,  Count(if (Type='RVNL', 1 , null)) as nrvnl,  Count(if (Type='Others', 1 , null)) as nothers, Count(if (Type='MOR' and division_id="+div_id1+", 1 , null)) as ndivn from (" + query+ ") as pkrly";

stmt = conn.createStatement();
rs = stmt.executeQuery(query1);
while (rs.next()) {
	nrly1 = rs.getString(1);
	nrvnl1 = rs.getString(2);
	nothers1 = rs.getString(3);
	ndivn1 = rs.getString(4);
}
//System.out.println("11===="+query1+"22==="+nrly1+nrvnl1+nothers1+ndivn1);
 %>
 
 <input type="hidden" id="menu1" value='<%=user %>'>
 <br><br>
<div id="thm" style="float:right; margin-top:-30px;" > <h5><b>Theme 
<% 
//String mytheme= request.getParameter("myTheme");
String mthm=null, mstyle=null, mstyle2=null;
int nr=5;
for (int i=1;i<nr;i++){
switch(i) {
case 1:
	mthm="brown";
	mstyle="margin-left:20px; background-color:brown; height:25px; width:10px;";
	mstyle2="margin-left:20px; background-color:brown; height:30px; width:15px;";
	break;
case 2:
	mthm="blue";
	mstyle="margin-left:20px; background-color:blue; height:25px; width:10px;";
	mstyle2="margin-left:20px; background-color:blue; height:30px; width:15px;";
	break;
case 3:
	mthm="green";
	mstyle="margin-left:20px; background-color:green; height:25px; width:10px;";
	mstyle2="margin-left:20px; background-color:green; height:30px; width:15px;";
	break;
case 4:
	mthm="magenta";
	mstyle="margin-left:20px; margin-right:20px; background-color:#8B008B; height:25px; width:10px;";
	mstyle2="margin-left:20px; margin-right:20px; background-color:#8B008B; height:30px; width:15px;";
	break;
default:
	mthm="brown";
	mstyle="margin-left:20px; background-color:brown; height:25px; width:10px;";
	mstyle2="margin-left:20px; background-color:brown; height:30px; width:15px;";
}
if (theme1!=null){
 if (theme1.equalsIgnoreCase("brown")){
if (i!=1) {%>
<input class='btn btn-primary' id="thm<%=i %>" Style="<%=mstyle%>"  onClick="changeTheme(<%=i %>,'<%=mthm %>')" type='button'/>
<% } else { %>
<input class='btn btn-primary' id="thm<%=i %>" Style="<%=mstyle2%>"  onClick="changeTheme(<%=i %>,'<%=mthm %>')" type='button'/>
<%} 
} else if (theme1.equalsIgnoreCase("blue")){
if (i!=2) {%>
<input class='btn btn-primary' id="thm<%=i %>" Style="<%=mstyle%>"  onClick="changeTheme(<%=i %>,'<%=mthm %>')" type='button'/>
<% } else { %>
<input class='btn btn-primary' id="thm<%=i %>" Style="<%=mstyle2%>"  onClick="changeTheme(<%=i %>,'<%=mthm %>')" type='button'/>
<%}
} else if (theme1.equalsIgnoreCase("green")){
if (i!=3) {%>
<input class='btn btn-primary' id="thm<%=i %>" Style="<%=mstyle%>"  onClick="changeTheme(<%=i %>,'<%=mthm %>')" type='button'/>
<% } else { %>
<input class='btn btn-primary' id="thm<%=i %>" Style="<%=mstyle2%>"  onClick="changeTheme(<%=i %>,'<%=mthm %>')" type='button'/>
<%}
} else if (theme1.equalsIgnoreCase("magenta")){
if (i!=4) {%>
<input class='btn btn-primary' id="thm<%=i %>" Style="<%=mstyle%>"  onClick="changeTheme(<%=i %>,'<%=mthm %>')" type='button'/>
<% } else { %>
<input class='btn btn-primary' id="thm<%=i %>" Style="<%=mstyle2%>"  onClick="changeTheme(<%=i %>,'<%=mthm %>')" type='button'/>
<%} 
} 
} else {
	if (i!=1) {%>
	<input class='btn btn-primary' id="thm<%=i %>" Style="<%=mstyle%>"  onClick="changeTheme(<%=i %>,'<%=mthm %>')" type='button'/>
	<% } else { %>
	<input class='btn btn-primary' id="thm<%=i %>" Style="<%=mstyle2%>"  onClick="changeTheme(<%=i %>,'<%=mthm %>')" type='button'/>
	<%} 
}
}
%>
					</b></h5>					
										</div>
<br>
<% if(code==1) { %>
<table class="acc2" >
<tr class="acc3">
<td class="acc4" width="30%" valign="top"> 
<div class="Accordion" id="sampleAccordion" tabindex="0">
		
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Reports</div>
		<div class="AccordionPanelContent">
			<ul class="acc">
                  <li class="acc1"><a class="pk2" href="Reportpiuinitiate.jsp">Document Reports</a></li>
                  <li class="acc1"><a class="pk2" href="PublicView.jsp">Public View Report</a></li>
                  <li class="acc1"><a class="pk2" href="User_List.jsp">Users List</a></li>
                   </ul>
		</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Actions</div>
		<div class="AccordionPanelContent">
		  <ul class="acc">
                   <li class="acc1"><a class="pk2" href="changepasswordlocaladmin.jsp">Change my password</a></li>
                   </ul>
		</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Support</div>
		<div class="AccordionPanelContent">
			<ul class="acc">
                   <li class="acc1"><a class="pk2" href="help_rb_co.jsp">Help</a></li>
 		   <li class="acc1"><a class="pk2" href="ContactUs.jsp">Contact us</a></li>
                   </ul>
		</div>
	</div>
</div>
</td>
<td valign="top">
		<div class="dpan">Status</div>
		<ul class="pan">
		<li class="pan1"><a class="pk2">Nos. of documents pending for approval with Railways = <%=nrly1 %> </a></li> 
		<li class="pan1"><a class="pk2">Nos. of documents pending for compliance with RVNL = <%=nrvnl1 %> </a></li>
		<li class="pan1"><a class="pk2">Nos. of documents pending for approval with Other Organizations  = <%=nothers1 %> </a></li>
				
		</ul>
</td>
</tr>
</table>
<%} else if (code==2) {%>

<table class="acc2" >
<tr class="acc3">
<td class="acc4" width="30%"> 
<div class="Accordion" id="sampleAccordion" tabindex="0">
		<div class="AccordionPanel">
		<div class="AccordionPanelTab">Actions</div>
		<div class="AccordionPanelContent">
		  <ul class="acc">
		   <li class="acc1"><a class="pk2" href="ApprovalWorkflow.jsp">My Tasks</a></li>
                   <li class="acc1"><a class="pk2" href="changepasswordlocaladmin.jsp">Change my password</a></li>
                   </ul>
		</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Reports</div>
		<div class="AccordionPanelContent">
			<ul class="acc">
                  <li class="acc1"><a class="pk2" href="Reportpiuinitiate.jsp">Document Reports</a></li>
                  <li class="acc1"><a class="pk2" href="PublicView.jsp">Public View Report</a></li>
                  <li class="acc1"><a class="pk2" href="User_List.jsp">Users List</a></li>
                   </ul>
		</div>
	</div>
	
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Support</div>
		<div class="AccordionPanelContent">
			<ul class="acc">
                   <li class="acc1"><a class="pk2" href="helpuser.jsp">Help</a></li>
 		   <li class="acc1"><a class="pk2" href="ContactUs.jsp">Contact us</a></li>
                   </ul>
		</div>
	</div>
</div>
</td>
<td valign="top">
		<div class="dpan">Status</div>
		<ul class="pan"><br>
		<% if (div_id1.equalsIgnoreCase("86")) {%>
		<li class="pan1"><a class="pk2">Nos. of documents pending for approval with Zonal Railway = <%=nrly1 %> </a></li> 
		<% } else { %>
		<li class="pan1"><a class="pk2">Nos. of documents pending for approval with Division = <%=ndivn1 %> </a></li> 
		<% }  %>
		<li class="pan1"><a class="pk2">Nos. of documents pending for compliance with RVNL = <%=nrvnl1 %> </a></li>
		<li class="pan1"><a class="pk2">Nos. of documents pending for approval with Other Organizations  = <%=nothers1 %> </a></li>
		
		</ul>
</td>
</tr>
</table>
<%} else if (code==3) {%>

<table class="acc2" >
<tr class="acc3">
<td class="acc4" width="30%"> 
<div class="Accordion" id="sampleAccordion" tabindex="0">
		<div class="AccordionPanel">
		<div class="AccordionPanelTab">Data Entry/Edit</div>
		<div class="AccordionPanelContent">
		<ul class="acc">
		<li class="acc1"><a class="pk2" href="c_user.jsp">Create/edit a user or local-admin</a></li>
                  <li class="acc1"><a class="pk2" href="Update.jsp">Create/edit master data</a></li>
                  <li class="acc1"><a class="pk2" href="CreateProjects.jsp">Create/edit project data</a></li>
		</ul>
   			</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Reports</div>
		<div class="AccordionPanelContent">
			<ul class="acc">
                  <li class="acc1"><a class="pk2" href="Reportpiuinitiate.jsp">Document Reports</a></li>
                  <li class="acc1"><a class="pk2" href="PublicView.jsp">Public View Report</a></li>
                  <li class="acc1"><a class="pk2" href="User_list1.jsp">Users List</a></li>
                  <li class="acc1"><a class="pk2" href="Report_dataentry.jsp?report_type=zonewise" target="_blank">Data Entry Progress Report</a></li>
                    <li class="acc1"><a class="pk2" href="Report_Docs.jsp?report_type=zonewise" target="_blank">Document Movement History Report</a></li>
                    <li class="acc1"><a class="pk2" href="MyDatatables.jsp?" >Data Details</a></li>
                   </ul>
		</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Actions</div>
		<div class="AccordionPanelContent">
		  <ul class="acc">
		 		 <li class="acc1"><a class="pk2" href="document_modify.jsp">Modify document</a></li>
                   <li class="acc1"><a class="pk2" href="documentrevision.jsp">Reopen a closed document</a></li>
                   <li class="acc1"><a class="pk2" href="Hidden_doc_deletion.jsp">Show/hide/delete documents</a></li>
                   <li class="acc1"><a class="pk2" href="MyDatadetails.jsp">View/edit data</a></li>
 		   <li class="acc1"><a class="pk2" href="datesetting.jsp">Settings</a></li>
 		   <li class="acc1"><a class="pk2" href="Maintenance.jsp">Maintenance Messages</a></li>
                   <li class="acc1"><a class="pk2" href="changepasswordlocaladmin.jsp">Change my password</a></li>
                   </ul>
		</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Support</div>
		<div class="AccordionPanelContent">
			<ul class="acc">
                   <li class="acc1"><a class="pk2" href="helpadmin.jsp">Help</a></li>
 		   <li class="acc1"><a class="pk2" href="ContactUs.jsp">Contact us</a></li>
                   </ul>
		</div>
	</div>
</div>
</td>
<td valign="top">
		<div class="dpan">Status</div>
		<ul class="pan"><br>
		<li class="pan1"><a class="pk2" >Nos. of documents pending for approval with Railways = <%=nrly1 %> </a></li> 
		<li class="pan1"><a class="pk2"  href="#">Nos. of documents pending for compliance with RVNL = <%=nrvnl1 %> </a></li>
		<li class="pan1"><a class="pk2" href="#">Nos. of documents pending for approval with Other Organizations  = <%=nothers1 %> </a></li>
		

		</ul>
</td>
</tr>
</table>
<%} else if (code==4) {%>

<table class="acc2" >
<tr class="acc3">
<td class="acc4" width="30%"> 
<div class="Accordion" id="sampleAccordion" tabindex="0">
		<div class="AccordionPanel">
		<div class="AccordionPanelTab">Data Entry/Edit</div>
		<div class="AccordionPanelContent">
		<ul class="acc">
		<li class="acc1"><a class="pk2" href="local_user.jsp">Create/edit a user</a></li>
        <li class="acc1"><a class="pk2" href="CreateProjects.jsp">Create/edit project data</a></li>
		</ul>
   			</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Reports</div>
		<div class="AccordionPanelContent">
			<ul class="acc">
                  <li class="acc1"><a class="pk2" href="Reportpiuinitiate.jsp">Document Reports</a></li>
                  <li class="acc1"><a class="pk2" href="PublicView.jsp">Public View Report</a></li>
                  <li class="acc1"><a class="pk2" href="User_list1.jsp">Users List</a></li>
                   </ul>
		</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Actions</div>
		<div class="AccordionPanelContent">
		  <ul class="acc">
               <!--    <li class="acc1"><a class="pk2" href="mailaction.jsp">Change setting for SMS/e-mail reminders</a></li>   --> 
                    <li class="acc1"><a class="pk2" href="changepasswordlocaladmin.jsp">Change my password</a></li>
                   </ul>
		</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Support</div>
		<div class="AccordionPanelContent">
			<ul class="acc">
                   <li class="acc1"><a class="pk2" href="helplocaladmin.jsp">Help</a></li>
 		   <li class="acc1"><a class="pk2" href="ContactUs.jsp">Contact us</a></li>
                   </ul>
		</div>
	</div>
</div>
</td>
<td valign="top">
		<div class="dpan">Status</div>
		<ul class="pan"><br>
		<li class="pan1"><a class="pk2">Nos. of documents pending for approval with Railways = <%=nrly1 %> </a></li> 
		<li class="pan1"><a class="pk2">Nos. of documents pending for compliance with RVNL = <%=nrvnl1 %> </a></li>
		<li class="pan1"><a class="pk2">Nos. of documents pending for approval with Other Organizations  = <%=nothers1 %> </a></li>
		
		</ul>
</td>
</tr>
</table>

<%} else if (code==5) {%>
<table class="acc2" >
<tr class="acc3">
<td class="acc4" width="30%"> 
<div class="Accordion" id="sampleAccordion" tabindex="0">
		<div class="AccordionPanel">
		<div class="AccordionPanelTab">Data Entry/Edit</div>
		<div class="AccordionPanelContent">
		<ul class="acc">
		<li class="acc1"><a class="pk2" href="user_Project.jsp">Select your project packages</a></li>
		<li class="acc1"><a class="pk2" href="user_index.jsp">Add/modify documents</a></li>
                        
		</ul>
   			</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Reports</div>
		<div class="AccordionPanelContent">
			<ul class="acc">
                  <li class="acc1"><a class="pk2" href="Reportpiuinitiate.jsp">Document Reports</a></li>
                  <li class="acc1"><a class="pk2" href="PublicView.jsp">Public View Report</a></li>
                  <li class="acc1"><a class="pk2" href="User_List.jsp">Users List</a></li>
                   </ul>
		</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Actions</div>
		<div class="AccordionPanelContent">
		  <ul class="acc">
                  <li class="acc1"><a class="pk2" href="MoreInfo.jsp">Returned documents</a></li>
	   					<li class="acc1"><a class="pk2" href="PullBack.jsp">PullBack document</a></li>
	   					<li class="acc1"><a class="pk2" href="FinalApproval.jsp">Close/approve documents</a></li>
	   					<li class="acc1"><a class="pk2" href="FinallyApprovedShow.jsp">Show/hide documents</a></li>
	   					<li class="acc1"><a class="pk2" href="ManualMail.jsp">SMS/e-mail Reminders</a></li>
	   					<li class="acc1"><a class="pk2" href="changepasswordlocaladmin.jsp">Change my password</a></li>
                  
                   </ul>
		</div>
	</div>
	<div class="AccordionPanel">
		<div class="AccordionPanelTab">Support</div>
		<div class="AccordionPanelContent">
			<ul class="acc">
                   <li class="acc1"><a class="pk2" href="helpmain.jsp">Help</a></li>
 		   <li class="acc1"><a class="pk2" href="ContactUs.jsp">Contact us</a></li>
                   </ul>
		</div>
	</div>
</div>
</td>
<td valign="top">
		<div class="dpan">Status</div>
		<ul class="pan"><br>
		<li class="pan1"><a class="pk2" >Nos. of documents pending for approval with Railways = <%=nrly1 %> </a></li> 
		<li class="pan1"><a class="pk2"  href="#">Nos. of documents pending for compliance with PIU = <%=nrvnl1 %> </a></li>
		<li class="pan1"><a class="pk2" href="#">Nos. of documents pending for approval with Other Organizations  = <%=nothers1 %> </a></li>
		

		</ul>
		
		
</td>
</tr>
</table>

<%} 
}catch(Exception e){
	
	e.printStackTrace();
} finally {
    try { conn.close(); } catch (Exception e) { /* ignored */ }
}
//pageContext.setAttribute("myIndex", "1", PageContext.SESSION_SCOPE);%>
<br><br><br>
<!-- <input type="image" src="http://example.com/path/to/image.png" />  
<input type="image" id="btnclick" src="images/mygraph.png" class="btn btn-primary"  onclick="window.open('Mygraph.jsp?code=<%=code %>' ,'MyTargetWindowName');">View Graphs</input> -->
<button type="button" id="btnclick" style="background-image:url(images/mygraph.png); box-shadow: 6px 6px 3px #777777; width:95px; height:80px; margin-left:600px; padding-left:10px; border: 1px solid gray; padding-top:50px; color:black; font-size:12px;" class="btn btn-primary" onclick="mygraph('<%=code %>');">Model Graphs</button> 


<script language="JavaScript" type="text/javascript">
var sampleAccordion = new Spry.Widget.Accordion("sampleAccordion", {useFixedPanelHeights: false, defaultPanel: 6});
$(document).ready(function() {
//$('#sampleAccordion').find('[data-content]').resize();
//$('#sampleAccordion').collapse().height('auto');
//$('#sampleAccordion').({active:all});
//$('#sampleAccordion').({useFixedPanelHeights: false});
});
//var acc1 = new Spry.Widget.Accordion("Acc1", { useFixedPanelHeights: false }); 
//defaultPanel: 6, useFixedPanelHeights: false, active:all,
function mygraph(code) {
        window.location="Mygraph.jsp?code="+code;
}
</script>	   			
 <%@include file="included/Newfooter.jsp" %>

</body>


</html>