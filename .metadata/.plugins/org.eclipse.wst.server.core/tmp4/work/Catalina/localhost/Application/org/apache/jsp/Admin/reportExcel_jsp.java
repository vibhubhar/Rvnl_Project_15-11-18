/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.86
 * Generated at: 2018-05-03 05:12:47 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.*;
import java.util.*;
import javax.servlet.http.*;
import javax.naming.*;
import java.sql.*;
import javax.sql.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.Element;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import java.awt.Color;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Document;
import com.itextpdf.text.Chunk;
import java.io.FileOutputStream;
import java.io.IOException;

public final class reportExcel_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			null, true, 1120256, true);
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
      out.write("<head>\r\n");
      out.write("<link href=\"resources/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\"/>\r\n");
      out.write("<link href=\"resources/bootstrap/css/bootstrap.css\" rel=\"stylesheet\"/>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<HTML>\r\n");
      out.write("<HEAD>\r\n");
      out.write("<TITLE>Report in Excel Format in JSP</TITLE>\r\n");
      out.write("<style>\r\n");
      out.write("table \r\n");
      out.write("{\r\n");
      out.write("mso-displayed-decimal-separator: \"\\.\";\r\n");
      out.write("mso-displayed-thousand-separator: \"\\,\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@page \r\n");
      out.write("{\r\n");
      out.write("margin: 1.0in .75in 1.0in .75in;\r\n");
      out.write("mso-header-margin: .5in;\r\n");
      out.write("mso-footer-margin: .5in;\r\n");
      out.write("mso-page-orientation: landscape;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</HEAD>\r\n");
      out.write("<body>\r\n");
      out.write("<br><br>\r\n");
      out.write("<!-- Added for appropriate file name to .xls file] START--> \r\n");

		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "excel.xls");

		}
	
      out.write("\r\n");
      out.write("<!-- END-->\r\n");

Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String doctype="";
String sqlQuery = "select distinct docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,ram.ActionPerformed,ram.CurrentDate,ram.Document_id,ram.ActionPerformedBy,DATEDIFF(ram.CurrentDate,docm.Date_of_Submission) as Aging, bmax.date1 from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select distinct((select max(ram1.currentdate) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id group by ram1.Document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax where projm.project_id = docm.project_id and ram.Document_id = wfm.Document_id and ram.CurrentDate = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id";
con = ds.getConnection();
stmt = con.createStatement();
rs = stmt.executeQuery(sqlQuery);

      out.write("\r\n");
      out.write("<table border=1>\r\n");
      out.write("<tr>\r\n");
      out.write("<th>Document Id</th>\r\n");
      out.write("<th>PIU Name</th>\r\n");
      out.write("<th>Project</th>\r\n");
      out.write("<th>Project Coordinator</th>\r\n");
      out.write("<th>Package Name</th>\r\n");
      out.write("<th>Coordinating Department</th>\r\n");
      out.write("<th>Designation</th>\r\n");
      out.write("<th>Document Type</th>\r\n");
      out.write("<th>Document Number</th>\r\n");
      out.write("<th>Date of Submission</th>\r\n");
      out.write("<th>Action Performed</th>\r\n");
      out.write("<th>Current Date</th>\r\n");
      out.write("<th>Action PerformedBy</th>\r\n");
      out.write("<th>Aging</th>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</tr>\r\n");
 
String document_id = null;
String piuname = null;
String project = null;
String pcor = null;
String packagename = null;
String cdeprt = null;
String desig = null;
String doctype1 = null;
String docno = null;
String dofsub = null;
String actions = null;
String current = null;
String action = null;
String age = null;


      out.write('\r');
      out.write('\n');

while(rs.next()){
	document_id = rs.getString(1);
	piuname = rs.getString(2);
	project = rs.getString(3);
	pcor = rs.getString(4);
	packagename = rs.getString(5);
	cdeprt = rs.getString(6);
	desig = rs.getString(7);
	document_id = rs.getString(8);	
	doctype1 = rs.getString(9);
	docno = rs.getString(10);
	dofsub = rs.getString(11);
	actions = rs.getString(12);
	current = rs.getString(13);
	action = rs.getString(14);
	age = rs.getString(15);
	
	
      out.write("\r\n");
      out.write("<tr>\r\n");
      out.write("<td width=\"200px\"><font color=\"\">\r\n");
      out.write(" ");
      out.print(document_id );
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("<td width=\"200px\">\r\n");
      out.write(" ");
      out.print(piuname );
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("<td width=\"200px\">");
      out.print(project);
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("<td width=\"200px\">");
      out.print(pcor);
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("<td width=\"200px\">");
      out.print(packagename);
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("<td width=\"200px\">");
      out.print(cdeprt);
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("<td width=\"200px\">");
      out.print(desig);
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("<td width=\"200px\">");
      out.print(document_id);
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("<td width=\"200px\">");
      out.print(doctype1);
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("<td width=\"200px\">");
      out.print(docno);
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("<td width=\"200px\">");
      out.print(dofsub);
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("<td width=\"200px\">");
      out.print(actions);
      out.write("\r\n");
      out.write("</td><td width=\"200px\">");
      out.print(current);
      out.write("\r\n");
      out.write("</td><td width=\"200px\">");
      out.print(action);
      out.write("\r\n");
      out.write("</td><td width=\"200px\">");
      out.print(age);
      out.write("\r\n");
      out.write("\r\n");
      out.write("</tr>\r\n");
} 
    try { con.close(); } catch (Exception e) { /* ignored */ }

      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<br>\r\n");

		if (exportToExcel == null) {
	
      out.write("\r\n");
      out.write("\t<a href=\"reportExcel.jsp?exportToExcel=YES\">Download Report in Excel</a><br><br>\r\n");
      out.write("\t\t\t<a href=\"reportToPdf.jsp?exportToPdf=YES\">Download Report in Pdf</a>\r\n");
      out.write("\t\r\n");
      out.write("\t");

		}
	
      out.write("\r\n");
      out.write("\t<br>\r\n");
      out.write("\t<br>\r\n");
      out.write("\t\r\n");
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
