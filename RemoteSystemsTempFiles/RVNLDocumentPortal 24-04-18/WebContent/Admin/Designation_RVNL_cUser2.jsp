 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Designation</title>
<script src ="resources/JS/backButton.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
</head>
<body>

</body>
</html>
  
<%
String dept=request.getParameter("Dept");  

String piu=request.getParameter("PIU");
int  i = Integer.parseInt(request.getParameter("Index"));


String buffer="";
int flag=0;
if(!dept.equalsIgnoreCase("none")){
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();

	     String depts="Select Department_Id from xx_departments_master where Department_Name='"+dept+"' and TYPE='RVNL'";

 PreparedStatement ps4 = conn.prepareStatement(depts);
  // ps3.setString(1, piu);
   ResultSet rsl = ps4.executeQuery(); 
 rsl.next();
 String depatment_id=rsl.getString(1);

 String sql = "select Designation_name from xx_designation_mapping where Department_id='"+depatment_id+"'";
 PreparedStatement ps3 = conn.prepareStatement(sql);
   ResultSet rs = ps3.executeQuery(); 
 
 
   String Desg_name ="";
   
   buffer="<div id ='DesgDiv_RVNL1' style='display: inline;'><select name='designation_RVNL' id='designation_RVNL' style='width: 245px; margin:3px 0px 12px 0px;'><option value='-1'>-- Select Designation --</option>";  
 
 while(rs.next()){
	
	 String designation_name = rs.getString("designation_name");	
	 Desg_name=Desg_name+";"+designation_name;
	
	 	 
	 if(!Desg_name.equalsIgnoreCase("null")){
		 flag=1;
		 }	 
  buffer=buffer+"<option value='"+designation_name+"'>"+designation_name+"</option>";  
   }  
buffer=buffer+"</select><div>"; 
 
if(flag==1){
 response.getWriter().println(buffer); 
}else{
	
buffer="<div id ='DesgDiv_RVNL' style='display: inline;'><select name='designation' id='designation' style='width: 245px; margin:3px 0px 12px 0px;'><option value=''>--Select Designation--</option></select></div>";
	
response.getWriter().println(buffer);
}
conn.close();
}
 catch(Exception e){
     System.out.println(e);
 }
}
else{
	buffer = "<div id ='DesgDiv_RVNL' style='display: inline;'><select name='designation' id='designation' style='width: 245px; margin:3px 0px 12px 0px;'><option value=''>--Select Designation--</option></select></div>";
	response.getWriter().println(buffer);	
	
	
}

 %>
