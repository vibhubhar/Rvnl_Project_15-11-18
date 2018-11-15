package com.rvnl.javascript;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;
import java.net.HttpURLConnection;
import java.io.*;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;

import java.util.*;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.apache.log4j.Logger;

public class SchedularGM implements Job {
	Calendar c;
	Date d;
	SimpleDateFormat sdf;
	final static Logger logger = Logger.getLogger(SchedularGM.class);
	public SchedularGM() {
	}

	String desigfinal = null, depfinal = null, daysdata = null,
			assignedto = null, pendingmail = null, pendingphone = null,
			supervisorname = null, documentid = null, divisionid = null,
			zoneid = null, designationid = null, type = null,
			Department_id = null, designame = null;

	String pendingfrm1 = null, addedby = null, drmdetails = null,
			mainuser = null;
	PreparedStatement inps1 = null, inps3 = null, inps2 = null, ps = null;
	Connection con = null;
	String documentname = null, documenttype = null, day1 = null;

	@Override
	public void execute(JobExecutionContext context)
			throws JobExecutionException {

		c = new GregorianCalendar();
		d = c.getTime();
		sdf = new SimpleDateFormat("d MMMMM yyyy - HH:mm:ss aaa");
		String msg = String.format("Job Name - %s, Current Time - %s", context
				.getJobDetail().getKey(), sdf.format(d));
		logger.info("GM Scheduler runs here------->" + msg);
		System.out.println("GM Scheduler runs here------->" + msg);
		try {
			con = QuartzListener.getConnection();
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

		String sql7 = "select distinct a.Zone as zonename, d.User_name, d.Email_Id, d.Contact_No, c.Designation_name, d.Department_id, d.Zone_Id from xx_document_mapping a, xx_zones_master b, xx_designation_mapping c, xx_user_master d where a.Zone=b.Zone_Name and b.Zone_Id = d.Zone_ID and c.Type = d.Type and d.Department_id = c.Department_id and c.designation_id=d.Designation_Id and c.designation_name='GM' and d.Type='MOR' and a.Forwarded='yes' order by zone";
// and a.zone='NWR'
		ResultSet rs7 = null;
		try {
			String zoneid = null,supname_1=null, desigid1 = null, contactno = null, designame = null, desigfinal = null, depfinal = null, divid1 = null, depid = null, desigidfinal = null, supemail = null, depm = null, zonem = null;
			Statement st = con.createStatement();
			rs7 = st.executeQuery(sql7);
			int p1=1;
			while (rs7.next()) {
				//while (rs7.next() && p1<2) {
				String zonename = rs7.getString("zonename");
				supemail = rs7.getString("Email_Id");
				depm = rs7.getString("Department_id");
				zonem = rs7.getString("Zone_ID");
				contactno = rs7.getString("Contact_No");
				//String supname2 = rs7.getString("User_name");
				supname_1="GM/" + zonename;			
				// System.out.println("getting division value inside a function collection------------------------------------------------------"+division);
									// mail code to be written
									//System.out.println("33  "+supname_1+",  "+supemail);			
									String msg1 = mailfunctiongm1(supemail, contactno,
											depm, zonem, con,supname_1);
								
									p1=p1+1;
								}
		
		if (p1==1) {
			logger.info("NO GM Exists in System .............");
			System.out.println("NO GM Exists in System .............");
							}

				} catch (Exception e) {
					e.printStackTrace();
				}
	}

	/*public String divisiondata(String assignedto1, String zonename)
			throws SQLException {}*/

	public static String mailfunctiongm1(String supervisioremail,
			String contactno,

		String departmentid, String zonem, Connection con,String supname11)
			throws SQLException {
		
		
		
	
		String result = null, docid1 = null;
		int data = 0, i=0;
		String divn=null,depfinal = null, assignedto = null, supervisorname = null, documentid = null, designationid = null, Department_id = null, project1=null;
		String documentnumber=null, documentname = null, documenttype = null, day1 = null, divisionid = null;
		Date availabledate1 = null;
		String pendingfrm1 = null, addedby = null, mainuser = null;
		PreparedStatement inps1 = null, inps3 = null, ps = null;
		ArrayList<String> addedbyall = new ArrayList<String>();
		ArrayList<String> addedbyname = new ArrayList<String>();
		ArrayList<String> days = new ArrayList<String>();
		ArrayList<String> division1 = new ArrayList<String>();
		Set<String> asemail = new HashSet<String>();
		ArrayList<String> docid = new ArrayList<String>();
		ArrayList<String> supervisor = new ArrayList<String>();
		ArrayList<String> date = new ArrayList<String>();
		ArrayList<String> documentname1 = new ArrayList<String>();
		ArrayList<String> documentnumber1 = new ArrayList<String>();
		ArrayList<String> doctype1 = new ArrayList<String>();
		Set<String> docid11 = new HashSet<String>();
		Set<String> desigid = new HashSet<String>();
		Set<String> departid = new HashSet<String>();
		ArrayList<String> doctype = new ArrayList<String>();
		ArrayList<String> projname = new ArrayList<String>();
		//PreparedStatement ps2 = null, hierPS = null, ps11 = null, inps = null;
			try {
			
			String assemail = null;
			String sqldoc1 = "select concat('HQ/ ',A.division) AS divisionname, A.dayssince, A.Project as project, A.PIU_Of_RVNL as PIU, A.Document_Map_ID AS docid,A.Document_Number as docnum, A.Document_Name as docname,A.Document_Type as doctype, A.Zone as zonename ,A.Assigned_To,A.Added_byUser,A.CurrentDate,A.Data from (select q1.*,q2.Data,q3.*, proj1.Project, proj1.PIU_of_RVNL  from (SELECT *,DateDIFF(CURDATE(),Date_of_Submission) AS dayssince from xx_document_mapping ) AS q1,(select Document_id,sum(AssignedDays) AS Data from xx_approval_workflow Group by(Document_id)) As q2,(SELECT * from xx_approval_workflow where Action='N' Group by(Document_id))AS q3 ,xx_user_master usr, xx_projectattributes_master proj1 where q1.Project_ID=proj1.Project_ID and q1.Document_Map_ID=q2.Document_id and q1.Document_Map_ID=q3.Document_id and  (q1.dayssince - q2.data-8) >= 0 and usr.User_Name=q3.Assigned_To and usr.MailStatus='1' and usr.Zone_ID="
					+ zonem + 
					" and usr.division_id=86) AS A  UNION  select B.division AS divisionname, B.dayssince, B.Project as project, B.PIU_Of_RVNL as PIU, B.Document_Map_ID AS docid, B.Document_Number as docnum, B.Document_Name as docname, B.Document_Type as doctype, B.zone as zonename,B.Assigned_To,B.Added_byUser as user,B.CurrentDate,B.Data from (select q1.*,q2.Data,q3.*, proj2.Project, proj2.PIU_of_RVNL   from (SELECT *,DateDIFF(CURDATE(),Date_of_Submission) AS dayssince from xx_document_mapping ) AS q1,(select Document_id,sum(AssignedDays) AS Data from xx_approval_workflow Group by(Document_id)) As q2,(SELECT * from xx_approval_workflow where Action='N') AS q3 ,xx_user_master usr, xx_projectattributes_master proj2 where q1.Project_ID=proj2.Project_ID and  q1.Document_Map_ID=q2.Document_id and q1.Document_Map_ID=q3.Document_id and  (q1.dayssince - q2.data-31) >= 0 and usr.User_Name=q3.Assigned_To and usr.MailStatus='1' and usr.Zone_ID="
					+ zonem +
					" and usr.division_id!=86) AS B  order by divisionname LIKE 'HQ%' Desc, divisionname, project, dayssince desc, doctype, docname ";
					
					
				//	"select A.Document_Map_ID AS docid,A.Document_Number as docnum, A.Document_Name as docname,A.Document_Type as doctype, A.dayssince ,Concat('HQ/',A.division) AS divisionname,A.Zone as zonename ,A.Assigned_To,A.Added_byUser,A.CurrentDate,A.Data from (select q1.*,q2.Data,q3.*  from (SELECT *,DateDIFF(CURDATE(),Date_of_Submission) AS dayssince from xx_document_mapping ) AS q1,(select Document_id,sum(AssignedDays) AS Data from xx_approval_workflow Group by(Document_id)) As q2,(SELECT * from xx_approval_workflow where Action='N' Group by(Document_id))AS q3 ,xx_user_master usr where q1.Document_Map_ID=q2.Document_id and q1.Document_Map_ID=q3.Document_id and  (q1.dayssince - q2.data-8) >= 0 and usr.User_Name=q3.Assigned_To and usr.MailStatus='1' and usr.Zone_ID="
				//	+ zonem
				//	+ " and usr.Division_Id=86) AS A UNION  select B.Document_Map_ID AS docid, B.Document_Number as docnum, B.Document_Name as docname, B.Document_Type as doctype, B.dayssince,B.division as divisionname,B.zone as zonename,B.Assigned_To,B.Added_byUser as user,B.CurrentDate,B.Data from (select q1.*,q2.Data,q3.*  from (SELECT *,DateDIFF(CURDATE(),Date_of_Submission) AS dayssince from xx_document_mapping ) AS q1,(select Document_id,sum(AssignedDays) AS Data from xx_approval_workflow Group by(Document_id)) As q2,(SELECT * from xx_approval_workflow where Action='N' Group by(Document_id)) AS q3 ,xx_user_master usr where q1.Document_Map_ID=q2.Document_id and q1.Document_Map_ID=q3.Document_id and  (q1.dayssince - q2.data-31) >= 0 and usr.User_Name=q3.Assigned_To and usr.MailStatus='1' and usr.Zone_ID="
				//	+ zonem + " and usr.Division_Id!=86) AS B";
			
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
				documentnumber = rsdoc1.getString("docnum");
				documentname = rsdoc1.getString("docname");
				documenttype = rsdoc1.getString("doctype");
				documentnumber1.add(documentnumber);
				documentname1.add(documentname);
				doctype1.add(documenttype);
				day1 = rsdoc1.getString("dayssince");
				data = rsdoc1.getInt("Data");
				docid11.add(documentid);
				division1.add(divn);
				addedbyname.add(addedby);
				addedbyall.add(assignedto);
				days.add(day1);
				project1 = rsdoc1.getString("project");
				projname.add(project1);
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
			/*
			if (i>0) {
			String plcCSV1 = docid11.toString().replace("[", "(")
					.replace("]", ")");
			String sql1 = "select a.Document_Map_ID, a.Document_Name,b.Project from xx_document_mapping a, xx_projectattributes_master b where a.Project_ID = b.Project_ID and a.Document_Map_ID IN "
					+ plcCSV1 + " ";
			
			Statement stdoc11 = con.createStatement();
			ResultSet rs11 = stdoc11.executeQuery(sql1);

			while (rs11.next()) {
				project1 = rs11.getString("Project");
				projname.add(project1);
			}
			}
			*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Doc Count: " + i);
		logger.info("Doc Count: "+i);
   if (i>0) {
		StringBuilder buf = new StringBuilder();
		buf.append("<table width='600px' align='center' border='1px gray' cellpadding='5' cellspacing='0' style='border:1px solid gray; font-family:Georgia; font-size:14px;'>"
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
					.append(addedbyall.get(k)).append("</td><td>")
					.append(date.get(k))
					.append("</td><td style='text-align:center;'>")
					.append(days.get(k)).append("</td></tr>");
			p++;
		}
		buf.append("</table>");
		String html = buf.toString();
		doctype.clear();
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

		final String to = supervisioremail;

		final String subject = "RVNL DOCUMENT PORTAL - Weekly Position";

		final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+supname11+"</b><br><br>Dear Sir,<br><br>The Position of Documents/Drawings pending for approval in HQ (with delay more than 7 days) and in divisions (with delay more than 30 days) is as under;<br><br> "+ html+ "<br><br>May please look into. <br><br><br> <span style='color:brown; font-size:20px; font-style:italic;'<b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
	
		// Sender's email ID and password needs to be mentioned
		final String from = "vibhardwaj55@gmail.com";
		final String pass = "8899403746";

		// Defining the gmail host
		String host = "smtp.gmail.com";
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
			result = "Your mail sent successfully to ....";
		} catch (MessagingException mex) {
			mex.printStackTrace();
			result = "Error: unable to send mail....";
		}
		System.out.println("result to check message of email----->" + result + " To "+supname11+": "+supervisioremail+", nos of Docs = " +(p-1));
		logger.info(result + supname11+": "+supervisioremail+", nos. of Docs = " +(p-1));
		try {
			// Construct data
			// contact number supervisor------contact_No_sup
			// contact number sender ------------- supcontact

			String user = "username=" + "indiarvnl@gmail.com";
			String hash = "&hash="
					+ "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
			//String message = "&message="
			//		+ "Please check your e-mail for the list of pending documents.\nRVNL Document Portal";
			String message = "&message=";
			if (p<3){
				message = message
					+ "Approval of "+(p-1)+" no. of document is overdue. Please check your e-mail ("+supervisioremail+") for details.\nRVNL Document Portal";
			} else {
				message = message
					+ "Approval of "+(p-1)+" nos. of documents is overdue. Please check your e-mail ("+supervisioremail+") for details.\nRVNL Document Portal";
			}
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
			System.out.println("SMS sent successfully");
			logger.info("SMS sent successfully"); 
				// return stringBuffer.toString();
		} catch (Exception e) {
			System.out.println("Error SMS " + e);
			logger.info("Error SMS "+e); 
			// return "Error "+e;
		}

		return "Message sent successfully";
	
  } else {logger.info("No document found.... for " + supname11);  System.out.println("No document found.... for " + supname11); return "";}
 } 
}