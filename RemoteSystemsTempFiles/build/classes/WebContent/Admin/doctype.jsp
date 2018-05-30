<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
 
<%
 
            String doctype=request.getParameter("ver");



Connection conn = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs12=null,rs13=null,rs14=null;
PreparedStatement ps1 = null, ps3 = null;
 
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

conn = ds.getConnection();
	 String query1 = "select * from xx_documentattributes_master where Document_Type='"+doctype+"'"; 
    
     ps1 = conn.prepareStatement(query1);
		rs1 = ps1.executeQuery();
        if(rs1.next())
        {   
        	out.println("<INPUT TYPE='HIDDEN' NAME='exist' ID='exist' value='true'>");
            out.println("<font color=red>");
            out.println("Document Type Already Exists !!!");
            out.println("</font>");

        }else {

           out.println("<font color=green>");
          out.println(" Available");
            out.println("</font>");

        }
	 
	 
	 
 //}
 


conn.close();

%>
