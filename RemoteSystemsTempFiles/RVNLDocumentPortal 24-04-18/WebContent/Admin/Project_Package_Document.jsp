<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="resources/JS/Reports230.js"></script>
</head>
<body>
<br>
				

<%
String project_id=request.getParameter("project_id");  
String buffer="";
int flag=0;
Connection conn = null;
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     conn = ds.getConnection();
	     
	     String sql="select package_id,package_name from xx_packages_project where project_id='"+project_id+"'";

	     PreparedStatement ps4 = conn.prepareStatement(sql);
	      // ps3.setString(1, piu);
	       ResultSet rs1 = ps4.executeQuery();
	       
	       buffer="<div id ='package' style='display: inline;'></br>Packages :<select name='packages' id='packages' style='width: 205px;margin-left:30px' onchange='sendInfo(this.value)'><option value='none'>Select packages</option>";
	       
	       while(rs1.next()){
	    	   String package_id = rs1.getString("package_id");
	    		 String package_name = rs1.getString("package_name");	
	    		 if(!package_name.equalsIgnoreCase("null")){
	    			 flag=1;
	    			 }	 
	    	  buffer=buffer+"<option value='"+package_id+"'>"+package_name+"</option>";
	       }	       
	       buffer=buffer+"</select></div>"; 
	       System.out.println("FLAG="+flag); 
	       if(flag==1){
	        response.getWriter().println(buffer); 
	       }else{
	    	   response.getWriter().println(buffer);
	       }
	       
}catch(Exception e){
	e.printStackTrace();
} finally {
    try { conn.close(); } catch (Exception e) { /* ignored */ }
}
%>
</body>
</html>