
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Designation</title>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
</head>
<body>

</body>
</html>

<%
	String dept = request.getParameter("Dept");

	String piu = request.getParameter("PIU");
	int  i = Integer.parseInt(request.getParameter("Index"));
	
	String s="DesgDiv_RVNL"+i;
	
	String buffer = "";
	int flag = 0;
	if(!dept.equalsIgnoreCase("none")){
	try {

		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

		Connection conn = ds.getConnection();
		
		String depts = "Select Department_Id from xx_departments_master where Department_Name='"
				+ dept + "' and TYPE='RVNL'";

		PreparedStatement ps4 = conn.prepareStatement(depts);
		// ps3.setString(1, piu);
		ResultSet rsl = ps4.executeQuery();
		rsl.next();
		String depatment_id = rsl.getString(1);

		String sql = "select Designation_name from xx_designation_mapping where Department_id='"
				+ depatment_id + "'";
		PreparedStatement ps3 = conn.prepareStatement(sql);
		//ps3.setString(1, dept);
		// ps3.setString(1, piu);
		ResultSet rs = ps3.executeQuery();

		String Desg_name = "";
		
		buffer = "<div id ='"+s+"' style='display: inline;'><select name='designation_RVNL"+i+"' id='designation_RVNL"+i+"' style='width: 205px'><option value='-1'>-- Select Designation --</option></div>";
		//   String xx = "tyghj;gvfg;gfgf";
		String buffer2 = "";

		while (rs.next()) {

			String designation_name = rs.getString("designation_name");
			Desg_name = Desg_name + ";" + designation_name;
			System.out.println(Desg_name);
			/*if(designation_name.equalsIgnoreCase("null")) {
			 buffer2=buffer+"<option value='CPM'>CPM</option></select>";  
			 System.out.println(buffer2);
			}*/

			if (!Desg_name.equalsIgnoreCase("null")) {
				flag = 1;
			}
			buffer = buffer + "<option value='" + designation_name
					+ "'>" + designation_name + "</option>";
		}
		// session.setAttribute("designation_name", Desg_name);
		buffer = buffer + "</select><br><br>";
		
		if (flag == 1) {
			response.getWriter().println(buffer);
		} else {
			//buffer=buffer+"<option value='CPM'>CPM</option></select>";
			buffer = "<div id ='DesgDiv_RVNL' style='display: inline;'><select name='designation"+i+"' id='designation"+i+"' style='width: 205px'><option value='CPM'>CPM</option></div>";
			response.getWriter().println(buffer);
		}
		
		
		
		conn.close();
	} catch (Exception e) {
		System.out.println(e);
	}
	}
	else{
		buffer = "<div id ='DesgDiv_RVNL' style='display: inline;'><select name='designation"+i+"' id='designation"+i+"' style='width: 205px'><option value=''>--select designation--</option></div>";
		response.getWriter().println(buffer);	
		
		
	}
%>
