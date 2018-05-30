<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
	<br>
	<%
	String user = (String)session.getAttribute("user_name");
	String type22 = request.getParameter("ThmType");
	String no = request.getParameter("ThmNo");
	System.out.println("user="+user+type22);
	%>
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
					UPDATE xx_user_master SET Theme='<%=type22 %>' where User_name='<%=user %>'   
	</sql:update>
<%
		//pageContext.setAttribute("myTheme", type, PageContext.SESSION_SCOPE);
session.setAttribute("myTheme", type22);
			String buffer = "<b style='color:lightblue;'>Loading.... '"+type22+"' theme</b>";
				response.getWriter().println(buffer);
		%>

</body>
</html>