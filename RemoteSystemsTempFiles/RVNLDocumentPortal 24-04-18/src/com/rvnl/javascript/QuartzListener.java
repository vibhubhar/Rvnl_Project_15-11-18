package com.rvnl.javascript;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Date;
import javax.naming.*;
import javax.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.ee.servlet.QuartzInitializerListener;
import org.quartz.impl.StdSchedulerFactory;

@WebListener
public class QuartzListener extends QuartzInitializerListener {
 
    
	@Override
     public void contextInitialized(ServletContextEvent sce) {
        super.contextInitialized(sce);
        ServletContext ctx = sce.getServletContext();
        StdSchedulerFactory sf = (StdSchedulerFactory) ctx.getAttribute(QUARTZ_FACTORY_KEY);
        try {
          Scheduler scheduler = sf.getScheduler();
          Scheduler sched6 = sf.getScheduler();
           Scheduler sched = sf.getScheduler();
    /*       
	        Scheduler sched1 = sf.getScheduler();
	        Scheduler sched5 = sf.getScheduler(); 
	        JobDetail job3 = JobBuilder.newJob(DisplayCurrentTime.class)
	        		.withIdentity("currentTime-Job-3", "newGroup")
	        		.build();
	        	JobDetail job4= JobBuilder.newJob(SchedularDRM.class)
	        			.withIdentity("currentTime-Job-4", "newGroup")
	        			.build();
	        	JobDetail job5= JobBuilder.newJob(SchedularGM.class)
	        			.withIdentity("currentTime-Job-5", "newGroup")
	        			.build();
	        	//run every 20 seconds  EVERY DAY SCHEDULAR
	        	CronTrigger trigger3 = TriggerBuilder.newTrigger()
	                    .withIdentity("daily", "group3")
	                    .withSchedule( CronScheduleBuilder.cronSchedule( "0 37 8 ? * MON-FRI"))//Fire at 10:15am every Monday, Tuesday, Wednesday, Thursday and Friday
	                   // .withSchedule( CronScheduleBuilder.cronSchedule( "30 3 16 * * ?"))//Fire at 10:15am every Monday, Tuesday, Wednesday, Thursday and Friday
	                    .build();                                                    // Fire at 10:15am every Monday, Tuesday, Wednesday, Thursday and Friday   -- 0 15 10 ? *
	                                                                                        //RUN Only On Monday at 9 PM    (0  9  *  *  1) ///pks//"0 50 9 ? * MON-FRI"
	        	
	        CronTrigger trigger4 = TriggerBuilder.newTrigger()
	                    .withIdentity("Monday", "group4")
	                    .withSchedule( CronScheduleBuilder.cronSchedule( "0 32 8 ? * MON-FRI"))// Fire at 10:15am every Monday   0 15 10 ? * MON
	                    //.withSchedule( CronScheduleBuilder.cronSchedule( "0 3 16 * * ?"))// Fire at 10:15am every Monday   0 15 10 ? * MON
	                    .build();
	        	CronTrigger trigger5 = TriggerBuilder.newTrigger()
	                    .withIdentity("Monday", "group5")
	                    .withSchedule( CronScheduleBuilder.cronSchedule( "0 30 8  ?  *  MON-FRI")) // Fire at 10:15am every Monday  old------  (0 15 10 ? * MON-FRI)
	                    //.withSchedule( CronScheduleBuilder.cronSchedule( "30 2 16 * * ?")) // Fire at 10:15am every Monday  old------  (0 15 10 ? * MON-FRI)
	                    //.withSchedule( CronScheduleBuilder.cronSchedule( "58 * * * * ?")) // Fire at 10:15am every Monday  old------  (0 15 10 ? * MON-FRI)
	                    .build(); 
	        	Date ft = sched.scheduleJob(job3, trigger3);
	        	sched.start(); 
	        	Date ft1 = sched1.scheduleJob(job4, trigger4);
	        	sched1.start();
	        	Date ft5 = sched5.scheduleJob(job5, trigger5);
	        	sched5.start();
	        	
	  */
            JobDetail jobDetail = JobBuilder.newJob(Login_details.class).build();
            Trigger trigger = TriggerBuilder.newTrigger().withIdentity("simple")
            		.withSchedule(CronScheduleBuilder.cronSchedule("0 58 23 * * ?"))
            		//.withSchedule(CronScheduleBuilder.cronSchedule("30 * * * * ?"))
            		.build();
            scheduler.scheduleJob(jobDetail, trigger);
            System.out.println("starting scheduler.....");
            scheduler.start();
            
         /*
            JobDetail job6 = JobBuilder.newJob(SchedularLive.class).build();
            Trigger trigger6 = TriggerBuilder.newTrigger().withIdentity("live")
            		.withSchedule(CronScheduleBuilder.cronSchedule("0 0 8 * * ?"))
            		//.withSchedule(CronScheduleBuilder.cronSchedule("30 * * * * ?"))
            		.build();
            sched6.scheduleJob(job6, trigger6);
           System.out.println("starting scheduler live portal.....");
            sched6.start();
       */  
        } catch (Exception e) {
            ctx.log("There was an error scheduling the job.", e);
        }
    }
     public static Connection getConnection() throws Exception {
    		
    	 Connection con = null;
    		try {
        		Statement stmt = null;
    		/*
    			Class.forName("com.mysql.jdbc.Driver");
    			con = DriverManager.getConnection(
    					"jdbc:mysql://localhost:3306/mysql2", "root", "root");
    			// here mysql is database name, root is username and password
    			
    			stmt = con.createStatement();
    	
    				

    			Class.forName("com.mysql.jdbc.Driver");
    			con = DriverManager.getConnection(
    					"jdbc:mysql://localhost:3306/mysql", "root", "root");
    			// here mysql is database name, root is username and password  db170218
    
    			 */
    			Context initCtx = new InitialContext();
    			Context envCtx = (Context) initCtx.lookup("java:comp/env");
    			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
    			con = ds.getConnection();
    			stmt = con.createStatement();
  
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    		
    		return con;
    		
    	}

}

