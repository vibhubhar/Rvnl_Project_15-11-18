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
String piu=request.getParameter("PIU_of_RVNL");  
String division_name=request.getParameter("division"); 
String Zone=request.getParameter("Zone");  
String buffer="";
int flag=0;
if(piu !="" || division_name!=""){
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     String division=null;
	     Connection conn = ds.getConnection();
	     ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs6=null,rs13=null,rs14=null;
	     PreparedStatement ps1 = null,ps2=null, ps3 = null,ps4=null,ps5=null,ps6=null,ps13=null,ps14=null;

	     System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa====="+Zone +piu);
	     buffer="<div id ='project_select' style='display: inline;' font color:grey;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='grey'><b></b><select name='project' id='project' style='width: 239px;margin: 22px 0px 0px 72px;' ><option value=''>&nbsp;&nbsp;&nbsp;Select Project</option>";
	     if(Zone!=null){
	    	 String zone_id=null;
	    	 ArrayList<String> proal=new ArrayList<String>();
	    	 String sql1="select * from xx_zones_master where Zone_Name='"+Zone+"'";
	    	 ps2 = conn.prepareStatement(sql1);
				rs3 = ps2.executeQuery();
				while(rs3.next()){ 
	    	 zone_id=rs3.getString("Zone_Id");
	    	 System.out.println("Zone_id=  "+zone_id);
				}
				String sql="select DISTINCT(Project_id) from xx_projectattributes_master where PIU_of_RVNL='"+piu+"' and completed='y'";
		    	 
			     ps5 = conn.prepareStatement(sql);
					rs5 = ps5.executeQuery();
					try{
					while(rs5.next()){
						
						String project_id = rs5.getString("Project_id");
						int projectval=0;
						 sql="select DISTINCT(package_id) from xx_packages_project where Project_Id="+project_id+"";
					     ps1 = conn.prepareStatement(sql);
							rs1 = ps1.executeQuery();
							while(rs1.next()){
									String package_id=rs1.getString("package_id");
									if((division_name.equalsIgnoreCase("none")) || (!division_name.equalsIgnoreCase(""))){
								
									sql="select distinct(package_id) from xx_project_division_map where package_id='"+package_id+"' and zone_id='"+zone_id+"' ";
									//System.out.println("printing inside division data-----------------"+sql);
									}
									else
									{
										sql="select distinct package_id from xx_project_division_map where package_id='"+package_id+"' and zone_id='"+zone_id+"' and division_name='"+division_name+"'";
										//System.out.println("printing inside query data-----"+sql);
											
									}
									
									ps3 = conn.prepareStatement(sql);
										rs4 = ps3.executeQuery();
										while(rs4.next()){
											proal.add(rs4.getString(1));
											System.out.println("added in al =  "+rs4.getString(1));
											projectval=1;
										}
							}		
							
							if(projectval==1){
								sql="select * from xx_projectattributes_master where Project_Id="+project_id+" and completed='y' order by Project";
								//System.out.println("last query -------------"+sql);
							     ps1 = conn.prepareStatement(sql);
									rs1 = ps1.executeQuery();
									while(rs1.next()){
											String project_name=rs1.getString("Project");
											
											System.out.println("project name finally  =  "+project_name);
											// buffer should be written here
											flag=1;
										       
									    	  buffer=buffer+"<option value='"+project_name+"'>"+project_name+"</option>";
											
											
											
									}		
								
								
							}					
							
					}	    	    	 	    	    	 
	    	 ps2.close();rs3.close();ps5.close();rs5.close();ps1.close();rs1.close();ps3.close();rs4.close();
				Set<String> project_ids = new HashSet<String>();
				Iterator<String> it=proal.iterator();
				/* while(it.hasNext()){
					
					sql="select * from xx_packages_project where package_id="+it.next()+"";
				     ps1 = conn.prepareStatement(sql);
						rs1 = ps1.executeQuery();
						while(rs1.next()){
								String project_id=rs1.getString("project_id");
								project_ids.add(project_id);
						}
				
				}
				
				Iterator<String> proit=project_ids.iterator();
					while(proit.hasNext()){
					
					sql="select * from xx_projectattributes_master where Project_Id="+proit.next()+" and completed='y' order by Project";
				     ps1 = conn.prepareStatement(sql);
						rs1 = ps1.executeQuery();
						while(rs1.next()){
								String project_name=rs1.getString("Project");
								
								System.out.println("project name finally  =  "+project_name);
								// buffer should be written here
								flag=1;
							       
						    	  buffer=buffer+"<option value='"+project_name+"'>"+project_name+"</option>";
								
								
								
						}
				
				} */
				
				
				
				
					}
				     catch(Exception e)
				     {
				    	e.printStackTrace(); 
				     }
				
				
				
				
	    	 
	     }else{
	     String sql="select Project from xx_projectattributes_master where PIU_of_RVNL='"+piu+"' and completed='y' order by Project";
	     ps5 = conn.prepareStatement(sql);
			rs5 = ps5.executeQuery();
			while(rs5.next()){
				
				String project = rs5.getString("Project");
				System.out.println("project:"+project);

				
					//projectId = rs6.getString("Project_ID") ;


	     //PreparedStatement ps4 = conn.prepareStatement(sql);
	      // ps3.setString(1, piu);
	       //ResultSet rs1 = ps4.executeQuery();
	       
	      		flag=1;
	       
	    	  buffer=buffer+"<option value='"+project+"'>"+project+"</option>";
	       }	
	     }

				buffer=buffer+"</select></div>"; 
		       System.out.println("FLAG="+flag); 
		       System.out.println("buffer="+buffer);
		       if(flag==1){
		        response.getWriter().println(buffer); 
		       }else{
		    	   //buffer=<!--"<div id ='project' style='display: inline;'><select name='projects' id='projects' style='width: 205px' color=''><option value='-1'>Select Project</option></div>-->";
		    	   response.getWriter().println(buffer);
		       }
conn.close();
}

catch(Exception e){
	e.printStackTrace();
}
}
else
{
	buffer="<div id ='project_select' style='display: inline;' font color:grey;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color='grey'><b></b><select name='projects' id='projects' style='width: 233px;margin: 22px 0px 0px 19px;'><option value=''>&nbsp;&nbsp;&nbsp;--Select Project--</option>";
       response.getWriter().println(buffer);



}
%>

</body>
</html>