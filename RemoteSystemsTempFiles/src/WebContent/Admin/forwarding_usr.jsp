<%@page import="java.net.HttpURLConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
//<%@include file="included/NewHeader1.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.*"%>
<%@ page session="true" %>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.internet.*" %>

<%@ page import="java.net.URL.*"%>
<%@ page import="java.io.*" %>

<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.net.URLEncoder.*" %>
<%@ page import="java.io.InputStreamReader.*" %>
<%@ page import="java.net.URLConnection.*"%>
<%@ page import="java.io.InputStreamReader.*" %>
<%@ page import="java.io.OutputStreamWriter.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forwarding User</title>
<script src="resources/jQuery/jquery-1.12.3.min.js"></script>
<script src="resources/jQuery/jquery-ui.js"></script>
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<script src="resources/JS/Approval_wf230.js"></script>
<!--   <link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" /> -->
	<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<script type="text/javascript">
 $(window).on ("beforeunload", function() { //window.opener.close(); 
 //var stage1= document.getElementById("stage").value;
 //alert(",,stage"+stage1);
//	if (stage1!= null) { 
	//	alert("...closing..."); 
//	window.opener.location.reload(true);
	// window.open("javascript:location.reload(true);","c_document");
//	}
	}); 

 </script>
</head>
<body>
<form id='Forward_Usr' name='Forward_Usr'>
<INPUT TYPE='HIDDEN' NAME="document_id">
<INPUT TYPE='HIDDEN' NAME="stage">
<INPUT TYPE='HIDDEN' NAME="user_id">
<INPUT TYPE='HIDDEN' NAME="Submitted_by">
<INPUT TYPE='HIDDEN' NAME="Submition_date">
<INPUT TYPE='HIDDEN' NAME="initatedfrm1">
<INPUT TYPE='HIDDEN' NAME="daysfinal">

<c:if test="${param.stage == null}">
<br>	
		<div style='vertical-align: baseline; padding: 10px; margin: 20px;'>
		<b>
		Forward To User :-
		</b>
		<br>
		<br>
		<br>
		

<%
String doc_id=request.getParameter("document_id");
String sub_date=request.getParameter("submitiondate");
String initatedfrm=request.getParameter("initatedfrm");
Connection conn=null;
String htype=null,submitted_by=null;
try {
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn = ds.getConnection();
	

String documentq="select HierarchyType,Submitted_by from xx_document_mapping where Document_Map_ID='"+doc_id+"' order by Submitted_by";
PreparedStatement divPS1 = conn.prepareStatement(documentq);


ResultSet divRS1 = divPS1.executeQuery();
if (divRS1.next()){
	htype=divRS1.getString(1);
	submitted_by=divRS1.getString(2);

}

if(htype.equalsIgnoreCase("Zone")){
	String documentq1="select Zone_HierarchyId from xx_document_mapping where Document_Map_ID='"+doc_id+"' order by Zone_HierarchyId";
	PreparedStatement divPS11 = conn.prepareStatement(documentq1);

	String Zonehi=null;
	ResultSet divRS11 = divPS11.executeQuery();
	if (divRS11.next()){
		Zonehi=divRS11.getString(1);
	}	
	
	String queryusers="select userid from xx_doc_zones_hierarchy where Hierarchy_id='"+Zonehi+"' order by userid";
	PreparedStatement divPS12 = conn.prepareStatement(queryusers);
	ResultSet divRS12 = divPS12.executeQuery();
	while(divRS12.next()){
		String user=divRS12.getString(1);
	%>	
		<div><input style="margin-left:150px;"  TYPE=radio name=userid VALUE='<%=user%>'> <%=user%> <BR></div>
		
<%		
	}
	
}else if(htype.equalsIgnoreCase("Division")){
	
	String documentq1="select Division_HierarchyId from xx_document_mapping where Document_Map_ID='"+doc_id+"' order by Division_HierarchyId";
	PreparedStatement divPS11 = conn.prepareStatement(documentq1);

	String divhi=null;
	ResultSet divRS11 = divPS11.executeQuery();
	if (divRS11.next()){
		divhi=divRS11.getString(1);
		}
	
	String queryusers="select userid from xx_doc_divisions_hierarchy where Hierarchy_id='"+divhi+"' order by userid";
	PreparedStatement divPS12 = conn.prepareStatement(queryusers);
	ResultSet divRS12 = divPS12.executeQuery();
	while(divRS12.next()){
		String user=divRS12.getString(1);
	%>	
		<div><input style="margin-left:150px;" TYPE=radio name=userid VALUE='<%=user%>'> <%=user%> <BR></div>
		
<%		
	}
	
}else if(htype.equalsIgnoreCase("Both")){
	
	String documentq1="select Division_HierarchyId,Zone_HierarchyId from xx_document_mapping where Document_Map_ID='"+doc_id+"'";
	PreparedStatement divPS11 = conn.prepareStatement(documentq1);

	String Divhierid=null,Zonhierid=null;
	ResultSet divRS11 = divPS11.executeQuery();
	if (divRS11.next()){
		Divhierid=divRS11.getString(1);
		Zonhierid=divRS11.getString(2);

	}
	String queryusers="select userid from xx_doc_divisions_hierarchy where Hierarchy_id='"+Divhierid+"' order by userid";
	PreparedStatement divPS12 = conn.prepareStatement(queryusers);
	ResultSet divRS12 = divPS12.executeQuery();
	%>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Division:</strong>
	<%
	while(divRS12.next()){
		String user=divRS12.getString(1);
	%>	
		<div><input style="margin-left:150px;" TYPE=radio name=userid VALUE='<%=user%>'> <%=user%> <BR></div>
		
<%		
	}
	
	

	String queryusersz="select userid from xx_doc_zones_hierarchy where Hierarchy_id='"+Zonhierid+"' order by userid";
	PreparedStatement divPS121 = conn.prepareStatement(queryusersz);
	ResultSet divRS121 = divPS121.executeQuery();
	%>
	<br> <br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Zone:</strong>
	<%
	
	while(divRS121.next()){
		String user=divRS121.getString(1);
	%>	
		<div><input style="margin-left:150px;" TYPE=radio name=userid VALUE='<%=user%>'> <%=user%> <BR></div>
		
<%		
	}
	
	
	
}
	
}catch(Exception e){
	
	e.printStackTrace();
} finally {
    try { conn.close(); } catch (Exception e) { /* ignored */ }
}



%>
<br>
		<br>
		

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="javascript:forwd_usr(<%=doc_id%>,<%=submitted_by%>,'<%=sub_date%>','<%=initatedfrm%>')">Forward</button>

</div>
<div id="dialogid" style="display: none"
								align="center">
								<br> Please Select Data!<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');">Ok</button>
							</div>
</c:if>






<c:if test="${param.stage != null}">
<%

String stage11=null, user1 = null,documentname=null,documenttype=null,emailidsup=null,contact_No_sup=null,supemailid=null,supcontact=null,user_id=null;
stage11 = request.getParameter("stage");
System.out.println("1 stage-----"+stage11);
if (stage11.equalsIgnoreCase("first")) {
	System.out.println("2 stage-----"+stage11);
user1 = (String) session.getAttribute("user_name");
 user_id = request.getParameter("user_id");
 String doc_action_alert2=(String)session.getAttribute("doc_action_Alert");
//Select email id of user to forward document

Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

Connection conn = ds.getConnection();
String emailq = "select Email_Id,Contact_No from xx_user_master where User_name='"
					+ user_id + "'";

			PreparedStatement emailp = conn
					.prepareStatement(emailq);
			ResultSet emailr = emailp.executeQuery();
			while (emailr.next()) {
				emailidsup = emailr.getString("Email_Id");
				contact_No_sup = emailr.getString("Contact_No");
				 
			}
			
			String supervisoremail = "select Email_Id,Contact_No from xx_user_master where User_name='"
					+ user1 + "'";

			PreparedStatement supervisorp = conn
					.prepareStatement(supervisoremail);
			ResultSet supervisorr = supervisorp.executeQuery();
			while (supervisorr.next()) {
				supemailid = supervisorr.getString("Email_Id");
				supcontact = supervisorr.getString("Contact_No");
			 
			}

//end of email id code
String daysfinal=null,username=null, subdate=null;
//System.out.println("sajghsajgdjgjsagjdgdsaj username username------"+user1);
String initatedfrm=request.getParameter("initatedfrm1");
String doc_id=request.getParameter("document_id");
System.out.println("documnet id of forward_user page"+doc_id); 
String Submitted_by=request.getParameter("Submitted_by");
String Submition_date=request.getParameter("Submition_date");
System.out.println("sub date="+Submition_date);
Date date =new SimpleDateFormat("dd/MM/yyyy").parse(Submition_date);
java.sql.Date Submitiondate = new java.sql.Date(date.getTime());
System.out.println("ssst"+Submitiondate);
//getting days final
String docname1 = "select Days from xx_doc_divisions_hierarchy where Document_id='"
		+ doc_id + "' and userid='"+user_id+"'";

PreparedStatement docnamep1 = conn
		.prepareStatement(docname1);
ResultSet rsdoc1 = docnamep1.executeQuery();
while (rsdoc1.next()) {
	 daysfinal=rsdoc1.getString("Days");						

}

if(daysfinal==null){
String docname2 = "select Days from xx_doc_zones_hierarchy where Document_id='"
		+ doc_id + "' and userid='"+user_id+"'";

PreparedStatement docnamep2 = conn
		.prepareStatement(docname2);
ResultSet rsdoc2 = docnamep2.executeQuery();
while (rsdoc2.next()) {
	 daysfinal=rsdoc2.getString("Days");						

        	}
}
int daysofapproval1=Integer.parseInt(daysfinal) ;
int daysofapproval=daysofapproval1+1;
// ending days final data------
String docname = "select Document_Name, Document_Type, Date_of_Submission from xx_document_mapping where Document_Map_ID='"
		+ doc_id + "'";
PreparedStatement docnamep = conn
		.prepareStatement(docname);
ResultSet rsdoc = docnamep.executeQuery();
while (rsdoc.next()) {
	 documentname = rsdoc.getString("Document_Name");
	 documenttype = rsdoc.getString("Document_Type");
}   
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
Calendar cal = Calendar.getInstance();
cal.add(cal.DATE, -daysofapproval1);
String cDate1= sdf.format(cal.getTime());
java.util.Date Date1 = sdf.parse(cDate1);


   //get addition of days
%>


<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_approval_workflow (Document_id,Added_byUser,Assigned_To,Action,CurrentDate,level,AssignedDays) Values (<%=doc_id%>,'<%=Submitted_by%>','<%=user_id %>','N','<%=Submitiondate%>',1,'<%=daysfinal%>')
</sql:update>

<sql:update dataSource="jdbc/MySQLDB" var="rs">
  update xx_document_mapping set forwarded='yes', Doc_forwd_date=now() where Document_Map_ID = <%=doc_id%>
</sql:update>

<sql:update dataSource="jdbc/MySQLDB" var="rs">  
  insert into xx_record_actions (Document_id,ActionPerformed,ActionPerformedBy,ActionedOn,Real_ActionDate) values('<%=doc_id%>','Submitted','<%=user1 %>','<%=Submitiondate%>', now())
</sql:update>
<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,AssignedDays,Real_ActionDate) values('<%=doc_id%>','<%=Submitiondate%>','pending','<%=user_id %>','<%=daysfinal%>', now())
</sql:update>
<%

//response.setHeader("Refresh", "0; URL=http://localhost:8080/RVNLDocumentPortal/Admin/user_index.jsp");
//if (!initatedfrm.equalsIgnoreCase("recreate")) {response.sendRedirect("user_index.jsp");}

		// Mail code starts from here
		System.out.println("today:"+Date1+"approval date:"+date);
if (Date1.compareTo(date)<=0 && doc_action_alert2.equalsIgnoreCase("on")) {					
					 String result;
					    // Get recipient's email-ID, message & subject-line from index.html page
					    
					    final String to = emailidsup;
					    final String subject = "RVNL DOCUMENT PORTAL";
					    final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+user_id.toUpperCase()+"</b> <br><br>"+user1+"/RVNL has forwarded a document/drawing for your approval and further necessary action please.The details of the document/drawing are as under:<br><BR> Document Name:  "+documentname+" <BR> Document Type:  "+documenttype+"<BR>Submission Date: "+Submition_date+"<BR>Target Time of days: "+daysofapproval1+" <br><br><br> <span style='color:brown;  font-size:20px; font-style:italic;'><b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
	
					
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
					 
					    // Mail code ends here
					    //SMS code 
					    
					    try {
		// Construct data
		//contact number supervisor------contact_No_sup
		//contact number sender ------------- supcontact
		
		String user = "username=" + "indiarvnl@gmail.com";
		String hash = "&hash=" + "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
		String message = "&message=" + "A request for approval of RVNL document has been initiated by "+user1+"/RVNL for '"+documentname+"'.\n\nRVNL Document Portal";
		String sender = "&sender=" + "RPDAMS";
		String numbers = "&numbers=" + ""+supcontact+"";
		//+","+contact_No_sup+"";
		
		// Send data
		HttpURLConnection connsms = (HttpURLConnection) new java.net.URL("https://api.textlocal.in/send in/?").openConnection();
		
		String data = user + hash + numbers + message + sender;
	
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
conn.close();
%>
<script>
document.Forward_Usr.stage.value = "second";
document.getElementById("Forward_Usr").submit();
</script>
 <%
} 
%>
<!-- <div style='vertical-align: baseline; padding: 10px; margin: 20px;'>
 <div class="alert alert-success">
 <strong>Success!</strong> Document has been Forwarded successfully.
</div>
</div> -->
</c:if>








</form>
</body>
</html>