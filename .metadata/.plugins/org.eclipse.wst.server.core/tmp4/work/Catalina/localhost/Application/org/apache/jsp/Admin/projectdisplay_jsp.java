/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.86
 * Generated at: 2018-05-04 10:56:07 UTC
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

public final class projectdisplay_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("     \r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<br>\r\n");

String scond="";
String piu=request.getParameter("PIU_of_RVNL"); 
String division_name=request.getParameter("division"); 
String Zone=request.getParameter("zone_name");  
String proj_type=request.getParameter("proj_type");  

Zone=Zone.replace("~"," ");

String buffer="";
int flag=0;
int projectval=0;
if(piu !="" ) {
	scond=" a.PIU_of_RVNL='"+piu+"' ";
}
if (division_name!=""){
	if (scond!=""){
		scond=scond+" and c.division_name='"+division_name+"' ";	
} else {
	scond=" c.division_name='"+division_name+"' ";
}
}
if (proj_type!=""){
	if (scond!=""){
		scond=scond+" and a.Project_Type='"+proj_type+"' ";	
} else {
	scond=" a.Project_Type='"+proj_type+"' ";
}
}

System.out.println("coming upto here--------------------------"+scond);
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     String division=null;
	     Connection conn = ds.getConnection();
	     ResultSet rs1 = null, rs2 = null;
	     PreparedStatement ps1 = null, ps2=null;
         buffer="<div id ='project_select' style='display: inline;'><b></b><select name='projects' id='project1' style='width: 240px;margin: 20px 0px 0px 98px;' onchange='Locselect(this.value);'><option value=''>-- Select Project --</option>";
	     
         if(Zone!=""){
	    	 String zone_id=null;
	    	
	    	 String sql1="select * from xx_zones_master where Zone_Name='"+Zone+"'";
	    	 ps1 = conn.prepareStatement(sql1);
				rs1 = ps1.executeQuery();
				while(rs1.next()){ 
	    	 zone_id=rs1.getString("Zone_Id");
	    	 
				}
				if (scond!=""){
					scond=scond+" and c.zone_id="+zone_id+" ";	
			} else {
				scond=" c.zone_id="+zone_id+" ";
			}
	     } 	
         //System.out.println("Project Display-------------------------"+scond);
         String sql="";
	    	  if (scond.equalsIgnoreCase("")) {
	    		sql="select distinct a.project project from xx_projectattributes_master a join xx_packages_project b on a.project_id=b.project_id join xx_project_division_map c on b.package_id=c.package_id order by a.project";
	    	 } else {
	    	   sql="select distinct a.project project from xx_projectattributes_master a join xx_packages_project b on a.project_id=b.project_id join xx_project_division_map c on b.package_id=c.package_id where " + scond+" order by a.project";
	    	 }
	    	  
	    	 	ps2 = conn.prepareStatement(sql);
				rs2 = ps2.executeQuery();
				try{
				while(rs2.next()){
				String project_name=rs2.getString("Project");						
										flag=1;
									       
								    	  buffer=buffer+"<option value='"+project_name+"'>"+project_name+"</option>";
								    	  System.out.println("Project Display option:"+project_name);			
				}	    	
				buffer=buffer+"</div>";
				ps1.close(); ps2.close(); 
				rs1.close(); rs2.close(); 
							}
	     catch(Exception e)
	     {
	    	e.printStackTrace(); 
	     }
				
	       if(flag==1){
		        response.getWriter().println(buffer); 
		        //System.out.println("Project Display- 2"+buffer);
		           
		       }else{
		    	 buffer="<div id ='project_select' style='display: inline;'><b></b><select name='projects' id='project1' style='width: 240px;margin: 20px 0px 0px 98px;' onchange='Locselect(this.value);'><option value=''>-- Select Project --</option>";
	     
		    	response.getWriter().println(buffer);

		       }
	       conn.close();
}			catch(Exception e){
	e.printStackTrace();
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