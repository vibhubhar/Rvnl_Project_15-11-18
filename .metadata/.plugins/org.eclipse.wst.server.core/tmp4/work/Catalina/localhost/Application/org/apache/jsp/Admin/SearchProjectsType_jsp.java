/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.86
 * Generated at: 2018-05-30 04:56:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.*;
import java.sql.*;
import javax.sql.*;

public final class SearchProjectsType_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write(" \r\n");
      out.write("   \r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<link href=\"resources/css/main.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write(" \r\n");

String projects=request.getParameter("PROJECTS");  
String piu=request.getParameter("piu"); 
System.out.println(projects);
String buffer="";
String projectid="";

try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();
	     int count=1;
	     String sql=null;
 if (!projects.equalsIgnoreCase("none")) {
	 sql = "select * from xx_projectattributes_master where Project_Type ='"+projects+"' and PIU_of_RVNL='"+piu+"'";
 } else {
	  sql = "select * from xx_projectattributes_master where PIU_of_RVNL='"+piu+"'";
 }
 System.out.println("11"+projects+"22"+sql);
 PreparedStatement ps3 = conn.prepareStatement(sql);
   //ps3.setString(1, piu);
   ResultSet rs = ps3.executeQuery(); 
   buffer="<div class='scrollit' style='height: 515px; margin-top:0px;'><table class='table table-hover table-bordered' style='background-color: #FFFAF0;width=100%'><tr class='success' style='height: 73px;'><th class='ListOfTables' width ='5%'><b>S.No.</b> </th><th class='ListOfTables' width ='50%'><b>Project Name</b> </th><th class='ListOfTables' width ='20%'><b>Project Type</b></th><th class='ListOfTables' width ='20%'><b>Project Coordinator</b></th><th class='ListOfTables' width ='5%'><b>Modify</b></th></tr></div>";
		  // "<div class='scrollit' style='height:515px;'><table class='table table-hover table-bordered' style='background-color: #FFFAF0;width=100%'><tr class='success' style='height: 73px;'><th class='ListOfTables' width ='5%'><b>S.No.</b> </th><th class='ListOfTables' width ='53%'><b>Project Name</b> </th><th class='ListOfTables' width ='53%'><b>Project Coordinator</b></th><th class='ListOfTables' width ='33%'><b>Project Type</b></th><th class='ListOfTables' width ='33%'><b>Modify</b></th></tr></div>";
   System.out.println("resultset val="+rs.getRow());
 	while(rs.next()){
 		projectid=rs.getString(1);
 	   String project =  rs.getString(2);
 	   String p_coordinator = rs.getString(3);
 	   String piuRVNL = rs.getString(4);
 	   String type = rs.getString(5);
	   buffer=buffer+"<tr class='active'><td class='ListOfTables'>"+count+"</td><td class='ListOfTables'>"+project+"</td><td class='ListOfTables'>"+type+"</td><td class='ListOfTables'>"+p_coordinator+"</td><td><INPUT TYPE='button' class='btn btn-primary' NAME='modify' value ='modify' onClick='modifying("+projectid+");'>"+"</td></tr>";
	   count=count+1;
   }
   buffer=buffer+"</table>";
 
		   System.out.println("----"+buffer);
 response.getWriter().println(buffer); 
 try { conn.close(); } catch (Exception e) { /* ignored */ }

}
 catch(Exception e){
     System.out.println(e);
 }

 
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