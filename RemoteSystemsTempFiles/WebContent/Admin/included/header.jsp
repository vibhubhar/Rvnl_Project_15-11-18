<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" type="text/css" href="resources/css/form-style.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
#header {
    background-color:#580058;
    color:white;

</style>

<style type="text/css">
html, body {
  margin: 0px;
  padding: 0px;
  border: 0px;
}
#footer {
background:#ffab62;

	width:100%;

	height:100px;

	position:absolute;

	bottom:0;
	left:0;
}
.header
{
margin-top:0px;
width:auto;
height:80px;
background-color:#8C001A;
}
ul
{
float:left;

}
ul li
{
float:left;
margin-left:5px;
list-style-type:none;
border-right:1px dotted white;
margin-bottom:10px;
padding-bottom:15px;
margin-right:5px;
}
ul li a
{
text-decoration:none;
color:white;
display:block;
padding:5px;
margin-right:5px;
}
ul li a:hover
{
text-decoration:none;

}
.topmenu
{
background-color:#C11B17;
height:40px;
width:110%;
}
body
{
margin-top:0px;
font-family:'Aerial';
font-size:16px;
}
</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>   
<%
String mailstatus=(String)session.getAttribute("MailStatus"); 
%>
     	   <div class="header">
   
 		   <table><tr><th width=15%>
    		  <img src="images/rail.png"  class="img-responsive" style="float:left;height:80px;margin-left:0px;">
    		  
   </td>
   <th width=60%>
      		 <h1 style="color:white;margin-left:10px;"><i>Project Document Monitoring Portal</i></h1>	
   
   </th><th width=25%>
 		  <img src="images/logo.png"  class="img-responsive" style="float:right;height:80px;margin-right:0px;">
 		 
   </table>	
   </div>
	   <div class="topmenu">
	  
	  		<ul>
	  		<!-- <li><a href="user_index.jsp">Add/Modify Docs</a></li>
	   					<li><a href="user_Project.jsp">My Projects</a></li>
	   					<li><a href="Reportpiuinitiate.jsp">My Reports</a></li>
	   					<li><a href="MoreInfo.jsp">Returned Tasks</a></li>
	   					<li><a href="PullBack.jsp">PullBack Doc</a></li>
	   					<li><a href="FinalApproval.jsp">Docs under Approval</a></li>
	   					<li><a href="FinallyApprovedShow.jsp">Approved Docs</a></li>
	   					<li><a href="ManualMail.jsp">Reminders</a></li>
	   					<li><a href="User_List.jsp">User List</a></li>
	   					<li><a href="changepasswordlocaladmin.jsp">Change Password</a></li>
	   					<li><a href="helpmain.jsp">Help</a></li>
	   					<li><a href="admn_logout.jsp">Logout</a></li>  -->
	   					<li><a href="NewIndexPIU.jsp">Home</a></li>
	   					</ul>	   					
	   					
	  
	   </div>

</body>
</html>