<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%-- <jsp:include page="Divisions.jsp" flush="true" /> --%>
<%@ page autoFlush="true" buffer="1094kb"%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Create User</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script src="resources/JS/Approval_wf230.js"></script>
<script src="resources/JS/Headquarter.js"></script>
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
    
    function Orgchange(str1) {
    	var str = encodeURIComponent(str1);
    var xmlhttp;
    //var k=document.getElementById(element).value;
    var urls="Org_user_display.jsp?Org1="+str;

    if (window.XMLHttpRequest)
      {
      xmlhttp=new XMLHttpRequest();
      }
    else
      {
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    xmlhttp.onreadystatechange=function()
      {
      if (xmlhttp.readyState==4 || xmlhttp.readyState == "complete")
        {
            document.getElementById("Org_userDiv").innerHTML=xmlhttp.responseText;
           }
      }
    xmlhttp.open("GET",urls,true);
    xmlhttp.send();
    }
</script>
<style>.boxed {
  border: 1px solid black ;
}</style>
<body>

<form id='Forward' name='Forward'>
<INPUT TYPE="HIDDEN" NAME="Doc_Id" id="docid">
<INPUT TYPE="HIDDEN" NAME="Division1" id="division1">
<INPUT TYPE="HIDDEN" NAME="Department" id="department">
<INPUT TYPE="HIDDEN" NAME="Designation" id="designation">
<INPUT TYPE="HIDDEN" NAME="submited" id="submited">
<INPUT TYPE="HIDDEN" NAME="finalsubmited" id="finalsubmited">
<INPUT TYPE="HIDDEN" NAME="usern" id="usern">
<INPUT TYPE="HIDDEN" NAME="docdivision" id="docdivision">	
<INPUT TYPE="HIDDEN" NAME="touser" id="touser">
<INPUT TYPE="HIDDEN" NAME="action" id="action">
<INPUT TYPE="HIDDEN" NAME="approvalDate" id="approvalDate">
<INPUT TYPE="HIDDEN" NAME="remarks" id="remarks">


<%
String Doc_Id =request.getParameter("Doc_Id");
String Doc_no =request.getParameter("Doc_no");
String RequestedBy =request.getParameter("RequestedBy");
String usern =request.getParameter("usern");
String docdivision=request.getParameter("division");
String actiontaken=request.getParameter("action");
String approvaldate1=request.getParameter("approvalDate");
String remark = request.getParameter("remark");


String zone="";
String user = (String)session.getAttribute("user_name");

%>

<c:if test="${param.submited == null}">

<br><br><br><br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;
<INPUT TYPE="radio" NAME="forwardr" VALUE="1" checked />
Forward to other Organization (Other than Railway)
<br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Organization:
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="Org1" style='display:inline;' ><select name="Org_name" id="Org_name"  onchange="Orgchange(this.value);"
					style="width: 205px; margin-top:6px;">
						<option value="none">-- Select Organization --</option>
						<%
						Connection conn = null;
						Statement stmt = null;
						ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs12=null,rs13=null,rs14=null, rs25=null;
						PreparedStatement ps1 = null, ps3 = null,ps4=null,ps5=null,ps12=null,ps13=null,ps14=null, ps25=null;
						try {
							Context initCtx = new InitialContext();
							Context envCtx = (Context) initCtx.lookup("java:comp/env");
							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

							conn = ds.getConnection();

								String sql3 = "select * from xx_org_master order by Org_Name";
								ps25 = conn.prepareStatement(sql3);
								rs25 = ps25.executeQuery();

								while (rs25.next()) {
									String orgname = rs25.getString("Org_Name");
						%>
						<option value="<%=orgname%>"><%=orgname%></option>
						<%
							}
						}catch(Exception e){
							e.printStackTrace();
						}	finally {
						    try { conn.close(); } catch (Exception e) { /* ignored */ }
						}
						%>
				  </select></div><br><br>

        <div id="Org_userDiv" style='display:inline;' >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User:&nbsp;&nbsp;&nbsp;&nbsp;<select name="Org_user" id="Org_user" style="width: 205px; margin-left:80px; margin-top:6px;">
						<option value="none">-- Select User --</option></select></div><br>
					
				<br><br><br>
				<center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="ReSubmited_Org('<%=Doc_Id%>','<%=usern%>','1','<%=actiontaken%>','<%=approvaldate1%>')">Submit</button> 
				</center>
				</c:if>			
<c:if test="${param.submited == 'true'}">
				<%
				
				Date date =new SimpleDateFormat("dd/MM/yyyy").parse(approvaldate1);
				java.sql.Date approvaldate = new java.sql.Date(date.getTime());
				
				
				String touser =request.getParameter("touser");
				String Doc_Id1 =request.getParameter("Doc_Id");
				
				Connection conn1 = null;
				Statement stmt1 = null;
				ResultSet rs1x = null, rs11 = null, rs31 = null,rs41=null,rs51=null,rs121=null;
				PreparedStatement ps11 = null, ps31 = null,ps41=null,ps51=null,ps121=null;
				try {
					Context initCtx = new InitialContext();
					Context envCtx = (Context) initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
					conn1 = ds.getConnection();
							
					String sql2 = "select MAx(Level) from xx_approval_workflow where Document_id='"+Doc_Id1+"'";
					ps11 = conn1.prepareStatement(sql2);
					rs11 = ps11.executeQuery();
					rs11.next();
					int level=rs11.getInt(1);
					level=level+1;
					String sql7 = "select Added_byUser from xx_approval_workflow where Document_id='"+Doc_Id1+"'";
					PreparedStatement ps71 = conn1.prepareStatement(sql7);
					ResultSet rs71 = ps71.executeQuery();
					rs71.next();
					String added_by=rs71.getString(1);
					
					  Statement insertStmt=(Statement) conn1.createStatement();
			        	String	insertStg ="insert into xx_approval_workflow (Document_id,Added_byUser,division_hierarchy_id,Assigned_To,Action,level,CurrentDate) Values ("+Doc_Id1+",'"+added_by+"',"+0+",'"+touser+"','N',"+level+",'"+approvaldate+"')";
			        		insertStmt.executeUpdate(insertStg);
			        		
			        		
			        		
			       
			       
			       %>
			        <sql:update dataSource="jdbc/MySQLDB" var="rs">
       update xx_approval_workflow set action ='Y' where document_id =<%=Doc_Id1%> and level ='<%=level-1%>'
     </sql:update>		
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
	update xx_record_actions set ActionPerformed='Forwarded to Others',Information='<%=remark%>', ActionedOn='<%=approvaldate%>',Real_ActionDate=now() where Document_id='<%=Doc_Id1%>' and ActionPerformedBy='<%=usern%>' and ActionPerformed='pending' 
	
</sql:update>		
<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Real_ActionDate) Values ('<%=Doc_Id1%>','<%=approvaldate%>','pending','<%=touser%>', now())
</sql:update>

<sql:update dataSource="jdbc/MySQLDB" var="rs">
update xx_moreammendments set status ='return', action_performedBy='<%=usern %>', action_to='<%=touser %>', information='Forwarded to Others' where document_id =<%=Doc_Id1%>
</sql:update>
<%  

			       conn1.close();
					
					}catch(Exception e){
				e.printStackTrace();
			} finally {
			    try { conn1.close(); } catch (Exception e) { /* ignored */ }
			}
			%>
<script>
document.Forward.submited.value = "false11";
document.getElementById("Forward").submit();
</script>		
				</c:if>	
				<c:if test="${param.submited == 'false11'}">
					<div class="alert alert-success" align="center">
        <strong>Success!</strong> Document has been forwarded.
        
        <div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
							 value="Close"
							onclick="javascript:window.close();return refreshAndClose();" /></div>
        
      </div>	
	
				</c:if>	
		<div id="dialogid" style="display: none"
								align="center">
								<br> Please Fill All Data<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');">Ok</button>
							</div>
</form>

</body>
</html>