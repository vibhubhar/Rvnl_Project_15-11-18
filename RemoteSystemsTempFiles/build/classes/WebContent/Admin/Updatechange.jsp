
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@include file="included/NewHeader.jsp"%> --%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>

<script type="text/javascript">
window.onunload = refreshAndClose2;
function refreshAndClose2()
{
	window.open('javascript:location.reload(true);', 'c_document');
   if (window.opener && !window.opener.closed) 
    {
      window.opener.close();
     } 
}
function refreshAndClose()
{
    window.close();
   if (window.opener && !window.opener.closed) 
    {
      window.opener.close();
     } 
}
</script>
<title>Final Approval</title>

</head>
<body>
<%
String sqlQuery=null;
sqlQuery=request.getParameter("sqlQuery");
String id=null;
 id=request.getParameter("zoneName");
 String zone=null;
 zone=request.getParameter("zone");
 
 String  doc_id=null;
 doc_id=request.getParameter("doc_id");

 
 String division=null;
 division=request.getParameter("division");
 String division1=null;
 division1=request.getParameter("division1");
 String org=null;
 org=request.getParameter("Org");
 String org1=null;
 org1=request.getParameter("Org1");
 String piu=null;
 piu=request.getParameter("piu");
 String piu1=null;
 piu1=request.getParameter("piu1");
 String documents=null;
 documents=request.getParameter("documents");
 String documents1=null;
 documents1=request.getParameter("documents1");
 String Projects=null;
 Projects=request.getParameter("Projects");
 String Projects1=null;
 Projects1=request.getParameter("projects1");
 
 String dept=null;
 dept=request.getParameter("dept");
 String dept1=null;
 dept1=request.getParameter("dept1");
 String desg=null;
 desg=request.getParameter("desg");
 String desg1=null;
 desg1=request.getParameter("desg1");
 String type=null;
 type=request.getParameter("type");
 String Project_type=null;
 Project_type=request.getParameter("Project_type");
 
 %>
 
 
 <%if(division !=null) {%>
 
 
 <div class="alert alert-success" align="center">
				<strong>Success!</strong> Division has been Successfully Added  with Division Name <%=division %>.
				
			</div>
			<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
							 value="Close"
							onclick="javascript:window.close();return refreshAndClose();" /></div>
 <%} 
 else if(division1 !=null){%>
 
 <div class="alert alert-success" align="center">
			<strong>Success!</strong> division has been Successfully Modified  with division Name <%=division1 %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>
 
 
<%}
else if(desg !=null){%>
 
 <div class="alert alert-success" align="center">
			<strong>Success!</strong> Designation has been Successfully Added  with Designation Name <%=desg %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>
 
 
<%}
else if(desg1 !=null){%>

<div class="alert alert-success" align="center"> 
			<strong>Success!</strong> Designation has been Successfully Modified  with Designation Name <%=desg1 %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>


<%}
 else if(org !=null){%>
	 
	 <div class="alert alert-success" align="center">
				<strong>Success!</strong> Organization has been Successfully Added  with Orgn. Name: <%=org %>.
				
			</div>
			<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
							 value="Close"
							onclick="javascript:window.close();return refreshAndClose();" /></div>
	 
	 
 <%}
 else if(org1 !=null){%>
 
 <div class="alert alert-success" align="center">
			<strong>Success!</strong> Organization has been Successfully Modified  with Orgn. Name: <%=org1 %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>
 
 <%}
 else if(piu !=null){%>
	 
	 <div class="alert alert-success" align="center">
				<strong>Success!</strong> Piu has been Successfully Added  with PIU Name <%=piu %>.
				
			</div>
			<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
							 value="Close"
							onclick="javascript:window.close();return refreshAndClose();" /></div>
	 
	 
 <%}
 else if(piu1 !=null){%>
 
 <div class="alert alert-success" align="center">
			<strong>Success!</strong> Piu has been Successfully Modified  with PIU Name <%=piu1 %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>
 
 
 
<%}
 else if(dept!=null){%>
 
 <div class="alert alert-success" align="center">
			<strong>Success!</strong> Department has been Successfully Added  with Department Name <%=dept %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>
 
 
<%}
else if(dept1!=null){%>
 
 <div class="alert alert-success" align="center">
			<strong>Success!</strong> Department has been Successfully Modified  with Department Name <%=dept1 %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>
 
 
<%}
else if(doc_id!=null){%>
 
 <div class="alert alert-success" align="center">
			<strong>Success!</strong> Document has been Successfully Forwarded  with Document id <%=doc_id %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="window.open('javascript:location.reload(true);', 'c_document'); javascript:window.close(); return refreshAndClose();" /></div>
 
 
<%}

else if(documents !=null){%>
 
 <div class="alert alert-success" align="center">
			<strong>Success!</strong> 'Document Type' has been Successfully Added  with Document Type Name <%=documents %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>
 
 
<%}
else if(documents1 !=null){%>
 
 <div class="alert alert-success" align="center">
			<strong>Success!</strong> 'Document Type' has been Successfully Modified  with Document Type Name <%=documents1 %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>
 
 
<%}
else if(Projects !=null){%>
 
 <div class="alert alert-success" align="center">
			<strong>Success!</strong> Project Type has been Successfully Added  with Project Type Name <%=Projects %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>
 
 
<%}
else if(Projects1 !=null){%>

<div class="alert alert-success" align="center">
			<strong>Success!</strong> Project Type has been Successfully Modified  with Project Type Name <%=Projects1 %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>


<%}
else if(zone !=null){%>

<div class="alert alert-success" align="center">
			<strong>Success!</strong> Zone has been Successfully Modified  with Zone Name <%=zone %>.
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>


<%}
else if(Project_type !=null){%>

<div class="alert alert-success" align="center">
			<strong>Success!</strong> data Already exist. No changes possible !
			
		</div>
		<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
						 value="Close"
						onclick="javascript:window.close();return refreshAndClose();" /></div>


<%}

else {%>
 <div class="alert alert-success" align="center">
				<strong>Success!</strong> Zone has been Successfully Added  with Zone  Name <%=id %>.
				
			</div>
			<div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
							 value="Close"
							onclick="javascript:window.close();return refreshAndClose();" /></div>
<%}%>
</body>
</html>