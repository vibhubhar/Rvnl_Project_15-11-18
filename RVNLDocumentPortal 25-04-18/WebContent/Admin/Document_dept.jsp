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
<script src="resources/JS/Headquarter.js"></script>
</head>
<body>

</body>
</html>

<%
String dtype=request.getParameter("dtype");  
System.out.println(dtype);
String buffer="";
try{
	
	 Context initCtx = new InitialContext();
	 Context envCtx = (Context) initCtx.lookup("java:comp/env");
	 DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();
	     
	     String sql = "select DM.Department_Name from xx_documenttype_mapping DOC,xx_departments_master DM where document_id = (select document_id from xx_documentattributes_master where document_type = ?)"+
	    		 "and DM.Department_Id = DOC.Department_id";
	     PreparedStatement ps3 = conn.prepareStatement(sql);
	       ps3.setString(1, dtype);
	       ResultSet rs = ps3.executeQuery(); 	     
	     
	       buffer="<div id ='DivsionsDiv' style='display: inline;'><select name='Department_name' id='Department_name' style='width: 205px;margin-left:26px' onchange='divisionChange()'><option value='-1'>Select</option></div>";
	       
	       while(rs.next()){
	    		
	    		 String dep_name = rs.getString(1);	
	    		 buffer=buffer+"<option value='"+dep_name+"'>"+dep_name+"</option>";  
	       }
	       buffer=buffer+"</select>";
	       response.getWriter().println(buffer); 
	       conn.close();
} catch(Exception e){
    System.out.println(e);
}
%>