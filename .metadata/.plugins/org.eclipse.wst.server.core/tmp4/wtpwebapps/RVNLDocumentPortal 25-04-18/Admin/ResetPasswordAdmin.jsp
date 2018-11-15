<%@page import="java.net.HttpURLConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%@include file="included/NewHeader1.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page autoFlush="true" buffer="1094kb"%>
<%@ page session="true"%>
<%@include file="sessionCheck.jsp"%>


<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

	<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>

<%@ page import="java.net.URL.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder.*" %>
<%@ page import="java.net.URLConnection.*"%>
<%@ page import="java.io.InputStreamReader.*" %>
<%@ page import="java.io.OutputStreamWriter.*" %>

<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.*"%>

<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
    
    <script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script src="resources/JS/Approval_wf230.js"></script>

    <script src="resources/JS/validateSysAdmin230.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>

<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<title>Insert title here</title>
<script type="text/javascript">

function checkPasswordMatch() {
	var password = $("#password1").val();
	var confirmPassword = $("#password2").val();
	
	if(password.length >= 5 && confirmPassword.length >= 5) {
		if (password != confirmPassword) {
			$("#divCheckPasswordMatch").html("Passwords do not match!");
			$("#divCheckPasswordMatch").css("color", "red");
			 $('button[type="button"]').prop('disabled', true);
		} else {
			$("#divCheckPasswordMatch").html("Passwords match.");
			$("#divCheckPasswordMatch").css("color", "green");
			 $('button[type="button"]').prop('disabled', false);
		}
    } else {
       //alert("Please Provide password of atleast 5 chars.");
       //$('button[type="button"]').prop('disabled', false);
       document.getElementById("submit2").disabled = true;
    }

	
}

</script>
<script type="text/javascript">
    function refreshAndClose() {
      //  window.opener.location.reload(true);
        window.close();
    }
</script>
<style>
  input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
    div.absolute {
   	position:absolute;
   	margin-top: 5px;
   	margin-left: 13px;
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
  .td{
 margin-left: 35%;
margin-top: 40px;
  }
</style>
</head>
<body>
<%
String username =request.getParameter("usern");
System.out.println("mmmm"+username);
//String username=username1.replace('~','/'); 
String role1=(String)session.getAttribute("role");
String role=(String)session.getAttribute("Type");
String zone_id1=(String)session.getAttribute("zone_id"); 
String piu_id1=(String)session.getAttribute("piu_id"); 
String div_id1=(String)session.getAttribute("Division_Id");
String user = (String) session.getAttribute("user_name");

%> 
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Change User Password] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>
<div class="container" style="margin-left:0px; padding: 0px; width:1600px;">
<br><br><br><br><br><br><br>
<form id='resetpassword' name='resetpassword' style="margin-top: 0px;">
<INPUT TYPE="HIDDEN" NAME="stage" id="stage">
<INPUT TYPE="HIDDEN" NAME="usern1" id="usern1">
<INPUT TYPE="HIDDEN" NAME="password" id="password">
<c:if test="${param.stage == null }">

<div class="td">
			New Password:<input type="password" name="password1" id="password1"
				style="width: 270px;margin: 0px 0px 0px 21px;" onkeyup="checkPasswordMatch();" required="true"/>
		
		<div class="registrationFormAlert" id="divCheckPasswordMatch"
			style="margin: 12px 0px 0px 114px; color: red;"><br></div>
			</div>
		<div class="td">
			Confirm Password:<input type="password" name="password2"
				id="password2" onkeyup="checkPasswordMatch();"
				style="width: 270px" required="true" /></br> </br> </br>
		
				
		<button type="button" name="submit2" id="submit2"
			class="btn btn-primary" onclick="actionresetpassword('<%=username%>')"
			style="width: 150px;margin-left: 125px;" font-size: inherit; margin: 14px -29px 0px 112px;">Reset
			Password</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-primary" value="Cancel" onClick="refreshAndClose()" />

<br><br> <br> <br>
<h4><span style="color:red; margin-left: -150px;">Note* : </span>Password should be of minimum five length Mandatory !</h4>


<div id="dialogid" style="display: none"
								align="center">
								<br> Please Fill Valid Details <br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="$('#dialogid').dialog('close');">cancel</button>
							</div>
</c:if>
<c:if test="${param.stage != null }">
<%
String prof_alert2=(String)session.getAttribute("Profile_Alert");
String username2 =request.getParameter("usern1");
String password =request.getParameter("password");
String pwds=password;
//encryption code starts here
MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(password.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
	password = Integer.toHexString(0xFF & digest[i]);

 if (password.length() < 2) {
 	password = "0" + password;
 }

 hexString.append(password);
}



//encrytion md5 ends here

String usern=username2.replaceAll("~", "/");

Connection con= null;

PreparedStatement ps = null, ps1 =null, ps9=null;
ResultSet rs = null,rs1=null, rs9=null;
Statement st = null;
String oldpass="", email_id=null, contact_no=null;
String msg="";

try{
	
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	 con = ds.getConnection();
st = con.createStatement();
int i = st.executeUpdate("update xx_user_master set Password='"+ password + "' where User_name='"+ usern + "'");
 msg="Password changed successfully" ;
 String usersql = "select * from xx_user_master where User_name='"+usern+"'";
	ps9 = con.prepareStatement(usersql);
	rs9 = ps9.executeQuery();
	while(rs9.next()){
	 email_id=rs9.getString("Email_Id");
	 contact_no=rs9.getString("Contact_No");
	}
rs9.close();
ps9.close();
st.close();
con.close();
if (prof_alert2.equalsIgnoreCase("On")) {
// Mail code starts from here
//System.out.println("today:"+Date1+"approval date:"+date);			
		 String result, cc1;
		 	cc1="";
		    // Get recipient's email-ID, message & subject-line from index.html page
		    StringBuffer url =    request.getRequestURL();
			String pageName1 = url.substring(0, url.lastIndexOf("/"))+"/admn_login.jsp";
		    final String to = email_id;
		    final String subject = "RVNL DOCUMENT PORTAL - password reset";
		    final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+usern.toUpperCase()+" </b><br><br> Your login password has been reset as under;"
		     +"<br><BR> User Id:  "+usern+"<br> Password: "+pwds+"<BR> Login webpage: <a href=\""+ pageName1+"\">"+pageName1+"</a><br><br>You are advised to change your password. <br><br><br><span style='color:brown; font-size:20px; font-style:italic;'<b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
		    						
		    // Sender's email ID and password needs to be mentioned
		    final String from = "vibhardwaj55@gmail.com";
		    final String pass = "8899403746";
		    
		    final String cc = cc1;
		    // Defining the gmail host
		    String host = "smtp.gmail.com";
		 
		    // Creating Properties object
		    Properties props = new Properties();
		 
		    // Defining properties
		   
		    props.put("mail.smtp.starttls.enable", "true");
		    props.put("mail.smtp.host", host);
		    props.put("mail.smtp.user", from);
		    props.put("mail.smtp.password", pass);
		    props.put("mail.smtp.port", "587");
		    props.put("mail.smtp.auth", "true");
		 
		    // Authorized the Session object.
		    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
		        @Override
		        protected PasswordAuthentication getPasswordAuthentication() {
		            return new PasswordAuthentication(from, pass);
		        }
		    });
		 
		    try {
		        // Create a default MimeMessage object.
		        MimeMessage message = new MimeMessage(mailSession);
		        // Set From: header field of the header.
		        message.setFrom(new InternetAddress(from));
		        // Set To: header field of the header.
		        message.addRecipient(Message.RecipientType.TO,
		                new InternetAddress(to));
		        message.setRecipients(Message.RecipientType.CC, cc);
		        // Set Subject: header field
		        message.setSubject(subject);
		        // Now set the actual message
		        message.setText(messg);
		        // Send message
		        Transport.send(message);
		        result = "Your mail sent successfully....";
		        System.out.println("Email sent successfully");
		    } catch (MessagingException mex) {
		        mex.printStackTrace();
		        result = "Error: unable to send mail....";
		    }
		 
		    // mail code ends here
		     //SMS code 

try {
//Construct data
//contact number supervisor------contact_No_sup
//contact number sender ------------- supcontact

String usersms = "username=" + "indiarvnl@gmail.com";
String hash = "&hash=" + "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
//String apiKey = "apikey=" + "noVebn4XbP0-UFyeK1rRwkvCNdDw5ZXfVqrSNPndk2";
String message = "&message=" + "Your login password has been reset. Please check your email ("+email_id+") for new password.\n\nRVNL Document Portal";
String sender = "&sender=" + "RPDAMS";
String numbers = "&numbers=" + ""+contact_no+"";

//Send data
HttpURLConnection connsms = (HttpURLConnection) new java.net.URL("http://api.textlocal.in/send in/?").openConnection();

String data = usersms + hash + numbers + message + sender;
//String data = apiKey + numbers + message + sender;
connsms.setDoOutput(true);
connsms.setRequestMethod("POST");
connsms.setRequestProperty("Content-Length", Integer.toString(data.length()));
connsms.getOutputStream().write(data.getBytes("UTF-8"));
final BufferedReader rd = new BufferedReader(new InputStreamReader(connsms.getInputStream()));
final StringBuffer stringBuffer = new StringBuffer();
String line;
while ((line = rd.readLine()) != null) {
stringBuffer.append(line);
}
rd.close();
System.out.println("Message sent successfully");
//return stringBuffer.toString();
} catch (Exception e) {
System.out.println("Error SMS "+e);
//return "Error "+e;
}					   
//sms code ends here
}

}catch(Exception e){
	e.printStackTrace();
} finally {
    try { con.close(); } catch (Exception e) { /* ignored */ }
}
%>
 <div style='vertical-align: baseline; padding: 10px; margin: 20px; width:400px;' >
	 <div class="alert alert-success">
	 <strong>Success!</strong> Password Updated Successfully!.
	 <br>
	 <br>
	 <center><input class='btn btn-primary' value='ok'  onClick="refreshAndClose()" type='button'/></center>
	
		
	 </div>
</div>
</c:if>


</form><br><br>
<br><br><br><br><br><br>
</div>
<%@include file="included/Newfooter.jsp" %>
</body><br><br>
   
</html>