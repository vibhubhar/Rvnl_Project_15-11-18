<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %> 
      <%@include file="included/NewHeader.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table class="mainClass" style="background-color: #F0FFFF" align="left">
<br><br>
<%String dbType = request.getParameter("type");
String zId= request.getParameter("zId");
String divId= request.getParameter("divId");
String piuId= request.getParameter("piuId");
String depId= request.getParameter("depId");
String desigId= request.getParameter("desigId");
String condition = request.getParameter("condition");

//out.println("dbType:::"+dbType);
//out.println("desigId:::"+desigId);

Connection con = null;
Statement stmt = null;
ResultSet rs = null;
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
con = ds.getConnection();
int queryUpdate =0;
String sqlQuery = null;

try{
if(dbType.equalsIgnoreCase("zone")){
sqlQuery = "DELETE FROM xx_zones_master WHERE Zone_Id ="+zId+"";
}
else if(dbType.equalsIgnoreCase("division")){
	if(divId.equalsIgnoreCase("70")){
		sqlQuery = "DELETE FROM xx_divisions_map WHERE division_id >= 70";	
	}
    else{
	    sqlQuery = "DELETE FROM xx_divisions_map WHERE division_id ="+divId+"";
	}
}	
else if(dbType.equalsIgnoreCase("piu")){
sqlQuery = "DELETE FROM xx_piu_master WHERE PIU_Id ="+piuId+"";
}
else if(dbType.equalsIgnoreCase("Departments")){
sqlQuery = "DELETE FROM xx_departments_master WHERE Department_Id ="+depId+"";
}
else if(dbType.equalsIgnoreCase("Designations")){
sqlQuery = "DELETE FROM xx_designation_master WHERE Designation_Id ="+desigId+"";
//sqlQuery = "DELETE FROM xx_designation_mapping WHERE Designation_Id ="+desigId+"";
}

stmt = con.createStatement();
queryUpdate = stmt.executeUpdate(sqlQuery);

if(dbType.equalsIgnoreCase("Designations")){
sqlQuery = "DELETE FROM xx_designation_mapping WHERE Designation_Id ="+desigId+"";
stmt = con.createStatement();
int queryUpdate1 = stmt.executeUpdate(sqlQuery);
}
if(queryUpdate==1){
	%><div class="alert alert-success" align="center">
    <strong>Success!</strong> Records are deleted successfully.
  </div>
	<% 
	//out.println("Value deleted successfully.");
	queryUpdate=0;
}
else{
	%>
	<div class="alert alert-info" align="center">
    There is an issue in deleting the records.
  </div><% 
	//out.println("There is an issue deleting the value.");
}
}catch(SQLException e){
	%>	
	<div class="alert alert-warning" align="center">
    <strong>Warning!</strong> Kindly remove its respective divisions first .
  </div>
	<% 
}finally{	
	try {

		if (con != null)
			con.close();
	} catch (Exception e) {
	}
	try {
		if (stmt != null)
			stmt.close();
		} catch (Exception e) {
		}
	try {
		if (rs != null)
			rs.close();
		} catch (Exception e) {
		}	
		}
%>
<form action="">
<%if(dbType.equalsIgnoreCase("zone")){ %>
<%}%>
<input type="hidden" name="type" value=<%=dbType %>>
<br> <br><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <h3>  <a style="margin-left:600px" href="Update.jsp">Back</a></h3>          
</table>
</form>
											      <%@include file="included/Newfooter.jsp" %>

</body>
</html>