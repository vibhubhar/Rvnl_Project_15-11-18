/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.86
 * Generated at: 2018-06-08 09:39:27 UTC
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
import java.util.*;
import java.util.Date;
import java.text.SimpleDateFormat;

public final class Updatechange_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link href=\"resources/css/main.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<!-- <link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\"> -->\r\n");
      out.write("<link href=\"resources/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\"/>\r\n");
      out.write("<link href=\"resources/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"/>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("window.onunload = refreshAndClose2;\r\n");
      out.write("function refreshAndClose2()\r\n");
      out.write("{\r\n");
      out.write("\twindow.open('javascript:location.reload(true);', 'c_document');\r\n");
      out.write("   if (window.opener && !window.opener.closed) \r\n");
      out.write("    {\r\n");
      out.write("      window.opener.close();\r\n");
      out.write("     } \r\n");
      out.write("}\r\n");
      out.write("function refreshAndClose()\r\n");
      out.write("{\r\n");
      out.write("    window.close();\r\n");
      out.write("   if (window.opener && !window.opener.closed) \r\n");
      out.write("    {\r\n");
      out.write("      window.opener.close();\r\n");
      out.write("     } \r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<title>Final Approval</title>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

String sqlQuery=null;
sqlQuery=request.getParameter("sqlQuery");
String id=null;
 id=request.getParameter("zoneName");
 String zone=null;
 zone=request.getParameter("zone");
 
 String  doc_id=null;
 doc_id=request.getParameter("doc_id");

 
 String division=null;
 division=request.getParameter("division");
 String division1=null;
 division1=request.getParameter("division1");
 String org=null;
 org=request.getParameter("Org");
 String org1=null;
 org1=request.getParameter("Org1");
 String piu=null;
 piu=request.getParameter("piu");
 String piu1=null;
 piu1=request.getParameter("piu1");
 String documents=null;
 documents=request.getParameter("documents");
 String documents1=null;
 documents1=request.getParameter("documents1");
 String Projects=null;
 Projects=request.getParameter("Projects");
 String Projects1=null;
 Projects1=request.getParameter("projects1");
 
 String dept=null;
 dept=request.getParameter("dept");
 String dept1=null;
 dept1=request.getParameter("dept1");
 String desg=null;
 desg=request.getParameter("desg");
 String desg1=null;
 desg1=request.getParameter("desg1");
 String type=null;
 type=request.getParameter("type");
 String Project_type=null;
 Project_type=request.getParameter("Project_type");
 
 
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" ");
if(division !=null) {
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t\t<strong>Success!</strong> Division has been Successfully Added  with Division Name ");
      out.print(division );
      out.write(".\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write(" ");
} 
 else if(division1 !=null){
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> division has been Successfully Modified  with division Name ");
      out.print(division1 );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
}
else if(desg !=null){
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> Designation has been Successfully Added  with Designation Name ");
      out.print(desg );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
}
else if(desg1 !=null){
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"alert alert-success\" align=\"center\"> \r\n");
      out.write("\t\t\t<strong>Success!</strong> Designation has been Successfully Modified  with Designation Name ");
      out.print(desg1 );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
}
 else if(org !=null){
      out.write("\r\n");
      out.write("\t \r\n");
      out.write("\t <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t\t<strong>Success!</strong> Organization has been Successfully Added  with Orgn. Name: ");
      out.print(org );
      out.write(".\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write("\t \r\n");
      out.write("\t \r\n");
      out.write(" ");
}
 else if(org1 !=null){
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> Organization has been Successfully Modified  with Orgn. Name: ");
      out.print(org1 );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write(" \r\n");
      out.write(" ");
}
 else if(piu !=null){
      out.write("\r\n");
      out.write("\t \r\n");
      out.write("\t <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t\t<strong>Success!</strong> Piu has been Successfully Added  with PIU Name ");
      out.print(piu );
      out.write(".\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write("\t \r\n");
      out.write("\t \r\n");
      out.write(" ");
}
 else if(piu1 !=null){
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> Piu has been Successfully Modified  with PIU Name ");
      out.print(piu1 );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
}
 else if(dept!=null){
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> Department has been Successfully Added  with Department Name ");
      out.print(dept );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
}
else if(dept1!=null){
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> Department has been Successfully Modified  with Department Name ");
      out.print(dept1 );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
}
else if(doc_id!=null){
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> Document has been Successfully Forwarded  with Document id ");
      out.print(doc_id );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"window.open('javascript:location.reload(true);', 'c_document'); javascript:window.close(); return refreshAndClose();\" /></div>\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
}

else if(documents !=null){
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> 'Document Type' has been Successfully Added  with Document Type Name ");
      out.print(documents );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
}
else if(documents1 !=null){
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> 'Document Type' has been Successfully Modified  with Document Type Name ");
      out.print(documents1 );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
}
else if(Projects !=null){
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> Project Type has been Successfully Added  with Project Type Name ");
      out.print(Projects );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
}
else if(Projects1 !=null){
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> Project Type has been Successfully Modified  with Project Type Name ");
      out.print(Projects1 );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
}
else if(zone !=null){
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> Zone has been Successfully Modified  with Zone Name ");
      out.print(zone );
      out.write(".\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
}
else if(Project_type !=null){
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t<strong>Success!</strong> data Already exist. No changes possible !\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
}

else {
      out.write("\r\n");
      out.write(" <div class=\"alert alert-success\" align=\"center\">\r\n");
      out.write("\t\t\t\t<strong>Success!</strong> Zone has been Successfully Added  with Zone  Name ");
      out.print(id );
      out.write(".\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div style=\"text-align:center;margin-top:130px;\"><input type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("\t\t\t\t\t\t\t value=\"Close\"\r\n");
      out.write("\t\t\t\t\t\t\tonclick=\"javascript:window.close();return refreshAndClose();\" /></div>\r\n");
}
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
