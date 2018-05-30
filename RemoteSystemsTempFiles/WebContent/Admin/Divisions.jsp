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
String piu=request.getParameter("zonemain");  

String zone1=piu.replace(" ","~" );
String arg="showprojectsss(this.value,'"+zone1+"')";
String buffer="";
int flag=0;
if(zone!=""){
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();
  
 String sql = "select  Division_Name from xx_divisions_map where ext_zone_id = (select zone_id from xx_zones_master where zone_name = ?) and Division_Name !='Headquarters' order by Division_Name";
 //System.out.println("quey for my output is-----"+sql);
 PreparedStatement ps3 = conn.prepareStatement(sql);
   ps3.setString(1, zone);
   ResultSet rs = ps3.executeQuery(); 
 
 
   String Div_Name ="";
   
   buffer="<div id ='DivsionsDiv' style='display: inline;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name='division' id='division' style='width: 240px'  onchange="+arg+" ><option value=''>-- Select Division --</option></div>";  

  
 
 while(rs.next()){
	
	 String division_name = rs.getString("Division_Name");	
	 Div_Name=Div_Name+";"+division_name;
	 
	 if(!Div_Name.equalsIgnoreCase("null")){
		 flag=1;
		 }	 
  buffer=buffer+"<option value='"+division_name+"'>"+division_name+"</option>";  
   }  
 session.setAttribute("Division_Name", Div_Name);
buffer=buffer+"</select>"; 

if(flag==1){
 response.getWriter().println(buffer); 
}else if(flag==0){
	
}
else{
	
	buffer="<div id ='DivsionsDiv' style='display: inline;'><select name='division' id='division' style='width: 205px' onchange="+arg+" ><option value='none'>-- Select Division --</option></select></div>";  

	response.getWriter().println(buffer);	
	
}
conn.close();
}
 catch(Exception e){
     System.out.println(e);
 }
}
else
{
	
	buffer="<div id ='DivsionsDiv' style='display: inline;'><select name='division' id='division' style='width: 205px' onchange="+arg+" ><option value='none'>-- Select Division --</option></div>";  
	response.getWriter().println(buffer); 
}
 %>