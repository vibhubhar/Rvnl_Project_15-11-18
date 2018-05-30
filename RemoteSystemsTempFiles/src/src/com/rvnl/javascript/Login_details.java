package com.rvnl.javascript;

import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.apache.log4j.Logger;

public class Login_details implements Job {
	Calendar c;
	Date d;
	SimpleDateFormat sdf;
	final static Logger logger = Logger.getLogger(Login_details.class);
	public Login_details() {
	}
	
	Connection con = null;
	
	@Override
	public void execute(JobExecutionContext context)
			throws JobExecutionException {

		c = new GregorianCalendar();
		d = c.getTime();
		sdf = new SimpleDateFormat("d MMMMM yyyy - HH:mm:ss aaa");
		String msg = String.format("Job Name - %s, Current Time - %s", context
				.getJobDetail().getKey(), sdf.format(d));
		logger.info("Login_Log Scheduler runs here------->" + msg);
		System.out.println("Login_Log Scheduler runs here------->" + msg);
		try {
			con = QuartzListener.getConnection();
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		try {
			
			Statement stmt1 = null;
			 stmt1 = con.createStatement();
	         String sql = "INSERT INTO xx_logins (select DATE(Last_login) as Date1, Count(if (Type='MOR',1, null)) AS Rly_Total, Count(if (Type='MOR' and Designation_Id=75,1, null)) AS Rly_DRM,Count(if (Type='MOR' and Designation_Id=115,1, null)) AS Rly_GM, Count(if (Type='RVNL',1, null)) AS RVNL_Total, Count(if (Type='RVNL' and (Role='LocalUser' or Role='System Administrator'),1, null)) AS RVNL_Admins, count(User_id) as Total_Logins from xx_user_master where DATE(Last_login) = DATE(now())  group by DATE_format(Last_login,'%d/%m/%Y') order by Last_login)";
	       	 stmt1.executeUpdate(sql); 
	       	logger.info("Today's Login Details saved to database........");
			System.out.println("Today's Login Details saved to database........");
				} catch (Exception e) {
					e.printStackTrace();
				}
	}

	
}
