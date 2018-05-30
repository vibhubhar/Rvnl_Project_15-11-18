<!DOCTYPE html>
<html>
<head>
		
		<%
 String theme3 = (String) pageContext.getAttribute("myTheme", PageContext.SESSION_SCOPE);
if (theme3!=null) {
if (theme3.equalsIgnoreCase("brown") ) { %>
		<link rel="stylesheet" type="text/css" href="resources/css/ThmBrown.css">
		<% } else if (theme3.equalsIgnoreCase("blue")) { %> 
		<link rel="stylesheet" type="text/css" href="resources/css/ThmBlue.css">
		<%} else if (theme3.equalsIgnoreCase("green")) { %> 
		<link rel="stylesheet" type="text/css" href="resources/css/ThmGreen.css">
		<%} else if (theme3.equalsIgnoreCase("magenta")) { %> 
		<link rel="stylesheet" type="text/css" href="resources/css/Thmmagenta.css">
		<%}
} else {%>
<link rel="stylesheet" type="text/css" href="resources/css/ThmBrown.css">
		<%} %>
		
<meta charset="ISO-8859-1">
<title>PDAMS</title>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<style>
.white-marquee {
   font-family:   arial, serif, "Times New Roman", calibri, Times;
	font-size: 14px;
	color:  white;
	//margin-left:50px;
	font-weight:bold;
	padding:10px;
	padding-bottom:5px;
}
</style>

</head>
<body>   
<%
//String mailstatus=(String)session.getAttribute("MailStatus"); 
//String user = (String) session.getAttribute("user_name");
String user_code = (String) session.getAttribute("User_Code");
if (user_code!=null) {} else {user_code="0";}
 String mq=null, mqLaunch=null, mqMaint=null, mqOther=null, mqRly=null, mqRVNL=null;					
 //System.out.println("code="+user_code);	
  Connection conn7 = null;
     			PreparedStatement ps777=null;
     			ResultSet  rs777=null;
     						//Statement stmt7 = null;
     						try {
     							Context initCtx = new InitialContext();
     							Context envCtx = (Context) initCtx.lookup("java:comp/env");
     							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

     							conn7 = ds.getConnection();
     							String sql35 = "select item, description from xx_maintenance";
     									
    								ps777 = conn7.prepareStatement(sql35);
    								rs777 = ps777.executeQuery();
    								while (rs777.next()) {
    									String item=rs777.getString(1);
    									 String desc=rs777.getString(2);
    									if (item.equalsIgnoreCase("marquee-launch")) {
    										mqLaunch=desc;
    									} else if (item.equalsIgnoreCase("marquee-maint")) {
    										mqMaint=desc;
    									} else if (item.equalsIgnoreCase("marquee-other")) {
    										mqOther=desc;
    									} else if (item.equalsIgnoreCase("marquee-Rly")) {
    										mqRly=desc;
    									} else if (item.equalsIgnoreCase("marquee-RVNL")) {
    										mqRVNL=desc;
    									} 
    								}
    								if (user_code.equalsIgnoreCase("2")) {
    									mq= mqLaunch+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqMaint+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqOther+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqRly;
    								} else if (user_code.equalsIgnoreCase("5")) {
    									mq= mqLaunch+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqMaint+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqOther+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqRVNL;
    								} else {
    								mq= mqLaunch+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqMaint+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqOther;
    								}		 
    				    				//System.out.println("marquee="+mq);
     						}catch(Exception e){
    							
    							e.printStackTrace();
    						} finally {
    						    try { rs777.close(); } catch (Exception e) { /* ignored */ }
    						    try { ps777.close(); } catch (Exception e) { /* ignored */ }
    						    try { conn7.close(); } catch (Exception e) { /* ignored */ }
    						}


%>
<input type="hidden" id="menu1" value='<%=session.getAttribute("user_name") %>'>
     	   <div class="header">
   
 		   <table width="100%"><tr><th width=15%>
    		  <img src="images/Rail_logo.png"  class="img-responsive" style="float:left;height:80px;margin-left:10px;">
    		  
   </td>
   <th width=60%>
      		 <h2 style=" margin-left:5px;"><i>Project Documents Approval Monitoring System (PDAMS)</i></h2>	
   
   </th><th width=25%>
	  <img src="images/RVNL_LOGO.jpg"  class="img-responsive" style="float:left;height:80px;margin-left:10px;">
 		  </table>	
   </div>
	   <div class="topmenu" id="menu">
	  <div id="menu1"  style="float:left;"> 
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
	   					<li><a href="NewIndex.jsp">Home</a></li>
	   					
	   					</ul>	 
	   					</div>  
	   					<%
	   					if (!mq.equalsIgnoreCase("") && mq!=null) {
	   					%>	
	   	<div id="menu11" ></div>									
	   <div id="menu2"  style="width:70%; float:left;">     					
	   <marquee><span class="white-marquee" id="white-marquee" style="float:right; width:100%"><%=mq %></span></marquee>  </div>
	  <%
	  	}
	   	%>	
	   	
							</div> 
							
</body>
</html>