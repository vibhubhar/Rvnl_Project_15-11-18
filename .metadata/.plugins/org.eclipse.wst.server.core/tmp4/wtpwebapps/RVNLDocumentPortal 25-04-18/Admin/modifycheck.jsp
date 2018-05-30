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
String index=request.getParameter("index");
String id=request.getParameter("id");
 System.out.println("Zone ====------ "+country);
System.out.println("zone-  "+zone+"  index ="+index+"--"+id+"this is new js we are using");
//System.out.println("id ===============================================first ---------------"+id); 
String buffer="";
int flag=0;
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();
// Statement stmt = conn.createStatement();  
// ResultSet rs = stmt.executeQuery("select  division_name from xx_divisions_map where ext_zone_id = (select zone_id from xx_zones_master where zone_name = '"+country+"' ");  
  
 String sql = "select  division_name from xx_divisions_map where ext_zone_id =(select zone_id from xx_zones_master where zone_name = ?) and division_name != 'Headquarters' order by Division_Name";
 PreparedStatement ps3 = conn.prepareStatement(sql);
   ps3.setString(1, country);
   ResultSet rs = ps3.executeQuery(); 
 
 
   String Div_Name ="";
   //System.out.println("----"+Div_Name);
   buffer="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+zone+" :";  

  
 
 while(rs.next()){
	
	 
	 String division_name = rs.getString("Division_name");	
	 Div_Name=Div_Name+";"+division_name;
	 //System.out.println(Div_Name); 
	 if(!Div_Name.equalsIgnoreCase("null")){
		 flag=1;
		 }	 
  buffer=buffer+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='checkbox' name='divisions"+id+":"+index+"'  id='divisions"+id+":"+index+"'  display:inline; ' style='margin-top:-350px;' value='"+division_name+"'> "+division_name;  
   
  
 }
  
 buffer+="";
 session.setAttribute("Division_Name", Div_Name);

//System.out.println("FLAG="+flag); 
if(flag==1){
	//System.out.println(buffer);
 response.getWriter().println(buffer); 
}else{
	response.getWriter().println(buffer);
}
conn.close();
}
 catch(Exception e){
     System.out.println(e);
 }

 %>