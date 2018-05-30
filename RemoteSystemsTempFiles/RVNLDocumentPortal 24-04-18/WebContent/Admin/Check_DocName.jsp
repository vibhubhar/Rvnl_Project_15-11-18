<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
 
<%
 
            String documentname=request.getParameter("ver");
String project_id=request.getParameter("projid");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs12=null,rs13=null,rs14=null;
PreparedStatement ps1 = null, ps3 = null;
 
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

conn = ds.getConnection();


                 String query = "select count(Document_Name) from xx_document_mapping where Project_ID="+project_id+" and Document_Name='"+documentname+"'"; 
                 
                 ps3 = conn.prepareStatement(query);
					rs3 = ps3.executeQuery();
                    if(rs3.next())
                    {   
                    	int count=rs3.getInt(1);
                    	if(count!=0){
                    		
                    		out.println("<INPUT TYPE='HIDDEN' NAME='exist' ID='exist' value='true'>");
                            out.println("<font color=red>");
                            out.println("<br>&nbsp;&nbsp;&nbsp;This Document Name already exists in this Project");
                            out.println("</font>");
                    		
                    	}else{
                    	
                    		
                    		out.println("<font color=green>");
                           // out.println("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Document Name Is Valid");
                            out.println("</font>");
                    		
                    	}     	
                    }
 
rs3.close();
ps3.close();
conn.close();
 
%>
