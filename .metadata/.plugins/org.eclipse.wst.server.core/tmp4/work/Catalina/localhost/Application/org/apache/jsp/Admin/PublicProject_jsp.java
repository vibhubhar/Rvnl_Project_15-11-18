/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.86
 * Generated at: 2018-05-03 09:35:40 UTC
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

public final class PublicProject_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
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
      response.setContentType("text/html; charset=ISO-8859-1");
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

      out.write("<!DOCTYPE html><html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<meta name=\"viewport\" content=\"initial-scale=1, maximum-scale=1\">       \r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.css\" />\r\n");
      out.write("<script src=\"http://code.jquery.com/jquery-1.8.2.min.js\"></script>\r\n");
      out.write("<script src=\"http://code.jquery.com/mobile/1.3.0/jquery.mobile-1.3.0.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body background= bgcolor=red>\r\n");
      out.write("<div data-role='page'  class = '' id='pageid' data-theme='b' data-content-theme='b'>\r\n");
      out.write("<div data-role='header'  class = '' id='headerid' data-theme='e' data-content-theme='e'><h1 id=\"indexheader\">Select Project</h1></div>\r\n");
      out.write("<div data-role='content'  class = '' id='contentid' data-theme='b' data-content-theme='b'>\r\n");
      out.write("<ul data-role='listview' id='mylist'>\r\n");

String piu1 = request.getParameter("piu");

      out.write('\r');
      out.write('\n');

Connection conn = null;
Statement stmt = null;
ResultSet rs3 = null;
PreparedStatement ps3 = null;
 String project1=null;
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
conn = ds.getConnection();
                 String query = "select Project from xx_projectattributes_master where PIU_Of_RVNL='"+piu1+"' order by Project"; 
        try {         
                 ps3 = conn.prepareStatement(query);
					rs3 = ps3.executeQuery();
                   while (rs3.next()) {
                	   project1 = rs3.getString("Project");

      out.write("\r\n");
      out.write("<li><a href='PublicProjectReport.jsp?project=");
      out.print(project1 );
      out.write("&piu=&status=&doctype=&majsec=&smajsec=&frmstn=&tostn=&orgName=&backurl=&t1=7&t2=14&frmkm=&tokm=&DateStart=&DateEnd=&frmstnkm=&tostnkm=&division=none&zone=' target=\"_blank\" data-transition='slide'>");
      out.print(project1 );
      out.write("</a></li>\r\n");

}	
        } catch(Exception e){
			
			e.printStackTrace();
		}
		           rs3.close();
                   ps3.close();
                   conn.close();
                    

      out.write("\r\n");
      out.write("</ul>\r\n");
      out.write("</div>\r\n");
      out.write("</div>\r\n");
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
