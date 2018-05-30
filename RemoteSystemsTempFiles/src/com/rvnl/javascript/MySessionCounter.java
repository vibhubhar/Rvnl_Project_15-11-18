package com.rvnl.javascript;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;

/**
 * Application Lifecycle Listener implementation class MySessionCounter
 *
 */
@WebListener
public class MySessionCounter implements HttpSessionListener {
	private static int activeSessions = 0;
	final static Logger logger = Logger.getLogger(MySessionCounter.class);
    /**
     * Default constructor. 
     */
    public MySessionCounter() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
 	  System.out.println("Session created by Id : " + se.getSession().getId());
 	 logger.info("Session created by Id : " + se.getSession().getId());
        activeSessions++;
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
  	  System.out.println("Session destroyed by Id : " + se.getSession().getId());
  	logger.info("Session destroyed by Id : " + se.getSession().getId());
      if(activeSessions > 0)
        activeSessions--;
    }
    public static int getActiveSessions() {
        return activeSessions;
      }
}
