<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page session="true"%>
<%@include file="included/NewHeader.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=session.getAttribute("user_name")%></title>

<link rel="shortcut icon" href="images/logo.jpg" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="CSS/mystyle.css">


</head>
<body>

	<div id="header">
		<table style="width: 100%">
			<tr>
				<td><h1 style="font-size: 300%;">&nbsp;&nbsp;&nbsp; Rail
						Vikas Nigam Limited Portal</h1></td>
				<td><img src="images/Rail-Vikas-Nigam-Limited-RVNL.jpg"></td>
		</table>
	</div>


	<%
	Connection con = null;
	ResultSet rs = null;

		try {

			String user_name = (String) session.getAttribute("user_name");

			String password = (String) session.getAttribute("password");
			//  Class.forName("com.mysql.jdbc.Driver");
			//   Connection con = DriverManager.getConnection("jdbc:mysql://10.15.75.44:3306/MySQL","root","root");

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

			 con = ds.getConnection();

			String sql = "select * from xx_user_master where User_name='"
					+ user_name + "' and password= '" + password + "'";
			Statement st = con.createStatement();
			 rs = st.executeQuery(sql);
			
			int pstatus = 0;

			if (rs.next()) {

				pstatus = rs.getInt("pstatus");

			}
			if (pstatus == 0) {
				response.sendRedirect("c_user.jsp");
			} else {
	%>
	<script type="text/javascript">
		alert("Username and Password does not match");
	</script>
	<%
		}
			//con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		    try { rs.close(); } catch (Exception e) { /* ignored */ }
		    try { con.close(); } catch (Exception e) { /* ignored */ }
		}
	
	%>
	<h1 align="left">
		<font style="color: red;">Welcome Page</font>:<%=(String) session.getAttribute("user_name")%>
</body>
</html>
