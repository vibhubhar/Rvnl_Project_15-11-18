
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%
response.setHeader("Cache-control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", -1);

request.getSession().removeAttribute("user_name");
HttpSession session1=request.getSession();  
session1.invalidate();  
  

	response.sendRedirect("admn_login.jsp");
%>