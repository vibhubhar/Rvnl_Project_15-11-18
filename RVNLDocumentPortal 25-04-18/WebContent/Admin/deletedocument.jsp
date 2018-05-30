<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@include file="included/NewHeader.jsp"%>
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
    function userdeletedoc(id){
    	
    	 document.CreateProject1.Project_stage1.value = id;
			document.getElementById("CreateProject1").submit();
   
    }
    
</script>


</head>
<body>
<c:if test="${param.Project_stage1 == null}">

<%
String document_id =request.getParameter("document_id");
String packageid =request.getParameter("packageid");
%>

<form name="CreateProject1" id="CreateProject1" method="post" style="margin-left:40px;" >
<INPUT TYPE="HIDDEN" NAME="Project_stage1" id="Project_stage1">
<INPUT TYPE="HIDDEN" NAME="document_id" id="document_id" value="<%=document_id%>">

                <center> <div class="alert alert-success" align="center" style="margin-top:100px; width:400px;">
	 <strong>Success!</strong> Are you sure you want to delete this document !.
	 <br> <br>
	 <input class='btn btn-primary' value='OK'  onClick="userdeletedoc(<%=document_id %>)" type='button'/>&nbsp;&nbsp;&nbsp;<input class='btn btn-primary' value='Cancel'  onClick="refreshAndClose()" type='button'/>
	 </div></center>
</form>	
</c:if>

<c:if test="${param.Project_stage1 != null}">
<%

Connection  conn = null;
try {
	
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	 conn = ds.getConnection();
	
	String document_id1 =request.getParameter("document_id");
	


%>
  <sql:update dataSource="jdbc/MySQLDB" var="rs">
  
DELETE from xx_document_mapping where Document_Map_ID ='<%=document_id1 %>';
 
  </sql:update>  
  <sql:update dataSource="jdbc/MySQLDB" var="rs">
  
DELETE from xx_doc_divisions_hierarchy where Document_id ='<%=document_id1 %>';
 
  </sql:update>  
  <sql:update dataSource="jdbc/MySQLDB" var="rs">
  
DELETE from xx_doc_zones_hierarchy where Document_id ='<%=document_id1 %>';
 
  </sql:update>  
   <center><div class="alert alert-success" align="center" style="margin-top:100px; width:400px;">
	<strong>Success!</strong> Document Deleted Successfully !.
	 <br> <br>
	 <input class='btn btn-primary' value='OK'  onClick="refreshAndClose()" type='button'/>
	 </div></center>
  
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