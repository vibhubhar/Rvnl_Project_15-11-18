<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>PDAMS - Login</title>
<script src="resources/JS/validateSysAdmin230.js"></script>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
</head>
<style type="text/css">

  #landing-wrapper {
    display:table;
    width:100%;
   // background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('images/CPM_CNB.jpg');
    background-position:center top;
    height:350px;
}
body {
 //background-image:   URL("images/JUBILEE-PINK.jpg");
 //background-image:   URL("images/CPM_CNB.jpg");
// background-image:   URL("images/scrapbook.jpg");
// background-image:   URL("images/asmani.jpg");
 background-image:   URL("images/CPM_CNB2.jpg");
 //  background-size:cover;
  //  background-blend-mode:screen;
//   background-color: #cccccc;
}

</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
</head>
<body>

<form id="loginPage" name="loginPage" method="post" action="login_success.jsp" >
    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
    
    String error=null;
            error=(String)session.getValue("u_error");
            if(error==null)
                {
                     %>
                   <!--  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <font size="6"  style="margin: 600px;margin-top:80px;color:Blue; font-family: calibri;">Welcome</font>  -->
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
   <!-- <div style=" width:100%; height:200px; background-color:pink; background-image: URL('images/CPM_CNB.jpg');" >  </div>   
   <img src="images/vallarpadam-rail-bridge-header.jpg" class="img-responsive" style="width:850px;height:300px;"/> -->
     <table class="table table-bordered" border="1"   align="center" style=" width:500px; background-color: pink;//brown; margin-top: 125px; box-shadow: 10px 10px 5px #888888;">
   <tr> <td style= " height:80px; background-color: #8C001A; vertical-align:middle;" ><img src="images/rail.png" class="img-responsive" style="float:left;height:80px;margin-left:0px;"> 
                 <img src="images/RVNL_LOGO.jpg" class="img-responsive" style="float:right; height:80px;margin-right:0px;"> </td></tr>
          <tr style="text-align:center;"><td style= "background-color: #C11B17;" >       <h4 style=" margin-left:5px; color:white">Project Documents Approval Monitoring System (PDAMS)</h4>	</td></tr>
          <tr>     <td width="450"; height="300" style="background-image:   URL('images/scrapbook.jpg'); background-color: pink; vertical-align:top;">		
		<br>
        <h4 style= "color:brown; text-align:center;" ><b>User-Login</b></h4>
        <br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Username:
  <input name="user_name" type="text" class="textfield" id="user_name">
  <br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password:
  <input name="password" type="password" class="textfield" id="password">
            <br><br>
       <%
String error1 = "";
error1 = (String)session.getAttribute("error");
if(error1!=null)
out.println(error1);
session.setAttribute("error", null);
%>
       <br> <br>
     	<button class="btn btn-basic" type="button" name="Submit" value="Login" style="margin-left:150px;" onclick="javascript:validateUser();">Login</button>
	
		<input style="margin-left:50px;" class="btn btn-basic" type="reset" value="Reset" />
         </td>
          </tr>
           </table>  
<!-- <div style=" width:100%; height:200px; background-color:pink; background-image: URL('images/CPM_CNB.jpg'); float:left;" >  </div>  -->
</form> 

										
</body>
</html>
