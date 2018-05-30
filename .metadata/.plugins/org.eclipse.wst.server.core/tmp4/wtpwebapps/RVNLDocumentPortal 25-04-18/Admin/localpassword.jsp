<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%@page import="java.sql.*"%>
<%@ page session="true"%>
<%@include file="included/NewHeader.jsp"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<%@page
	import=" java.security.MessageDigest,javax.swing.JOptionPane,javax.swing.JFrame"%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<script type = "text/javascript" >
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script>
</head>
<body>
	<%
// pass=null,pass1=null,pass2=null;
String user1 = (String)session.getAttribute("user_name");
String pass=request.getParameter("password");
String pass1=request.getParameter("password1");
String pass2=request.getParameter("password2");

//encryption code starts here
MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(pass.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
	pass = Integer.toHexString(0xFF & digest[i]);

 if (pass.length() < 2) {
	 pass = "0" + pass;
 }

 hexString.append(pass);
}
// second passwor

MessageDigest mdAlgorithm1 = MessageDigest.getInstance("MD5");
mdAlgorithm1.update(pass1.getBytes());

byte[] digest1 = mdAlgorithm1.digest();
StringBuffer hexString1 = new StringBuffer();

for (int i = 0; i < digest1.length; i++) {
	pass1 = Integer.toHexString(0xFF & digest1[i]);

 if (pass1.length() < 2) {
	 pass1 = "0" + pass1;
 }

 hexString.append(pass1);
}

// Third password
MessageDigest mdAlgorithm2 = MessageDigest.getInstance("MD5");
mdAlgorithm2.update(pass2.getBytes());

byte[] digest2 = mdAlgorithm2.digest();
StringBuffer hexString2 = new StringBuffer();

for (int i = 0; i < digest2.length; i++) {
	pass2 = Integer.toHexString(0xFF & digest2[i]);

 if (pass2.length() < 2) {
	 pass2 = "0" + pass2;
 }

 hexString.append(pass2);
}


%>
<%
Connection con= null;

PreparedStatement ps = null,ps1 =null;

ResultSet rs = null,rs1=null;
Statement st = null;
String oldpass="";
String msg="";

%>

<%
try{
	
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	 con = ds.getConnection();
st = con.createStatement();
 rs = st.executeQuery("select * from xx_user_master where User_name='"+ user1 + "'");

if(rs.next()){ 
user1 = rs.getString("user_name");

 oldpass = rs.getString("password");

System.out.println("username "+user1);
System.out.println("password "+oldpass);

} 
if(pass1.equals(pass2))
{
if (oldpass.equals(pass)) {
st = con.createStatement();
int i = st.executeUpdate("update xx_user_master set Password='"+ pass2 + "' where User_name='"+ user1 + "'");
 msg="Password changed successfully" ;
 session.invalidate();
response.sendRedirect("admn_login.jsp");
st.close();
con.close();
} else {
	 msg="Old Password doesn't match";
	// response.sendRedirect("change_password.jsp?msg="+msg);
	 %>
	 <c:redirect url="changepasswordlocaladmin.jsp">
<c:param name="msg" value="<%=msg %>"></c:param>
</c:redirect>
	 
	 <%
}
}else{
msg="New Password And Confirm Password Don't Match";
//response.sendRedirect("change_password.jsp?msg="+msg);
%>
<c:redirect url="changepasswordlocaladmin.jsp">
<c:param name="msg" value="<%=msg %>"></c:param>
</c:redirect>

<%
}

} catch (Exception e) {
//out.println(e);
}
%>
<div style="text-align: center;
    /* display: flex; */
    margin: 119px;
    font-size: larger;
    color: green;"> <% out.print(msg); %></div>
</body>
</html>