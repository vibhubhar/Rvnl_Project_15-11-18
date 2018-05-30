<!DOCTYPE html><html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>

<head>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">       

<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.css" />
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.js"></script>
</head>
<body background= bgcolor=red>
<div data-role='page'  class = '' id='pageid' data-theme='b' data-content-theme='b'>
<div data-role='header'  class = '' id='headerid' data-theme='e' data-content-theme='e'><h1 id="indexheader">Select Project</h1></div>
<div data-role='content'  class = '' id='contentid' data-theme='b' data-content-theme='b'>
<ul data-role='listview' id='mylist'>
<%
String piu1 = request.getParameter("piu");
%>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs3 = null;
PreparedStatement ps3 = null;
 String project1=null;
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
conn = ds.getConnection();
                 String query = "select Project from xx_projectattributes_master where PIU_Of_RVNL='"+piu1+"' order by Project"; 
        try {         
                 ps3 = conn.prepareStatement(query);
					rs3 = ps3.executeQuery();
                   while (rs3.next()) {
                	   project1 = rs3.getString("Project");
%>
<li><a href='PublicProjectReport.jsp?project=<%=project1 %>&piu=&status=&doctype=&majsec=&smajsec=&frmstn=&tostn=&orgName=&backurl=&t1=7&t2=14&frmkm=&tokm=&DateStart=&DateEnd=&frmstnkm=&tostnkm=&division=none&zone=' target="_blank" data-transition='slide'><%=project1 %></a></li>
<%
}	
        } catch(Exception e){
			
			e.printStackTrace();
		}
		           rs3.close();
                   ps3.close();
                   conn.close();
                    
%>
</ul>
</div>
</div>
</body>
</html>
