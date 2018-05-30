<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.css"/>
<link rel="stylesheet" href="/Application/Admin/resources/css/main.css"/>	
<link rel="shortcut icon" href="images/PDAMS_icon.ico" />
<title>PDAMS Login</title>
<script src="resources/JS/validateSysAdmin230.js"></script>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
</head>
<style type="text/css">
div.gallery {
    margin: 2px;
    border: 1px solid #ccc;
    float: left;
    width: 180px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: 100px;                                           
   background-image:cover;
}

div.desc {
    padding: 5px;
    text-align: center;
}
#header {
    background-color:#580058;
    color:white;
}
html, body {
  margin: 0px;
  padding: 0px;
  border: 0px;
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
margin-left:30px;
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
width: auto;
}
body
{
margin-top:0px;
font-family:'Aerial';
font-size:16px;

}
h2{
     word-wrap: break-word;
     -webkit-hyphens: auto;
     -moz-hyphens: auto;
     -ms-hyphens: auto;
     -o-hyphens: auto;
     hyphens: auto;
}


</style>

 
</head>
<body>
<div id="container">
<jsp:include page="included/NewHeader1.jsp">
        <jsp:param name="theme3" value="brown"/>
    </jsp:include>

<!--    <div class="header">
   <table><tr><td width=15%>
    		  <img src="images/rail.png" class="img-responsive" style="float:left;height:80px;margin-left:0px;"><br>
    		  
   </td>
   <td width=60%>
      		 <h2 style="color:white;"><i>Project Documents Approval Monitoring System (PDAMS)</i></h2>	
   
   </td><td width=25%>
 		  <img src="images/logo.png" class="img-responsive" style="float:right;height:80px;margin-right:0px;">
 		  <br></td></tr>
   </table></div> -->
   
   
<div class="container-fluid bg_img">
<div class="row">
<div class="col-md-4 col-sm-4 col-xs-12"></div>
<div class="col-md-4 col-sm-4 col-xs-12">
<div class="col-3 col-s-12"></div>
<form id="loginPage" class="bg_login" name="loginPage" method="post" action="login_success.jsp" >
<img class="logo" src="/Application/Admin/images/Rail_logo.png" alt="" class="img-responsive"/>
<h1 class="welcome">Welcome</h1>
    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
    String msg1=null, msg2=null, msg3=null, pic1=null, pic2=null, pic3=null, profile_alert=null, docaction_alert=null;					
		
    String error=null;
            error=(String)session.getValue("u_error");
            if(error==null)   {
                 Connection conn2 = null;
     			PreparedStatement ps227=null;
     			ResultSet  rs227=null;
     						//Statement stmt = null;
     						try {
     							Context initCtx = new InitialContext();
     							Context envCtx = (Context) initCtx.lookup("java:comp/env");
     							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

     							conn2 = ds.getConnection();
     							String sql35 = "select item, description from xx_maintenance";
     									
    								ps227 = conn2.prepareStatement(sql35);
    								rs227 = ps227.executeQuery();
    								while (rs227.next()) {
    									String item=rs227.getString(1);
    									 String desc=rs227.getString(2);
    								 if (item.equalsIgnoreCase("msg-1")) {
    										msg1=desc;
    									} else if (item.equalsIgnoreCase("msg-2")) {
    										msg2=desc;
    									} else if (item.equalsIgnoreCase("msg-3")) {
    										msg3=desc;
    									}
    								 if (item.equalsIgnoreCase("pic-1")) {
 										pic1=desc;
 									} else if (item.equalsIgnoreCase("pic-2")) {
 										pic2=desc;
 									} else if (item.equalsIgnoreCase("pic-3")) {
 										pic3=desc;
 									} else if (item.equalsIgnoreCase("profile_alert")) {
 										profile_alert=desc;
 										session.setAttribute("Profile_Alert",profile_alert);
 									} else if (item.equalsIgnoreCase("doc_action_alert")) {
 										docaction_alert=desc;
 										session.setAttribute("doc_action_Alert",docaction_alert);
 									}
    								}
    									
     						}catch(Exception e){
    							
    							e.printStackTrace();
    						}  finally {
     						    try { rs227.close(); } catch (Exception e) { /* ignored */ }
     						    try { ps227.close(); } catch (Exception e) { /* ignored */ }
     						    try { conn2.close(); } catch (Exception e) { /* ignored */ }
     						}


              									%>
                    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <!--  <div> <font size="5vw"  style=margin-left:45%; color:Blue; font-family: calibri;">Welcome</font></div>-->
                   
                   <%
                }
            else if(error.equals("relogin"))
                {
            %>
            <font size="4" style="color:red;font-family: calibri;">Try Again</font>
            
            <%
                session.putValue("u_error",null);
            }
   %> 
      
     
     
     
      
  <div class="form-group">
    <label for="exampleInputEmail1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Username</label>
    <input type="user_name" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter UserName">
    <small id="emailHelp" class="form-text text-muted" style=color:#FFA500;>We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password</label>
    <input type="password" name="password" class="form-control" id="password" placeholder="Password">
  </div>
  <%
               //In order to bring transparency and enable monitoring of approval of various plans/documents submitted by project authorities to Railway Officials in Divisions and Zonal Headquarters, RVNL has made a beginning by developing a web-based application 'Project Documents Approval Monitoring System (PDAMS) '.  <br> <b>- MR</b>
               //RPDAMS will log movement of plans/documents right from submission till approval by all concerned officials. MIS reports generated from the application will help in monitoring the progress of approvals at divisional and HQ levels. Periodic reports sent by portal through weekly emails to DRMs and GMs will act as a managerial information tool to ensure speedier approvals of project documents with ultimate objective of faster project delivery.  <br> <b>- CMD/RVNL</b>
String error1 = "";
error1 = (String)session.getAttribute("error");
if(error1!=null)
out.println(error1);
session.setAttribute("error", null);
%>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Remember me</label>
  </div>
  <br> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  <button type="submit" class="btn btn-success btn-block" value="Login" onclick="javascript:validateUser();">Login</button>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input class="btn btn-success btn-block" style="margin-top:-10px;" type="button" onclick="javascript:location.reload();" value="Reset" />

      
      
      	
      
      
      
   
</form> 
</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</div>

<br><br><br>
		
   <%@include file="included/footer.jsp" %>	
   </div> 
   
 
   <script type="text/javascript" src="/Application/Admin/resources/bootstrap-3.3.7-dist/js/jquery-3.3.1.js"></script> 
   <script type="text/javascript" src="resources/bootstrap-3.3.7-dist/js/bootstrap.js"></script>   		     
</body>

</html>