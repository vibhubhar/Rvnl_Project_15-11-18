<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
 
<%
 
           // String org1=request.getParameter("ver");


Connection conn = null;
Statement stmt = null;
ResultSet rs3 = null;
PreparedStatement ps3 = null;
 try {
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

conn = ds.getConnection();

String buffer="";
int flag=0;
buffer="<select name='Org_name' id='Org_name' style='width: 205px;' onchange='disableNewOrg(this.value);'> <option value='none'>-- Select Organization --</option>";

                 String query = "select * from xx_org_master order by Org_name"; 
                                 
                  ps3 = conn.prepareStatement(query);
                		 rs3 = ps3.executeQuery();
                		 
                		 while (rs3.next()) {
                	   String orgname = rs3.getString("Org_Name");
					buffer=buffer+ "<option value='"+orgname+ "'>"+orgname+"</option>";
						}	
                   flag=1;
                   buffer=buffer+"</select>";
               
                   if(flag==1){
       		        response.getWriter().println(buffer); 
       		        //System.out.println("Project Display- 2"+buffer);
       		           
       		       }else{
       		    	 buffer="<select name='Org_name' id='Org_name' style='width: 205px;' onchange='disableNewOrg(this.value);'> <option value='none'>-- Select Organization --</option></select>";
       		    	response.getWriter().println(buffer);

       		       }
 } catch(Exception e){
		
		e.printStackTrace();
	} finally {
	    try { rs3.close(); } catch (Exception e) { /* ignored */ }
	    try { ps3.close(); } catch (Exception e) { /* ignored */ }
	    try { conn.close(); } catch (Exception e) { /* ignored */ }
	}
//System.out.println("addorg"+buffer);
//rs3.close();
//ps3.close();
//conn.close();
 
%>
