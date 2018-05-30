 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
  
<%
String country=request.getParameter("cont");  
String zone=request.getParameter("zone");
System.out.println(country);
String buffer="";
int flag=0;
Connection conn = null;
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     conn = ds.getConnection();
// Statement stmt = conn.createStatement();  
// ResultSet rs = stmt.executeQuery("select  division_name from xx_divisions_map where ext_zone_id = (select zone_id from xx_zones_master where zone_name = '"+country+"' ");  
  
 String sql = "select  division_name from xx_divisions_map where ext_zone_id =(select zone_id from xx_zones_master where zone_name = ?) and division_name != 'Headquarters'";
 PreparedStatement ps3 = conn.prepareStatement(sql);
   ps3.setString(1, country);
   ResultSet rs = ps3.executeQuery(); 
 
 
   String Div_Name ="";
   System.out.println("----"+Div_Name);
   buffer="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+zone+":";  
//   String xx = "tyghj;gvfg;gfgf";
  
 
 while(rs.next()){
	
	 
	 String division_name = rs.getString("Division_name");	
	 Div_Name=Div_Name+";"+division_name;
	 //System.out.println(Div_Name); 
	 if(!Div_Name.equalsIgnoreCase("null")){
		 flag=1;
		 }	 
  buffer=buffer+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='checkbox' name='divisions' id='divisions' value='"+division_name+"'> "+division_name;  
   
 }
  
  
 session.setAttribute("Division_Name", Div_Name);

System.out.println("FLAG="+flag); 
if(flag==1){
 response.getWriter().println(buffer); 
}else{
	response.getWriter().println("</br>");
}

}
 catch(Exception e){
     System.out.println(e);
 } finally {
	    try { conn.close(); } catch (Exception e) { /* ignored */ }
	}

 %>