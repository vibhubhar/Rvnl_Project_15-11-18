/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.86
 * Generated at: 2018-05-29 07:32:53 UTC
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
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.naming.*;
import java.sql.*;
import javax.sql.*;

public final class Update_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("/Admin/included/NewHeader.jsp", Long.valueOf(1527076887650L));
    _jspx_dependants.put("/WEB-INF/sessionCheck1.jspf", Long.valueOf(1524567358000L));
    _jspx_dependants.put("/Admin/included/Newfooter.jsp", Long.valueOf(1526628672412L));
    _jspx_dependants.put("/Admin/sessionCheck.jsp", Long.valueOf(1524567356000L));
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
      out.write(" \r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  ");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\t\t\r\n");
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
      out.write(" \r\n");
      out.write(" ");
 

int timeout1 = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout1 + "; URL = admn_login.jsp");

if(((String)session.getAttribute("user_name"))==null)
       {
           
	response.sendRedirect("admn_login.jsp");
           
       }
      out.write("\r\n");
      out.write("    \r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link href=\"resources/css/main.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<script src=\"resources/JS/Update230.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("function modifydisplay(zoneName,zoneId)\r\n");
      out.write("{\r\n");
      out.write("\t var i=0;\r\n");
      out.write("\t var pattern = new RegExp(/[~`!#$%\\^&*+=\\-\\[\\]\\\\';,/{}|\\\\\":<>\\?]/); //unacceptable chars\r\n");
      out.write("\t\t\t    if (pattern.test(zoneName)) {\r\n");
      out.write("\t\t\t        i=1;\r\n");
      out.write("\t\t\t        }\r\n");
      out.write("\t var zoneName1=encodeURIComponent(zoneName);\r\n");
      out.write("\tvar url=\"modifytoDb.jsp?type=zone&zoneName=\"+zoneName1+\"&zId=\"+zoneId+\"&contains=\"+i+\"\";\r\n");
      out.write("\twindow.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');\r\n");
      out.write("//returnProjects(id);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function modifydisplay1(divisionName1,divisionId)\r\n");
      out.write("{  var i=0;\r\n");
      out.write("\t var pattern = new RegExp(/[~`!#$%\\^&*+=\\-\\[\\]\\\\';,/{}|\\\\\":<>\\?]/); //unacceptable chars\r\n");
      out.write("\t\t\t    if (pattern.test(divisionName1)) {\r\n");
      out.write("\t\t\t        i=1;\r\n");
      out.write("\t\t\t        }\r\n");
      out.write("\t var divisionName2=encodeURIComponent(divisionName1);\r\n");
      out.write("\tvar url=\"modifytoDb.jsp?type=division&divisionName=\"+divisionName2+\"&divisionId=\"+divisionId+\"&contains=\"+i+\"\";\r\n");
      out.write("\twindow.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');\r\n");
      out.write("//returnProjects(id);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function modifydisplay21(Org_Name,Org_ID)\r\n");
      out.write("{  \t\t   \r\n");
      out.write("\tvar i=0;\r\n");
      out.write("\t var pattern = new RegExp(/[~`!#$%\\^&*+=\\-\\[\\]\\\\';,/{}|\\\\\":<>\\?]/); //unacceptable chars\r\n");
      out.write("\t\t\t    if (pattern.test(Org_Name)) {\r\n");
      out.write("\t\t\t        i=1;\r\n");
      out.write("\t\t\t        }\r\n");
      out.write("\t var Org_Name1=encodeURIComponent(Org_Name);\r\n");
      out.write("\tvar url=\"modifytoDb.jsp?type=Others&Org_Name=\"+Org_Name1+\"&Org_ID=\"+Org_ID+\"&contains=\"+i+\"\";\r\n");
      out.write("\twindow.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');\r\n");
      out.write("//returnProjects(id);\r\n");
      out.write("}\r\n");
      out.write("function modifydisplay2(PIU_Name,PIU_ID)\r\n");
      out.write("{  \t\t   \r\n");
      out.write("\tvar i=0;\r\n");
      out.write("\t var pattern = new RegExp(/[~`!#$%\\^&*+=\\-\\[\\]\\\\';,/{}|\\\\\":<>\\?]/); //unacceptable chars\r\n");
      out.write("\t\t\t    if (pattern.test(PIU_Name)) {\r\n");
      out.write("\t\t\t        i=1;\r\n");
      out.write("\t\t\t        }\r\n");
      out.write("\t var PIU_Name1=encodeURIComponent(PIU_Name);\r\n");
      out.write("\tvar url=\"modifytoDb.jsp?type=piu&PIU_Name=\"+PIU_Name1+\"&PIU_ID=\"+PIU_ID+\"&contains=\"+i+\"\";\r\n");
      out.write("\twindow.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');\r\n");
      out.write("//returnProjects(id);\r\n");
      out.write("}\r\n");
      out.write("function modifydisplay3(Type,Department_Name,Department_Id)\r\n");
      out.write("{  \t\t var i=0;\r\n");
      out.write("var pattern = new RegExp(/[~`!#$%\\^&*+=\\-\\[\\]\\\\';,/{}|\\\\\":<>\\?]/); //unacceptable chars\r\n");
      out.write("\t    if (pattern.test(Department_Name)) {\r\n");
      out.write("\t        i=1;\r\n");
      out.write("\t        } \r\n");
      out.write("var Department_Name1=encodeURIComponent(Department_Name);\r\n");
      out.write("\tvar url=\"modifytoDb.jsp?type=Departments&depType=\"+Type+\"&depName=\"+Department_Name1+\"&depId=\"+Department_Id+\"&contains=\"+i+\"\";\r\n");
      out.write("\twindow.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');\r\n");
      out.write("//returnProjects(id);\r\n");
      out.write("}\r\n");
      out.write("function modifydisplay4(DesignationType,Designation_Name,Designation_Id,Departmentname)\r\n");
      out.write("{  \tvar i=0;\r\n");
      out.write("var pattern = new RegExp(/[~`!#$%\\^&*+=\\-\\[\\]\\\\';,/{}|\\\\\":<>\\?]/); //unacceptable chars\r\n");
      out.write("\t    if (pattern.test(Designation_Name)) {\r\n");
      out.write("\t        i=1;\r\n");
      out.write("\t        } \t  \t\r\n");
      out.write("var Designation_Name1=encodeURIComponent(Designation_Name);\r\n");
      out.write("\tvar url=\"modifytoDb.jsp?type=Designations&desigType=\"+DesignationType+\"&desigName=\"+Designation_Name1+\"&desId=\"+Designation_Id+\"&departmentold=\"+Departmentname+\"&contains=\"+i+\"\";\r\n");
      out.write("\twindow.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');\r\n");
      out.write("//returnProjects(id);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function modifydisplay5(Document_Type,Document_Id,loctype)\r\n");
      out.write("{  \t\t\r\n");
      out.write("\tvar i=0;\r\n");
      out.write("\tvar pattern = new RegExp(/[~`!#$%\\^&*+=\\-\\[\\]\\\\';,/{}|\\\\\":<>\\?]/); //unacceptable chars\r\n");
      out.write("\t\t    if (pattern.test(Document_Type)) {\r\n");
      out.write("\t\t        i=1;\r\n");
      out.write("\t\t        }\r\n");
      out.write("\tvar Document_Type1=encodeURIComponent(Document_Type);\r\n");
      out.write("\tvar url=\"modifytoDb.jsp?type=Documents&Document_Type=\"+Document_Type1+\"&Document_Id=\"+Document_Id+\"&Loc_Type=\"+loctype+\"&contains=\"+i+\"\";\r\n");
      out.write("\twindow.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');\r\n");
      out.write("//returnProjects(id);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function modifydisplay6(Project_type,Project_type_id)\r\n");
      out.write("{  \t\r\n");
      out.write("\tvar i=0;\r\n");
      out.write("\tvar pattern = new RegExp(/[~`!#$%\\^&*+=\\-\\[\\]\\\\';,/{}|\\\\\":<>\\?]/); //unacceptable chars\r\n");
      out.write("\t\t    if (pattern.test(Project_type)) {\r\n");
      out.write("\t\t        i=1;\r\n");
      out.write("\t\t        }\r\n");
      out.write("\tvar Project_type1=encodeURIComponent(Project_type);\r\n");
      out.write("\tvar url=\"modifytoDb.jsp?type=Projects&Project_type=\"+Project_type1+\"&Project_type_id=\"+Project_type_id+\"&contains=\"+i+\"\";\r\n");
      out.write("\twindow.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');\r\n");
      out.write("//returnProjects(id);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<style>\r\n");
      out.write("\r\n");
      out.write("div.absolute {\r\n");
      out.write("   \tposition:absolute;\r\n");
      out.write("   \tmargin-top: 5px;\r\n");
      out.write("   \tmargin-left: 105px;\r\n");
      out.write("   \tmargin-bottom: 20px;\r\n");
      out.write(" \tpadding: 15 px;\r\n");
      out.write("    width: auto;\r\n");
      out.write("    height: 30px;\r\n");
      out.write("    border: 3px double #ff4d4d;\r\n");
      out.write("    background-color:#ffe6e6;\r\n");
      out.write("        }\r\n");
      out.write("    table.center {\r\n");
      out.write("    margin-left:auto; \r\n");
      out.write("    margin-right:auto;\r\n");
      out.write("  }\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
String user = (String)session.getAttribute("user_name");
//System.out.println("UZER:"+user);

      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write(" \r\n");
      out.write(" <div class=\"absolute\" style=\"font-weight:bold\" ><h8>&nbsp;&nbsp;&nbsp;[Master List] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>\r\n");
      out.write("\r\n");
      out.write("<h8><font style=\"color:red; font-weight:normal\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style=\"color:#3333cc; font-weight:normal\">:&nbsp;");
      out.print((String)session.getAttribute("user_name") );
      out.write("&nbsp;&nbsp;&nbsp;</font></h8>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"container\" style=\"margin-top:60px;\">\r\n");
      out.write("<form id=\"loginForm111\" name=\"loginForm111\" method=\"post\">\r\n");
      out.write("<table class=\"table table-hover table-bordered\" style=\"background-color: #F0FFFF\">\r\n");
      out.write("<tr class=\"active\">\r\n");
      out.write("<td align=\"center\"><p><font color=\"red\"><h2>Master Data Operations</h2></font></p></td>\r\n");
      out.write("</tr>\r\n");
      out.write("<tr>\r\n");
      out.write("\r\n");
      out.write("<td style=\"background-color: #F0FFFF\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select Options:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("<select name=\"tab\" id=\"tab\"  onchange=\"showList(this.value)\">\r\n");
      out.write("                        <option selected=\"selected\">-- Select Options --</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"zone\">Zone</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"division\">Division</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"Others\">Other Organizations</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"piu\">PIU of RVNL</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"Departments\">Department</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"Designations\">Designation</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"Documents\">Document Type</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"Projects\">Project Type</option>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</select> <br> <br>  \r\n");
      out.write("\t\t\t<div id=\"list\"></div>\t\r\n");
      out.write("</td></tr></table>\r\n");
      out.write("\r\n");
      out.write("</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>\r\n");
      out.write("<br><br><br>\t\t\t\t\t\t\t\t\t\t\t      ");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<style>\r\n");
      out.write("@import url('http://fonts.googleapis.com/css?family=Open+Sans:400,700');\r\n");
      out.write("\r\n");
      out.write("footer{\r\n");
      out.write("\tposition: fixed;\r\n");
      out.write("\tmargin-top:150px;\r\n");
      out.write("\tbottom: 0;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- \r\n");
      out.write("<footer>\r\n");
      out.write("<div class=\"city\">\r\n");
      out.write("  <ul class=\" nav navbar-nav\">\r\n");
      out.write("  \r\n");
      out.write("    <li class=\"footerli\">Rail Vikas Nigam Limited.</li>\r\n");
      out.write("    </ul>\r\n");
      out.write("    <ul   class=\"nav navabar-nav\" style=\"float:right;\">\r\n");
      out.write("   <li class=\"footerli\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Design & Developed By<a href=\"http://www.awcsoftware.net\" style=\"text-decoration:none;\">AWC SOFTWARE PVT LTD</a></li>\r\n");
      out.write("    \r\n");
      out.write("  </ul>\r\n");
      out.write(" </div>\r\n");
      out.write("\r\n");
      out.write("</footer> -->\r\n");
      out.write("\r\n");
      out.write("<footer class=\"footer-basic-centered\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t<p class=\"footer-company-motto\" style=\"float:left;\">Rail Vikas Nigam Limited</p>\r\n");
      out.write("\t\t\t<p class=\"footer-company-motto\" style=\"float:center; font-family:serif; font-size:14px; font-style:italic; margin-top:5px;\">Ver:2.30.pks</p>\r\n");
      out.write("\t\t\t<p class=\"footer-company-name\" style=\"float:right; margin-top:-20px;\"> Design & Developed By<a href=\"http://www.awcsoftware.net\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AWC SOFTWARE PVT LTD</a></p>\r\n");
      out.write("\r\n");
      out.write("\t\t</footer>\r\n");
      out.write("</body>");
      out.write("\r\n");
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