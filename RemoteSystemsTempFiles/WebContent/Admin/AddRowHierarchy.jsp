
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
	String zone = request.getParameter("zone");
	String docType = request.getParameter("docType");
	String level = request.getParameter("Level");
	System.out.println("ZZZZX" + zone + ":" + docType + ":" + level);
	int lev = Integer.parseInt(level);
	int xx_level = lev + 1;
	System.out.println(zone + "PI DEPT");
	String buffer = "";
	int flag = 0;
	Connection conn = null;
	PreparedStatement dep_ps=null;
	ResultSet dep_rs = null;
		
	try {

		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

		 conn = ds.getConnection();
		String dep_sql = "select * from xx_departments_master where type = 'MOR'";

		dep_ps = conn.prepareStatement(dep_sql);

		dep_rs = dep_ps.executeQuery();

		buffer = "<tr class='active'><td >"
				+ zone
				+ "</td><td >"
				+ docType
				+ "</td>"
				+ "<td ><select name='Department_name"
				+ xx_level
				+ "' id='Department_name"
				+ xx_level
				+ "' style='width: 200px;' onchange='DepDesgin_Update("
				+ xx_level
				+ ")'>"
				+ "<option value='none'>-- Select Department --</option>";
		while (dep_rs.next()) {
			String dept = dep_rs.getString("department_name");

			buffer += "<option value='" + dept + "'>" + dept
					+ "</option>";
		}

		buffer += "</select></td><td ><div id ='DesgDiv_RVNL"
				+ xx_level
				+ "' style='display: inline;'><select name='Designation' id='designation' style='width: 200px;'>"
				+ "<option value='-1'>-- Select Designation --</option></select></div></td><td id='LevelId"
				+ xx_level + "'>" + xx_level + "</td>"
				+ "<td><img id='AddImage" + xx_level
				+ "' src='images/Add.png' onclick='add_Hierarchy("
				+ xx_level + ",&quot;" + zone + "&quot;,&quot;"
				+ docType + "&quot;)' class='add-hierarchy'></td>"
				+ "<td><img id ='Remove" + xx_level
				+ "' src='images/Remove.png' onclick=''></td></tr>";

		response.getWriter().println(buffer);
	} catch (Exception e) {
		System.out.println(e);
	} finally {
	    try { dep_rs.close(); } catch (Exception e) { /* ignored */ }
	    try { dep_ps.close(); } catch (Exception e) { /* ignored */ }
	    try { conn.close(); } catch (Exception e) { /* ignored */ }
	}
%>
