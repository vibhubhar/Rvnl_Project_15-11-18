<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
 
<%
 
            String depart=request.getParameter("ver");

String depart1=request.getParameter("param5");


Connection conn = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs12=null,rs13=null,rs14=null;
PreparedStatement ps1 = null, ps3 = null;
 
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

conn = ds.getConnection();
 if(depart1!="null"){

                 String query = "select * from xx_departments_master where Department_Name="+depart+"' and Type='"+depart1+"'"; 
               
                 ps3 = conn.prepareStatement(query);
					rs3 = ps3.executeQuery();
                    if(rs3.next())
                    {   
                    	out.println("<INPUT TYPE='HIDDEN' NAME='exist' ID='exist' value='true'>");
                        out.println("<font color=red>");
                        out.println("Department already Exist");
                        out.println("</font>");
 
                    }else {
 
                       out.println("<font color=green>");
                      out.println(" Available");
                        out.println("</font>");
 
                    }
 } else{
	 String query1 = "select * from xx_documentattributes_master where Document_Type="+depart+"'"; 
     
     ps1 = conn.prepareStatement(query1);
		rs1 = ps1.executeQuery();
        if(rs1.next())
        {   
        	out.println("<INPUT TYPE='HIDDEN' NAME='exist' ID='exist' value='true'>");
            out.println("<font color=red>");
            out.println("Department Already Exist");
            out.println("</font>");

        }else {

           out.println("<font color=green>");
          out.println(" Available");
            out.println("</font>");

        }
	 
	 
	 
 //}
 

}
conn.close();

%>
