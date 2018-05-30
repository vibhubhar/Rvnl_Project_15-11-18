<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="resources/JS/validateSysAdmin230.js"></script>

</head>
<body>
<%
String proid=request.getParameter("project_id");
System.out.println(proid+"proid");
String buffer="";
int flag=0;

try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();
//Statement stmt = conn.createStatement();  
//ResultSet rs = stmt.executeQuery("select  division_name from xx_divisions_map where ext_zone_id = (select zone_id from xx_zones_master where zone_name = '"+country+"' ");  
 String sql="select * from xx_document_mapping where Project_ID='"+proid+"' and Forwarded ='No'";
//String sql = "select mas.designation_name from xx_designation_master mas,xx_designation_mapping map ,xx_departments_master dmas,"+
//      	 "xx_piu_master piu where map.designation_Id = mas.designation_Id and map.Department_Id = dmas.Department_id and piu.piu_id = map.piu_id and" +
//	      " piu.piu_name ='"+piu+"' and dmas.department_name = ?";

  
   buffer="<div id ='documentNamediv' style='display: inline;'><tr></br>Documents :<select name='documentName' id='documentName' style='width: 205px' onchange='showUser(this.value)'><option value='-1'>Select Document</option></div>";  

PreparedStatement ps4 = conn.prepareStatement(sql);
 // ps3.setString(1, piu);
  ResultSet rsl = ps4.executeQuery(); 
  while(rsl.next()){
String Docname=rsl.getString("Document_Name");
int docid=rsl.getInt("Document_Map_ID");
if(!Docname.equalsIgnoreCase("null")){
	 flag=1;
	 }	 
buffer=buffer+"<option value='"+docid+"'>"+Docname+"</option>";  
}  
  
// session.setAttribute("designation_name", Desg_name);
buffer=buffer+"</select>"; 
System.out.println("FLAG="+flag); 
if(flag==1){
response.getWriter().println(buffer); 
}else{
	//buffer=buffer+"<option value='CPM'>CPM</option></select>";
   buffer="<div id ='documentNamediv' style='display: inline;'><select name='documentName' id='documentName' style='width: 205px'><option value='-1'>Select</option></div>";  
	response.getWriter().println(buffer);
}
conn.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>