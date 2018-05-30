<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<script src="resources/JS/Approval_wf230.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">

function refreshAndClose()
{
    window.close();
    if (window.opener && !window.opener.closed) 
    {
      window.opener.location.reload();
    }
}
</script>
<script type="text/javascript">
    window.onunload = refreshParent;
    function refreshParent() {
        window.opener.location.reload();
    }
</script>
</head>
<body>
<%
String user = (String)session.getAttribute("user_name");

%>
<form id='return_pop' name='return_pop'  method="post">
<INPUT TYPE="HIDDEN" NAME="submited" id="submited">

<c:if test="${param.submited == null}">

<%
String fromuser=null;
	String action=request.getParameter("action");
	if(action.equalsIgnoreCase("returned")){	
		//String Document_id=request.getParameter("doc_id");
		//String requested_by=request.getParameter("requested_by");
		String docno=request.getParameter("doc_no");
		//String division=request.getParameter("Division");
		//String Clevel=request.getParameter("C_Level");
		String remark = request.getParameter("remark");
		String approvaldate=request.getParameter("approvalDate");

		
		String doc_id = request.getParameter("Doc_Id");
		 fromuser = request.getParameter("usern");
		String requested_by = request.getParameter("RequestedBy");
		//String docno1 = request.getParameter("doc_no");
		Date date =new SimpleDateFormat("dd/MM/yyyy").parse(approvaldate);
		java.sql.Date approvaldate2 = new java.sql.Date(date.getTime());
		System.out.println("users..."+fromuser+"too.."+requested_by+approvaldate2);
		//docno = request.getParameter("doc_no");
		
		//requested_by = request.getParameter("requested_by");
		%>
		
		<sql:update dataSource="jdbc/MySQLDB" var="rs">
  update xx_approval_workflow set action ='Y' where document_id =<%=doc_id%> 
</sql:update>
<sql:update dataSource="jdbc/MySQLDB" var="rs">
			update xx_record_actions set ActionPerformed='Returned to RVNL with approval',Information='---',ActionedOn='<%=approvaldate2%>',Real_ActionDate=now() where Document_id='<%=doc_id%>' and ActionPerformedBy='<%=fromuser%>' and ActionPerformed='pending'
			
		</sql:update>
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Real_ActionDate) Values ('<%=doc_id%>','<%=approvaldate2%>','pending','<%=requested_by%>',now())
</sql:update>	
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
	update xx_moreammendments set status ='return', action_performedBy='<%=fromuser%>', action_To='<%=requested_by%>', Information='Approved by Others' where document_id =<%=doc_id%>
	</sql:update>
	<%
}
	%>
<script>
document.return_pop.submited.value = '<%= fromuser %>';
document.getElementById("return_pop").submit();
</script>
</c:if>

<c:if test="${param.submited != null}">
<%
String fromuser1 = request.getParameter("submited");
%>
<div class="alert alert-success" align="center">
					    <strong> Document has been approved by User: '<%= fromuser1 %>' of Other Organization.</strong>
					    <div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
							 value="Close"
							onclick="javascript:window.close();return refreshAndClose()" /></div>
	</div>
	</c:if>
</form>

</body>
</html>