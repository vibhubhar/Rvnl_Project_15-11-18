<%@page import="javax.swing.text.Position"%>
<%@page import="java.net.HttpURLConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<%@ page session="true"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page session="true"%>
<%@include file="sessionCheck.jsp"%>
<%@ page import="java.net.URL.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.URLEncoder.*"%>
<%@ page import="java.io.InputStreamReader.*"%>
<%@ page import="java.net.URLConnection.*"%>
<%@ page import="java.io.InputStreamReader.*"%>
<%@ page import="java.io.OutputStreamWriter.*"%>
<%@include file="included/NewHeader.jsp"%>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<script src="resources/JS/UserIndex.js" type="text/javascript"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script src="resources/JS/validate230.js" type="text/javascript"></script>
<style type="text/css">
#example_length {
	display: none;
}

#example {
	width: inherit;
}

div.absolute {
	position: absolute;
	margin-top: 5px;
	margin-left: 13px;
	margin-bottom: 20px;
	padding: 15 px;
	width: auto;
	height: 30px;
	border: 3px double #ff4d4d;
	background-color: #ffe6e6;
}

table.center {
	margin-left: auto;
	margin-right: auto;
}

table.display th td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px;
	text-align: left;
}

th, td {
	//padding: 5px;
	//text-align: left;
}
</style>
<html>
<head>
<script type="text/javascript">
function pkclose() {
	document.Edit_Document.identification.value = "ninth";
	document.getElementById("Edit_Document").submit();
}

</script>
</head>

<body>
	<%

String name=(String)session.getAttribute("user_name");
String mail_status=(String)session.getAttribute("MailStatus"); 

%>
	<div class="absolute" style="font-weight: bold">
		<h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Mail/SMS Alerts]
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>
		<h8> <font style="color: red; font-weight: normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font>
		<font style="color: #3333cc; font-weight: normal">:&nbsp;<%=name %>&nbsp;&nbsp;&nbsp;
		</font></h8>

	</div>
	<br>
	<br>
	<br>

	<form align="center" style="width: 700px; margin-left: 200px;"
		name="Edit_Document" id="Edit_Document" action="">
		<br> <br> <br> <INPUT TYPE="HIDDEN"
			NAME="identification"> <INPUT TYPE="HIDDEN"
			NAME="assigneddays"> <INPUT TYPE="HIDDEN" NAME="assigneduser">
		<INPUT TYPE="HIDDEN" NAME="assigneduser1"> <INPUT
			TYPE="HIDDEN" NAME="username">
		<%
	if (mail_status.equalsIgnoreCase("1")) {
			%>

		<div id="dialogidpk34" style="display: inline;" align="center" >
			<h4>
				You are in Auto Mode setting. To change to Manual Mode,
				contact your Local Admin.<br> <br>
			</h4>
			<button id="cancle" class="btn btn-primary"
				onclick="pkclose();">OK</button>
		</div>
		<% 
			} else {
			%>


		<c:if test="${param.identification == null}">

			<table class="table table-hover table-bordered" class="display"
				style="background-color: #F0FFFF">
				<thead>
					<tr class="success">
						<td width="180px"><center><b>Officer</b></center></td>
						<td><b>Action</b></td>
						<td width="250px"><center><b>Documents Pending in </b></center></td>
						<td><center><b>Last Reminder</b></center></td>
						<td width="150px"><center><b>Delay in Days</b></center></td>
						<td><center><b>Action</b></center></td>
					</center></tr>
				</thead>
				<tr></tr>
				<tbody id="people">
					<% 
				Connection conn = null;
				ResultSet rsm=null;
				String res1="",res2="",res3="",res4="";
				String ldate = null;
				try {
					String username=null,position = null, unit=null;
					Context initCtx = new InitialContext();
					Context envCtx = (Context) initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
					
					conn = ds.getConnection();
				String sql3 = "select * from xx_mailaction where User_name='"+name+"'";
				PreparedStatement ps1 = conn.prepareStatement(sql3);
				ResultSet rs1 = ps1.executeQuery();

				while (rs1.next()) {
					unit = rs1.getString("Unit");
					position = rs1.getString("Position");
					
					
				if(position.equalsIgnoreCase("GM") && unit.equalsIgnoreCase("Division")||(unit.equalsIgnoreCase("Both"))){
					ldate = rs1.getString("CurrentTime");
					SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
					Date result1 = formater.parse(ldate);
					SimpleDateFormat AppDateFormat = new SimpleDateFormat("dd/MM/yyyy");

					 res2 =AppDateFormat.format(result1);
				}
				else if(position.equalsIgnoreCase("GM") && (unit.equalsIgnoreCase("Headquarter") ||(unit.equalsIgnoreCase("Both")))){
	ldate = rs1.getString("CurrentTime");
	SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
	Date result11 = formater.parse(ldate);
	SimpleDateFormat AppDateFormat = new SimpleDateFormat("dd/MM/yyyy");

	 res1 =AppDateFormat.format(result11);
				}
else if(position.equalsIgnoreCase("DRM") && unit.equalsIgnoreCase("Division")){
	ldate = rs1.getString("CurrentTime");
	SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
	Date result1 = formater.parse(ldate);
	SimpleDateFormat AppDateFormat = new SimpleDateFormat("dd/MM/yyyy");

	 res4 =AppDateFormat.format(result1);
				}

else if(position.equalsIgnoreCase("Railways") && unit.equalsIgnoreCase("MOR")){    
	
	ldate = rs1.getString("CurrentTime");
	SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
	Date result1 = formater.parse(ldate);
	SimpleDateFormat AppDateFormat = new SimpleDateFormat("dd/MM/yyyy");

	 res3 =AppDateFormat.format(result1);
}					
	
}
				
				}catch(Exception e){
					e.printStackTrace();
				} finally {
				    try { conn.close(); } catch (Exception e) { /* ignored */ }
				} 
				
				
	%>
					<tr>
						<td width="200px"">	<center><h8>GM </h8>	</center></td>
						<td><center>
								<input type='checkbox' class="Blocked" name='GM' id='GM' />
							</center> <br> 
							<center>
								<input type='checkbox' class="Blocked1" name='GMDivision'
									id='GMDivision' />
							</center></td>
						<td width="180px"">	<center>HQ <br><br>Division	</center></td>
						<td><%=res1 %> <br> <br> <%=res2 %></td>
						<td><center><input type="number" id="GMdays" class="textbox"
							name="GMdays" min="1" style="width: 80px" disabled><BR>
							<br> <input type="number" id="GMdaysdivision"
							class="textbox1" name="GMdaysdivision" min="1"
							style="width: 80px" disabled></center></td>
						<td><center><input type="button" class="submit btn btn-primary"
							id="gmdays" value="Send Alerts" onclick="GMdays1('GM','<%=name %>');" /></center></td>
					</tr>
					<tr>
						<td><h8>
							<p id="name">	<center>DRM	</center>
							</h8></td>
						<td><center>
								<input type='checkbox' class="Blocked" name='DRM' id='DRM' />
							</center></td>
						<td>	<center>Division</center></td>
						<td><%=res4 %></td>
						<td>	<center><input type="number" id="DRMdays" class="textbox"
							name="DRMdays" min="1" style="width: 80px" disabled>	</center></td>
						<td>	<center><input type="button" class="submit btn btn-primary"
							id="drmdays" value="Send Alerts"
							onclick="DRMdays1('DRM','Division','<%=name %>');" />	</center></td>
					</tr>

					<tr>
						<td width="200px""><h8>	<center>Other Railway Users	</center></h8></td>
						<td><center>
								<input type='checkbox' class="Blocked" name='railways'
									id='railways' />
							</center></td>
						<td>	<center>HQ & Division	</center></td>
						<td><%=res3 %></td>
						<td>	<center><input type="number" id="Railwaydays" class="textbox"
							name="Railwaydays" min="1" style="width: 80px" disabled>	</center></td>
						<td>	<center><input type="button" class="submit btn btn-primary"
							id="railwaydays" value="Send Alerts"
							onclick="Railwaydays1('<%=name %>');" />	</center></td>
					</tr>
				</tbody>
			</table>


			<div id="dialogid" style="display: none" align="center">
				<br> Please Fill Complete data<br> <br>
				<button id="cancel" class="btn btn-primary"
					onclick="$j('#dialogid').dialog('close');">OK</button>
			</div>
			<br>
			<br>


		</c:if>
		<%
	}

	%>


		<c:if test="${param.identification!= null}">
			<%
			String identification = request.getParameter("identification");
			if (!identification.equalsIgnoreCase("ninth")) {
				String Division=null,userid=null,divisionname=null,assignedto1=null,GMDays=null,GMDivision=null;
								String result = null, docid1 = null;
								String username1 = request.getParameter("username");    // Headquarter ----division
								String daysofapproval1 = request.getParameter("assigneddays");  // NO Of days filled---------------
								String officer = request.getParameter("assigneduser");     // GM  ---DRM  
								String MainUser = request.getParameter("assigneduser1");    // logged in user details  cpm/secunderabd
								System.out.println("username1         "+username1);
								System.out.println("daysofapproval1         "+daysofapproval1);
								System.out.println("officer         "+officer);
								System.out.println("MainUser                        MainUser    "+MainUser);
						if(officer.equalsIgnoreCase("Both")){
							String s=daysofapproval1;
							String[] filename = s.split("/"); 
							 GMDays=filename[0];
							 GMDivision=filename[1];
						System.out.println("Coming inside here"+GMDays  +"  division   "+GMDivision);
							
								}
								else if(officer.equalsIgnoreCase("Division")){
							String s=daysofapproval1;
							
							 GMDays=s;
							 GMDivision="99999";

							
								}
								else if(officer.equalsIgnoreCase("Headquarter")){
							String s=daysofapproval1;
							
							 GMDays="99999";
							 GMDivision=s;

							
								}
								
								
								int data = 0;
								String  assignedto = null, supervisorid=null, supervisorname = null, documentid = null, designationid = null, Department_id = null;
								String documentname = null, divn=null, project1=null, assemail=null, div_name=null, documenttype = null, day1 = null, drmmail=null;
								Date availabledate1 = null;
								String pendingfrm1 = null, addedby = null, mainuser = null;
								PreparedStatement inps1 = null, inps3 = null, ps = null;
								ArrayList addedbyall = new ArrayList();
								ArrayList addedbyname = new ArrayList();
								ArrayList divname = new ArrayList();
								
								//Set division1 = new HashSet();
								Set asemail = new HashSet();
								ArrayList docid = new ArrayList();
								ArrayList supervisor = new ArrayList();
								
								ArrayList documentname1 = new ArrayList();
								Set docid11 = new HashSet();
								Set division = new HashSet();
								Set user1 = new HashSet();
								Set user2 = new HashSet();
								ArrayList days = new ArrayList();
								ArrayList date = new ArrayList();
								Set drmdata = new HashSet();
								ArrayList Zonename = new ArrayList();
								Set desigid = new HashSet();
								Set departid = new HashSet();
								ArrayList doctype = new ArrayList();
								//ArrayList<String> documentname1 = new ArrayList<String>();
								ArrayList<String> documentnumber1 = new ArrayList<String>();
								ArrayList<String> doctype1 = new ArrayList<String>();
								//Set docid11 = new HashSet();
								ArrayList division1 = new ArrayList();
								ArrayList<String> projname = new ArrayList<String>();
								PreparedStatement ps2 = null, hierPS = null, ps11 = null, inps = null;
								String desigid1 = null,supname1=null,supname11 =null, contactno = null,divisionid =null, designame = null, desigfinal = null, depfinal = null, divid1 = null, depid = null, desigidfinal = null, supemail = null, depm = null, divm = null;

								String supervisioremail =null;
								Connection con = null;
									Statement stmt1 = null;
									ResultSet rs11 = null, rs = null, rs1 = null;
									PreparedStatement ps1 = null,ps11_1=null;
									try {
										Context initCtx = new InitialContext();
										Context envCtx = (Context) initCtx.lookup("java:comp/env");
										DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

										con = ds.getConnection();
						String sql = "select * from xx_user_master where User_name='"+MainUser+"'";
										
										ps1 = con.prepareStatement(sql);
										rs = ps1.executeQuery();
										while (rs.next()) {
											userid = rs.getString("User_ID");
											supervisioremail=rs.getString("Email_Id");
											
										}
									if(!officer.equalsIgnoreCase("MOR"))	{
										if(officer.equalsIgnoreCase("DRM")){
										String sql7 = "select distinct a.Division, d.User_name, d.Email_Id, d.Contact_No, c.Designation_name, d.Department_id, a.zone, d.Division_Id from xx_document_mapping a, xx_divisions_map b,  xx_designation_mapping c, xx_user_master d where a.Division=b.Division_Name and b.Ext_Zone_Id = d.Zone_ID and b.Division_Id = d.Division_ID  and c.Type = d.Type and d.Department_id = c.Department_id and c.designation_id=d.Designation_Id and c.designation_name='DRM' and d.Type='MOR' and a.Forwarded='yes' and a.Submitted_by="+userid;
										//String assignedto1=null;
												ResultSet rs7 = null;
												try {
												//	String desigid1 = null, contactno = null, designame = null, desigfinal = null, depfinal = null, divid1 = null, depid = null, desigidfinal = null, supemail = null, depm = null, divm = null;
													Statement st = con.createStatement();
													rs7 = st.executeQuery(sql7);
													int p1=1;
													while (rs7.next()) {
														div_name = rs7.getString("Division");
														drmmail = rs7.getString("Email_Id");
														//departmentid = rs7.getString("Department_id");
														divm = rs7.getString("Division_ID");
														contactno = rs7.getString("Contact_No");
														//String supname2=rs7.getString("User_name");
														supname11="DRM/"+div_name;
														System.out.println("to "+supname11+" User email id......"+supemail);
														int i=0;
																		// here------------------------------------
						try {
							//String assemail=null, project1=null; 
							String sqldoc1 = "select q1.*,q2.Data,q3.*  from (SELECT *,DateDIFF(CURDATE(),Date_of_Submission) AS dayssince from xx_document_mapping ) AS q1,(select Document_id,sum(AssignedDays) AS Data from xx_approval_workflow Group by(Document_id)) As q2,(SELECT * from xx_approval_workflow where Action='N') AS q3,xx_user_master usr where q1.Document_Map_ID=q2.Document_id and q1.Document_Map_ID=q3.Document_id and  (q1.dayssince - q2.data-"+daysofapproval1+") > 0 and usr.User_Name=q3.Assigned_To and usr.MailStatus='1' and usr.Division_ID="+divm+" and Submitted_by="+userid;
							
							Statement stdoc1 = con.createStatement();
							
							// execute the query, and get a java resultset
							ResultSet rsdoc1 = stdoc1.executeQuery(sqldoc1);
							while (rsdoc1.next()) {
								//addedby = rsdoc1.getString("Added_byUser");
								assignedto = rsdoc1.getString("Assigned_To");
								availabledate1 = rsdoc1.getDate("CurrentDate");
								supervisorid = rsdoc1.getString("Added_byUser");
								documentid = rsdoc1.getString("Document_id");
								//documentnumber = rsdoc1.getString("Document_Number");
								documentname = rsdoc1.getString("Document_Name");
								documenttype = rsdoc1.getString("Document_Type");
								//documentnumber1.add(documentnumber);
								documentname1.add(documentname);
								doctype1.add(documenttype);
								day1 = rsdoc1.getString("dayssince");
								data = rsdoc1.getInt("Data");
								docid11.add(documentid);
								// division1.add(DivisionName);
								//addedbyname.add(addedby);
								addedbyall.add(assignedto);
								days.add(day1);
								i++;
									pendingfrm1 = new SimpleDateFormat("dd/MM/yyyy")
											.format(availabledate1);
									date.add(pendingfrm1);
									String sql71 = "select * from xx_user_master where User_ID="
											+ supervisorid + "";

									inps3 = con.prepareStatement(sql71);
									ResultSet rs71 = inps3.executeQuery(sql71);
									while (rs71.next()) {
										assemail = rs71.getString("Email_Id");
										supervisorname = rs71.getString("User_Name");
										divisionid = rs71.getString("Division_ID");
										designationid = rs71.getString("Designation_Id");
										Department_id = rs71.getString("Department_id");
										desigid.add(designationid);
										supervisor.add(supervisorname);
										departid.add(Department_id);
										asemail.add(assemail);
									}
							}
							if (i>0) {
							String plcCSV1 = docid11.toString().replace("[", "(")
									.replace("]", ")");
							System.out.println("docid"+plcCSV1);
							String sql1 = "select a.Document_Map_ID, a.Document_Name,b.Project from xx_document_mapping a, xx_projectattributes_master b where a.Project_ID = b.Project_ID and a.Document_Map_ID IN "
									+ plcCSV1 + " ";
							
							Statement stdoc11 = con.createStatement();
							ResultSet rs14 = stdoc11.executeQuery(sql1);

							while (rs14.next()) {
								project1 = rs14.getString("Project");
								projname.add(project1);
											}
							}
								} catch (Exception e) {
							e.printStackTrace();
								}
								System.out.println("no" + i);
							if (i>0) {		
								StringBuilder buf = new StringBuilder();
								buf.append("<table width='600px' align='center' border='1px gray' cellpadding='5' cellspacing='0' style='border:1px gray;'>"
								+ "<tr>" + "<th>SNo</th>" + "<th>Project Name</th>" + "<th>Document Type</th>"
								+ "<th>Document Name</th>" + "<th>Currently With</th>" + "<th>Pending Since</th>"
								+ "<th>Under Approval Since (Days)</th>" + "</tr>");
								int p = 1;
								System.out.println("Document size--vvv-" + docid11.size());
								for (int k = 0; k < docid11.size(); k++) {
							buf.append("<tr><td>").append(p).append("</td><td>")
									.append(projname.get(k)).append("</td><td>")
									.append(doctype1.get(k)).append("</td><td>")
									.append(documentname1.get(k)).append("</td><td>")
									.append(addedbyall.get(k)).append("</td><td>")
									.append(date.get(k)).append("</td></td>")
									.append("</td><td style='text-align:center;'>")
									.append(days.get(k)).append("</td></tr>");
							p++;
								}
								buf.append("</table>");
								String html = buf.toString();
								System.out.println("string" + html+" from"+MainUser);
								doctype1.clear();
								docid.clear();
								projname.clear();
								supervisor.clear();
								addedbyall.clear();
								days.clear();
								docid11.clear();
								documentname1.clear();
								date.clear();
								desigid.clear();
								departid.clear();
								
								final String to = supervisioremail;

								final String subject = "RVNL DOCUMENT PORTAL";

								final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+supname11.toUpperCase()+"</b> <br><br>The Position of Documents/Drawings submitted by <b><u>"+MainUser+"</b></u> which are pending for approval in the division with a delay of more than <b>"+daysofapproval1+" days </b> is as under;<br><br> "
								+ html
								+ "<br>May Please look into.<br><br><br><span style='color:brown;  font-size:20px; font-style:italic;'><b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
								
								// Sender's email ID and password needs to be mentioned
								final String from = "indiarvnl@gmail.com";
								final String pass = "vsam3WSCJAIw4cj7";

								// Defining the gmail host
								String host = "smtp-relay.sendinblue.com";
								String ccdata = asemail.toString().replace("[", "").replace("]", "");
								 final String cc = ccdata;
								 asemail.clear();
								 System.out.println("CC mail id-----"+ccdata);
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
								Session mailSession = Session.getInstance(props,
								new javax.mail.Authenticator() {
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
							message.addRecipient(Message.RecipientType.TO, new InternetAddress(
									to));
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
								System.out.println("result to check message of email----->" + result);

								try {
							// Construct data
							// contact number supervisor------contact_No_sup
							// contact number sender ------------- supcontact

							String user = "username=" + "indiarvnl@gmail.com";
							String hash = "&hash="
									+ "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
							String message = "&message="
									+ "Please check your e-mail ("+supervisioremail+") for the list of pending documents of "+MainUser+".\n\nRVNL Document Portal";
							String sender = "&sender=" + "RPDAMS";
							String numbers = "&numbers=" + "" + contactno + "";

							// Send data
							HttpURLConnection connsms = (HttpURLConnection) new java.net.URL(
									"http://api.textlocal.in/send/?").openConnection();

							String data1 = user + hash + numbers + message + sender;

							connsms.setDoOutput(true);
							connsms.setRequestMethod("POST");
							connsms.setRequestProperty("Content-Length",
									Integer.toString(data1.length()));
							connsms.getOutputStream().write(data1.getBytes("UTF-8"));
							final BufferedReader rd = new BufferedReader(new InputStreamReader(
									connsms.getInputStream()));
							final StringBuffer stringBuffer = new StringBuffer();
							String line;
							while ((line = rd.readLine()) != null) {
								stringBuffer.append(line);
							}
							rd.close();
							//con.close();
							System.out.println("Message sent successfully");
							// return stringBuffer.toString();
								} catch (Exception e) {
							System.out.println("Error SMS " + e);
							// return "Error "+e;
								}
							} else { System.out.println("No document found.... for " + supname11); }
							
								p1++;			
								}

							if (p1==1) {System.out.println("NO DRM Exists in System .............");}
											
								} catch (Exception e) {
									e.printStackTrace();
								}

										int count=0;
										Calendar calendar = Calendar.getInstance();
										  
										   java.util.Date currentDate = calendar.getTime();

										   java.sql.Date date11 = new java.sql.Date(currentDate.getTime());
										  PreparedStatement ps_select = con.prepareStatement("select count(*) from xx_mailaction where User_name='"+MainUser+"' and Position='"+officer+"' and Unit='"+username1+"'");

										   ResultSet rs_select = ps_select.executeQuery();

										   if(rs_select.next()){ 
											 
								            count = rs_select.getInt(1);
										   }   
										   System.out.println("count..."+count+MainUser+username1+officer);
										   if(count==0){
												
											   String sql1drm = "INSERT INTO xx_mailaction (Unit,Position,User_name,CurrentTime)" +
											   						             "VALUES ('"+username1+"','"+officer+"','"+MainUser+"','"+date11+"')";
											   System.out.println("updated query     ...   "+sql1drm);						 
											   PreparedStatement preparedStmt = con.prepareStatement(sql1drm);
											   // execute the preparedstatement
											   preparedStmt.executeUpdate();


										   }else{
											   
											   String sqlupdate = "UPDATE xx_mailaction SET CurrentTime='"+date11+"' where Unit='"+username1+"' and Position='"+officer+"' and User_name='"+MainUser+"' ";
											 System.out.println("update query  ...   "+sqlupdate);
											   PreparedStatement preparedStmt = con.prepareStatement(sqlupdate);
											   preparedStmt.executeUpdate();
										   }
										}
																
										else if((username1.equalsIgnoreCase("GM")) && ((officer.equalsIgnoreCase("Both")) ||(officer.equalsIgnoreCase("Division")) || (officer.equalsIgnoreCase("Headquarter") )) ){
											
											String divnamefinal=null;
											String sql7 = "select distinct a.Zone as zonename, d.User_name, d.Email_Id, d.Contact_No, c.Designation_name, d.Department_id, d.Zone_Id from xx_document_mapping a, xx_zones_master b, xx_designation_mapping c, xx_user_master d where a.Zone=b.Zone_Name and b.Zone_Id = d.Zone_ID and c.Type = d.Type and d.Department_id = c.Department_id and c.designation_id=d.Designation_Id and c.designation_name='GM' and d.Type='MOR' and a.Forwarded='yes' and a.Submitted_by="+userid+" order by Zone";

											ResultSet rs7 = null;
										
											try {
											//	String zoneid = null,supname_1=null, desigid1 = null, contactno = null, designame = null, desigfinal = null, depfinal = null, divid1 = null, depid = null, desigidfinal = null, supemail = null, depm = null, zonem = null;
												
												Statement st = con.createStatement();
												rs7 = st.executeQuery(sql7);
												int p1=1;
												while (rs7.next()) {
													String zonename = rs7.getString("zonename");
													supemail = rs7.getString("Email_Id");
													depm = rs7.getString("Department_id");
													String zonem = rs7.getString("Zone_ID");
													contactno = rs7.getString("Contact_No");
													//String supname2 = rs7.getString("User_name");
													String supname_1="GM/" + zonename;			
													// System.out.println("getting division value inside a function collection------------------------------------------------------"+division);
																		// mail code to be written
																		System.out.println("33  "+supname_1+",  "+supemail);			
																		//String msg1 = mailfunctiongm1(supemail, contactno,
																		//		depm, zonem, con,supname_1);
																	
																		p1=p1+1;
																	
																		int i=0;
																		System.out.println("Printing mail user names............"+supervisioremail);
																		
								
								//String assemail = null;
								String sqldoc1 = "select A.Document_Map_ID AS docid,A.Document_Number as docnum, A.Document_Name as docname,A.Document_Type as doctype, A.dayssince ,A.division AS divisionname,A.Zone as zonename ,A.Assigned_To,A.Added_byUser,A.CurrentDate,A.Data from (select q1.*,q2.Data,q3.*  from (SELECT *,DateDIFF(CURDATE(),Date_of_Submission) AS dayssince from xx_document_mapping ) AS q1,(select Document_id,sum(AssignedDays) AS Data from xx_approval_workflow Group by(Document_id)) As q2,(SELECT * from xx_approval_workflow where Action='N')AS q3 ,xx_user_master usr where q1.Document_Map_ID=q2.Document_id and q1.Document_Map_ID=q3.Document_id and  (q1.dayssince - q2.data-"+GMDivision+") >= 0 and usr.User_Name=q3.Assigned_To and usr.MailStatus='1' and usr.Zone_ID="
										+ zonem + " and q1.Submitted_by="+userid
										+ " and q1.division='Headquarters') AS A UNION  select B.Document_Map_ID AS docid, B.Document_Number as docnum, B.Document_Name as docname, B.Document_Type as doctype, B.dayssince,B.division as divisionname,B.zone as zonename,B.Assigned_To,B.Added_byUser as user,B.CurrentDate,B.Data from (select q1.*,q2.Data,q3.*  from (SELECT *,DateDIFF(CURDATE(),Date_of_Submission) AS dayssince from xx_document_mapping ) AS q1,(select Document_id,sum(AssignedDays) AS Data from xx_approval_workflow Group by(Document_id)) As q2,(SELECT * from xx_approval_workflow where Action='N') AS q3 ,xx_user_master usr where q1.Document_Map_ID=q2.Document_id and q1.Document_Map_ID=q3.Document_id and  (q1.dayssince - q2.data-"+GMDays+") >= 0 and usr.User_Name=q3.Assigned_To and usr.MailStatus='1' and usr.Zone_ID="
										+ zonem + " and q1.Submitted_by="+userid + " and q1.division!='Headquarters') AS B ";
								try {
								Statement stdoc1 = con.createStatement();
								// execute the query, and get a java resultset
								ResultSet rsdoc1 = stdoc1.executeQuery(sqldoc1);
								while (rsdoc1.next()) {
									addedby = rsdoc1.getString("Added_byUser");
									assignedto = rsdoc1.getString("Assigned_To");
									availabledate1 = rsdoc1.getDate("CurrentDate");
									supervisorname = rsdoc1.getString("Added_byUser");
									divn = rsdoc1.getString("divisionname");
									documentid = rsdoc1.getString("docid");
									//documentnumber = rsdoc1.getString("docnum");
									documentname = rsdoc1.getString("docname");
									documenttype = rsdoc1.getString("doctype");
									//documentnumber1.add(documentnumber);
									documentname1.add(documentname);
									doctype1.add(documenttype);
									day1 = rsdoc1.getString("dayssince");
									data = rsdoc1.getInt("Data");
									docid11.add(documentid);
									division1.add(divn);
									addedbyname.add(addedby);
									addedbyall.add(assignedto);
									days.add(day1);
									i++;
									String sql2 = "select * from xx_user_master where User_ID='"
											+ supervisorname + "'";
									// System.out.println("first inside NEW-------------"+sql2);
									PreparedStatement ps21 = con.prepareStatement(sql2);
									ResultSet rs112 = ps21.executeQuery();

									while (rs112.next()) {

										mainuser = rs112.getString("User_name");
										supervisor.add(mainuser);
										assemail = rs112.getString("Email_Id");
										divisionid = rs112.getString("Division_ID");
										designationid = rs112.getString("Designation_Id");
										Department_id = rs112.getString("Department_id");
										desigid.add(designationid);
										departid.add(Department_id);
										asemail.add(assemail);
									
									}

									pendingfrm1 = new SimpleDateFormat("dd/MM/yyyy")
											.format(availabledate1);
									date.add(pendingfrm1);
									}
								if (i>0) {
								String plcCSV1 = docid11.toString().replace("[", "(")
										.replace("]", ")");
								String sql1 = "select a.Document_Map_ID, a.Document_Name,b.Project from xx_document_mapping a, xx_projectattributes_master b where a.Project_ID = b.Project_ID and a.Document_Map_ID IN "
										+ plcCSV1 + " ";
								System.out.println("first inside NEW-------------" + sql1);
								Statement stdoc11 = con.createStatement();
								ResultSet rs15 = stdoc11.executeQuery(sql1);

								while (rs15.next()) {
									project1 = rs15.getString("Project");
									projname.add(project1);
								}
								}
							
							System.out.println("no" + i);
					   if (i>0) {
							StringBuilder buf = new StringBuilder();
							buf.append("<table width='600px' align='center' border='1px gray' cellpadding='5' cellspacing='0' style='border:1px gray;'>"
									+ "<tr>" + "<th>SNo</th>" + "<th>Division</th>" + "<th>Project Name</th>" + "<th>Document Type</th>"
									+ "<th>Document Name</th>" + "<th>Submitted By</th>"
									+ "<th>Currently With</th>" + "<th>Pending Since</th>"
									+ "<th>Under Approval Since (Days)</th>" + "</tr>");
							int p = 1;
							// System.out.println("Document size--vvv-" + docid11.size());
							for (int k = 0; k < docid11.size(); k++) {
								buf.append("<tr><td>").append(p).append("</td><td>")
										.append(division1.get(k)).append("</td><td>")
										.append(projname.get(k)).append("</td><td>")
										.append(doctype1.get(k)).append("</td><td>")
										.append(documentname1.get(k)).append("</td><td>")
										.append(supervisor.get(k)).append("</td><td>")
										.append(addedbyall.get(k)).append("</td></td>")
										.append(date.get(k)).append("</td></td>")
										.append("</td><td style='text-align:center;'>")
										.append(days.get(k)).append("</td></tr>");
								p++;
							}
							buf.append("</table>");
							String html = buf.toString();
							doctype1.clear();
							docid11.clear();
							projname.clear();
							supervisor.clear();
							addedbyall.clear();
							days.clear();
							docid.clear();
							documentname1.clear();
							date.clear();
							desigid.clear();
							departid.clear();
							division1.clear();
					 String msg1=null;
					 if(officer.equalsIgnoreCase("Headquarter")){
						msg1=	 "To <br>"+supname11+"<br><br>The Position of Documents/Drawings submitted by <b><u>"+MainUser+"</b></u> which are pending for approval in Zonal HQ with a delay of more than <b>"+GMDays+" days </b> is as under;<br><br> ";
						
					 } else if(officer.equalsIgnoreCase("Division")){
						 msg1="To <br>"+supname11+"<br><br>The Position of Documents/Drawings submitted by <b><u>"+MainUser+"</b></u> which are pending for approval in division(s) with a delay of more than <b>"+GMDivision+" days </b> is as under;<br><br> ";
					 } else if(officer.equalsIgnoreCase("Both")){
						 msg1="To <br>"+supname11+"<br><br>The Position of Documents/Drawings submitted by <b><u>"+MainUser+"</b></u> which are pending for approval in Zonal HQ with a delay of more than <b>"+GMDays+" days </b> and in division(s) with a delay of more than <b>"+GMDivision+" days </b> is as under;<br><br> ";
					 }	
						 
							final String to = supervisioremail;

							final String subject = "RVNL DOCUMENT PORTAL";

							final String messg = msg1 + html
									+ "<br>May Please look into.<br><br><br><span style='color:brown;  font-size:20px; font-style:italic;'><b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
							;
							System.out.println("Printing mail data--supervisioremail---"
									+ supervisioremail + "MEssage---" + messg);
							// Sender's email ID and password needs to be mentioned
							final String from = "indiarvnl@gmail.com";
							final String pass = "vsam3WSCJAIw4cj7";

							// Defining the gmail host
							String host = "smtp-relay.sendinblue.com";
							String ccdata = asemail.toString().replace("[", "").replace("]", "");
							final String cc = ccdata;
							asemail.clear();
							
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

							Session mailSession = Session.getInstance(props,
									new javax.mail.Authenticator() {
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
							message.addRecipient(Message.RecipientType.TO, new InternetAddress(
									to));
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
							System.out.println("result to check message of email----->" + result);

							try {
								// Construct data
								// contact number supervisor------contact_No_sup
								// contact number sender ------------- supcontact

								String user = "username=" + "indiarvnl@gmail.com";
								String hash = "&hash="
										+ "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
								String message = "&message="
										+ "Please check your e-mail ("+supervisioremail+") for the list of pending documents of "+MainUser+".\n\nRVNL Document Portal ";
								String sender = "&sender=" + "RPDAMS";
								String numbers = "&numbers=" + "" + contactno + "";

								// Send data
								HttpURLConnection connsms = (HttpURLConnection) new java.net.URL(
										"http://api.textlocal.in/send/?").openConnection();

								String data1 = user + hash + numbers + message + sender;

								connsms.setDoOutput(true);
								connsms.setRequestMethod("POST");
								connsms.setRequestProperty("Content-Length",
										Integer.toString(data1.length()));
								connsms.getOutputStream().write(data1.getBytes("UTF-8"));
								final BufferedReader rd = new BufferedReader(new InputStreamReader(
										connsms.getInputStream()));
								final StringBuffer stringBuffer = new StringBuffer();
								String line;
								while ((line = rd.readLine()) != null) {
									stringBuffer.append(line);
								}
								rd.close();
								System.out.println("Message sent successfully");
								// return stringBuffer.toString();
							} catch (Exception e) {
								System.out.println("Error SMS " + e);
								// return "Error "+e;
							}
					   
							System.out.println("Message sent successfully");
					  } else { System.out.println("No document found.... for " + supname11); }
					 } catch (Exception e) {e.printStackTrace();
					 }
							}
										if (p1==1) {System.out.println("NO GM Exists in System .............");
																}

													} catch (Exception e) {
														e.printStackTrace();
													}
												
												int n=0; 
												String position1=null;
												if (officer.equalsIgnoreCase("both")) {n=2;} else {n=1;}
													for (int i=0; i<n;i++){
														if (officer.equalsIgnoreCase("both") && i==0) {
															position1="Headquarter";	
														} else if (officer.equalsIgnoreCase("both") && i==1) {
															position1="Division";
														} else {position1=officer;	}
															
														int count=0;
														Calendar calendar = Calendar.getInstance();
														  
														   java.util.Date currentDate = calendar.getTime();

														   java.sql.Date date11 = new java.sql.Date(currentDate.getTime());
														  PreparedStatement ps_select = con.prepareStatement("select count(*) from xx_mailaction where User_name='"+MainUser+"' and Position='"+username1+"' and Unit='"+ position1+"'");

														   ResultSet rs_select = ps_select.executeQuery();

														   if(rs_select.next()){ 
															 
												            count = rs_select.getInt(1);
														   }   
														   if(count==0){
																
															   String sql1drm = "INSERT INTO xx_mailaction (Unit,Position,User_name,CurrentTime)" +
															   						             "VALUES ('"+position1+"','"+username1+"','"+MainUser+"','"+date11+"')";
															   System.out.println("updated query     ...   "+sql1drm);						 
															   PreparedStatement preparedStmt = con.prepareStatement(sql1drm);
															   // execute the preparedstatement
															   preparedStmt.executeUpdate();


														   }else{
															   
															   String sqlupdate = "UPDATE xx_mailaction SET CurrentTime='"+date11+"' where Unit='"+position1+"' and Position='"+username1+"' and User_name='"+MainUser+"' ";
															   System.out.println("update query  ...   "+sqlupdate);
															   PreparedStatement preparedStmt = con.prepareStatement(sqlupdate);
															   preparedStmt.executeUpdate();
														   }
													}
													
												
												
										}
										
									}else{ 
										// Railway User Part starts from here-----------------------------------			
										

										try {

										Statement selectStmt = null;
										String pendingdays=null, pendingmail = null, supermobile = null, pendingphone = null;
										String supermail = null;
										String sql11 = "select Distinct dep.Assigned_To, usr.Email_Id, usr.Contact_No from xx_approval_workflow dep ,xx_user_master usr where usr.User_name = dep.Assigned_To and Action='N' and (DATEDIFF(CURDATE(),dep.CurrentDate) - dep.AssignedDays-"+daysofapproval1+") >= 0 and usr.MailStatus ='1' and usr.Type='MOR' and dep.Added_byUser="
										+ userid + " order by Assigned_To";
										//System.out.println("00111"+sql11);
										int p1 = 0;
										inps=con.prepareStatement(sql11);
										ResultSet rs8 = inps.executeQuery(sql11);
										while(rs8.next()){
										assignedto1=rs8.getString(1);
										System.out.println("To :"+assignedto1);
										String supmail = rs8.getString(2);
										contactno = rs8.getString(3);
										//   	mailfunction(assignedto, email1, contactno1, dayname, con);
										// TODO Auto-generated catch block
										String sql12 = "select usr.User_Name, usr.Email_Id, usr.Contact_No, dep.CurrentDate,dep.Document_id,usr.MailStatus, dmap.Document_Name, dmap.Document_Type, proj.Project, (DATEDIFF(CURDATE(),dep.CurrentDate) - dep.AssignedDays) as pendingdays from xx_approval_workflow dep,xx_user_master usr, xx_document_mapping dmap, xx_projectattributes_master proj where proj.Project_ID = dmap.Project_ID and dep.Document_id=dmap.Document_Map_ID and usr.User_Id = dep.Added_byUser and dep.Action='N' and (DATEDIFF(CURDATE(),dep.CurrentDate) - dep.AssignedDays-"+daysofapproval1+") >= 0 and usr.MailStatus ='0' and dep.Added_byUser="
										+ userid + " and dep.Assigned_To='" + assignedto1 + "' order by pendingdays desc";
										//System.out.println("00222"+sql12);
										StringBuilder buf = new StringBuilder();buf.append(""+""+"<table width='600px' align='center' border='1px gray' cellpadding='5' cellspacing='0' style='border:1px gray;'>"+"<tr>"+"<th>SNo</th>"+"<th>Project Name</th>"+"<th>Document Type</th>"+"<th>Document Name</th>"+"<th>Submitted By</th>"+"<th>Pending Since</th>"+"<th>Days Overdue</th>"+"</tr>");
										int p = 1;
										inps=con.prepareStatement(sql12);
										ResultSet rs2 = inps.executeQuery(sql12);
										while(rs2.next()){
										addedby=rs2.getString(1);
										assemail=rs2.getString(2);
										availabledate1=rs2.getDate(4);
										documentname=rs2.getString(7);
										documenttype=rs2.getString(8);
										project1=rs2.getString(9);
										pendingdays=rs2.getString(10);
										pendingfrm1=new SimpleDateFormat("dd/MM/yyyy").format(availabledate1);
										
										buf.append("<tr><td>").append(p).append("</td><td>")
										.append(project1).append("</td><td>")
										.append(documenttype).append("</td><td>")
										.append(documentname).append("</td><td>")
										.append(addedby).append("</td><td>").append(pendingfrm1)
										.append("</td></td>").append("</td><td style='text-align:center;'>")
										.append(pendingdays).append("</td></tr>");
										p++;
										}
										buf.append("</table>"+""+"");
										
										if(p>1){
										String html = buf.toString();	 
										String mesg1 = "<br><br>The Position of Documents/Drawings submitted by <b><u>"+MainUser+"/RVNL</b></u> which are pending for your approval and having delay of more than <b>"+daysofapproval1+" days </b> is as under;<br><br> "
										+ html + "<br>May Please look into. <br><br><br><br> <span style='color:brown; font-size:20px; font-style:italic;'<b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";

										final String to = supmail;
										final String subject = "RVNL DOCUMENT PORTAL";
										final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+assignedto1.toUpperCase()+" </b>" + mesg1;

										// Sender's email ID and password needs to be mentioned
										final String from = "indiarvnl@gmail.com";
										final String pass = "vsam3WSCJAIw4cj7";
										//String ccdata = asemail.toString().replace("[", "").replace("]", "");
										String ccdata = assemail;
										final String cc = ccdata;
										asemail.clear();
										// Defining the gmail host
										String host = "smtp-relay.sendinblue.com";

										// Creating Properties object
										Properties props = new Properties();

										// Defining properties
										props.put("mail.smtp.starttls.enable","true");props.put("mail.smtp.host",host);props.put("mail.smtp.user",from);props.put("mail.smtp.password",pass);props.put("mail.smtp.port","587");props.put("mail.smtp.auth","true");

										// Authorized the Session object.
										Session mailSession=Session.getInstance(props,new javax.mail.Authenticator(){@Override protected javax.mail.PasswordAuthentication getPasswordAuthentication(){return new PasswordAuthentication(from,pass);}});

										try{
										// Create a default MimeMessage object.
										MimeMessage message = new MimeMessage(mailSession);
										// Set From: header field of the header.
										message.setFrom(new InternetAddress(from));
										// Set To: header field of the header.
										message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));message.setRecipients(Message.RecipientType.CC,cc);
										// Set Subject: header field
										message.setSubject(subject);
										// Now set the actual message
										message.setText(messg);
										// Send message
										Transport.send(message);
										result="Your mail sent successfully.... to: "+assignedto1+ccdata;

										Thread.sleep(5000);
										}catch(
										MessagingException mex){mex.printStackTrace();result="Error: unable to send mail....";}
										System.out.println("result to check message of email----->"+result);
										// Mail code ends here
										// SMS code

										try{
										// Construct data
										// contact number supervisor------contact_No_sup
										// contact number sender ------------- supcontact

										String user = "username=" + "indiarvnl@gmail.com";
										String hash = "&hash=" + "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
										String message = "&message="
										+ "Please check your e-mail ("+ supmail +") for the list of pending documents.\n\n RVNL Document Portal ";
										String sender = "&sender=" + "RPDAMS";
										String numbers = "&numbers=" + "" + contactno + "";

										// Send data
										HttpURLConnection connsms = (HttpURLConnection) new java.net.URL("http://api.textlocal.in/send/?").openConnection();

										String data2 = user + hash + numbers + message + sender;

										connsms.setDoOutput(true);connsms.setRequestMethod("POST");connsms.setRequestProperty("Content-Length",Integer.toString(data2.length()));connsms.getOutputStream().write(data2.getBytes("UTF-8"));
										final BufferedReader rd = new BufferedReader(new InputStreamReader(connsms.getInputStream()));
										final StringBuffer stringBuffer = new StringBuffer();
										String line;
										while((line=rd.readLine())!=null){
											stringBuffer.append(line);
											}
										rd.close();
										System.out.println("Message sent successfully...."+data2);
										// return stringBuffer.toString();
										}catch(Exception e){System.out.println("Error SMS "+e);
										// return "Error "+e;
										}

										}else{
																		System.out
																				.println("No document found.... for "
																						+ assignedto1);
																	}
										p1++;
																}
										                    
																if (p1 == 0) {
																	System.out
																			.println("No matching document (for which mails are to be sent) exists in System .............");
																} else {
																	
																	int count = 0;
																	Calendar calendar = Calendar.getInstance();

																	java.util.Date currentDate2 = calendar.getTime();

																	java.sql.Date date14 = new java.sql.Date(currentDate2.getTime());
																	PreparedStatement ps_select = con.prepareStatement("select count(*) from xx_mailaction where User_name='" + MainUser
																	+ "' and Position='" + username1 + "' and Unit='" + officer + "'");

																	ResultSet rs_select = ps_select.executeQuery();

																	if(rs_select.next()){

																	count=rs_select.getInt(1);
																	}
																	if(count==0){

																	String sql2drm = "INSERT INTO xx_mailaction (Unit,Position,User_name,CurrentTime)" + "VALUES ('MOR','Railways','"
																	+ MainUser + "','" + date14 + "')";System.out.println("updated query     ...   "+sql2drm);
																	PreparedStatement preparedStmt1 = con.prepareStatement(sql2drm);
																	// execute the preparedstatement
																	preparedStmt1.executeUpdate();

																	}else{

																	String sqlupdate = "UPDATE xx_mailaction SET CurrentTime='" + date14
																	+ "' where Unit='MOR' and Position='Railways' and User_name='" + MainUser + "' ";
																	PreparedStatement preparedStmt1 = con.prepareStatement(sqlupdate);preparedStmt1.executeUpdate();
																	}	
															}

															} catch (Exception e) {
																e.printStackTrace();
															}								
									
									
									
									
									
									
									
									
									}
			}catch(Exception e){e.printStackTrace();}finally{con.close();}
		
			%>
			<div class="alert alert-success" align="center"
				style="margin: 112px 0px 0px 0px;">
				<strong>Success!</strong> Mail Sent Successfully By!
				<%=name%>. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-primary"
					onclick="location.href='ManualMail.jsp'">Want to Mails to
					Other Officer !</button>
			</div>
<%
} else { 
	%>
	<script>
	window.location.href='NewIndex.jsp';
	</script>
	<%
	}
			%>
		</c:if>
	</form>

	<script type="text/javascript">
		var $j = jQuery.noConflict();
		$('.Blocked').change(
				function() {
					$(this).parents("tr:eq(0)").find(".textbox").prop(
							"disabled", !this.checked).val('');
					;
				});
		$('.Blocked1').change(
				function() {
					$(this).parents("tr:eq(0)").find(".textbox1").prop(
							"disabled", !this.checked).val('');
					;
				});
	</script>
</body>
<br><br><br><br><br><br>

		      <%@include file="included/Newfooter.jsp" %>

</html>