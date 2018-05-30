<!DOCTYPE html><html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>

<head>
<title>PDAMS - Report</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">       

<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.css" />
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.js"></script>
</head>
<body background= bgcolor=red>
<div data-role='page'  class = '' id='pageid' data-theme='e' data-content-theme='e'>
<div data-role='header'  class = '' id='headerid' data-theme='b' data-content-theme='b'><h1 id="indexheader">Select PIU</h1></div>
<div data-role='content'  class = '' id='contentid' data-theme='e' data-content-theme='e'>
<ul data-role='listview' id='mylist'>
<!--  <li><a href='PublicReport.jsp' data-transition='slide'>All</a></li>-->

<%
Connection conn = null;
Statement stmt = null;
ResultSet rs3 = null;
PreparedStatement ps3 = null;
 String piuname=null;
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
conn = ds.getConnection();
                 String query = "select PIU_Name from xx_piu_master where PIU_ID<>27 order by PIU_Name"; 
        try {         
                 ps3 = conn.prepareStatement(query);
					rs3 = ps3.executeQuery();
                   while (rs3.next()) {
                	   piuname = rs3.getString("PIU_Name");
%>
<li><a href='PublicProject.jsp?piu=<%=piuname %>' data-transition='slide'><%=piuname %></a></li>
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
