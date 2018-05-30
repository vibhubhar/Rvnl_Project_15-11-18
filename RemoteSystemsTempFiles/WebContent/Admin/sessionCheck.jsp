<% 

int timeout1 = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout1 + "; URL = admn_login.jsp");

if(((String)session.getAttribute("user_name"))==null)
       {
           
	response.sendRedirect("admn_login.jsp");
           
       }%>