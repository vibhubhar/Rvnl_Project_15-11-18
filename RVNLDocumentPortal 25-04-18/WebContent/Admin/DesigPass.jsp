<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
 
<%
int id=0;
            String Desig=request.getParameter("ver");
String department=request.getParameter("department");
String newdesig=request.getParameter("newdesig");
String type=request.getParameter("desigType");
/* 
System.out.println("coming here------------"+Desig);
System.out.println("department department------------"+department);
System.out.println("coming hnewdesigere------------"+newdesig);
System.out.println("coming here------------"+Desig); */
Connection conn = null;
Statement stmt = null;
ResultSet rs = null,  rs3 = null;
PreparedStatement ps = null, ps3 = null;
 
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

conn = ds.getConnection();

String query1 = "select * from xx_departments_master where Department_Name='"+department+"' and Type='"+newdesig+"'"; 
//System.out.println("final sqlQuery:::"+query1);
	ps = conn.prepareStatement(query1);
	 rs = ps.executeQuery();
   if(rs.next())
   {   
	  id=rs.getInt("Department_Id"); 
   }




                 String query = "select * from xx_designation_mapping where Designation_name='"+Desig+"' and Type='"+newdesig+"' and Department_id="+id; 
                 
                 ps3 = conn.prepareStatement(query);
					rs3 = ps3.executeQuery();
                    if(rs3.next())
                    {   
                    	out.println("<INPUT TYPE='HIDDEN' NAME='exist' ID='exist' value='true'>");
                        out.println("<font color=red>");
                        out.println("Designation  Already Exist");
                        out.println("</font>");
 
                    }else {
 
                       out.println("<font color=green>");
                      out.println(" Available");
                        out.println("</font>");
 
                    }
 
conn.close();
 
%>
