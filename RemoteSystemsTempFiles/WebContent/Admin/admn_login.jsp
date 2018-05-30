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
<title>PDAMS Login</title>
<link rel="shortcut icon" href="images/PDAMS_icon.ico" />

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
<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
</head>
<body>
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

<form id="loginPage" name="loginPage" method="post" action="login_success.jsp" >
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
                   <div> <font size="6"  style="margin-left: 600px; margin-top:80px; margin-bottom: 50px; color:Blue; font-family: calibri;">Welcome</font></div>
                   
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
   <table  width="97%" height="300" style="margin-left:20px; margin-right:20px;">
   <tr>
                <td width="75%" height="300">
                     <table> 
                     <%
                     int p=0;
                     if (!msg1.equalsIgnoreCase("") && msg1!=null) {
                    	 p++;
                     %>
                     <tr><td width="100%" height="50%" colspan="2"><img src="<%=pic1 %>" class="img-responsive" alt="msgpic1" align="left" vspace="10" hspace="10" style="width:100px;height:110px;"/><p align="justify" style="padding:10px"><%=msg1 %></p></td></tr>   
          <% } 
                     if (!msg2.equalsIgnoreCase("") && msg2!=null) { 
                     p++;%>
            <tr><td width="50%" height="50%"><img src="<%=pic2 %>" alt="msgpic2" class="img-responsive" align="left" vspace="10" hspace="10" style="width:120px;height:135px;"/><p align="justify" style="padding:10px"><%=msg2 %></p></td>
            <%} 
                     if (!msg3.equalsIgnoreCase("") && msg3!=null) {
                    	 p++;
            %><td width="50%" height="50%"><img src="<%=pic3 %>" class="img-responsive" alt="msgpic3" align="left" hspace="10" vspace="10" style="width:105px;height:140px;"/><p align="justify" style="padding:10px"><%=msg3 %></p></td> </tr>
            <%}
                     if (p==0) {
                 %>
              <tr><td ><img src="images/vallarpadam-rail-bridge-header.jpg" class="img-responsive"  style="width:1050px;height:300px;" /></td></tr>
           
   <!-- <img src="images/CPM_CNB.jpg" class="img-responsive" style="width:100%;height:100%;"/> -->
 <%} %>
           
           </table> 
                </td>
      <td  rowspan="1" width="25%" height="300" style="border: 2px solid gray; background-color:#F0FFFF">		
		
        <h1 style= "background-color:gray;//#C11B17;//rgb(128,128,128);color:white" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Login</h1>
        <br><br><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Username:
  <input name="user_name" type="text" class="textfield" id="user_name">
  <br><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password:
  <input name="password" type="password" class="textfield" id="password">
            <br><br>
               <%
               //In order to bring transparency and enable monitoring of approval of various plans/documents submitted by project authorities to Railway Officials in Divisions and Zonal Headquarters, RVNL has made a beginning by developing a web-based application 'Project Documents Approval Monitoring System (PDAMS) '.  <br> <b>- MR</b>
               //RPDAMS will log movement of plans/documents right from submission till approval by all concerned officials. MIS reports generated from the application will help in monitoring the progress of approvals at divisional and HQ levels. Periodic reports sent by portal through weekly emails to DRMs and GMs will act as a managerial information tool to ensure speedier approvals of project documents with ultimate objective of faster project delivery.  <br> <b>- CMD/RVNL</b>
String error1 = "";
error1 = (String)session.getAttribute("error");
if(error1!=null)
out.println(error1);
session.setAttribute("error", null);
%>
       <br> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<button class="btn btn-primary" type="button" name="Submit" value="Login" onclick="javascript:validateUser();">Login</button>
	
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input class="btn btn-primary" type="button" onclick="javascript:location.reload();" value="Reset" />
          </th> 
          </tr>
          <tr> <td colspan="2" style="padding-top:10px;"> 
             
        <!--                <table>    
            <tr><td width="300px" height="150px"><img src="images/vallarpadam-rail-bridge-header.jpg" class="img-responsive" align="left" vspace="10" hspace="10" style="width:100px;height:150px;"/><p align="justify" style="padding:10px"><%=msg1 %></p></td><td width="300px" height="150px"><img src="images/vallarpadam-rail-bridge-header.jpg" class="img-responsive" align="right" hspace="10" vspace="10" style="width:100px;height:150px;"/><p align="justify" style="padding:10px"><%=msg2 %></p></td> </tr>
            <tr><td width="600px" height="150px" colspan="2"><img src="images/pks.jpg" class="img-responsive" align="left" vspace="10" hspace="10" style="width:75px;height:88px;"/><p align="justify" style="padding:10px"><%=msg3 %></p></td></tr></table>
      -->
 <% 
if (p!=0) {
    %>
      <div class="gallery">
  <a target="_blank" href="#">
    <img src="images/CSTM.jpg" alt="Mubai CSTM">
  </a>
 <!--   <div class="desc">Mumbai CSTM</div> -->
</div>

<div class="gallery">
  <a target="_blank" href="#">
    <img src="images/Bardhman bridge.jpg" alt="Barddhman bridge">
  </a>
 <!--  <div class="desc">Cable stayed bridge</div>  -->
</div>

<div class="gallery">
  <a target="_blank" href="#">
    <img src="images/track.jpg" alt="Track" >
  </a>
 <!--   <div class="desc">Electrified track</div> -->
</div>
<div class="gallery">
 <a target="_blank" href="#">
<img src="images/vallarpadam-rail-bridge-header.jpg">
</a>
<!--  <div class="desc">Vallarpadam Bridge </div> -->
</div>  
<div class="gallery">
  <a target="_blank" href="#">
    <img src="images/metro.jpg" alt="Metro" >
  </a>
 <!--   <div class="desc">Kolkata Metro</div> -->
</div>

<div class="gallery">
  <a target="_blank" href="#">
    <img src="images/track2.jpg" alt="Track-doubling" >
  </a>
<!--   <div class="desc">Track Doubling</div>  -->
</div>
<%} %>
       </td></tr>
       </table>  
</form> 
<br><br><br>
		
   <%@include file="included/Newfooter.jsp" %>	      		     
</body>

</html>