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
<div style="float:right; margin-top:-15px; margin-right:30px;"> <button class="btn btn-primary" onclick="var mfile1='PDAMS-User Manual-PIU.pdf'; window.open('download_user_manual.jsp?mfile='+ mfile1);">Download User Manual</button></div>
<div style="float:right; margin-top:-15px; margin-right:30px;"> <button class="btn btn-primary" onclick="var mfile1='PIU-Guidelines.pdf'; window.open('download_user_manual.jsp?mfile='+ mfile1);">Download PIU Guidelines</button></div>
<br><br>
 
<div class="container" style="text-align:justify;">
<Table class ="table"><tr ><td class="test"  colspan="2"> <h8 >General</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">This Website is designed, tested & found compatible to Mozilla Firefox & Google Chrome browsers. For better look, feel and complete functionality, please use these browsers only.</td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">Contact your Local-Admin for creation of new Projects, Users and Organizations or switching alert/reminder mode from Auto to Manual or vice versa or any modification of these details.</td></tr><tr ><td class="two"> 3) &nbsp;&nbsp;&nbsp;</td><td class="two">In case of forget password, contact your Local-Admin to reset the password.</td></tr><tr ><td class="two"> 4)&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Data Entry Restrictions:</b> Special characters & ' ? ! < > " \  are not allowed in general in any input field. Any blank space is not allowed but & character is allowed in 'user id' input field. <br><br></td></tr><tr ><td class="test"  colspan="2"> <h8 >Add Modify Document</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">Projects and packages which have been added by System/Local-Admin will be visible here and from here you can create and forward document of a particular project package.</td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">Details of the project & packages will be available here and based on it you can create document and forward further for approval.<br><br></td></tr><tr ><td class="test"  colspan="2"> <h8>Add Project Packages</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">You can see a list of project packages assigned to you. </td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">You can create documents only for project packages, which are assigned to you.</td></tr><tr ><td class="two"> 3) &nbsp;&nbsp;&nbsp;</td><td class="two">From this tab, you can also assign a Project package to yourself out of a complete list of the projects and packages created for the PIU.<br><br></td></tr><tr ><td class="test"  colspan="2"> <h8>Document Reports</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">Filters for Zone, Division, PIU, Projects and Railway User show the options available in your jurisdictions only thereby meaning that you see only your PIU and zones, divisions and Railway users and projects related to your PIU.   </td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">Different types of Reports based on selected filters can be generated. The reports can then be printed or exported to local machine in PDF and Excel formats also. For each document shown in the detailed report, log details for particular document can also be seen/printed/exported. The reports also have provision of sorting, search and record display control etc for fast and better retrieval of the required information.</td></tr><tr ><td class="two"> 3) &nbsp;&nbsp;&nbsp;</td><td class="two">The reports can be filtered for 'Zone', 'Division', 'PIU', 'Project Type', 'Project', 'Document Type', 'documents submitted between  two dates', 'approved/ pending status', 'pending with particular Railway user', 'pending for more than a predefined number of days', 'pending with users of other organizations'. In addition, documents of a project can also be filtered for 'Km wise' or 'Station wise' stretch of location.</td></tr><tr ><td class="two"> 4) &nbsp;&nbsp;&nbsp;</td><td class="two">There are basically five different types of reports generated by the system as given below;</td></tr><tr ><td class="two"> &nbsp;&nbsp;a.&nbsp;&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Detailed Report   </b>all filters are available for this report including filters for location wise details.</td></tr><tr ><td class="two"> &nbsp;&nbsp;b.&nbsp;&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Summary Reports</b></td></tr><tr ><td class="two"> &nbsp;&nbsp;&nbsp;&nbsp;i.</td><td class="two"><b>Project Wise Summary Report   </b> Please enter 'x' and 'y' variables of time periods as per your choice. Default values are 30 and 60 days. Filter for location wise details and Organization (other than Railway/RVNL) &nbsp;&nbsp;&nbsp; are available for this report but filters for Document 'Status', 'Railway User' and 'Under Approval for more than' specified period are not available for this report type.</td></tr><tr ><td class="two"> &nbsp;&nbsp;&nbsp;&nbsp;ii.</td><td class="two"><b>Department Wise Summary Report   </b>Please enter 'x' and 'y' variables of time periods as per your choice in the time periods panel. Default values are 30 and 60 days. Filter for location wise details and Organization (other than Railway/RVNL) &nbsp;&nbsp;&nbsp; are available for this report but filters for Document 'Status', 'Railway User' and 'Under Approval for more than' specified period are not available for this report type.</td></tr><tr ><td class="two"> &nbsp;&nbsp;&nbsp;&nbsp;iii.</td><td class="two"><b>Project Specific Status Report   </b>Please select a particular project to view this report. Filter for location wise details, Document 'Status', 'Railway User' and 'Under Approval for more than' specified period and Organization (other than Railway/RVNL) &nbsp;&nbsp;&nbsp; are not available for this report type.</td></tr><tr ><td class="two"> &nbsp;&nbsp;&nbsp;&nbsp;iv.&nbsp;&nbsp;&nbsp;</td><td class="two"><b>Monthwise Summary Report - </b> Report shows monthwise position for documents submitted and approved for last 12 months including the current month. Filter for location wise details, Document 'Status', 'Railway User' and 'Under Approval for more than' specified period and Organization (other than Railway/RVNL) are not available for this report type.</td></tr><tr ><td class="two"> 5) &nbsp;&nbsp;&nbsp;</td><td class="two">For further details please see 'More information'.<br><br></td></tr><tr ><td class="test" style="font-weight:bold" colspan="2"> <h8 >Public View Report</h8></td></tr><tr ><td class="two"> 1)&nbsp;&nbsp;&nbsp;</td><td class="two">This is a special link for PIU and Project Specific drill-down reports which are also be available for public view on RVNL website. You can view details pertaining to any PIU or Project. </td></tr><tr ><td class="two"> 2)&nbsp;&nbsp;&nbsp;</td><td class="two">This report is combination of Project Specific document type wise summary report with hyper-links to Project wise Summary and Detailed Reports. <br><br></td></tr><tr ><tr ><td class="test"  colspan="2"> <h8 >User List</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">This tab shows the information of users within your jurisdiction. Only your PIU, zones and divisions assigned to your PIU are available as user source filters.</td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">A complete list (unfiltered) of users of other organizations is also available.<br><br></td></tr><tr ><td class="test"  colspan="2"> <h8 >Returned Documents</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">Documents forwarded by you to Railways but which are returned back to RVNL can be seen in this tab.</td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">From this tab, you can resubmit the document after necessary compliance of Railway observations to any Railway user. </td></tr><tr ><td class="two"> 3) &nbsp;&nbsp;&nbsp;</td><td class="two">You can mark the document as forwarded to user of any other Organization like NHAI, SECL etc. and also register that user's approval on physical return of the document duly approved from that user.</td></tr><tr ><td class="two"> 4) &nbsp;&nbsp;&nbsp;</td><td class="two">Documents approved by all assigned users and sent back by Railway/Other user as approved are shown in different color (green) &nbsp;&nbsp;&nbsp; and can either be forwarded to next level of approvals (e.g. doc returned from division with approval may be required to be sent to approval of HQ officers) &nbsp;&nbsp;&nbsp; or can be marked as finally approved from final approval tab.</td></tr><tr ><td class="two"> 5) &nbsp;&nbsp;&nbsp;</td><td class="two">Documents pending with other organizations are shown in 'Yellow' color button.<br><br></td></tr><tr ><td class="test"  colspan="2"> <h8 >Pullback Documents</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">Tab is used to Pullback document from other users if RVNL user decides to do so particularly when document has physically moved but that user is not making entries to this effect in the portal. After pulling back, the document can be resubmitted from retuned task tab to the user with which it is actually pending now.</td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">Pulled back documents can be seen in Retuned Task Tab.</td></tr><tr ><td class="two"> 3) &nbsp;&nbsp;&nbsp;</td><td class="two">Pullback can also used for getting back the created document which is pending with any users.</td></tr><tr ><td class="two"> 4) &nbsp;&nbsp;&nbsp;</td><td class="two">To pullback a document you need to select particular document and by filling appropriate information you can pullback documents.<br><br></td></tr><tr ><td class="test"  colspan="2"> <h8 >Documents under Approval</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">It shows the list of all documents under approval. </td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">The documents available in your returned tasks tab are shown here with green button (enabled) &nbsp;&nbsp;&nbsp; for registering final approval for such documents.</td></tr><tr ><td class="two"> 3) &nbsp;&nbsp;&nbsp;</td><td class="two">Grey color button are disabled you cannot finally approve them but green color buttons are available for final approval.<br><br></td></tr><tr ><td class="test"  colspan="2"> <h8 >Approved Docs</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">This tab shows the list of documents which are marked as finally approved. </td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">In case of garbage document (created/forwarded by mistake and not required to be shown in reports as no such document actually/physically sent for approval, you can enter 'N' in 'Show in Report'. The default option is 'Y'.<br><br></td></tr><tr ><td class="test"  colspan="2"> <h8 >Reminders</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">You can send alerts/reminders to Railway users, DRMs and GMs from 'Reminders' tab for documents delayed beyond a time limit (value to be entered by you). This scenario may be used in case, PIU does not want to send auto alerts/reminders on weekly basis. 'Reminders' tab will not work if Auto mode of alerts/reminders is set for that PIU. </td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">Contact your Local-Admin for change of alert setting from Auto to Manual or vice versa.<br><br></td></tr><tr ><td class="test"  colspan="2"> <h8 >Log Details</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">Logs are used to get the current status and movement log of particular document.</td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">Flow status of particular document from start to finish will be available in the log details.</td></tr><tr ><td class="two"> 3) &nbsp;&nbsp;&nbsp;</td><td class="two">Document logs can be seen/accessed from different tabs such as 'Returned Tasks', 'Docs Under Approval' and 'Approved Docs'.</td></tr><tr ><td class="two"> 4) &nbsp;&nbsp;&nbsp;</td><td class="two">Logs can also be generated for each document shown in Detailed Reports generated from 'Document Reports' tab.<br><br></td></tr><tr ><td class="test"  colspan="2"> <h8 >Change Password</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">This tab is used to change password by entering current password & new password of minimum five alphanumeric characters.</td></tr><tr ><td class="two"> 2) &nbsp;&nbsp;&nbsp;</td><td class="two">In case you forget your password, please contact your Local-Admin.<br><br></td></tr><tr ><td class="test"  colspan="2"> <h8 >Log Out</h8></td></tr><tr ><td class="two"> 1) &nbsp;&nbsp;&nbsp;</td><td class="two">It will get you out from the system.</td></tr></table>
  </div>
</body>
 
 <br><br><br><br><br><br>
										      <%@include file="included/Newfooter.jsp" %>

</html>