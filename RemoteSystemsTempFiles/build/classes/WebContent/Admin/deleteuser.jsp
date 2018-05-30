<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.io.*,java.util.*,javax.script.*,java.nio.file.*,java.nio.charset.*,java.text.DateFormat" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import ="java.text.SimpleDateFormat"%>
 <%@ page import ="java.util.Date"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
 <%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="resources/JS/validateSysAdmin230.js"></script>
<!--  <link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" /> -->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RVNL Document Portal </title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">    
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<script type="text/javascript">
    function refreshAndClose() {
        window.opener.location.reload(true);
        window.close();
    }
    function userdelete(id){
    	
    	 document.CreateProject11.Project_stage11.value = id;
			document.getElementById("CreateProject11").submit();
   
    }
    
</script>


</head>
<body>


<%
String str1=request.getParameter("Project_stage11");

String username =request.getParameter("usern");
String updatedusername="'";
updatedusername=updatedusername+username.replaceAll("~","/")+"'";
%>

<form name="CreateProject11" id="CreateProject11" method="post" style="margin-left:40px;" >
<INPUT TYPE="HIDDEN" NAME="Project_stage11" id="Project_stage11">
<INPUT TYPE="HIDDEN" NAME="username" id="username" value='<%=username%>'>
<c:if test="${param.Project_stage11 == null}">
                 <div class="alert alert-success"  style="margin-top: 100px; width:400px;">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Success!</strong> Are you sure you want to delete this user !
	 <br>
	 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	 <input class="btn btn-primary" value="ok"  onClick="userdelete(<%=updatedusername %>)" type="button"/>&nbsp;&nbsp;&nbsp;<input class="btn btn-primary" value="Cancel"  onClick="refreshAndClose()" type="button"/>
	 </div>
</c:if>
</form>	


<c:if test="${param.Project_stage11 != null}">
<%

Connection  conn = null;
try {
	
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn = ds.getConnection();
	
	String username1 =request.getParameter("username");
	username1=username1.replace("~","/" );
	//String str1=request.getParameter("Project_stage11");
	System.out.println("printing here-----------str-----"+str1);


%>
  <sql:update dataSource="jdbc/MySQLDB" var="rs">
  
DELETE from xx_user_master where User_name='<%=username1 %>';
 
  </sql:update>  
   <div class="alert alert-success"  style="margin-top: 100px; margin-left: 50px; width:400px;">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Success!</strong> User Deleted Successfully !.
	 <br>
	 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	 &nbsp;&nbsp;&nbsp;<input class='btn btn-primary' value='Ok'  onClick="refreshAndClose()" type='button'/>
	 </div>
  
<%

}
catch(Exception e){
	e.printStackTrace();
} finally {
    try { conn.close(); } catch (Exception e) { /* ignored */ }
}
%>	
</c:if>
</body>
</html>