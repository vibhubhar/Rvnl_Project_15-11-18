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
  
<%
String dept=request.getParameter("Dept");  


String piu=request.getParameter("PIU");
String idx=request.getParameter("Index");
String dType = request.getParameter("dType");
//String zone=request.getParameter("Zone");
//String divn=request.getParameter("Divn");

String Type = request.getParameter("Type");
System.out.println(Type+"Type");

String buffer="";
String depatment_id=null;
int flag=0;

if(!dept.equalsIgnoreCase("none")){
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();
// Statement stmt = conn.createStatement();  
//
/* String piu_id=null, zone_id=null;
int level=0;
if (Type.equalsIgnoreCase("RVNL")) {
	String pid="Select PIU_Id from xx_piu_master where PIU_Name='"+piu+"'";
	PreparedStatement ps2 = conn.prepareStatement(pid);
	 ResultSet rs2 = ps2.executeQuery(); 
	if (rs2.next()) {
	piu_id=rs2.getString(1);
	}
if (piu_id.equalsIgnoreCase("27")) {
level=1;	
} else {level=2;}
} else if  (Type.equalsIgnoreCase("MOR")) {
	String zid="Select Zone_Id from xx_zones_master where Zone_Name='"+zone+"'";
	PreparedStatement ps3 = conn.prepareStatement(zid);
	 ResultSet rs3 = ps3.executeQuery(); 
	if (rs3.next()) {
	zone_id=rs3.getString(1);
	}
if (zone_id.equalsIgnoreCase("18")) {
level=1;	
} else if (divn.equalsIgnoreCase("Headquarters")) {
level=2;} else {level=3;}
}
*/
// ResultSet rs = stmt.executeQuery("select  division_name from xx_divisions_map where ext_zone_id = (select zone_id from xx_zones_master where zone_name = '"+country+"' ");  
  String depts="Select Department_Id from xx_departments_master where Department_Name='"+dept+"' and Type='"+Type+"'";
// String sql = "select mas.designation_name from xx_designation_master mas,xx_designation_mapping map ,xx_departments_master dmas,"+
//       	 "xx_piu_master piu where map.designation_Id = mas.designation_Id and map.Department_Id = dmas.Department_id and piu.piu_id = map.piu_id and" +
//	      " piu.piu_name ='"+piu+"' and dmas.department_name = ?";

  

 PreparedStatement ps4 = conn.prepareStatement(depts);
  // ps3.setString(1, piu);
   ResultSet rsl = ps4.executeQuery(); 
 rsl.next();
 depatment_id=rsl.getString(1);

 //String sql = "select Designation_name from xx_designation_mapping where Department_Id ='"+depatment_id+"' and Type='"+Type+"' and Level="+level;
 String sql = "select Designation_name from xx_designation_mapping where Department_Id ='"+depatment_id+"' and Type='"+Type+"' order by Designation_name";
 

 PreparedStatement ps3 = conn.prepareStatement(sql);
   //ps3.setString(1, dept);
  // ps3.setString(1, piu);
   ResultSet rs = ps3.executeQuery(); 

 
   String Desg_name ="";
   
   buffer="<div id ='DesgDiv_RVNL"+idx+"' style='display: inline;'><select name='designation_RVNL"+idx+"' id='designation_RVNL"+idx+"' style='width: 205px; margin:3px 0px 12px 0px;'><option value=''>--Select Designation--</option>";  
 
 while(rs.next()){
	
	 String designation_name = rs.getString("designation_name");	
	 Desg_name=Desg_name+";"+designation_name;
	
	 	 
	 if(!Desg_name.equalsIgnoreCase("null")){
		 flag=1;
		 }	 
  buffer=buffer+"<option value='"+designation_name+"'>"+designation_name+"</option>";  
   }  
 // session.setAttribute("designation_name", Desg_name);
buffer=buffer+"</select></div>"; 

if(flag==1){
 response.getWriter().println(buffer); 
}else{
buffer="<div id ='DesgDiv_RVNL' style='display: inline;'><select name='designation_RVNL"+idx+"' id='designation_RVNL"+idx+"' style='width: 205px; margin:3px 0px 12px 0px;'><option value=''>--Select Designation--</option></select></div>";	
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
	   buffer="<div id ='DesgDiv_RVNL"+idx+"' style='display: inline;'><select name='designation_RVNL"+idx+"' id='designation_RVNL"+idx+"' style='width: 205px;'><option value=''>--Select Designation--</option></select></div>";
	response.getWriter().println(buffer);

}
 %>
</body>
</html>