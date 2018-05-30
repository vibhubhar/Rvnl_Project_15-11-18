<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<jsp:include page="Divisions.jsp" flush="true" />
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
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script src="resources/JS/Approval_wf230.js"></script>
<script src="resources/JS/Headquarter.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

$("input[name$='forwardr']").click(function() {
        var test = $(this).val();

        $("div.desc").hide();
        $("#Fwd"+test).show();
    });
});
</script>
<script type="text/javascript">
    window.onunload = refreshParent;
    function refreshParent() {
        window.opener.location.reload();
    }
</script>
<body>
<br><br><br>
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


<%
String Doc_Id =request.getParameter("Doc_Id");
String Doc_no =request.getParameter("Doc_no");
String RequestedBy =request.getParameter("RequestedBy");
String usern =request.getParameter("usern");
String docdivision=request.getParameter("division");
String actiontaken=request.getParameter("action");
String approvaldate1=request.getParameter("approvalDate");
String remarkdiv = request.getParameter("remarkdiv");
String remarkzon = request.getParameter("remarkzon");
System.out.println("Approvaldate ="+approvaldate1);




String zone="";
String user = (String)session.getAttribute("user_name");

System.out.println("Docid="+Doc_Id+" Docno="+Doc_no+" RequestedBy="+RequestedBy+" usern="+usern+" docdivision="+docdivision+"action="+actiontaken);
%>

<c:if test="${param.submited != 'true'}">

<!-- &nbsp;&nbsp;&nbsp;<INPUT TYPE="radio" NAME="forwardr" VALUE="3" checked="checked" />
Zonal Headquarter-->
&nbsp;&nbsp;&nbsp;&nbsp;
<INPUT TYPE="radio" NAME="forwardr" VALUE="1" checked />
Intra Division
&nbsp;&nbsp;&nbsp;&nbsp;
<INPUT TYPE="radio" NAME="forwardr" VALUE="2"/>
Intra Zone
&nbsp;&nbsp;&nbsp;&nbsp;
<!-- <INPUT TYPE="radio" NAME="forwardr" VALUE="4"/>
Final Approval -->
<div id="Fwd1" class="desc" >
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs12=null;
PreparedStatement ps1 = null, ps3 = null,ps4=null,ps5=null,ps12=null;
try {
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn = ds.getConnection();
						%>
						
						
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Division:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=docdivision %>
					<br>	
					<br>	
					<div style='vertical-align: baseline; padding: 10px; margin: 20px;'>	   
<%
					String divisionid=null,userid=null,usrids=null; 
					String div_sql1 = "select division_id from xx_divisions_master where division_name='"+docdivision+"'";
					PreparedStatement divPS1 = conn.prepareStatement(div_sql1);
					
					
					ResultSet divRS1 = divPS1.executeQuery();
					if (divRS1.next()){
						divisionid=divRS1.getString("division_id");
					
					
					}
					
					userid="select * from xx_user_master where Type='MOR' and Division_ID="+divisionid;
					PreparedStatement divPS2 = conn.prepareStatement(userid);
					ResultSet divRS2 = divPS2.executeQuery();
					
					
					while (divRS2.next()){
					usrids=divRS2.getString("User_name");
						
					%>
					
					<input TYPE=radio name=userid VALUE='<%=usrids%>' > <%=usrids%> <BR>
					
					<%						
					}
					
					
					
					%>
					</div>
									<br /> <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Forward with Remarks</b>
					<br>
					<br>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="remarkdiv" id="remarkdiv" maxlength="500" rows="10" cols="50" name="comment" placeholder="Enter Remarks"></textarea>
				<br>
				<br>
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="Submit('<%=Doc_Id%>','<%=usern%>','1','<%=actiontaken%>','<%=approvaldate1%>')">Submit</button> 
				
				</div>
					<!-- </div> -->
						
	<div id="Fwd2" class="desc" style='display:none;'>
	<br>
	<%
	
	String zone_id=null;
	String div_sql = "select division_id from xx_divisions_master where xx_divisions_master.division_name='"+docdivision+"'";
	PreparedStatement divPS = conn.prepareStatement(div_sql);
	
	
	ResultSet divRS = divPS.executeQuery();
	while(divRS.next()){
		
		String zonid_sql = "select Ext_Zone_Id from xx_divisions_map where Division_Id='"+divRS.getString("division_id")+"'";
		PreparedStatement zonidPS = conn.prepareStatement(zonid_sql);
		
		
		ResultSet zonidRS = zonidPS.executeQuery();
		while(zonidRS.next()){
			zone_id=zonidRS.getString("Ext_Zone_Id");
			String zon_sql = "select Zone_Name from xx_zones_master where Zone_Id='"+zonidRS.getString("Ext_Zone_Id")+"'";
			PreparedStatement zonPS = conn.prepareStatement(zon_sql);
			ResultSet zonRS = zonPS.executeQuery();
			while(zonRS.next()){
			zone=zonRS.getString("Zone_Name");
			
			}
		
		}
		
	}
	
	%>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=zone %>
	
	<br>
	<br>
	<div style='vertical-align: baseline; padding: 10px; margin: 20px;'>	   
					<%
					
					String zone_sql2="select * from xx_user_master where Zone_ID='"+zone_id+"' and Division_Id= 86";
					PreparedStatement zonPS1 = conn.prepareStatement(zone_sql2);
					ResultSet zonRS1 = zonPS1.executeQuery();
					String userid1=null;
					while(zonRS1.next()){
						
						userid1=zonRS1.getString("User_name");
						
						%>
						
						<input TYPE=radio name=userid VALUE='<%=userid1%>'> <%=userid1%> <BR>
						<%
					
					}
					
					%>		   
		
		
		</div>				<br /> <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>forward with Remarks</b>
					<br>
					<br>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="remarkzon" id="remarkzon" maxlength="500" rows="10" cols="50" name="comment" placeholder="Enter Remarks"></textarea>
				
				<br /> <br />
				<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="Submit('<%=Doc_Id%>','<%=usern%>','9','<%=actiontaken%>','<%=approvaldate1%>')">Submit</button>
	</div>					
	
						
<div id="Fwd3" class="desc" style='display:none;'>
<%
%>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select name=zones id="zones" style="width: 205px">
	<option value="none">-- Select Zone --</option>
<%
String querypkg="select Package_ID from xx_document_mapping where xx_document_mapping.Document_Map_ID = '"+Doc_Id+"'";
PreparedStatement ps=conn.prepareStatement(querypkg);
ResultSet rspkg=ps.executeQuery();
rspkg.next();
String pkgid=rspkg.getString("Package_ID");
String queryzonid="select distinct zone_id from xx_project_division_map where Package_ID='"+pkgid+"'";
PreparedStatement pszon=conn.prepareStatement(queryzonid);
ResultSet rszon=pszon.executeQuery();
while(rszon.next()){
String zoned =rszon.getString("zone_id");
String queryzonename="select Zone_Name from xx_zones_master where zone_id='"+zoned+"'";
PreparedStatement pszonename=conn.prepareStatement(queryzonename);
ResultSet rszonename=pszonename.executeQuery();
while (rszonename.next()){
String namez=rszonename.getString("Zone_Name");
%>
<option value="zoned"><%=namez %></option>
<%
}
}
 }catch(Exception e){
						e.printStackTrace();
					}	finally {
					    try { conn.close(); } catch (Exception e) { /* ignored */ }
					}
%>
</select>
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="zonalhq('<%=Doc_Id%>','<%=usern%>')">Submit</button>
</div>						
						
						
						<div id="Fwd4" class="desc" style='display:none;'>
						<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="finalapproval('<%=Doc_Id%>','<%=user%>')">Approved</button>
						</div>
			</c:if>		
			
			
			
			
			
			
			
				
				<c:if test="${param.submited == 'true'}">
				<%
				
				System.out.println("My date input='"+approvaldate1+"'");
				Date date =new SimpleDateFormat("dd/MM/yyyy").parse(approvaldate1);
				java.sql.Date approvaldate = new java.sql.Date(date.getTime());
				System.out.println("ssst"+approvaldate);
				
				// approvaldate=approvaldate+" "+"12:00:00";
				
				String touser =request.getParameter("touser");
				String Doc_Id1 =request.getParameter("Doc_Id");
				String remark=null;
				/*String Division =request.getParameter("Division1");
				String Department =request.getParameter("Department");
				String Designation =request.getParameter("Designation");*/
				System.out.println("to user="+touser+" doc_id="+Doc_Id1+"remarkdiv='"+remarkdiv+"'"+"remarkzon='"+remarkzon);
				if(remarkdiv.equalsIgnoreCase("")){
					remark=remarkzon;
					
				}else{	
					remark=remarkdiv;
				}
				Connection conn1 = null;
				Statement stmt1 = null;
				ResultSet rs1x = null, rs11 = null, rs31 = null,rs41=null,rs51=null,rs121=null;
				PreparedStatement ps11 = null, ps31 = null,ps41=null,ps51=null,ps121=null;
				try {
					Context initCtx = new InitialContext();
					Context envCtx = (Context) initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
					conn1 = ds.getConnection();
							/* String sql1="select division_id from xx_divisions_master where division_name='"+Division+"'";	
							System.out.println(sql1);
							ps31 = conn1.prepareStatement(sql1);
							rs31 = ps31.executeQuery();
							rs31.next();
							String division_id = rs31.getString("division_id");
							
							String sql5="select Department_Id from xx_departments_master where Department_Name='"+Department+"'";	
							ps51 = conn1.prepareStatement(sql5);
							rs51 = ps51.executeQuery();
							rs51.next();
							String Department_Id = rs5.getString("Department_Id");
							System.out.println("---=----==--"+Department_Id);
							String sql6="select Designation_Id from xx_designation_master where Designation_Name='"+Designation+"'";	
							ps41 = conn1.prepareStatement(sql6);
							rs41 = ps41.executeQuery();
							rs41.next();
							String Designation_Id = rs41.getString("Designation_Id");
							System.out.println("---=----==--"+Designation_Id);
					String sql3 = "select User_name from xx_user_master where Division_ID='"+division_id+"' and Department_id='"+Department_Id+"' and Designation_Id='"+Designation_Id+"'";
					ps31 = conn1.prepareStatement(sql3);
					rs31 = ps31.executeQuery();
					rs31.next();
					
					*/
					//String username = rs31.getString("User_name");
					//System.out.println("username="+username+"=division="+Division+"=dept="+Department+"=designation="+Designation);
					//System.out.println("query="+sql3);
					//String username =
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
			        		
			        		
			        		System.out.println("Action taken log="+actiontaken);
			       
			       
			       %>
			        <sql:update dataSource="jdbc/MySQLDB" var="rs">
       update xx_approval_workflow set action ='Y' where document_id =<%=Doc_Id1%> and level ='<%=level-1%>'
     </sql:update>		
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
	update xx_record_actions set ActionPerformed='<%=actiontaken %>',Information='<%=remark%>', ActionedOn='<%=approvaldate%>',Real_ActionDate=now() where Document_id='<%=Doc_Id1%>' and ActionPerformedBy='<%=usern%>' and ActionPerformed='pending'
	
</sql:update>		
<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Real_ActionDate) Values ('<%=Doc_Id1%>','<%=approvaldate%>','pending','<%=touser%>', now())
</sql:update>
<div class="alert alert-success" align="center">
        <strong>Success!</strong> Document has been forwarded.asdsssssssssss
        <div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
							 value="Close"
							onclick="javascript:window.close();opener.window.focus();" /></div>
        
        
        
      </div><%  

					
					} catch(Exception e){
				e.printStackTrace();
			} finally {
			    try { conn1.close(); } catch (Exception e) { /* ignored */ }
			}
			%>
		
				</c:if>	
				<c:if test="${param.finalsubmited == 'xyz'}">
				<%
			String touser =request.getParameter("touser");
				String Doc_Id1 =request.getParameter("Doc_Id");
				/*String Division =request.getParameter("Division1");
				String Department =request.getParameter("Department");
				String Designation =request.getParameter("Designation");*/
				System.out.println("to user="+touser+" doc_id="+Doc_Id1);
			
				int level=0;
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
				level=rs11.getInt(1);
				}catch(Exception e){
					e.printStackTrace();
				} finally {
				    try { conn1.close(); } catch (Exception e) { /* ignored */ }
				}
				 %>
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			update xx_record_actions set ActionPerformed='Final Approved',Information='<%=remarkdiv%>',Real_ActionDate=now() where Document_id='<%=Doc_Id1%>' and ActionPerformedBy='<%=usern%>' and ActionPerformed='pending'
			
		</sql:update>
		 <sql:update dataSource="jdbc/MySQLDB" var="rs">
       update xx_approval_workflow set action ='Y' where document_id =<%=Doc_Id1%> and level ='<%=level%>'
     </sql:update>		
			
						
				</c:if>

</form>

</body>
</html>