<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page session="true" %>
 <%@include file="included/NewHeader.jsp"%>
<%@page import=" java.security.MessageDigest,javax.swing.JOptionPane,javax.swing.JFrame"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<%
String user_name =request.getParameter("user_name") ;

String password =request.getParameter("password") ;


// encryption code starts here
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

  

// encrytion md5 ends here
String message="";

String zone_id="", ucode=null;

Connection con= null;

PreparedStatement ps = null,ps1 =null;

ResultSet rs = null,rs1=null;

if((!(user_name.equals(null) || user_name.equals("")) && !(password.equals(null) || password.equals(""))))
{

try{
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	con = ds.getConnection();
	ps = con.prepareStatement("select * from xx_user_master where User_Name=? and Password=?");

ps.setString(1, user_name);

ps.setString(2, password);
rs = ps.executeQuery();

if(rs.next()){ 
user_name = rs.getString("user_name");

password = rs.getString("password");
 
zone_id=rs.getString("Zone_ID");
String piu_id=rs.getString("PIU_ID");
String mailstatus=rs.getString("MailStatus");
if(user_name.equals(user_name) && password.equals(password))

{
	String type=rs.getString("Type");
String theme=rs.getString("Theme");
String role=rs.getString("Role");
String Division_ID=rs.getString("Division_ID");
String realdatestatus=rs.getString("RealdateStatus");
session.setAttribute("user_name",user_name);
session.setAttribute("Type",type);
session.setAttribute("zone_id",zone_id);
session.setAttribute("piu_id",piu_id);
session.setAttribute("role",role);
session.setAttribute("Division_Id",Division_ID);
session.setAttribute("MailStatus",mailstatus);
session.setAttribute("RealdateStatus",realdatestatus);
//pageContext.setAttribute("myTheme", "brown", PageContext.SESSION_SCOPE);
session.setAttribute("myTheme", theme);

System.out.println("user_name----" +user_name);
/* System.out.println("user_name----" +user_name);
System.out.println("Type----"+type);
System.out.println("zone_id----"+zone_id);
System.out.println("piu_id----"+piu_id);
System.out.println("role----"+role);
System.out.println("Division_Id----"+Division_ID); */

if(role.equalsIgnoreCase("System Administrator")&& (type.equalsIgnoreCase("RVNL")) && (piu_id.equalsIgnoreCase("27"))){
	ucode="3";
//response.sendRedirect("NewIndexSysadmin.jsp"); 
}
else if(type.equalsIgnoreCase("MOR") && (zone_id.equalsIgnoreCase("18"))  && (role.equalsIgnoreCase("Supervisor"))){
	ucode="1";
	//	response.sendRedirect("NewIndexCO.jsp"); 
	
}
else if(type.equalsIgnoreCase("RVNL") && (piu_id.equalsIgnoreCase("27"))  && (role.equalsIgnoreCase("Supervisor"))){
	ucode="1";
	//response.sendRedirect("NewIndexCO.jsp"); 
	
}
else if(role.equalsIgnoreCase("LocalUser")) {
	ucode="4";
	//response.sendRedirect("NewIndexLocaladmin.jsp");
}else if(type.equalsIgnoreCase("RVNL") && role.equalsIgnoreCase("Supervisor")){
	ucode="5";
	//response.sendRedirect("NewIndexPIU.jsp"); 
	
}else if(type.equalsIgnoreCase("MOR") && role.equalsIgnoreCase("Supervisor")){
	ucode="2";
	//response.sendRedirect("NewIndexZoneDivn.jsp"); 
	
}
session.setAttribute("User_Code",ucode);
response.sendRedirect("NewIndex.jsp"); 
} 
}
else{

	   response.sendRedirect("admn_login.jsp");
	   session.setAttribute("error", "<font color='red'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Username and Password do not match</b>");
	   	


}


rs.close();

ps.close(); 
con.close();

}

catch(SQLException sqe)

{

out.println(sqe);

} 

}

else

{
	
%>

<center><p style="color:red">Error In Login</p></center>

<% 

getServletContext().getRequestDispatcher("admn_index.jsp?user="+user_name).include(request,response);

}

%>