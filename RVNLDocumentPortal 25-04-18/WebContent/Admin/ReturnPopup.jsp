<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.net.HttpURLConnection"%>
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
    
    $(document).ready(function(){
   	 $('#remark').on('keypress', function (event) {
   		   // var regex = new RegExp("^[a-zA-Z0-9]+$");
   		  var regex = new RegExp("['?!<\">\\\\&]+$");
   		    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
   		    if (regex.test(key)) {
   		       event.preventDefault();
   		       return false;
   		    }
   		});
		});

</script>
</head>
<body>
<%String user = (String)session.getAttribute("user_name");

%>
<form id='return_pop' name='return_pop'  method="post">
<INPUT TYPE="HIDDEN" NAME="Doc_Id">
<INPUT TYPE="HIDDEN" NAME="Action">
<INPUT TYPE="HIDDEN" NAME="requested_by">
<INPUT TYPE="HIDDEN" NAME="checkedval">
<INPUT TYPE="HIDDEN" NAME="doc_no">
<INPUT TYPE="HIDDEN" NAME="remarks">

<%
String Document_id=request.getParameter("doc_id");
String requested_by=request.getParameter("requested_by");

String docno=request.getParameter("doc_no");
String division=request.getParameter("Division");
String Clevel=request.getParameter("C_Level");
String remark = request.getParameter("remark");
String approvaldate=request.getParameter("approvaldate");
%>
<c:choose>

<c:when test="${param.Action == null}">

<br><br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Return with Remarks</b>

<br>
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="remark" id="remark" rows="10" cols="50" maxlength="100" name="comment" placeholder="Enter Remark"></textarea>
</div>
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button id ="Return" type="button" class="btn btn-primary" onclick="returnedpopup('<%=Document_id%>','<%=requested_by%>','<%=docno%>','<%=user%>','return')">Submit</button>
</c:when>
<c:when test="${param.Action == 'returned'}">
<%
	String action=request.getParameter("Action");
String doc_action_alert2=(String)session.getAttribute("doc_action_Alert");
	if(action.equalsIgnoreCase("returned")){	
		String doc_id = request.getParameter("Doc_Id");
		
		String requestedBy = request.getParameter("requested_by");
		String docno1 = request.getParameter("doc_no");
		
		try{	
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
		Connection conn =null;
		 conn = ds.getConnection();
		 String sql = "select PM.project,PM.project_Coordinator,PP.package_name,PP.package_director,DM.document_number,DM.Submitted_by from xx_document_mapping DM,xx_packages_project PP,"+
				 "xx_projectattributes_master PM where DM.Project_ID = PM.Project_ID  and PP.package_id = DM.Package_ID and DM.Document_Map_ID ='"+doc_id+"'";
		PreparedStatement ps = conn.prepareStatement(sql);
		 ResultSet rs = ps.executeQuery();
		 String project =null,pCoordinator =null,package_name =null,package_director =null;requested_by=null;
		 
		while(rs.next()){
			 project = rs.getString(1);
			 pCoordinator = rs.getString(2);
			 package_name = rs.getString(3);
			 package_director = rs.getString(4);
			 docno1 = rs.getString(5);
		}
		Date date =new SimpleDateFormat("dd/MM/yyyy").parse(approvaldate);
		java.sql.Date approvaldate2 = new java.sql.Date(date.getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String returnDate= sdf.format(date);
		docno = request.getParameter("doc_no");
		
		requested_by = request.getParameter("requested_by");
		%>
		
		<sql:update dataSource="jdbc/MySQLDB" var="rs">
  update xx_approval_workflow set action ='Y' where document_id =<%=doc_id%> 
</sql:update>
<sql:update dataSource="jdbc/MySQLDB" var="rs">
			update xx_record_actions set ActionPerformed='Returned to RVNL',Information='<%=remark %>',ActionedOn='<%=approvaldate2%>',Real_ActionDate=now() where Document_id='<%=doc_id%>' and ActionPerformedBy='<%=user%>' and ActionPerformed='pending'
			
		</sql:update>
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Real_ActionDate) Values ('<%=doc_id%>','<%=approvaldate2%>','pending','<%=requested_by%>', now())
</sql:update>	
<%
String select21 = "select * from xx_moreammendments where document_id ='"+doc_id+"'";

Statement st=null;

int flag=0;
st=(Statement) conn.createStatement();
ResultSet rs222 = st.executeQuery(select21);
if(rs222.next()){
	flag=1;
	
}
if(flag==1)
{
	%>
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
	update xx_moreammendments set status ='return', action_To='<%=requested_by%>', Information='<%=remark%>' where document_id =<%=doc_id%>
	</sql:update>
<%}
else
{
	
	%>

<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_moreammendments (Document_id,document_number,status,action_performedBy,project,package,projectCoordinator,packageDirector,action_to,Information) Values ('<%=doc_id%>','<%=docno1 %>','return','<%=user%>','<%=project%>','<%=package_name%>','<%=pCoordinator%>','<%=package_director%>','<%=requested_by%>','<%=remark%>')
</sql:update>	
<%

}
%>
		<% 
		if (doc_action_alert2.equalsIgnoreCase("on")) {
		// Mail code starts from here
				String  documentname=null,documenttype=null,supemailid=null,supcontact=null,emailidsup=null,contact_No_sup=null;
		String supervisoremail = "select Email_Id,Contact_No from xx_user_master where User_name='"
				+ user + "'";

		PreparedStatement supervisorp = conn
				.prepareStatement(supervisoremail);
		ResultSet supervisorr = supervisorp.executeQuery();
		while (supervisorr.next()) {
			supemailid = supervisorr.getString("Email_Id");
			supcontact = supervisorr.getString("Contact_No");
		 
		}

		String result;
		String user_id = request.getParameter("user_id");
		   // Get recipient's email-ID, message & subject-line from index.html page
		   String emailq = "select Email_Id,Contact_No from xx_user_master where User_name='"
									+ requested_by + "'";

							PreparedStatement emailp = conn
									.prepareStatement(emailq);
							ResultSet emailr = emailp.executeQuery();
							while (emailr.next()) {
								emailidsup = emailr.getString("Email_Id");
								contact_No_sup = emailr.getString("Contact_No");
								 
							}
							String docname = "select Document_Number, Document_Name,Document_Type from xx_document_mapping where Document_Map_ID='"
									+ doc_id + "'";
							PreparedStatement docnamep = conn
									.prepareStatement(docname);
							ResultSet rsdoc = docnamep.executeQuery();
							while (rsdoc.next()) {
								 docno = rsdoc.getString("Document_Number");
								 documentname = rsdoc.getString("Document_Name");
								 documenttype = rsdoc.getString("Document_Type");
								 
							}
							   final String to = emailidsup;
		   final String subject = "RVNL DOCUMENT PORTAL";
		   final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+requested_by.toUpperCase()+" </b><br><br> A document/drawing as per following details is returned for compliance to the observations:<br><BR> Document No:  "+docno+"<BR> Document Name:  "+documentname+" <BR> Document Type:  "+documenttype+"<BR> Returned By: "+user+"<BR>Date of Return: "+returnDate+".<br><br><br> <span style='color:brown; font-size:20px; font-style:italic;'<b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
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

		String user11 = "username=" + "indiarvnl@gmail.com";
		String hash = "&hash=" + "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
		String message = "&message=" + "A document has been returned by "+user+". Doc Name: '"+documentname+"'.\n\nRVNL Document Portal";
		String sender = "&sender=" + "RPDAMS";
		String numbers = "&numbers=" + ""+supcontact+"";
		//+","+contact_No_sup+"";

		// Send data
		HttpURLConnection connsms = (HttpURLConnection) new java.net.URL("http://api.textlocal.in/send/?").openConnection();

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
		conn.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
%>
<script>
document.return_pop.Action.value = "null22";
document.getElementById("return_pop").submit();
</script>

</c:when>
<c:when test="${param.Action == 'null22'}">

<div class="alert alert-success" align="center">
					    <strong> Document has been returned for more Information.</strong>
					    <div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
							 value="Close"
							onclick="javascript:window.close();return refreshAndClose()" /></div>
    
					    
					    
					    
					    </div>

</c:when>
<c:otherwise>

</c:otherwise>


</c:choose>


</form>

</body>
</html>