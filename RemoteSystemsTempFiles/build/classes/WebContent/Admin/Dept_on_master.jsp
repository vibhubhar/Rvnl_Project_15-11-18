<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>

<%
String type=request.getParameter("dtype");  

String piu=request.getParameter("PIU");

String buffer="";
int flag=0; 
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();
	     String Sql="select Department_Name from xx_departments_master where Type=? order by Department_Name";
	     PreparedStatement ps3 = conn.prepareStatement(Sql);
	     ps3.setString(1, type);
	    // ps3.setString(1, piu);
	     ResultSet rs = ps3.executeQuery(); 
	  	buffer="<div id='Desgdiv' style='display: inline;'><tr></br> Department : <select name='department' id='department' style='width: 225px;margin-left:90px'><option value='none'>-- Select Department --</option></div>";
	  	while(rs.next()){
	 	   String Department =  rs.getString(1);
	 	  if(!Department.equalsIgnoreCase("null")){
	 		 flag=1;
	 		 
	 		 }	 
	 	  // buffer=buff+er+"<tr class='active'><td class='ListOfTables'>"+project+"</td><td class='ListOfTables'>"+p_coordinator+"</td><td class='ListOfTables'>"+piuRVNL+"</td></tr>";
	 	   buffer=buffer+"<option value='"+Department+"'>"+Department+"</option>";
	    }
	    buffer=buffer+"</select></br>";
	  
	



if(flag==1){

 response.getWriter().println(buffer); 
}else{
	response.getWriter().println("</br>");
}
conn.close();

}
catch(Exception e){
    System.out.println(e);
}
%>
</body>
</html>
