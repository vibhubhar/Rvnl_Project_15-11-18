<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
 
<%
 
            String piu=request.getParameter("ver");


Connection conn = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs12=null,rs13=null,rs14=null;
PreparedStatement ps1 = null, ps3 = null;
 
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

conn = ds.getConnection();


                 String query = "select * from xx_piu_master where PIU_Name='"+piu+"'"; 
                
                 ps3 = conn.prepareStatement(query);
					rs3 = ps3.executeQuery();
                    if(rs3.next())
                    {   
                    	out.println("<INPUT TYPE='HIDDEN' NAME='exist' ID='exist' value='true'>");
                        out.println("<font color=red>");
                        out.println("PIU  Already Exist");
                        out.println("</font>");
 
                    }else {
 
                       out.println("<font color=green>");
                      out.println(" Available");
                        out.println("</font>");
 
                    }
 
conn.close();
 
%>
