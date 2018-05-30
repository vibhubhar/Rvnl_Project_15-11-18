<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.io.*,java.util.*,javax.script.*,java.nio.file.*,java.nio.charset.*,java.text.DateFormat" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import = "java.lang.Integer"%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">    
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script src="resources/jQuery/jquery-1.12.3.min.js"></script> 
<script src="resources/jQuery/jquery-ui.js"></script>

</head>
<body>

</body>
</html>
 
<%
String piu=request.getParameter("PIU");  
String buffer="";
String projectid="", completed=null;
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();

 String sql = "select * from xx_projectattributes_master where piu_of_RVNL ='"+piu+"' order by Project ";
 
  PreparedStatement ps3 = conn.prepareStatement(sql);
 int count=1;
   //ps3.setString(1, piu);
   ResultSet rs = ps3.executeQuery(); 
   if(rs !=null){
 	buffer="<div class='scrollit' style='height: 515px; margin-top:0px;'><table class='table table-hover table-bordered' style='background-color: #FFFAF0;width=100%'><tr class='success' style='height: 73px;'><th class='ListOfTables' width ='5%'><b>S.No.</b> </th><th class='ListOfTables' width ='50%'><b>Project Name</b> </th><th class='ListOfTables' width ='20%'><b>Project Type</b></th><th class='ListOfTables' width ='15%'><b>Project Coordinator</b></th><th class='ListOfTables' width ='5%'><b>Package(s) Created</b></th><th class='ListOfTables' width ='5%'><b>Modify</b></th></tr></div>";
   System.out.println("resultset val="+rs.getRow());
 	while(rs.next()){
 		
 		projectid=rs.getString(1);
	   String project =  rs.getString(2);
	   String p_coordinator = rs.getString(3);
	   String piuRVNL = rs.getString(4);
	   String type = rs.getString(5);
	   String completed1 = rs.getString(11);
	   if (completed1!=null) { completed="Yes";
	   buffer=buffer+"<tr class='active'><td class='ListOfTables'>"+count+"</td><td class='ListOfTables'>"+project+"</td><td class='ListOfTables'>"+type+"</td><td class='ListOfTables'>"+p_coordinator+"</td><td class='ListOfTables'>"+completed+"</td><td><INPUT TYPE='button' class='btn btn-primary' NAME='modify' value ='modify' onClick='modifying("+projectid+");'>"+"</td></tr>";
	   } else {completed="No";
	   buffer=buffer+"<tr style='background-color: lightpink;'><td class='ListOfTables'>"+count+"</td><td class='ListOfTables'>"+project+"</td><td class='ListOfTables'>"+type+"</td><td class='ListOfTables'>"+p_coordinator+"</td><td class='ListOfTables'>"+completed+"</td><td><INPUT TYPE='button' class='btn btn-primary' NAME='modify' value ='modify' onClick='modifying("+projectid+");'>"+"</td></tr>";
	   }
	   count=count+1;
   }
   buffer=buffer+"</table>";
   }else{
	   buffer=buffer+"";
   }
		   
 response.getWriter().println(buffer); 
	    try { conn.close(); } catch (Exception e) { /* ignored */ }
}
 catch(Exception e){
     System.out.println(e);
 }

 %>