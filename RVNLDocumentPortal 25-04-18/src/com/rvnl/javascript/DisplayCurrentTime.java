package com.rvnl.javascript;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.net.HttpURLConnection;
import java.net.URL.*;
import java.io.*;
import java.net.URLEncoder.*;
import java.io.InputStreamReader.*;
import java.net.URLConnection.*;
import java.io.OutputStreamWriter.*;

import javax.mail.PasswordAuthentication;

//import org.joda.time.Days;

import java.net.InetAddress;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

import java.text.*;
import java.util.*;

//import org.joda.time.DateTime;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.apache.log4j.Logger;

public class DisplayCurrentTime implements Job {
	Calendar c;
	Date d;
	SimpleDateFormat sdf;
	final static Logger logger = Logger.getLogger(DisplayCurrentTime.class);
	
	public DisplayCurrentTime() {
	}

	@Override
	public void execute(JobExecutionContext context)
			throws JobExecutionException {
		c = new GregorianCalendar();
		d = c.getTime();
		sdf = new SimpleDateFormat("d MMMMM yyyy - HH:mm:ss aaa");
		String msg = String.format("Job Name - %s, Current Time - %s", context
				.getJobDetail().getKey(), sdf.format(d));
		Connection con = null;
		System.out.println("Rly Users Scheduler runs here------->" + msg);
		logger.info("Rly Users Scheduler runs here------->" + msg);
		// my code starts from
		// here---------------------------------------------------------------------------------------------------
		try {
			Statement stmt = null, stmt1 = null, stmt2 = null, stmt3 = null, stmt4 = null;
			String assignedto = null, availabledate = null, supervisorname = null, mainuser = null, documentid = null, documentname = null, documenttype = null, supermail = null, supermobile = null, pendingmail = null, pendingphone = null;
			Date availabledate1 = null;
			int pendingdays = 0;
			String pendingfrm1 = null, dayname = null, sql11 = null;
			//Set<String> assignedto1 = new HashSet<String>();
			PreparedStatement ps = null, ps2 = null, hierPS = null, ps11 = null, inps = null, inps1 = null, inps2 = null;

			
			try {
				con = QuartzListener.getConnection();
			} catch (Exception e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}

			Calendar calendar = Calendar.getInstance();
			java.util.Date currentDate = calendar.getTime();

			java.sql.Date date12 = new java.sql.Date(currentDate.getTime());
			
			String query = "SELECT DAYNAME('" + date12 + "') AS days";

			// create the java statement
			Statement st = con.createStatement();

			// execute the query, and get a java resultset
			ResultSet rs1 = st.executeQuery(query);
			if (rs1.next()) {
				dayname = rs1.getString("days");
			}
			if (dayname.equalsIgnoreCase("Saturday")) {
				logger.info("Saturday..... exiting ..... ");
				System.exit(0);

			}
			if (dayname.equalsIgnoreCase("Sunday")) {
				logger.info("Sunday...... exiting .....");
				System.exit(0);

			}
			if (dayname.equalsIgnoreCase("Monday")) {
				sql11 = "select Distinct dep.Assigned_To, usr.Email_Id, usr.Contact_No from xx_approval_workflow dep ,xx_user_master usr where usr.User_name = dep.Assigned_To and Action='N' and (DATEDIFF(CURDATE(),dep.CurrentDate) - dep.AssignedDays-1) >= 0 and usr.MailStatus ='1' and usr.Type='MOR' order by Assigned_To";
			

			} else {

					sql11 = "select Distinct dep.Assigned_To, usr.Email_Id, usr.Contact_No from xx_approval_workflow dep ,xx_user_master usr where usr.User_name = dep.Assigned_To and Action='N' and (DATEDIFF(CURDATE(),dep.CurrentDate) - dep.AssignedDays-1) = 0 and usr.MailStatus ='1' order by Assigned_To";
					
				}
			int p1=0;
			inps = con.prepareStatement(sql11);
			ResultSet rs = inps.executeQuery(sql11);
			while (rs.next()) {
			//	while (rs.next()) {
				assignedto = rs.getString(1);
				String email1 = rs.getString(2);
			String contactno1 = rs.getString(3);
			   	mailfunction(assignedto, email1, contactno1, dayname, con);
            	p1++;
            	}
	
if (p1==0) {logger.info("No matching document (for which mails are to be sent) exists in System ............."); System.out.println("No matching document (for which mails are to be sent) exists in System .............");}
	

		
		} catch (Exception e) {
			e.printStackTrace();
		}
finally{
	
	try {
		con.close();
	} catch (Exception e2) {
		// TODO Auto-generated catch block
		e2.printStackTrace();
	}
}
	}

	public static void mailfunction(String assignedto1, String supmail, String contactno,
			String dayname, Connection con) throws SQLException {
		Statement stmt = null, stmt1 = null, stmt2 = null, stmt3 = null, stmt4 = null;
		String result=null, assignedto = null, addedby=null, assemail=null, availabledate = null, pendingfrm1=null, pendingdays=null, project1=null, supervisorname = null, mainuser = null, documentid = null, documentname = null, documenttype = null, supermail = null, supermobile = null, pendingmail = null, pendingphone = null;
		Date availabledate1 = null;
		Set<String> asemail = new HashSet<String>();
		
		PreparedStatement ps = null, ps2 = null, hierPS = null, ps11 = null, inps = null;
		try {
			con = QuartzListener.getConnection();
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		String sql12=null;
		if (dayname.equalsIgnoreCase("Monday")) {
			sql12 = "select usr.User_Name, usr.Email_Id, usr.Contact_No, dep.CurrentDate,dep.Document_id,usr.MailStatus, dmap.Document_Name, dmap.Document_Type, proj.Project, (DATEDIFF(CURDATE(),dep.CurrentDate) - dep.AssignedDays) as pendingdays from xx_approval_workflow dep,xx_user_master usr, xx_document_mapping dmap, xx_projectattributes_master proj where proj.Project_ID = dmap.Project_ID and dep.Document_id=dmap.Document_Map_ID and usr.User_Id = dep.Added_byUser and dep.Action='N' and (DATEDIFF(CURDATE(),dep.CurrentDate) - dep.AssignedDays-1) >= 0 and usr.MailStatus ='1' and dep.Assigned_To='"+assignedto1 +"' order by pendingdays desc";
					//"select dep.Assigned_To,dep.CurrentDate,dep.Added_byUser,dep.Document_id,usr.MailStatus from xx_approval_workflow dep ,xx_user_master usr where usr.User_name = dep.Assigned_To and Action='N' and (DATEDIFF(CURDATE(),dep.CurrentDate) - dep.AssignedDays-1) >= 0 and usr.MailStatus ='1' and Assigned_To='" + assignedto1+"'";
			//System.out.println("QUery-Monday -" + sql11);

		} else {

				sql12 = "select usr.User_Name, usr.Email_Id, usr.Contact_No, dep.CurrentDate,dep.Document_id,usr.MailStatus, dmap.Document_Name, dmap.Document_Type, proj.Project, (DATEDIFF(CURDATE(),dep.CurrentDate) - dep.AssignedDays) as pendingdays from xx_approval_workflow dep,xx_user_master usr, xx_document_mapping dmap, xx_projectattributes_master proj where proj.Project_ID = dmap.Project_ID and dep.Document_id=dmap.Document_Map_ID and usr.User_Id = dep.Added_byUser and dep.Action='N' and (DATEDIFF(CURDATE(),dep.CurrentDate) - dep.AssignedDays-1) = 0 and usr.MailStatus ='1' and dep.Assigned_To='"+assignedto1 +"' order by pendingdays desc";
						//"select dep.Assigned_To,dep.CurrentDate,dep.Added_byUser,dep.Document_id from xx_approval_workflow dep ,xx_user_master usr where usr.User_name = dep.Assigned_To and Action='N' and (DATEDIFF(CURDATE(),dep.CurrentDate) - dep.AssignedDays-1) = 0 and usr.MailStatus ='1'";
			
		}
	
		
		StringBuilder buf = new StringBuilder();
		buf.append(""
				+ ""
				+ "<table width='600px' align='center' border='1px gray' cellpadding='5' cellspacing='0' style='border:1px solid gray; font-family:Georgia; font-size:14px;'>"
				+ "<tr>" + "<th>SNo</th>" + "<th>Project Name</th>" + "<th>Document Type</th>"
				+ "<th>Document Name</th>" + "<th>Submitted By</th>"
				+ "<th>Pending Since</th>"
				+ "<th>Days Overdue</th>" + "</tr>");
		int p = 1;
		inps = con.prepareStatement(sql12);
		ResultSet rs2 = inps.executeQuery(sql12);
		while (rs2.next()) {
			addedby  = rs2.getString(1);
			assemail  = rs2.getString(2);
			availabledate1 = rs2.getDate(4);
			documentname = rs2.getString(7);
			documenttype = rs2.getString(8);
			project1 = rs2.getString(9);
			pendingdays = rs2.getString(10);
			
			pendingfrm1 = new SimpleDateFormat("dd/MM/yyyy")
					.format(availabledate1);
			asemail.add(assemail);
						
			// System.out.println("Document size--vvv-" + docid11.size());
			//for (int k = 0; k < docid11.size(); k++) {
				buf.append("<tr><td>").append(p).append("</td><td>")
						.append(project1).append("</td><td>")
						.append(documenttype).append("</td><td>")
						.append(documentname).append("</td><td>")
						.append(addedby).append("</td><td>")
						.append(pendingfrm1)
						.append("</td><td style='text-align:center;'>")
						.append(pendingdays).append("</td></tr>");
				p++;
			}
			buf.append("</table>" + "" + "");
			
	if (p>1) {
			String html = buf.toString();
			String mesg1=null;
		 if (dayname.equalsIgnoreCase("Monday")) {
			  mesg1 = " </b><br><br>Dear Sir,<br><br> The approval of the following Documents/Drawings is getting delayed at your end;<br><br> "+ html+ "<br><br>May please look into. <br><br><br><span style='color:brown; font-size:20px; font-style:italic;'<b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
	 } else {
		 mesg1 = " </b><br><br>Dear Sir,<br><br> Your approval of the following Documents/Drawings has become overdue on date;<br><br> "+ html+ "<br><br>May Please look into. <br><br><br><br>  <span style='color:brown; font-size:20px; font-style:italic;'<b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";

	 }
		final String to = supmail;

		final String subject = "RVNL DOCUMENT PORTAL - Position of Pending Documents";
		final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"
				+ assignedto1
				+ mesg1;
				
		// Sender's email ID and password needs to be mentioned
		final String from = "indiarvnl@gmail.com";
		final String pass = "vsam3WSCJAIw4cj7";
		String ccdata = asemail.toString().replace("[", "").replace("]", "");
		final String cc = ccdata;
		asemail.clear();
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
		Session mailSession = Session.getInstance(props,
				new javax.mail.Authenticator() {
					@Override
					protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
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
		System.out.println(result + assignedto1+": "+supmail+", nos of Docs = " +(p-1));
		logger.info(result + assignedto1+": "+supmail+", nos of Docs = " +(p-1));
		// Mail code ends here
		// SMS code

		try {
			// Construct data
			// contact number supervisor------contact_No_sup
			// contact number sender ------------- supcontact

			String user = "username=" + "indiarvnl@gmail.com";
			String hash = "&hash="
					+ "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
			String message = "&message=";
			if (p<3){
				message = message
						+ "Approval of "+(p-1)+" no. of document is overdue. Please check your e-mail ("+supmail+") for details.\nRVNL Document Portal";
				} else {
				message = message
						+ "Approval of "+(p-1)+" nos. of documents is overdue. Please check your e-mail ("+supmail+") for details.\nRVNL Document Portal";
				}
			
			
			String sender = "&sender=" + "RPDAMS";
			String numbers = "&numbers=" + "" + contactno + "";

			// Send data
			HttpURLConnection connsms = (HttpURLConnection) new java.net.URL(
					"http://api.textlocal.in/send/?").openConnection();

			String data = user + hash + numbers + message + sender;

			connsms.setDoOutput(true);
			connsms.setRequestMethod("POST");
			connsms.setRequestProperty("Content-Length",
					Integer.toString(data.length()));
			connsms.getOutputStream().write(data.getBytes("UTF-8"));
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
			logger.info("Error SMS " + e);
			// return "Error "+e;
		}
	}  else {logger.info("No document found.... for " + assignedto1); System.out.println("No document found.... for " + assignedto1); } 
	}
}