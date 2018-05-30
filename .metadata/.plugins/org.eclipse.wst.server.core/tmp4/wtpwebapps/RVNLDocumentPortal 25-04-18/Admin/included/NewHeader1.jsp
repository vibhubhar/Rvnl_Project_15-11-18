<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.css"/>
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap-theme.css"/> 
<link rel="stylesheet" href="/Application/Admin/resources/css/main.css"/>	
		<%
 String theme3 = (String) pageContext.getAttribute("myTheme", PageContext.SESSION_SCOPE);
		System.out.println("Theme="+theme3);
 %>
		
<meta charset="ISO-8859-1">
<title>PDAMS</title>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>


<style>
.white-marquee {
   font-family: arial, calibri, "Times New Roman", Times, serif;
	font-size: 16px;
	color: white;// blue;//white;
	//margin-left:50px;
	font-weight:bold;
	padding:5px;
	padding-bottom:5px;
}
.marquee_section {
	width: 73%;
	float: right;
	line-height: 64px;
	height: 65px;
}

</style>

</head>
<body>   
<%
//String mailstatus=(String)session.getAttribute("MailStatus"); 
//String user = (String) session.getAttribute("user_name");
String user_code = (String) session.getAttribute("User_Code");
if (user_code!=null) {} else {user_code="0";}
 String mq=null,  mqLaunch=null, mqMaint=null, mqOther=null, mqRly=null, mqRVNL=null;					
// System.out.println("code="+user_code);	
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
  <!-- header -->
     	   <div class="container-fluid top_bar">
           <div class="row">
           <div class="col-md-4 col-sm-4 col-xs-4" >
           <img src="/Application/Admin/images/Rail_logo.png" alt="" class="img-responsive"/>
           </div>
           <div class="col-md-4 col-sm-4 col-xs-4 top_middle_bar">
           <h2 ><p class="text-white bg-dark"><i>Project Documents Approval Monitoring System (PDAMS)</i></p></h2>
           </div>
           <div class="col-md-4 col-sm-4 col-xs-4 right_bar" >
           <img src="/Application/Admin/images/RVNL_LOGO.jpg" alt="" class="img-responsive pull-right"/>
           </div>
 		   
 		  
   
 		 
   
   </div>
   </div>
   <!-- end of header -->
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
	   					<li><a href="admn_logout.jsp">Logout</a></li>  
	   						<li><a href="NewIndex.jsp">Home</a></li> -->
	   					
	   					</ul>	 
	   					</div>  	
	   					<%
	   					if (!mq.equalsIgnoreCase("") && mq!=null) {       
	   					%>				
	   <div id="menu2"  style="width:100%; float:right;">     					
	   <marquee><span class="white-marquee" id="white-marquee" style="float:left;"><%=mq %></span></marquee>  </div>
	<%
	}
	%>	
	</div> 
	<script type="text/javascript" src="/Application/Admin/resources/bootstrap-3.3.7-dist/js/jquery-3.3.1.js"></script> 
   <script type="text/javascript" src="/Application/Admin/resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>  					
</body>
</html>