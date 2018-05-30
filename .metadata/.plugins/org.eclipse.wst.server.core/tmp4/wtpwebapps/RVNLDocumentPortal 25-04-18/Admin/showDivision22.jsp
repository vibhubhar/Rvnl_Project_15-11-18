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
<script src="resources/JS/Reports230.js"></script>
</head>
<body>

</body>
</html>
 
 
 
 
 
<%
String zone=request.getParameter("zone");  
System.out.println(zone);
String buffer="";
int flag=0;
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();
// Statement stmt = conn.createStatement();  
// ResultSet rs = stmt.executeQuery("select  division_name from xx_divisions_map where ext_zone_id = (select zone_id from xx_zones_master where zone_name = '"+country+"' ");  
  
 String sql = "select  Division_Name from xx_divisions_map where ext_zone_id = (select zone_id from xx_zones_master where zone_name = ?) order by Division_Name='Headquarters' Desc, Division_Name";
 //System.out.println("quey for my output is-----"+sql);
 PreparedStatement ps3 = conn.prepareStatement(sql);
   ps3.setString(1, zone);
   ResultSet rs = ps3.executeQuery(); 
 
 
   String Div_Name ="";
   System.out.println("----"+Div_Name);
   buffer="<div id ='DivisionsDiv' style='display: inline;'><select name='division' id='division' style='width: 205px' onchange='showprojectsss(this.value);' ><option value='none'>-- Select Division --</option></div>";  

  
 
 while(rs.next()){
	
	 String division_name = rs.getString("Division_Name");	
	 Div_Name=Div_Name+";"+division_name;
	 System.out.println(Div_Name); 
	 if(!Div_Name.equalsIgnoreCase("null")){
		 flag=1;
		 }	 
  buffer=buffer+"<option value='"+division_name+"'>"+division_name+"</option>";  
   }  
 session.setAttribute("Division_Name", Div_Name);
buffer=buffer+"</select>"; 
System.out.println("FLAG="+flag); 
if(flag==1){
 response.getWriter().println(buffer); 
}else{
	System.out.println("coming inside else of showdivision22.jsp");
	buffer="<div id ='DivisionsDiv' style='display: inline;'><select name='division' id='division' style='width: 205px' onchange='showprojectsss(this.value);' ><option value='none'>-- Select Division --</option></select></div>";  

	response.getWriter().println(buffer);
}
try { conn.close(); } catch (Exception e) { /* ignored */ }
}
 catch(Exception e){
     System.out.println(e);
 }

 %>