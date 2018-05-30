<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
 
<%
 
     String org1=request.getParameter("Org1");


Connection conn = null;
///Statement stmt = null;
ResultSet rs = null, rs1 = null;
PreparedStatement ps = null, ps1 = null;
 
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

conn = ds.getConnection();

String buffer="";
int flag=0;
buffer="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User:&nbsp;&nbsp;&nbsp;&nbsp;<select name='Org_user' id='Org_user' style='width: 205px;  margin-left:80px; margin-top:6px;'> <option value='none'>-- Select User --</option>";

                 String query = "select * from xx_org_master where Org_name='"+org1+"'"; 
                 
                 ps = conn.prepareStatement(query);
					rs = ps.executeQuery();
					 String orgid=null;
                   if (rs.next()) {
                	   orgid = rs.getString("Org_Id");
                   }
                   String query1 = "select * from xx_user_master where Org_Id="+orgid; 
                   
                   ps1 = conn.prepareStatement(query1);
  					rs1 = ps1.executeQuery();
                     while (rs1.next()) {
                  	   String user1 = rs1.getString("User_name");
                       
					buffer=buffer+ "<option value='"+user1+ "'>"+user1+"</option>";
                   }
                   flag=1;
                   buffer=buffer+"</select>";
               
                   if(flag==1){
       		        response.getWriter().println(buffer); 
       		        //System.out.println("Project Display- 2"+buffer);
       		           
       		       }else{
       		    	 buffer="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User:&nbsp;&nbsp;&nbsp;&nbsp;<select name='Org_user' id='Org_user' style='width: 205px;  margin-left:80px; margin-top:6px;' > <option value='none'>-- Select User --</option></select>";
       		    	response.getWriter().println(buffer);

       		       }
//System.out.println("addorg"+buffer);
rs1.close();
ps1.close();
rs.close();
ps.close();
conn.close();
 
%>
