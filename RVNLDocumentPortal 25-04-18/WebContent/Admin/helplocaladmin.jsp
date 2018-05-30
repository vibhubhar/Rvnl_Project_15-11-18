<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.io.*,java.util.*,javax.script.*,java.nio.file.*,java.nio.charset.*,java.text.DateFormat" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import = "java.lang.Integer"%>
<%-- <%@include file="included/NewHeader.jsp"%> --%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>
<%@include file="included/NewHeader.jsp"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RVNL Document Portal </title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">    
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script src="resources/jQuery/jquery-1.12.3.min.js"></script> 

<style>
textarea {
   resize: none;
}
td.test{
			background-color:#ffe6e6;  
			height: 30px;
			font-size: large;
            font-weight:bold;
            color:black;
        
}
   
td.two {
color: black;
font-size:medium;
background-color: white;
}

div.test{
border: 3px double #ff4d4d;
    background-color:#ffe6e6;
    width: auto;
    height: 30px;
  padding: 15 px;
}
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
<script src="resources/jQuery/jquery-ui.js"></script>

</head>
<body>
<%String user = (String)session.getAttribute("user_name");
//System.out.println("UZER:"+user);
%>
<%
String role1=(String)session.getAttribute("role");
String role=(String)session.getAttribute("Type");
String zone_id1=(String)session.getAttribute("zone_id"); 
String piu_id1=(String)session.getAttribute("piu_id"); 
String div_id1=(String)session.getAttribute("Division_Id");
%>

<%-- <div><h4 style='width: 300px; margin-left: 27px'>&nbsp;&nbsp;&nbsp;Help</h4></div>

<h4 align="left"  style='width: 300px; margin-left:27px'><font style="color:red">&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font color="#99CC00">:&nbsp;<%=(String)session.getAttribute("user_name") %></font></h4>
 --%>
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[Help] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div><br>
<div style="float:right; margin-top:-15px; padding-right:30px; text-decoration:underline;"><button class="btn btn-primary" onclick="window.open('processflow.jsp')">More Information</button></div>
<div style="float:right; margin-top:-15px; margin-right:30px;"> <button class="btn btn-primary" onclick="var mfile1='PDAMS-User Manual-LA.pdf'; window.open('download_user_manual.jsp?mfile='+ mfile1);">Download User Manual</button></div>
<br><br>
 
<div class="container" style="text-align:justify;">
 <Table class ="table"><tr ><td class="test" style="font-weight:bold" colspan="2"> <h8 >General </h8></td></tr><tr ><td class="two"> 1)&nbsp;&nbsp;&nbsp;</td><td class="two">This Website is designed, tested & found compatible to Mozilla Firefox & Google Chrome browsers. For better look, feel and complete functionality, please use these browsers only.</td></tr><tr ><td class="two"> 2)&nbsp;&nbsp;&nbsp;</td><td class="two">In case of forget password, contact System-Admin to reset the password.</td></tr><tr ><td class="two"> 3)&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Data Entry Restrictions:</b> Special characters & ' ? ! < > " \  are not allowed in general in any input field. Any blank space is not allowed but & character is allowed in 'user id' input field. <br><br></td></tr><tr ><td class="test" style="font-weight:bold" colspan="2"> <h8 >Manage Users </h8></td></tr><tr ><td class="two"> 1)&nbsp;&nbsp;&nbsp;</td><td class="two">Users of your PIU, zones and divisions assigned to your PIU & Organizations can be created and modified with this tab.</td></tr><tr ><td class="two"> 2)&nbsp;&nbsp;&nbsp;</td><td class="two">Information like name, email id and contact number in case of transfer of the officer from the post may be updated with current information.  Passwords of users can also be reset.</td></tr><tr ><td class="two"> 3)&nbsp;&nbsp;&nbsp;</td><td class="two">User-Id for a user should be complete Designation along with place of posting without any space in between (For example-SrDEN/E/WAT) so that the User-Id is unique. User-Id should be written in proper letter (combination of capital/small) as is written in normal correspondence as this user Id will be used in all reports and mail alerts.</td></tr><tr ><td class="two"> 4)&nbsp;&nbsp;&nbsp;</td><td class="two">DRM of division and GM of zone should invariably be created with complete details like email id and mobile numbers as weekly positions of delayed documents shall be sent by email/SMS to the Railway users automatically by the system.  </td></tr><tr ><td class="two"> 5)&nbsp;&nbsp;&nbsp;</td><td class="two">Correct email id and mobile numbers should be entered as alerts and reminders will be sent to all Railway users. In case of change of email /mobile of a user, the details should be modified accordingly by Local-Admin of that PIU.</td></tr><tr ><td class="two"> 6)&nbsp;&nbsp;&nbsp;</td><td class="two"><b>RVNL Users:</b> Only users like CPM/SC, GM/S&T/SC and GM/Elec/SC should be created as these users will only be forwarding documents/drawings for approvals of Railway Users and alerts will be initiated from their side to such users, DRMs and GMs. <br><br>UserId of RVNL users should include organization name i.e. CPM/Chennai/RVNL or GM(S&T)/Bangalore/RVNL for easy identification by Railway officials.<br><br> Separate User_Ids for RVNL officers like GM/Elec or GM/S&T who are looking after projects in more than one PIU should be created for each PIU duly suffixing PIU name in the User_Id e.g. User_Ids for GM/S&T/Delhi who looks after projects of Delhi and Kanpur may be 'GM/S&T/DLI/Delhi' for  Delhi PIU and 'GM/S&T/DLI/Kanpur' for Kanpur PIU so that he can log in with User_Ids of respective PIUs to create and forward documents of that PIU.  </td></tr><tr ><td class="two"> 7)&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Railway Users:</b> For division level users, only branch officer/JAG level users be created so that document is shown pending against his name in case it is pending with some officers/staff working under him. Normally, users required to approve/sign the document /drawing should be created. For HQ level users, only SAG level officers who normally sign such document be created.</td></tr><tr ><td class="two"> 8)&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Users of Other Organizations:</b> In order to log the movement and for showing in reports, documents pending with users of organizations like NHAI, Forest, NTPC, MCL, SECL etc can also be created by local admin. Normally such users are created with organization name and user id only and no other details for such users are required to be filled as such users will not be using this portal. The RVNL user only will make entries for forwarding the document and registering receipt of approved document as and when it is approved by that user.<br><br></td></tr><tr ><td class="test" style="font-weight:bold" colspan="2"> <h8>Create Projects</h8></td></tr><tr ><td class="two"> 1)&nbsp;&nbsp;&nbsp;</td><td class="two">You can create a new project and can also update information of an existing project, if no document has been created in that particular project for zones/divisions assigned to you. However, details like jurisdiction details and package wise nos. of drawings/documents required to be created/approved can be updated later also without any restrictions.</td></tr><tr ><td class="two"> 2)&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Jurisdiction Details</b> for a project are entered in form of Major section, from km & to km details of the project jurisdiction. In case project is spread over more than one major section, add major section button can be used to add a new row. Similarly major section wise Station Details (name and km) are also to be entered to show all the stations in the jurisdictions of the project. Add Station button can be used to add a new station row. Upto 10 major section rows and 50 station rows can be created.</td></tr><tr ><td class="two"> 3)&nbsp;&nbsp;&nbsp;</td><td class="two">Along with details like zone, division, project director, the nos. of documents/drawing required to be created/approved for each document type (i.e. ESP, Bridge GAD etc) for each package is to be entered. </td></tr><tr ><td class="two"> 4)&nbsp;&nbsp;&nbsp;</td><td class="two">You can update information of any project. You can also change zone if document within that package is not created.</td></tr><tr ><td class="two"> 5)&nbsp;&nbsp;&nbsp;</td><td class="two">You can add and remove packages. A project can have maximum 15 packages. A package can only be removed, if no document of that particular package has been forwarded for approval of Railway.<br><br></td></tr><tr ><td class="test" style="font-weight:bold" colspan="2"> <h8 >Document Reports </h8></td></tr><tr ><td class="two"> 1)&nbsp;&nbsp;&nbsp;</td><td class="two">Filters for Zone, Division, PIU, Projects and Railway User show the options available in your jurisdictions only thereby meaning that you see only your PIU and zones, divisions and Railway users and projects related to your PIU.   </td></tr><tr ><td class="two"> 2)&nbsp;&nbsp;&nbsp;</td><td class="two">Different types of Reports based on selected filters can be generated. The reports can then be printed or exported to local machine in PDF and Excel formats also. For each document shown in the detailed report, log details for particular document can also be seen/printed/exported. The reports also have provision of sorting, search and record display control etc for fast and better retrieval of the required information.</td></tr><tr ><td class="two"> 3)&nbsp;&nbsp;&nbsp;</td><td class="two">The reports can be filtered for 'Zone', 'Division', 'PIU', 'Project Type', 'Project', 'Document Type', 'documents submitted between  two dates', 'approved/ pending status', 'pending with particular Railway user', 'pending for more than a predefined number of days', 'pending with users of other organizations'. In addition, documents of a project can also be filtered for 'Km wise' or 'Station wise' stretch of location.</td></tr><tr ><td class="two"> 4)&nbsp;&nbsp;&nbsp;</td><td class="two">There are basically five different types of reports generated by the system as given below;</td></tr><tr ><td class="two"> &nbsp;&nbsp;&nbsp;a.&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Detailed Reports - </b> All filters are available for this report including filters for location wise details.</td></tr><tr ><td class="two"> &nbsp;&nbsp;&nbsp;b.&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Summary Reports</b></td></tr><tr ><td class="two"> &nbsp;&nbsp;&nbsp;&nbsp;i.&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Project Wise Summary Report -</b> Please enter 'x' and 'y' variables of time periods as per your choice. Default values are 30 and 60 days. Filter for location wise details and Organization (other than Railway/RVNL) are available for this report but filters for Document 'Status', 'Railway User' and 'Under Approval for more than' specified period are not available for this report type.</td></tr><tr ><td class="two"> &nbsp;&nbsp;&nbsp;&nbsp;ii.&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Department Wise Summary Report - </b> Please enter 'x' and 'y' variables of time periods as per your choice in the time periods panel. Default values are 30 and 60 days. Filter for location wise details and Organization (other than Railway/RVNL) are available for this report but filters for Document 'Status', 'Railway User' and 'Under Approval for more than' specified period are not available for this report type.</td></tr><tr ><td class="two"> &nbsp;&nbsp;&nbsp;&nbsp;iii.&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Project Specific Status Report - </b> Please select a particular project to view this report. Filter for location wise details, Document 'Status', 'Railway User' and 'Under Approval for more than' specified period and Organization (other than Railway/RVNL) are not available for this report type.</td></tr><tr ><td class="two"> &nbsp;&nbsp;&nbsp;&nbsp;iv.&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Monthwise Summary Report - </b> Report shows monthwise position for documents submitted and approved for last 12 months including the current month. Filter for location wise details, Document 'Status', 'Railway User' and 'Under Approval for more than' specified period and Organization (other than Railway/RVNL) are not available for this report type.</td></tr><tr ><td class="two"> 5)&nbsp;&nbsp;&nbsp;</td><td class="two">For further details please see 'More information'.<br><br></td></tr><tr ><td class="test" style="font-weight:bold" colspan="2"> <h8 >Public View Report</h8></td></tr><tr ><td class="two"> 1)&nbsp;&nbsp;&nbsp;</td><td class="two">This is a special link for PIU and Project Specific drill-down reports which are also be available for public view on RVNL website. You can view details pertaining to any PIU or Project. </td></tr><tr ><td class="two"> 2)&nbsp;&nbsp;&nbsp;</td><td class="two">This report is combination of Project Specific document type wise summary report with hyper-links to Project wise Summary and Detailed Reports. <br><br></td></tr><tr ><td class="test" style="font-weight:bold" colspan="2"> <h8 >User List </h8></td></tr><tr ><td class="two"> 1)&nbsp;&nbsp;&nbsp;</td><td class="two">This tab shows the information of all users of your PIU and Railway Zones/divisions assigned to your PIU.</td></tr><tr ><td class="two"> 2)&nbsp;&nbsp;&nbsp;</td><td class="two">A complete list of users of other organizations is also available.<br><br></td></tr><tr ><td class="test" style="font-weight:bold" colspan="2"> <h8 >Log Details </h8></td></tr><tr ><td class="two"> 1)&nbsp;&nbsp;&nbsp;</td><td class="two">Logs are used to get the current status and movement log of particular document.</td></tr><tr ><td class="two"> 2)&nbsp;&nbsp;&nbsp;</td><td class="two">Flow status of particular document from start to finish will be available in the log details.</td></tr><tr ><td class="two"> 3)&nbsp;&nbsp;&nbsp;</td><td class="two">Document logs can be seen/accessed from 'Documents' tab.</td></tr><tr ><td class="two"> 4)&nbsp;&nbsp;&nbsp;</td><td class="two">Logs can also be generated for each document shown in Detailed Reports generated from 'My Reports' tab. <br><br></td></tr><tr ><td class="test" style="font-weight:bold" colspan="2"> <h8 >Mail action </h8></td></tr><tr ><td class="two"> 1)&nbsp;&nbsp;&nbsp;</td><td class="two">You can change setting of alerts/reminders (to be sent as email/sms) from Auto to Manual or vice versa for your PIU.</td></tr><tr ><td class="two"> 2)&nbsp;&nbsp;&nbsp;</td><td class="two">Change of mode is applicable to all PIU level RVNL users creating and forwarding documents. <b> This facility is not being extended to Local-admins.</b> </b><br><br></td></tr><tr ><td class="test" style="font-weight:bold" colspan="2"> <h8 >Change Password </h8></td></tr><tr ><td class="two"> 1)&nbsp;&nbsp;&nbsp;</td><td class="two">This tab is used to change password by entering current password & new password of minimum five alphanumeric characters.</td></tr><tr ><td class="two"> 2)&nbsp;&nbsp;&nbsp;</td><td class="two">In case you forget your password, please contact your System-Admin.<br><br></td></tr><tr ><td class="test" style="font-weight:bold" colspan="2"> <h8 >Log Out </h8></td></tr><tr ><td class="two"> 1)&nbsp;&nbsp;&nbsp;</td><td class="two">It will get you out from the system.</td></tr></table>
 </div>
</body>
 
  <br><br><br><br><br><br>
										      <%@include file="included/Newfooter.jsp" %>

</html>