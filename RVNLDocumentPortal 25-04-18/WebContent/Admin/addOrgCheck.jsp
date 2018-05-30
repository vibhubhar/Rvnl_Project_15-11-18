<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
 
<%
 
String org1 = request.getParameter("ver");


Connection conn = null;
Statement stmt = null, stmt1=null;
ResultSet  rs3 = null;
PreparedStatement ps3 = null;
 try {
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

conn = ds.getConnection();


                 String query = "select * from xx_org_master where Org_name='"+org1+"'"; 
                 
                 ps3 = conn.prepareStatement(query);
					rs3 = ps3.executeQuery();
                    if(rs3.next())
                    {   
                    	out.println("<INPUT TYPE='HIDDEN' NAME='exist' ID='exist' value='true'>");
                        out.println("<font color=red>");
                        out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This Organization already exists !!!");
                        out.println("</font>");
 
                    }else {
                    
                    	 stmt1 = conn.createStatement();
                         String sql = "INSERT INTO xx_org_master (Org_name) VALUES ('"+org1+"')";
                       	 stmt1.executeUpdate(sql); 
                       	 out.println("<font color=green><b>");
                         out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New Organization added successfully...");
                         out.println("</b></font>");
  
                    }
 } catch(Exception e){
		
		e.printStackTrace();
	} finally {
	    try { rs3.close(); } catch (Exception e) { /* ignored */ }
	    try { ps3.close(); } catch (Exception e) { /* ignored */ }
	    try { conn.close(); } catch (Exception e) { /* ignored */ }
	}
//rs3.close();
//ps3.close();
//conn.close();
 
%>
