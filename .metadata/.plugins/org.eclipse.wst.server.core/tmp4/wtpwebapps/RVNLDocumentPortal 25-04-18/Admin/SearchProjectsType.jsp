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
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>

</body>
</html>
 
<%
String projects=request.getParameter("PROJECTS");  
String piu=request.getParameter("piu"); 
System.out.println(projects);
String buffer="";
String projectid="";

try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();
	     int count=1;
	     String sql=null;
 if (!projects.equalsIgnoreCase("none")) {
	 sql = "select * from xx_projectattributes_master where Project_Type ='"+projects+"' and PIU_of_RVNL='"+piu+"'";
 } else {
	  sql = "select * from xx_projectattributes_master where PIU_of_RVNL='"+piu+"'";
 }
 System.out.println("11"+projects+"22"+sql);
 PreparedStatement ps3 = conn.prepareStatement(sql);
   //ps3.setString(1, piu);
   ResultSet rs = ps3.executeQuery(); 
   buffer="<div class='scrollit' style='height: 515px; margin-top:0px;'><table class='table table-hover table-bordered' style='background-color: #FFFAF0;width=100%'><tr class='success' style='height: 73px;'><th class='ListOfTables' width ='5%'><b>S.No.</b> </th><th class='ListOfTables' width ='50%'><b>Project Name</b> </th><th class='ListOfTables' width ='20%'><b>Project Type</b></th><th class='ListOfTables' width ='20%'><b>Project Coordinator</b></th><th class='ListOfTables' width ='5%'><b>Modify</b></th></tr></div>";
		  // "<div class='scrollit' style='height:515px;'><table class='table table-hover table-bordered' style='background-color: #FFFAF0;width=100%'><tr class='success' style='height: 73px;'><th class='ListOfTables' width ='5%'><b>S.No.</b> </th><th class='ListOfTables' width ='53%'><b>Project Name</b> </th><th class='ListOfTables' width ='53%'><b>Project Coordinator</b></th><th class='ListOfTables' width ='33%'><b>Project Type</b></th><th class='ListOfTables' width ='33%'><b>Modify</b></th></tr></div>";
   System.out.println("resultset val="+rs.getRow());
 	while(rs.next()){
 		projectid=rs.getString(1);
 	   String project =  rs.getString(2);
 	   String p_coordinator = rs.getString(3);
 	   String piuRVNL = rs.getString(4);
 	   String type = rs.getString(5);
	   buffer=buffer+"<tr class='active'><td class='ListOfTables'>"+count+"</td><td class='ListOfTables'>"+project+"</td><td class='ListOfTables'>"+type+"</td><td class='ListOfTables'>"+p_coordinator+"</td><td><INPUT TYPE='button' class='btn btn-primary' NAME='modify' value ='modify' onClick='modifying("+projectid+");'>"+"</td></tr>";
	   count=count+1;
   }
   buffer=buffer+"</table>";
 
		   System.out.println("----"+buffer);
 response.getWriter().println(buffer); 
 try { conn.close(); } catch (Exception e) { /* ignored */ }

}
 catch(Exception e){
     System.out.println(e);
 }

 %>