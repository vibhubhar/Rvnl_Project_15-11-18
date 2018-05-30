<%@page import="java.net.HttpURLConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="included/NewHeader.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- <jsp:include page="Divisions.jsp" flush="true" /> --%>
<%@ page autoFlush="true" buffer="1094kb"%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />

<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>

<%@ page import="java.net.URL.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder.*" %>
<%@ page import="java.net.URLConnection.*"%>
<%@ page import="java.io.InputStreamReader.*" %>
<%@ page import="java.io.OutputStreamWriter.*" %>

<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.*"%>

<script type="text/javascript">
    window.onunload = refreshParent;
    function refreshParent() {
        window.opener.location.reload();
    }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
    function refreshAndClose() {
       // window.opener.location.reload(true);
        window.close();
    }
</script>
</head>
<body>
<%
String user = (String)session.getAttribute("user_name");
String prof_alert2=(String)session.getAttribute("Profile_Alert");
String doc_action_alert2=(String)session.getAttribute("doc_action_Alert");
PreparedStatement pstatement = null;
		String email_old = request.getParameter("email_old");
		String no_old = request.getParameter("no_old");
		String Type = request.getParameter("type_test");
		String user_name1 = request.getParameter("user_name");
		String test1 = request.getParameter("test");
		String officer_name = request.getParameter("officer_name");
		String email_id = request.getParameter("email_id");
		String contact_no = request.getParameter("contact_no");
		String Role = request.getParameter("Role");
		String PIU_name = request.getParameter("PIU_name");
		String Department_RVNL2 = request.getParameter("Department_RVNL2");
		String designation_RVNL11 = request.getParameter("DesgDiv_RVNL2");

		String Zone = request.getParameter("Zone");
		String division1 = request.getParameter("division1");
		String designation_RVNL21 = request.getParameter("DesgDiv_RVNL1");
		String Department_RVNL1 = request.getParameter("Department_RVNL1");
		String queryString=null;
        PreparedStatement p1 =null;
		Connection conn=null;
		Statement stmt=null;
		int updateQuery = 0;
		//System.out.println("comoing upto here-------------------"+user_name1);
	try{
		
		String desigid=null;
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
		 String depid=null;
		conn = ds.getConnection();
		 System.out.println(" Type----"+Type+user_name1);
		if (Type.equalsIgnoreCase("Others")) {
					if(user_name1!="" && user_name1!=null){
						   queryString = "UPDATE xx_user_master SET User_name='"+user_name1+"', Created_by='"+user+"', Date_created=now() where User_name='"+test1+"'";
					}
			
		} else {

		if(Department_RVNL1!=null){
		String deptartmentname="select * from xx_departments_master where Department_Name='"+Department_RVNL1+"' and Type='MOR'";
		
		 PreparedStatement ps4dep = conn.prepareStatement(deptartmentname);
		  // ps3.setString(1, piu);
		   ResultSet rsldep = ps4dep.executeQuery(); 
		  
		 while(rsldep.next()){
		 depid=rsldep.getString("Department_Id");
		 }
		}
		else{
			String deptartmentname="select * from xx_departments_master where Department_Name='"+Department_RVNL2+"' and Type='RVNL'";
			
			 PreparedStatement ps4dep = conn.prepareStatement(deptartmentname);
			  // ps3.setString(1, piu);
			   ResultSet rsldep = ps4dep.executeQuery(); 
			   
			 while(rsldep.next()){
			 depid=rsldep.getString("Department_Id");
			 }
			
			
		}
		if(designation_RVNL11 !=null){
		 String depts="Select designation_id from xx_designation_mapping where Designation_name='"+designation_RVNL11+"' and Type='RVNL'";
		
		 PreparedStatement ps4 = conn.prepareStatement(depts);
		  // ps3.setString(1, piu);
		   ResultSet rsl = ps4.executeQuery(); 
		   
		 while(rsl.next()){
		 desigid=rsl.getString("designation_id");
		 }
		 }
		 else{
			 String depts1="Select designation_id from xx_designation_mapping where Designation_name='"+designation_RVNL21+"' and Type='MOR'";
			
			 PreparedStatement ps41 = conn.prepareStatement(depts1);
			  // ps3.setString(1, piu);
			   ResultSet rsl1 = ps41.executeQuery(); 
			   
			 while(rsl1.next()){
			 desigid=rsl1.getString("designation_id");
			 }	 		 
		 }
		//System.out.println("name="+user_name1+"o"+officer_name+"e"+email_id+"no"+contact_no+"des"+desigid);
		if (user_name1!="" && officer_name!="" &&  email_id!="" && contact_no!="" && desigid!="" && user_name1!=null && officer_name!=null &&  email_id!=null && contact_no!=null && desigid!=null){
		   queryString = "UPDATE xx_user_master SET User_name='"+user_name1+"',Department_id='"+depid+"', Officer_Name='"+officer_name+"',Email_Id='"+email_id+"',Contact_No='"+contact_no+"',Designation_Id='"+desigid+"', Created_by='"+user+"', Date_created=now() where User_name='"+test1+"'";
		} 
		}
		  // System.out.println("final query----"+queryString+desigid);
         if (queryString != null) {
		   p1 = conn.prepareStatement(queryString);
                   updateQuery = p1.executeUpdate();
                if (updateQuery != 0) {
                	
                	//response.setHeader("Refresh", "0; URL=http://localhost:8080/RVNLDocumentPortal/Admin/user_index.jsp");       	
            }
                   	 
                   %>
           <sql:update  dataSource="jdbc/MySQLDB" var="rs">
           		   update xx_record_actions set ActionPerformedBy='<%=user_name1%>' where ActionPerformedBy='<%=test1%>';
           		   
		</sql:update>
				
		  <sql:update  dataSource="jdbc/MySQLDB" var="rs">
        			update xx_moreammendments set action_performedBy='<%=user_name1%>' where action_performedBy='<%=test1%>';
		</sql:update>
				
		 <sql:update  dataSource="jdbc/MySQLDB" var="rs">
        		
				  update xx_moreammendments set action_To='<%=user_name1%>' where action_To='<%=test1%>';
           	
		</sql:update>
				
		 <sql:update  dataSource="jdbc/MySQLDB" var="rs">
     				  update xx_doc_zones_hierarchy set UserId ='<%=user_name1%>' where UserId ='<%=test1%>';
           	</sql:update>
          	
		 <sql:update  dataSource="jdbc/MySQLDB" var="rs">
        			 update xx_doc_divisions_hierarchy set userId ='<%=user_name1%>' where userId ='<%=test1%>';
		</sql:update>
				
		 <sql:update  dataSource="jdbc/MySQLDB" var="rs">
              		  update xx_approval_workflow set Assigned_To  ='<%=user_name1%>' where Assigned_To ='<%=test1%>';
		</sql:update>
			 	
		<div class="alert alert-success" style="width: 500px; margin-top: 100px; margin-left: 100px;">
	 <strong>Success!</strong> User data has been updated successfully.
	 <br>
	 <br>
	 <center><input class='btn btn-primary' value='OK'  onClick="refreshAndClose()" type='button'/></center>
	 </div>
    
    <%
	if (!Type.equalsIgnoreCase("Others")) {
		if (prof_alert2.equalsIgnoreCase("On")) {
		// Mail code starts from here
//System.out.println("today:"+Date1+"approval date:"+date);			
		 String result, cc1, cc2, id1, no2;
		    // Get recipient's email-ID, message & subject-line from index.html page
		    StringBuffer url =   request.getRequestURL();
			if (!email_old.equalsIgnoreCase(email_id)) {
				cc1=email_old;
				cc2="<br> New Email Id: "+email_id+"<br> Old Email Id: "+email_old;
			} else { 
				cc1=""; cc2="";
			}
			if (!no_old.equalsIgnoreCase(contact_no)) {
				no2="<br> New Contact No: "+contact_no+"<br> Old Contact No: "+no_old;
			} else { 
				no2="";
			}
			if (!user_name1.equalsIgnoreCase(test1)) {
				id1="<br> Old Uder Id: "+test1;
			} else {id1="";}
					
			String pageName1 = url.substring(0, url.lastIndexOf("/"))+"/admn_login.jsp";
		    final String to = email_id;
		    final String subject = "RVNL DOCUMENT PORTAL - Change in User details";
		    final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+user_name1.toUpperCase()+" </b><br><br> Your portal login details have been modifed as under;"
		     +"<br><BR> New User Id:  "+user_name1+id1+cc2+no2+"<br> Login webpage: <a href=\""+ pageName1+"\">"+pageName1+"</a> <br><br><br><span style='color:brown; font-size:20px; font-style:italic;'<b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
		    						
		    // Sender's email ID and password needs to be mentioned
		    final String from = "indiarvnl@gmail.com";
		    final String pass = "vsam3WSCJAIw4cj7";
		    
		    final String cc = cc1;
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
		        System.out.println("Email sent successfully");
		    } catch (MessagingException mex) {
		        mex.printStackTrace();
		        result = "Error: unable to send mail....";
		    }
		 
		    // mail code ends here
		     //SMS code 

try {
//Construct data
//contact number supervisor------contact_No_sup
//contact number sender ------------- supcontact

String usersms = "username=" + "indiarvnl@gmail.com";
String hash = "&hash=" + "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
//String apiKey = "apikey=" + "noVebn4XbP0-UFyeK1rRwkvCNdDw5ZXfVqrSNPndk2";
String message = "&message=" + "Please check your email ("+email_id+") for modified login details.\n\nRVNL Document Portal";
String sender = "&sender=" + "RPDAMS";
String numbers = "&numbers=" + ""+contact_no+","+no_old+"";

//Send data
HttpURLConnection connsms = (HttpURLConnection) new java.net.URL("http://api.textlocal.in/send in/?").openConnection();

String data = usersms + hash + numbers + message + sender;
//String data = apiKey + numbers + message + sender;
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
//sms code ends here
		}
	}    
         
         
         } else {
			
			%>
			<div class="alert alert-warning" style="width: 500px; margin-top: 100px; margin-left: 100px; text-align:center;">
  <strong>Warning!</strong> Data is not Updated Please check it ! <br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Trick: re-enter designation)
<br> <br>
	 <center><input class='btn btn-primary' value='OK'  onClick="refreshAndClose()" type='button'/></center>
	 </div>
<% 
		}
		 p1.close();
         conn.close();
	}  catch (Exception ex) { 
	 }
		
            /* finally {
                // close all the connections.
                p1.close();
                conn.close();
            } */
		
	%>
	

</body>
</html>