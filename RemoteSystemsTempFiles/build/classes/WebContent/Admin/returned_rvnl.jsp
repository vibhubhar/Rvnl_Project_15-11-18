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
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.internet.*" %>

<%@ page import="java.net.URL.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder.*" %>
<%@ page import="java.io.InputStreamReader.*" %>
<%@ page import="java.net.URLConnection.*"%>
<%@ page import="java.io.InputStreamReader.*" %>
<%@ page import="java.io.OutputStreamWriter.*" %>
<%@page import="java.net.HttpURLConnection"%>

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

$(document).ready(function(){

$("input[name$='forwardr']").click(function() {
        var test = $(this).val();

        $("div.desc").hide();
        $("#Fwd"+test).show();
    });
});
</script>
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

<c:if test="${param.submited == null }">

<!-- &nbsp;&nbsp;&nbsp;<INPUT TYPE="radio" NAME="forwardr" VALUE="3" checked="checked" />
Zonal Headquarter-->
&nbsp;&nbsp;&nbsp;&nbsp;
<INPUT TYPE="radio" NAME="forwardr" VALUE="1" checked />
Resubmit
&nbsp;&nbsp;&nbsp;&nbsp;
<!-- <INPUT TYPE="radio" NAME="forwardr" VALUE="2"/> 
Intra Zone-->
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

String hierarchyidq="select HierarchyType,Zone_HierarchyId,Division_HierarchyId from xx_document_mapping where Document_Map_ID="+Doc_Id;
PreparedStatement divPShier = conn.prepareStatement(hierarchyidq);
ResultSet divRShier = divPShier.executeQuery();
String ZoneHierarchyid=null,DivisionHierarchyid=null,userlist=null;
if (divRShier.next()){
%>
<div class="boxed" style="18px 0px 27px 22px;margin-left: 19px;margin-top: 10px;">
<%

if(divRShier.getString("HierarchyType").equalsIgnoreCase("Both")){
ZoneHierarchyid=divRShier.getString("Zone_HierarchyId");
DivisionHierarchyid=divRShier.getString("Division_HierarchyId");
String sqlq2 ="select * from xx_doc_divisions_hierarchy where userid!='"+user+"' and Hierarchy_id="+DivisionHierarchyid;
Statement stmt3 = conn.createStatement();
ResultSet rs32 = stmt3.executeQuery(sqlq2);
while(rs32.next()){
userlist=rs32.getString("userid");
%>
<input TYPE=radio name=userid VALUE='<%=userlist%>' > <%=userlist%> <BR> 
<%
}
String sqlq21 ="select * from xx_doc_zones_hierarchy where userid!='"+user+"' and Hierarchy_id="+ZoneHierarchyid;
Statement stmt31 = conn.createStatement();
ResultSet rs31 = stmt31.executeQuery(sqlq21);
while(rs31.next()){
userlist=rs31.getString("userid"); 
%>

<input TYPE=radio name=userid VALUE='<%=userlist%>' > <%=userlist%> <BR> 

<%
}

}else if(divRShier.getString("HierarchyType").equalsIgnoreCase("Zone")){
	ZoneHierarchyid=divRShier.getString("Zone_HierarchyId");
	
	String sqlq21 ="select * from xx_doc_zones_hierarchy where userid!='"+user+"' and Hierarchy_id="+ZoneHierarchyid;
	Statement stmt31 = conn.createStatement();
	ResultSet rs31 = stmt31.executeQuery(sqlq21);
	
	while(rs31.next()){
	userlist=rs31.getString("userid");
	
	%>
	
	<input TYPE=radio name=userid VALUE='<%=userlist%>' > <%=userlist%> <BR>
	
	<%
	}

}else {
	DivisionHierarchyid=divRShier.getString("Division_HierarchyId");
	String sqlq2 ="select * from xx_doc_divisions_hierarchy where userid!='"+user+"' and Hierarchy_id="+DivisionHierarchyid;
	Statement stmt3 = conn.createStatement();
	ResultSet rs32 = stmt3.executeQuery(sqlq2);
	
	while(rs32.next()){
	userlist=rs32.getString("userid");
	
	%>
	
	<input TYPE=radio name=userid VALUE='<%=userlist%>' > <%=userlist%> <BR>
	
	<%
	}
	
	
}
}					
					
					%>
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Resubmit with Remarks</b>
					
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="remark" id="remark" maxlength="500" rows="5" cols="50" name="comment" placeholder="Enter Remarks"></textarea>
				<br>
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="ReSubmited('<%=Doc_Id%>','<%=usern%>','1','<%=actiontaken%>','<%=approvaldate1%>')">Submit</button> 
				
				</div>
					<!-- </div> -->
						
	<div id="Fwd2" class="desc" style='display:none; '>
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
		
		
		</div>
				<br /> <br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Resubmit with Remarks</b>
					<br>
					<br>
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="remark" id="remark" maxlength="500" rows="10" cols="50" name="comment" placeholder="Enter Remarks"></textarea>
				<br>
				<br>
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
				
				Date date =new SimpleDateFormat("dd/MM/yyyy").parse(approvaldate1);
				java.sql.Date approvaldate = new java.sql.Date(date.getTime());
				
				String doc_action_alert2=(String)session.getAttribute("doc_action_Alert");
				String touser =request.getParameter("touser");
				String Doc_Id1 =request.getParameter("Doc_Id");
				
				Connection conn1 = null;
				String daysfinal=null;
				Statement stmt1 = null;
				ResultSet rs1x = null, rs11 = null, rs31 = null,rs41=null,rs51=null,rs121=null;
				PreparedStatement ps11 = null, ps31 = null,ps41=null,ps51=null,ps121=null;
				try {
					Context initCtx = new InitialContext();
					Context envCtx = (Context) initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
					conn1 = ds.getConnection();
					// getting days final
					String docname1 = "select Days from xx_doc_divisions_hierarchy where Document_id='"
							+ Doc_Id1 + "' and userid='"+touser+"'";
					
					PreparedStatement docnamep1 = conn1
							.prepareStatement(docname1);
					ResultSet rsdoc1 = docnamep1.executeQuery();
					while (rsdoc1.next()) {
						 daysfinal=rsdoc1.getString("Days");						
					
					}
					
					if(daysfinal==null){
					String docname2 = "select Days from xx_doc_zones_hierarchy where Document_id='"
							+ Doc_Id1 + "' and userid='"+touser+"'";
					System.out.println("Second query----"+docname2);
					PreparedStatement docnamep2 = conn1
							.prepareStatement(docname2);
					ResultSet rsdoc2 = docnamep2.executeQuery();
					while (rsdoc2.next()) {
						 daysfinal=rsdoc2.getString("Days");						
					
				            	}
					}
					
					if(daysfinal==null){
						daysfinal="3";
					}
					int daysofapproval1=Integer.parseInt(daysfinal) ;	
					int daysofapproval=daysofapproval1+1;
					String sql2 = "select MAX(Level) from xx_approval_workflow where Document_id='"+Doc_Id1+"'";
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
			        	
			        		Calendar calendar = Calendar.getInstance();
							  
							   java.util.Date currentDate = calendar.getTime();

							   java.sql.Date date11 = new java.sql.Date(currentDate.getTime());
						
						       
						       //get addition of days
						    
		calendar.setTime(date11);
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		calendar.add(Calendar.DATE, -daysofapproval1);
		String cDate1= sdf.format(calendar.getTime());
		java.util.Date Date1 = sdf.parse(cDate1);
		String resubDate= sdf.format(date);
		//java.util.Date currentDate1 = calendar.getTime();
		//java.sql.Date maildate =  new java.sql.Date(currentDate1.getTime());
					
			        	String	insertStg ="insert into xx_approval_workflow (Document_id,Added_byUser,division_hierarchy_id,Assigned_To,Action,level,CurrentDate,AssignedDays) Values ("+Doc_Id1+",'"+added_by+"',"+0+",'"+touser+"','N',"+level+",'"+approvaldate+"','"+daysofapproval+"')";
			        		insertStmt.executeUpdate(insertStg);
			        		
			        		
			        		
			       
			       
			       %>
			        <sql:update dataSource="jdbc/MySQLDB" var="rs">
       update xx_approval_workflow set action ='Y' where document_id =<%=Doc_Id1%> and level ='<%=level-1%>'
     </sql:update>		
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
	update xx_record_actions set ActionPerformed='Resubmitted',Information='<%=remark%>', ActionedOn='<%=approvaldate%>',Real_ActionDate=now() where Document_id='<%=Doc_Id1%>' and ActionPerformedBy='<%=usern%>' and ActionPerformed='pending' 
	
</sql:update>		
<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy, AssignedDays,Real_ActionDate) Values ('<%=Doc_Id1%>','<%=approvaldate%>','pending','<%=touser%>','<%=daysofapproval%>', now())
</sql:update>

<sql:update dataSource="jdbc/MySQLDB" var="rs">
update xx_moreammendments set status ='resubmitted' where document_id =<%=Doc_Id1%>
</sql:update>
<%  
      String user1 = null, docno=null, subdate=null, documentname=null,documenttype=null,emailidsup=null,contact_No_sup=null,supemailid=null,supcontact=null,user_id=null;
		user1 = (String) session.getAttribute("user_name");
		
      String docname = "select Document_Number, Document_Name,Document_Type, Date_Of_Submission from xx_document_mapping where Document_Map_ID='"
				+ Doc_Id1 + "'";
		PreparedStatement docnamep = conn1
				.prepareStatement(docname);
		ResultSet rsdoc = docnamep.executeQuery();
		while (rsdoc.next()) {
			 docno = rsdoc.getString("Document_Number");
			 documentname = rsdoc.getString("Document_Name");
			 documenttype = rsdoc.getString("Document_Type");
			// subdate = rsdoc.getString("Date_of_Submission");
		}
		
		String emailq = "select Email_Id,Contact_No from xx_user_master where User_name='"
				+ touser + "'";

		PreparedStatement emailp = conn1
				.prepareStatement(emailq);
		ResultSet emailr = emailp.executeQuery();
		while (emailr.next()) {
			emailidsup = emailr.getString("Email_Id");
			contact_No_sup = emailr.getString("Contact_No");
			 
		}
		
		String supervisoremail = "select Email_Id,Contact_No from xx_user_master where User_name='"
				+ user1 + "'";

		PreparedStatement supervisorp = conn1
				.prepareStatement(supervisoremail);
		ResultSet supervisorr = supervisorp.executeQuery();
		while (supervisorr.next()) {
			supemailid = supervisorr.getString("Email_Id");
			supcontact = supervisorr.getString("Contact_No");
		 
		}

//end of email id code

      // Mail code starts from here
      System.out.println("1...today:"+Date1+"approval date:"+date);
		if (Date1.compareTo(date)<=0 && doc_action_alert2.equalsIgnoreCase("on")) {			
					 String result;
					    // Get recipient's email-ID, message & subject-line from index.html page
					    
					    final String to = emailidsup;
					    final String subject = "RVNL DOCUMENT PORTAL";
					    final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+touser.toUpperCase()+" </b><br><br>"+user1+"/RVNL has resubmitted a document/drawing for your approval and further necessary action please. The details of the document/drawing are as under:<br><BR> Document No:  "+docno+"<BR> Document Name:  "+documentname+" <BR> Document Type:  "+documenttype+"<br>Re-submission Date: "+resubDate+" <br>Target Time of days: "+daysofapproval1+" <br><br><br> <span style='color:brown; font-size:20px; font-style:italic;'<b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
	
					
					    // Sender's email ID and password needs to be mentioned
					    final String from = "indiarvnl@gmail.com";
					    final String pass = "vsam3WSCJAIw4cj7";
					    
					    final String cc = supemailid;
					    // Defining the gmail host
					    String host = "smtp-relay.sendinblue.com";
					 
					    // Creating Properties object
					    Properties props = new Properties();
					 
					    // Defining properties
					   
					    props.put("mail.smtp.starttls.enable", "true");
					    props.put("mail.smtp.host", host);
					    props.put("mail.smtp.user", from);
					    props.put("mail.smtp.password", pass);
					    props.put("mail.smtp.port", "587");
					    props.put("mail.smtp.auth", "true");
					 
					    // Authorized the Session object.
					    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
					        @Override
					        protected PasswordAuthentication getPasswordAuthentication() {
					            return new PasswordAuthentication(from, pass);
					        }
					    });
					 
					    try {
					        // Create a default MimeMessage object.
					        MimeMessage message = new MimeMessage(mailSession);
					        // Set From: header field of the header.
					        message.setFrom(new InternetAddress(from));
					        // Set To: header field of the header.
					        message.addRecipient(Message.RecipientType.TO,
					                new InternetAddress(to));
					        message.setRecipients(Message.RecipientType.CC, cc);
					        // Set Subject: header field
					        message.setSubject(subject);
					        // Now set the actual message
					        message.setText(messg);
					        // Send message
					        Transport.send(message);
					        result = "Your mail sent successfully....";
					    } catch (MessagingException mex) {
					        mex.printStackTrace();
					        result = "Error: unable to send mail....";
					    }
					    System.out.println("result to check message of email----->"+result);
					    // Mail code ends here
					    //SMS code 
					    
					    try {
		// Construct data
		//contact number supervisor------contact_No_sup
		//contact number sender ------------- supcontact
		
		String user11 = "username=" + "indiarvnl@gmail.com";
		String hash = "&hash=" + "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
		String message = "&message=" + "A document has been resubmitted by "+user1+"/RVNL. Doc Name: '"+documentname+"'.\n\nRVNL Document Portal";
		String sender = "&sender=" + "RPDAMS";
		String numbers = "&numbers=" + ""+supcontact+"";
		//+","+contact_No_sup+"";
		
		// Send data
		HttpURLConnection connsms = (HttpURLConnection) new java.net.URL("http://api.textlocal.in/send in/?").openConnection();
		
		String data = user11 + hash + numbers + message + sender;
	
		connsms.setDoOutput(true);
		connsms.setRequestMethod("POST");
		connsms.setRequestProperty("Content-Length", Integer.toString(data.length()));
		connsms.getOutputStream().write(data.getBytes("UTF-8"));
		final BufferedReader rd = new BufferedReader(new InputStreamReader(connsms.getInputStream()));
		final StringBuffer stringBuffer = new StringBuffer();
		String line;
		while ((line = rd.readLine()) != null) {
			stringBuffer.append(line);
		}
		rd.close();
		System.out.println("Message sent successfully");
		//return stringBuffer.toString();
	} catch (Exception e) {
		System.out.println("Error SMS "+e);
		//return "Error "+e;
	}
		}	

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
        <strong>Success!</strong> Document has been re-submitted.
        
        <div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
							 value="Close"
							onclick="javascript:window.close();return refreshAndClose();" /></div>
        
      </div>
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
			update xx_record_actions set ActionPerformed='Final Approved',Real_ActionDate=now() where Document_id='<%=Doc_Id1%>' and ActionPerformedBy='<%=usern%>' and ActionPerformed='pending'
			
		</sql:update>
		 <sql:update dataSource="jdbc/MySQLDB" var="rs">
       update xx_approval_workflow set action ='Y' where document_id =<%=Doc_Id1%> and level ='<%=level%>'
     </sql:update>		
	<script>
document.Forward.finalsubmited.value = "nana";
document.getElementById("Forward").submit();
</script>				
		</c:if>
		<c:if test="${param.finalsubmited == 'nana'}">
				<div class="alert alert-success" align="center">
								    <strong> Document has been received back duly Approved.</strong>
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
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');">OK</button>
							</div>

</form>

</body>
</html>