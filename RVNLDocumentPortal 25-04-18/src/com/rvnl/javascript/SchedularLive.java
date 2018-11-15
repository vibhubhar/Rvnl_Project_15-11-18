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
import java.util.Properties;
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

public class SchedularLive implements Job {
	Calendar c;
	Date d;
	SimpleDateFormat sdf;
	final static Logger logger = Logger.getLogger(SchedularLive.class);

	public SchedularLive() {
	}

	String desigfinal = null, depfinal = null, daysdata = null,
			assignedto = null, pendingmail = null, pendingphone = null,
			supervisorname = null, documentid = null, divisionid = null,
			zoneid = null, designationid = null, type = null,
			Department_id = null, designame = null, supname1 = null;

	String pendingfrm1 = null, addedby = null, drmdetails = null,
			mainuser = null;
	PreparedStatement inps1 = null, inps3 = null, inps2 = null, ps = null;
	Connection con = null;
	String documentname = null, documenttype = null, day1 = null;

	Set division = new HashSet();
	Set user1 = new HashSet();

	Set user2 = new HashSet();
	ArrayList days = new ArrayList();
	ArrayList date = new ArrayList();
	Set drmdata = new HashSet();

	@Override
	public void execute(JobExecutionContext context)
			throws JobExecutionException {

		c = new GregorianCalendar();
		d = c.getTime();
		sdf = new SimpleDateFormat("d MMMMM yyyy - HH:mm:ss aaa");
		String msg = String.format("Job Name - %s, Current Time - %s", context
				.getJobDetail().getKey(), sdf.format(d));
		System.out.println("Live Scheduler runs here------->" + msg);
		logger.info("Live Scheduler runs here------->" + msg);

		try {
			con = QuartzListener.getConnection();
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

	//	String sql7 = "select distinct a.Division, d.User_name, d.Email_Id, d.Contact_No, c.Designation_name, d.Department_id, a.zone, d.Division_Id from xx_document_mapping a, xx_divisions_map b,  xx_designation_mapping c, xx_user_master d where a.Division=b.Division_Name and b.Ext_Zone_Id = d.Zone_ID and b.Division_Id = d.Division_ID  and c.Type = d.Type and d.Department_id = c.Department_id and c.designation_id=d.Designation_Id and c.designation_name='DRM' and d.Type='MOR' and a.Forwarded='yes'";
// and a.division='Sambalpur'
	//	String assignedto1=null;
	//	ResultSet rs7 = null;
		try {
			String desigid1 = null, contactno = null, designame = null, desigfinal = null, depfinal = null, divid1 = null, depid = null, desigidfinal = null, supemail = null, depm = null, divm = null;
			Statement st = con.createStatement();
			supemail="vibhubhardwaj53@gmail.com";
			contactno="+918077091456";
			supname1="GGM/P-II";
			
									// here------------------------------------
									mailfunctiondrm(supemail, contactno, depm, divm,
											con,supname1);
													
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

	//public String divisiondata(String assignedto1) throws SQLException {}

	public static void mailfunctiondrm(String supervisioremail,
			String contactno, String departmentid, String divm,
			Connection con,String supname11) throws SQLException {
				final String to = supervisioremail;

		final String subject = "RVNL DOCUMENT PORTAL - live test";

		final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+supname11+"</b><br><br>Dear Sir,<br><br>The portal is working fine..........<br><br> "+
				" <br><br><br> <span style='color:brown; font-size:20px; font-style:italic;'<b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
		
		// Sender's email ID and password needs to be mentioned
		final String from = "vibhardwaj55@gmail.com";
		final String pass = "8899403746";

		// Defining the gmail host
		String host = "smtp.gmail.com";
		String result=null;
		 final String cc = "";
		// System.out.println("CC mail id-----"+ccdata);
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
		//System.out.println(result + supname11+": "+supervisioremail+" nos of Docs = " +(p-1));
		//logger.info(result + supname11+": "+supervisioremail+" nos of Docs = " +(p-1));
		try {
			// Construct data
			// contact number supervisor------contact_No_sup
			// contact number sender ------------- supcontact

			String user = "username=" + "indiarvnl@gmail.com";
			String hash = "&hash="
					+ "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
			//String message = "&message="
		//			+ "Please check your e-mail for the list of pending documents.\nRVNL Document Portal";
			String message = "&message=";
			
				message = message
						+ "Portal is live and working fine........\nRVNL Document Portal";
			
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
			System.out.println("SMS sent successfully");
			logger.info("SMS sent successfully");
			// return stringBuffer.toString();
		} catch (Exception e) {
			System.out.println("Error SMS " + e);
			logger.info("Error SMS " + e);
			// return "Error "+e;
		}
		
	
	}
	
}