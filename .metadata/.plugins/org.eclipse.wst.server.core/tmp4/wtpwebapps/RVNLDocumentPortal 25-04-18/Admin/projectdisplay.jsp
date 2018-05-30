<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<%
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
%>
</body>
</html>