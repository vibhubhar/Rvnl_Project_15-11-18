/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.86
 * Generated at: 2018-05-29 11:55:48 UTC
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
import java.io.*;
import java.util.*;
import javax.script.*;
import java.nio.file.*;
import java.nio.charset.*;
import java.text.DateFormat;
import javax.naming.*;
import java.sql.*;
import javax.sql.*;
import org.apache.taglibs.standard.tag.common.sql.ResultImpl;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.naming.*;
import java.sql.*;
import javax.sql.*;
import java.util.*;

public final class deleteuser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/sessionCheck1.jspf", Long.valueOf(1524567358000L));
    _jspx_dependants.put("/Admin/sessionCheck.jsp", Long.valueOf(1524567356000L));
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fsql_005fupdate_0026_005fvar_005fdataSource;

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
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fsql_005fupdate_0026_005fvar_005fdataSource = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
    _005fjspx_005ftagPool_005fsql_005fupdate_0026_005fvar_005fdataSource.release();
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
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write(" ");
 

int timeout1 = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout1 + "; URL = admn_login.jsp");

if(((String)session.getAttribute("user_name"))==null)
       {
           
	response.sendRedirect("admn_login.jsp");
           
       }
      out.write("  \r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link href=\"resources/css/main.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<script src=\"resources/JS/validateSysAdmin230.js\"></script>\r\n");
      out.write("<!--  <link\r\n");
      out.write("\thref=\"http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css\"\r\n");
      out.write("\trel=\"stylesheet\" type=\"text/css\" /> -->\r\n");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>RVNL Document Portal </title>\r\n");
      out.write("<link href=\"resources/css/main.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<link href=\"resources/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"/>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css\">    \r\n");
      out.write("<link href=\"resources/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\"/>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    function refreshAndClose() {\r\n");
      out.write("        window.opener.location.reload(true);\r\n");
      out.write("        window.close();\r\n");
      out.write("    }\r\n");
      out.write("    function userdelete(id){\r\n");
      out.write("    \t\r\n");
      out.write("    \t document.CreateProject11.Project_stage11.value = id;\r\n");
      out.write("\t\t\tdocument.getElementById(\"CreateProject11\").submit();\r\n");
      out.write("   \r\n");
      out.write("    }\r\n");
      out.write("    \r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");

String str1=request.getParameter("Project_stage11");

String username =request.getParameter("usern");
String updatedusername="'";
updatedusername=updatedusername+username.replaceAll("~","/")+"'";

      out.write("\r\n");
      out.write("\r\n");
      out.write("<form name=\"CreateProject11\" id=\"CreateProject11\" method=\"post\" style=\"margin-left:40px;\" >\r\n");
      out.write("<INPUT TYPE=\"HIDDEN\" NAME=\"Project_stage11\" id=\"Project_stage11\">\r\n");
      out.write("<INPUT TYPE=\"HIDDEN\" NAME=\"username\" id=\"username\" value='");
      out.print(username);
      out.write("'>\r\n");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      boolean _jspx_th_c_005fif_005f0_reused = false;
      try {
        _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
        _jspx_th_c_005fif_005f0.setParent(null);
        // /Admin/deleteuser.jsp(62,0) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
        _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.Project_stage11 == null}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
        int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
        if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n");
            out.write("                 <div class=\"alert alert-success\"  style=\"margin-top: 100px; width:400px;\">\r\n");
            out.write("\t &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Success!</strong> Are you sure you want to delete this user !\r\n");
            out.write("\t <br>\r\n");
            out.write("\t <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \r\n");
            out.write("\t <input class=\"btn btn-primary\" value=\"ok\"  onClick=\"userdelete(");
            out.print(updatedusername );
            out.write(")\" type=\"button\"/>&nbsp;&nbsp;&nbsp;<input class=\"btn btn-primary\" value=\"Cancel\"  onClick=\"refreshAndClose()\" type=\"button\"/>\r\n");
            out.write("\t </div>\r\n");
            int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
        _jspx_th_c_005fif_005f0_reused = true;
      } finally {
        org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
      }
      out.write("\r\n");
      out.write("</form>\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      //  c:if
      org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
      boolean _jspx_th_c_005fif_005f1_reused = false;
      try {
        _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
        _jspx_th_c_005fif_005f1.setParent(null);
        // /Admin/deleteuser.jsp(73,0) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
        _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${param.Project_stage11 != null}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
        int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
        if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write('\r');
            out.write('\n');


Connection  conn = null;
try {
	
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn = ds.getConnection();
	
	String username1 =request.getParameter("username");
	username1=username1.replace("~","/" );
	//String str1=request.getParameter("Project_stage11");
	System.out.println("printing here-----------str-----"+str1);



            out.write("\r\n");
            out.write("  ");
            //  sql:update
            org.apache.taglibs.standard.tag.rt.sql.UpdateTag _jspx_th_sql_005fupdate_005f0 = (org.apache.taglibs.standard.tag.rt.sql.UpdateTag) _005fjspx_005ftagPool_005fsql_005fupdate_0026_005fvar_005fdataSource.get(org.apache.taglibs.standard.tag.rt.sql.UpdateTag.class);
            boolean _jspx_th_sql_005fupdate_005f0_reused = false;
            try {
              _jspx_th_sql_005fupdate_005f0.setPageContext(_jspx_page_context);
              _jspx_th_sql_005fupdate_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fif_005f1);
              // /Admin/deleteuser.jsp(92,2) name = dataSource type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
              _jspx_th_sql_005fupdate_005f0.setDataSource("jdbc/MySQLDB");
              // /Admin/deleteuser.jsp(92,2) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
              _jspx_th_sql_005fupdate_005f0.setVar("rs");
              int[] _jspx_push_body_count_sql_005fupdate_005f0 = new int[] { 0 };
              try {
                int _jspx_eval_sql_005fupdate_005f0 = _jspx_th_sql_005fupdate_005f0.doStartTag();
                if (_jspx_eval_sql_005fupdate_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
                  if (_jspx_eval_sql_005fupdate_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    _jspx_push_body_count_sql_005fupdate_005f0[0]++;
                    out = org.apache.jasper.runtime.JspRuntimeLibrary.startBufferedBody(_jspx_page_context, _jspx_th_sql_005fupdate_005f0);
                  }
                  do {
                    out.write("\r\n");
                    out.write("  \r\n");
                    out.write("DELETE from xx_user_master where User_name='");
                    out.print(username1 );
                    out.write("';\r\n");
                    out.write(" \r\n");
                    out.write("  ");
                    int evalDoAfterBody = _jspx_th_sql_005fupdate_005f0.doAfterBody();
                    if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
                      break;
                  } while (true);
                  if (_jspx_eval_sql_005fupdate_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
                    out = _jspx_page_context.popBody();
                    _jspx_push_body_count_sql_005fupdate_005f0[0]--;
                  }
                }
                if (_jspx_th_sql_005fupdate_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
                  return;
                }
              } catch (java.lang.Throwable _jspx_exception) {
                while (_jspx_push_body_count_sql_005fupdate_005f0[0]-- > 0)
                  out = _jspx_page_context.popBody();
                _jspx_th_sql_005fupdate_005f0.doCatch(_jspx_exception);
              } finally {
                _jspx_th_sql_005fupdate_005f0.doFinally();
              }
              _005fjspx_005ftagPool_005fsql_005fupdate_0026_005fvar_005fdataSource.reuse(_jspx_th_sql_005fupdate_005f0);
              _jspx_th_sql_005fupdate_005f0_reused = true;
            } finally {
              org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_sql_005fupdate_005f0, _jsp_getInstanceManager(), _jspx_th_sql_005fupdate_005f0_reused);
            }
            out.write("  \r\n");
            out.write("   <div class=\"alert alert-success\"  style=\"margin-top: 100px; margin-left: 50px; width:400px;\">\r\n");
            out.write("\t &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Success!</strong> User Deleted Successfully !.\r\n");
            out.write("\t <br>\r\n");
            out.write("\t <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \r\n");
            out.write("\t &nbsp;&nbsp;&nbsp;<input class='btn btn-primary' value='Ok'  onClick=\"refreshAndClose()\" type='button'/>\r\n");
            out.write("\t </div>\r\n");
            out.write("  \r\n");


}
catch(Exception e){
	e.printStackTrace();
} finally {
    try { conn.close(); } catch (Exception e) { /* ignored */ }
}

            out.write('	');
            out.write('\r');
            out.write('\n');
            int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return;
        }
        _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
        _jspx_th_c_005fif_005f1_reused = true;
      } finally {
        org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f1_reused);
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