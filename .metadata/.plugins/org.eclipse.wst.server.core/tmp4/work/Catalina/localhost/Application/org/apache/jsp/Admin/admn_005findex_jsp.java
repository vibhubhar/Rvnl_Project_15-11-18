/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.86
 * Generated at: 2018-04-29 05:12:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.naming.*;
import java.sql.*;
import javax.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.naming.*;
import java.sql.*;
import javax.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public final class admn_005findex_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/Admin/included/NewHeader.jsp", Long.valueOf(1524567356000L));
    _jspx_dependants.put("/WEB-INF/sessionCheck1.jspf", Long.valueOf(1524567358000L));
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

 
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = admn_login.jsp");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/css/form-style.css\">\r\n");
      out.write("\t\t");

 String theme3 = (String) pageContext.getAttribute("myTheme", PageContext.SESSION_SCOPE);
if (theme3!=null) {
if (theme3.equalsIgnoreCase("brown") ) { 
      out.write("\r\n");
      out.write("\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/css/ThmBrown.css\">\r\n");
      out.write("\t\t");
 } else if (theme3.equalsIgnoreCase("blue")) { 
      out.write(" \r\n");
      out.write("\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/css/ThmBlue.css\">\r\n");
      out.write("\t\t");
} else if (theme3.equalsIgnoreCase("green")) { 
      out.write(" \r\n");
      out.write("\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/css/ThmGreen.css\">\r\n");
      out.write("\t\t");
} else if (theme3.equalsIgnoreCase("magenta")) { 
      out.write(" \r\n");
      out.write("\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/css/Thmmagenta.css\">\r\n");
      out.write("\t\t");
}
} else {
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"resources/css/ThmBrown.css\">\r\n");
      out.write("\t\t");
} 
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("<meta charset=\"ISO-8859-1\">\r\n");
      out.write("<title>PDAMS</title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"//code.jquery.com/jquery-1.10.2.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write(".white-marquee {\r\n");
      out.write("   font-family:   arial, serif, \"Times New Roman\", calibri, Times;\r\n");
      out.write("\tfont-size: 14px;\r\n");
      out.write("\tcolor:  white;\r\n");
      out.write("\t//margin-left:50px;\r\n");
      out.write("\tfont-weight:bold;\r\n");
      out.write("\tpadding:10px;\r\n");
      out.write("\tpadding-bottom:5px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>   \r\n");

//String mailstatus=(String)session.getAttribute("MailStatus"); 
//String user = (String) session.getAttribute("user_name");
String user_code = (String) session.getAttribute("User_Code");
if (user_code!=null) {} else {user_code="0";}
 String mq=null, mqLaunch=null, mqMaint=null, mqOther=null, mqRly=null, mqRVNL=null;					
 //System.out.println("code="+user_code);	
  Connection conn7 = null;
     			PreparedStatement ps777=null;
     			ResultSet  rs777=null;
     						//Statement stmt7 = null;
     						try {
     							Context initCtx = new InitialContext();
     							Context envCtx = (Context) initCtx.lookup("java:comp/env");
     							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

     							conn7 = ds.getConnection();
     							String sql35 = "select item, description from xx_maintenance";
     									
    								ps777 = conn7.prepareStatement(sql35);
    								rs777 = ps777.executeQuery();
    								while (rs777.next()) {
    									String item=rs777.getString(1);
    									 String desc=rs777.getString(2);
    									if (item.equalsIgnoreCase("marquee-launch")) {
    										mqLaunch=desc;
    									} else if (item.equalsIgnoreCase("marquee-maint")) {
    										mqMaint=desc;
    									} else if (item.equalsIgnoreCase("marquee-other")) {
    										mqOther=desc;
    									} else if (item.equalsIgnoreCase("marquee-Rly")) {
    										mqRly=desc;
    									} else if (item.equalsIgnoreCase("marquee-RVNL")) {
    										mqRVNL=desc;
    									} 
    								}
    								if (user_code.equalsIgnoreCase("2")) {
    									mq= mqLaunch+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqMaint+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqOther+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqRly;
    								} else if (user_code.equalsIgnoreCase("5")) {
    									mq= mqLaunch+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqMaint+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqOther+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqRVNL;
    								} else {
    								mq= mqLaunch+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqMaint+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+mqOther;
    								}		 
    				    				//System.out.println("marquee="+mq);
     						}catch(Exception e){
    							
    							e.printStackTrace();
    						} finally {
    						    try { rs777.close(); } catch (Exception e) { /* ignored */ }
    						    try { ps777.close(); } catch (Exception e) { /* ignored */ }
    						    try { conn7.close(); } catch (Exception e) { /* ignored */ }
    						}



      out.write("\r\n");
      out.write("<input type=\"hidden\" id=\"menu1\" value='");
      out.print(session.getAttribute("user_name") );
      out.write("'>\r\n");
      out.write("     \t   <div class=\"header\">\r\n");
      out.write("   \r\n");
      out.write(" \t\t   <table width=\"100%\"><tr><th width=15%>\r\n");
      out.write("    \t\t  <img src=\"images/Rail_logo.png\"  class=\"img-responsive\" style=\"float:left;height:80px;margin-left:10px;\">\r\n");
      out.write("    \t\t  \r\n");
      out.write("   </td>\r\n");
      out.write("   <th width=60%>\r\n");
      out.write("      \t\t <h2 style=\" margin-left:5px;\"><i>Project Documents Approval Monitoring System (PDAMS)</i></h2>\t\r\n");
      out.write("   \r\n");
      out.write("   </th><th width=25%>\r\n");
      out.write("\t  <img src=\"images/RVNL_LOGO.jpg\"  class=\"img-responsive\" style=\"float:left;height:80px;margin-left:10px;\">\r\n");
      out.write(" \t\t  </table>\t\r\n");
      out.write("   </div>\r\n");
      out.write("\t   <div class=\"topmenu\" id=\"menu\">\r\n");
      out.write("\t  <div id=\"menu1\"  style=\"float:left;\"> \r\n");
      out.write("\t  \t\t<ul>\r\n");
      out.write("\t  \t\t\r\n");
      out.write("\t  \t\t<!-- <li><a href=\"user_index.jsp\">Add/Modify Docs</a></li>\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"user_Project.jsp\">My Projects</a></li>\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"Reportpiuinitiate.jsp\">My Reports</a></li>\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"MoreInfo.jsp\">Returned Tasks</a></li>\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"PullBack.jsp\">PullBack Doc</a></li>\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"FinalApproval.jsp\">Docs under Approval</a></li>\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"FinallyApprovedShow.jsp\">Approved Docs</a></li>\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"ManualMail.jsp\">Reminders</a></li>\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"User_List.jsp\">User List</a></li>\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"changepasswordlocaladmin.jsp\">Change Password</a></li>\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"helpmain.jsp\">Help</a></li>\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"admn_logout.jsp\">Logout</a></li>  -->\r\n");
      out.write("\t   \t\t\t\t\t<li><a href=\"NewIndex.jsp\">Home</a></li>\r\n");
      out.write("\t   \t\t\t\t\t\r\n");
      out.write("\t   \t\t\t\t\t</ul>\t \r\n");
      out.write("\t   \t\t\t\t\t</div>  \r\n");
      out.write("\t   \t\t\t\t\t");

	   					if (!mq.equalsIgnoreCase("") && mq!=null) {
	   					
      out.write("\t\r\n");
      out.write("\t   \t<div id=\"menu11\" ></div>\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t   <div id=\"menu2\"  style=\"width:70%; float:left;\">     \t\t\t\t\t\r\n");
      out.write("\t   <marquee><span class=\"white-marquee\" id=\"white-marquee\" style=\"float:right; width:100%\">");
      out.print(mq );
      out.write("</span></marquee>  </div>\r\n");
      out.write("\t  ");

	  	}
	   	
      out.write("\t\r\n");
      out.write("\t   \t\r\n");
      out.write("\t\t\t\t\t\t\t</div> \r\n");
      out.write("\t\t\t\t\t\t\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\r\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("<link href=\"resources/css/main.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\r\n");
      out.write("<title>");
      out.print(session.getAttribute("user_name"));
      out.write("</title>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"shortcut icon\" href=\"images/logo.jpg\" type=\"image/x-icon\">\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/mystyle.css\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"header\">\r\n");
      out.write("\t\t<table style=\"width: 100%\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td><h1 style=\"font-size: 300%;\">&nbsp;&nbsp;&nbsp; Rail\r\n");
      out.write("\t\t\t\t\t\tVikas Nigam Limited Portal</h1></td>\r\n");
      out.write("\t\t\t\t<td><img src=\"images/Rail-Vikas-Nigam-Limited-RVNL.jpg\"></td>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t");

	Connection con = null;
	ResultSet rs = null;

		try {

			String user_name = (String) session.getAttribute("user_name");

			String password = (String) session.getAttribute("password");
			//  Class.forName("com.mysql.jdbc.Driver");
			//   Connection con = DriverManager.getConnection("jdbc:mysql://10.15.75.44:3306/MySQL","root","root");

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

			 con = ds.getConnection();

			String sql = "select * from xx_user_master where User_name='"
					+ user_name + "' and password= '" + password + "'";
			Statement st = con.createStatement();
			 rs = st.executeQuery(sql);
			
			int pstatus = 0;

			if (rs.next()) {

				pstatus = rs.getInt("pstatus");

			}
			if (pstatus == 0) {
				response.sendRedirect("c_user.jsp");
			} else {
	
      out.write("\r\n");
      out.write("\t<script type=\"text/javascript\">\r\n");
      out.write("\t\talert(\"Username and Password does not match\");\r\n");
      out.write("\t</script>\r\n");
      out.write("\t");

		}
			//con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		    try { rs.close(); } catch (Exception e) { /* ignored */ }
		    try { con.close(); } catch (Exception e) { /* ignored */ }
		}
	
	
      out.write("\r\n");
      out.write("\t<h1 align=\"left\">\r\n");
      out.write("\t\t<font style=\"color: red;\">Welcome Page</font>:");
      out.print((String) session.getAttribute("user_name"));
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
