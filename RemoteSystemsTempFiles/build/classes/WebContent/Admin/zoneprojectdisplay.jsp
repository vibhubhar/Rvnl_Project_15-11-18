<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="resources/JS/Reports230.js"></script>
<title>Insert title here</title>
</head>
<body>
	<br>
	<%
		String piu = request.getParameter("PIU_of_RVNL");
		String Zone = request.getParameter("Zone");
String zoneid=null;
		String buffer = "";
		int flag = 0;
		Connection conn = null;
		try {
			String sql11_1 = null, sql11_2 = null;
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
			String division = null;
			conn = ds.getConnection();
			ResultSet rs = null, rs1 = null, rs31_1 = null, rs4 = null, rs5 = null, rs6 = null, rs13 = null, rs3 = null, rs5_1 = null;
			PreparedStatement ps1 = null, ps2 = null, ps31_1 = null, ps4 = null, ps5 = null, ps6 = null, ps3 = null, ps14 = null, ps5_1 = null;
			System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaazzzzzzzzzzzzzzzzzzzzzzzzz====="+ Zone + piu);
			buffer = "<div id ='project_select' style='display: inline;' font color:grey;><font color='grey'><b></b><select name='project' id='project' style='width: 192px;margin: 22px 0px 0px 11px;' onchange='showprojectss(this.value);'><option value=''>&nbsp;&nbsp;&nbsp;--Select PIU-- </option>";
			
			String sql3 = "select Zone_Id from xx_zones_master where Zone_Name='"+piu+"'";
			System.out.println("outputting quey for testinng------"+sql3);
			ps31_1 = conn.prepareStatement(sql3);
			rs31_1 = ps31_1.executeQuery();
			while(rs31_1.next())
			{
				zoneid=rs31_1.getString("Zone_Id");
				
			}

			
			String piuid1 = null,piuname=null;
		
				
				if(!zoneid.equalsIgnoreCase("18")){
			
				 sql3 = "select Distinct Piu_Id from xx_user_zone_mapping where Zone_Id="+zoneid;
				ps3 = conn.prepareStatement(sql3);
				rs3 = ps3.executeQuery();

				while (rs3.next()) {
					piuid1 = rs3.getString("Piu_Id");
					String sql31= "select * from xx_piu_master where piu_id="+piuid1 ;
					PreparedStatement ps31 = conn.prepareStatement(sql31);
					ResultSet rs31 = ps31.executeQuery();

					while (rs31.next()) {
						piuname=rs31.getString("PIU_Name");
						flag=1;
							       
						    	  buffer=buffer+"<option value='"+piuname+"'>"+piuname+"</option>";
								
						
					}
	
		}
				}else{
					String sql31_1= "select * from xx_piu_master order by PIU_Name";
					PreparedStatement ps311_1 = conn.prepareStatement(sql31_1);
					ResultSet rs311_1 = ps311_1.executeQuery();

					while (rs311_1.next()) {
						piuname=rs311_1.getString("PIU_Name");
						
	      		flag=1;
	       
	    	  buffer=buffer+"<option value='"+piuname+"'>"+piuname+"</option>";
						
					}
				}
				conn.close();
				}	
				
			 catch (Exception e) {
				e.printStackTrace();
			}


			

			buffer = buffer + "</select></div>";
			System.out.println("FLAG=" + flag);
			System.out.println("buffer=" + buffer);
			if (flag == 1) {
				response.getWriter().println(buffer);
			} else {
				//buffer=<!--"<div id ='project' style='display: inline;'><select name='projects' id='projects' style='width: 205px' color=''><option value='-1'>Select Project</option></div>-->";
				response.getWriter().println(buffer);
			}
			    try { conn.close(); } catch (Exception e) { /* ignored */ }
	%>

</body>
</html>