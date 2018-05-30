<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %>    
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="resources/JS/validateSysAdmin230.js"></script>
</head>
<body>
<%
String role1 = (String) session.getAttribute("role");
String zone=request.getParameter("Zone");
String piu=request.getParameter("PIU");
String Org=request.getParameter("Org");
String buffer="";

try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();
	     String sql ="";
	   
         if(piu!=null){
	  		
	  		sql ="select PM.PIU_Name,DEM.Department_Name,DESM.Designation_Name,UM.User_name,UM.Officer_Name,UM.Email_Id,UM.Contact_No from xx_user_master UM , xx_piu_master PM,xx_departments_master DEM,"+
		    		  "xx_designation_master DESM where UM.PIU_ID = PM.PIU_Id and UM.Department_id = DEM.Department_Id and UM.Designation_Id = DESM.Designation_Id"+
		    		  " and PM.PIU_Name ='"+piu+"' order by DEM.Department_Name,DESM.Designation_Name,UM.User_name";	      
	           PreparedStatement ps = conn.prepareStatement(sql);   	           
		         ResultSet rs = ps.executeQuery();

		      buffer ="<div class='scrollit' style='overflow-x: scroll;margin: -321px 0px 60px 1px;width: 100%;height: 434px;position:relative;'><table class='table table-hover table-bordered'><tr class='success'><th class='ListOfTables' width ='5%'><b>SNo</b></th>"+
		    		  "<th class='ListOfTables' width ='15%'><b>Department</b></th>"+
		    		  "<th class='ListOfTables' width ='5%'><b>Designation</b></th><th class='ListOfTables' width ='5%'><b>UserId</b></th><th class='ListOfTables' width ='15%'><b>Officer Name</b></th><th class='ListOfTables' width ='10%'><b>Email Id</b></th><th class='ListOfTables' width ='15%'><b>Contact No</b></th><th class='ListOfTables' width ='5%'><b>Modify</b></th><th class='ListOfTables' width ='15%'><b>Reset Password</b></th><th class='ListOfTables' width ='5%'><b>Action</b></th></tr>";
	   	             int count=0,available=0;
		         while(rs.next()){
		        	String piu_name= rs.getString(1);
		        	String dep_name= rs.getString(2);
		        	String desg_name= rs.getString(3);
		        	String user_name= rs.getString(4);
		        	String officername= rs.getString(5);
		        	String email_id= rs.getString(6);
		        	String contact_no= rs.getString(7);
		        	 String sql15 = "select count(*) from xx_record_actions where ActionPerformedBy='"+user_name+"' ";
		        	 
					  PreparedStatement ps15 = conn.prepareStatement(sql15);
						ResultSet rs15 = ps15.executeQuery();
						if (rs15.next()) {
							available = rs15.getInt(1);								
																					
						
						}
		        	String updatedusername="'";
		        	updatedusername=updatedusername+user_name.replaceAll("/", "~")+"'";
		        	
		        	
		        	count=count+1;
		        	
	         if(available==0){
		       buffer += "<tr class='active' style='width:40%;'><td class='ListOfTables' width ='5%'>"+count+"</td>"+
		    	  		 "<td class='ListOfTables' width ='15%'>"+dep_name+"</td><td class='ListOfTables' width ='5%'>"+desg_name+"</td>"+
		    		 	 "<td class='ListOfTables' width ='5%'>"+user_name+"</td>"+"<td class='ListOfTables' width ='15%'>"+officername+"</td>"+"<td class='ListOfTables' width ='10%'>"+email_id+"</td>"+"<td class='ListOfTables' width ='15%'>"+contact_no+"</td>"
		    	  		 +	"<td class='ListOfTables' width ='5%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin1("+updatedusername+");>Modify</button> </td>"+
		    		 			"<td class='ListOfTables' width ='15%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin("+updatedusername+");>Reset Password</button> </td>"+
				    "<td class='ListOfTables' width ='5%'><button type='button' class='btn btn-primary' onclick=javascript:deleteuser("+updatedusername+"); >Delete</button></tr>";  		        	
	               }
		         
		         else{
		        	 buffer += "<tr class='active' style='width:40%;'><td class='ListOfTables' width ='5%'>"+count+"</td>"+
			    	  		 "<td class='ListOfTables' width ='15%'>"+dep_name+"</td><td class='ListOfTables' width ='5%'>"+desg_name+"</td>"+
			    		 	 "<td class='ListOfTables' width ='5%'>"+user_name+"</td>"+"<td class='ListOfTables' width ='15%'>"+officername+"</td>"+"<td class='ListOfTables' width ='10%'>"+email_id+"</td>"+"<td class='ListOfTables' width ='15%'>"+contact_no+"</td>"
			    	  		 +	"<td class='ListOfTables' width ='5%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin1("+updatedusername+");>Modify</button> </td>"+
			    		 			"<td class='ListOfTables' width ='15%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin("+updatedusername+");>Reset Password</button> </td>"+
					    "<td class='ListOfTables' width ='5%'><button type='button' class='btn btn-primary' onclick=javascript:deleteuser("+updatedusername+"); disabled='true'>Delete</button></tr>";  		        	
		               } 
		         }
		         buffer +="</table></div>";  
		         response.getWriter().println(buffer);
   		}else if(zone!=null) {	     
   			if(zone.equalsIgnoreCase("Railway Board")){
      			 sql=" select DISTINCT ZM.zone_name,DEM.Department_Name,DESM.Designation_Name,UM.User_name,UM.Officer_Name,UM.Email_Id,UM.Contact_No from xx_user_master UM , xx_zones_master ZM,xx_divisions_map DM,xx_departments_master DEM,"+
      	           	     "xx_designation_master DESM where UM.Zone_ID = ZM.Zone_Id and UM.Department_id = DEM.Department_Id "+
      	                    "and UM.Designation_Id = DESM.Designation_Id and ZM.zone_name = '"+zone+"' order by ZM.zone_name, DEM.Department_Name,UM.User_name";
      	            System.out.println("cccc"+sql);
      	            PreparedStatement ps = conn.prepareStatement(sql);        
      	            ResultSet rs = ps.executeQuery();

      	            buffer ="<div class='scrollit' style='overflow-x: scroll;margin: -321px 0px 60px 1px;width: 100%;height: 434px;position:relative;'><table class='table table-hover table-bordered'><tr class='success'><td class='ListOfTables' width ='1%'><b>SNo</b></td>"+
      	   	    		  "<td class='ListOfTables' width ='5%'><b>Department</b></td>"+
      	   	    		  "<td class='ListOfTables' width ='10%'><b>UserId</b></td><td class='ListOfTables' width ='25%'><b>Officer Name</b></td><td class='ListOfTables' width ='5%'><b>Designation</b></td><td class='ListOfTables' width ='15%'><b>Email Id</b></td><td class='ListOfTables' width ='10%'><b>Contact No</b></td><td class='ListOfTables' width ='1%'><b>Modify</b></td><td class='ListOfTables' width ='1%'><b>Reset Password</b></td><td class='ListOfTables' width ='1%'><b>Action</b></td></tr>"; 
      	            int count1=0,available=0;
      	            while(rs.next()){
      	           		String zone_name= rs.getString(1);
      	   	        	//String division= rs.getString(2);
      	   	        	String dep_name= rs.getString(2);
      	   	        	String desg_name= rs.getString(3);
      	   	        	String user_name= rs.getString(4);
      	   	       String sql151 = "select count(*) from xx_record_actions where ActionPerformedBy='"+user_name+"' ";
		        	 
					  PreparedStatement ps151 = conn.prepareStatement(sql151);
						ResultSet rs151 = ps151.executeQuery();
						if (rs151.next()) {
							available = rs151.getInt(1);								
																					
						
						}
      	   	        	String officername= rs.getString(5);
      	   	        	String email_id= rs.getString(6);
      	   	        	String contact_no= rs.getString(7);
      	   	        	String updatedusername="'";
      	   	        	count1=count1+1;
      		        	updatedusername=updatedusername+user_name.replaceAll("/", "~")+"'";
      		        //	if(available==0){
      		        		if(role1.equalsIgnoreCase("System Administrator")){
      		        		buffer +=  "<tr class='active'><td class='ListOfTables' width ='5%'>"+count1+"</td>"+
          	   	     	    		"<td class='ListOfTables' width ='15%'>"+dep_name+"</td>"+
          	   	     	    		"<td class='ListOfTables' width ='15%'>"+user_name+"</td>"+"<td class='ListOfTables' width ='25%'>"+officername+"</td>"+"<td class='ListOfTables' width ='5%'>"+desg_name+"</td>"+"<td class='ListOfTables' width ='15%'>"+email_id+"</td>"+"<td class='ListOfTables' width ='10%'>"+contact_no+"</td>"+
          	     	     	    			"<td class='ListOfTables' width ='1%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin1("+updatedusername+");>Modify</button> </td>"+
          	     	   	     	    		"<td class='ListOfTables' width ='1%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin("+updatedusername+");>Reset Password</button> </td>"+
          	     			    		 			"<td class='ListOfTables' width ='15%'><button type='button' class='btn btn-primary' onclick=javascript:deleteuser("+updatedusername+");>Delete</button></tr></tr>"; 
          	        	
      		        	}else{
      	   	        	 buffer +=  "<tr class='active'><td class='ListOfTables' width ='5%'>"+count1+"</td>"+
      	   	     	    		"<td class='ListOfTables' width ='15%'>"+dep_name+"</td>"+
      	   	     	    		"<td class='ListOfTables' width ='15%'>"+user_name+"</td>"+"<td class='ListOfTables' width ='25%'>"+officername+"</td>"+"<td class='ListOfTables' width ='5%'>"+desg_name+"</td>"+"<td class='ListOfTables' width ='15%'>"+email_id+"</td>"+"<td class='ListOfTables' width ='10%'>"+contact_no+"</td>"+
      	     	     	    			"<td class='ListOfTables' width ='1%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin1("+updatedusername+");>Modify</button> </td>"+
      	     	   	     	    		"<td class='ListOfTables' width ='1%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin("+updatedusername+");>Reset Password</button> </td>"+
      	     			    		 			"<td class='ListOfTables' width ='15%'><button type='button' class='btn btn-primary' onclick=javascript:deleteuser("+updatedusername+"); disabled='true'>Delete</button></tr></tr>"; 
      	            }
      	            }
      	            buffer +="</table></div>"; 
      	            response.getWriter().println(buffer);	
      			}
      			else{
      	  sql=" select ZM.zone_name,DM.Division_Name,DEM.Department_Name,DESM.Designation_Name,UM.User_name,UM.Officer_Name,UM.Email_Id,UM.Contact_No from xx_user_master UM , xx_zones_master ZM,xx_divisions_map DM,xx_departments_master DEM,"+
           	     "xx_designation_master DESM where UM.Zone_ID = ZM.Zone_Id and UM.Division_ID = DM.Division_Id and UM.Department_id = DEM.Department_Id "+
                    "and UM.Designation_Id = DESM.Designation_Id and ZM.zone_name = '"+zone+"' order by DM.Division_Name,DEM.Department_Name, UM.User_name" ;
            
            PreparedStatement ps = conn.prepareStatement(sql);        
            ResultSet rs = ps.executeQuery();

            buffer ="<div class='scrollit' style='overflow-x: scroll;margin: -321px 0px 60px 1px;width: 100%;height: 434px;position:relative;'><table class='table table-hover table-bordered'><tr class='success'><td class='ListOfTables' width ='1%'><b>SNo</b></td>"+
   	    		  "<td class='ListOfTables' width ='1%'><b>Division</b></td><td class='ListOfTables' width ='1%'><b>Department</b></td>"+
   	    		  "<td class='ListOfTables' width ='1%'><b>Designation</b></td><td class='ListOfTables' width ='1%'><b>UserId</b></td><td class='ListOfTables' width ='1%'><b>Officer Name</b></td><td class='ListOfTables' width ='1%'><b>Email Id</b></td><td class='ListOfTables' width ='1%'><b>Contact No</b></td><td class='ListOfTables' width ='1%'><b>Modify</b></td><td class='ListOfTables' width ='1%'><b>Reset Password</b></td><td class='ListOfTables' width ='1%'><b>Action</b></td></tr>"; 
            int count1=0,available=0;
            while(rs.next()){
           		String zone_name= rs.getString(1);
   	        	String division= rs.getString(2);
   	        	String dep_name= rs.getString(3);
   	        	String desg_name= rs.getString(4);
   	        	String user_name= rs.getString(5);
   	        	String sql1511 = "select count(*) from xx_record_actions where ActionPerformedBy='"+user_name+"' ";
	        	
				  PreparedStatement ps1511 = conn.prepareStatement(sql1511);
					ResultSet rs1511 = ps1511.executeQuery();
					if (rs1511.next()) {
						available = rs1511.getInt(1);								
																				
					
					}
   	        	String officername= rs.getString(6);
   	        	String email_id= rs.getString(7);
   	        	String contact_no= rs.getString(8);
   	        	String updatedusername="'";
   	        	count1=count1+1;
	        	updatedusername=updatedusername+user_name.replaceAll("/", "~")+"'";
	        	
	        	//if(available==0){
	        		if(role1.equalsIgnoreCase("System Administrator")){
	        	   	 buffer +=  "<tr class='active'><td class='ListOfTables' width ='1%'>"+count1+"</td>"+
   	     	    		"<td class='ListOfTables' width ='1%'>"+division+"</td><td class='ListOfTables' width ='1%'>"+dep_name+"</td>"+
   	     	    		"<td class='ListOfTables' width ='1%'>"+desg_name+"</td><td class='ListOfTables' width ='1%'>"+user_name+"</td>"+"<td class='ListOfTables' width ='1%'>"+officername+"</td>"+"<td class='ListOfTables' width ='1%'>"+email_id+"</td>"+"<td class='ListOfTables' width ='1%'>"+contact_no+"</td>"+
   	     	    			"<td class='ListOfTables' width ='1%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin1("+updatedusername+");>Modify</button> </td>"+
   	     	    		"<td class='ListOfTables' width ='1%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin("+updatedusername+");>Reset Password</button> </td>"+
		    		 			"<td class='ListOfTables' width ='15%'><button type='button' class='btn btn-primary' onclick=javascript:deleteuser("+updatedusername+");>Delete</button></tr>"; 
	        	}else{
	        		 buffer +=  "<tr class='active'><td class='ListOfTables' width ='1%'>"+count1+"</td>"+
	    	     	    		"<td class='ListOfTables' width ='1%'>"+division+"</td><td class='ListOfTables' width ='1%'>"+dep_name+"</td>"+
	    	     	    		"<td class='ListOfTables' width ='1%'>"+desg_name+"</td><td class='ListOfTables' width ='1%'>"+user_name+"</td>"+"<td class='ListOfTables' width ='1%'>"+officername+"</td>"+"<td class='ListOfTables' width ='1%'>"+email_id+"</td>"+"<td class='ListOfTables' width ='1%'>"+contact_no+"</td>"+
	    	     	    			"<td class='ListOfTables' width ='1%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin1("+updatedusername+");>Modify</button> </td>"+
	    	     	    		"<td class='ListOfTables' width ='1%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin("+updatedusername+");>Reset Password</button> </td>"+
	 		    		 			"<td class='ListOfTables' width ='15%'><button type='button' class='btn btn-primary' onclick=javascript:deleteuser("+updatedusername+"); disabled='true'>Delete</button></tr>"; 
	 	        	
	        		
	        		
	        	}
	        	
	        	}
            buffer +="</table></div>"; 
            response.getWriter().println(buffer);	
       }
   			
         
} else if(Org!=null) {	     
 	  sql=" select UM.User_name from xx_user_master UM , xx_org_master OM where UM.Org_ID = OM.Org_Id and OM.Org_name = '"+Org+"' order by UM.User_Name" ;
       
       PreparedStatement ps = conn.prepareStatement(sql);        
       ResultSet rs = ps.executeQuery();

       buffer ="<div class='scrollit' style='overflow-x: scroll;margin: -321px 0px 60px 1px;width: 100%;height: 434px;position:relative;'><table class='table table-hover table-bordered'><tr class='success'><td class='ListOfTables' width ='1%'><b>SNo</b></td>"+
	    		  "<td class='ListOfTables' width ='20%'><b>UserId</b></td><td class='ListOfTables' width ='20%'><b>Modify</b></td><td class='ListOfTables' width ='20%'><b>Action</b></td></tr>"; 
       int count1=0,available=0;
       while(rs.next()){
      			String user_name= rs.getString(1);
	        	String sql1511 = "select count(*) from xx_record_actions where ActionPerformedBy='"+user_name+"' ";
       	
			  PreparedStatement ps1511 = conn.prepareStatement(sql1511);
				ResultSet rs1511 = ps1511.executeQuery();
				if (rs1511.next()) {
					available = rs1511.getInt(1);								
				}
	        	String updatedusername="'";
	        	count1=count1+1;
       	updatedusername=updatedusername+user_name.replaceAll("/", "~")+"'";
      
       //	if(available==0){
       		if(role1.equalsIgnoreCase("System Administrator")){
       
	        	 buffer +=  "<tr class='active'><td class='ListOfTables' width ='5%'>"+count1+"</td><td class='ListOfTables' width ='20%'>"+user_name+"</td>"+
	     	    			"<td class='ListOfTables' width ='20%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin1("+updatedusername+");>Modify</button> </td>"+
	     	    			"<td class='ListOfTables' width ='15%'><button type='button' class='btn btn-primary' onclick=javascript:deleteuser("+updatedusername+");>Delete</button></tr>"; 
      	
       }else{
    	   buffer +=  "<tr class='active'><td class='ListOfTables' width ='5%'>"+count1+"</td><td class='ListOfTables' width ='20%'>"+user_name+"</td>"+
	    			"<td class='ListOfTables' width ='20%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin1("+updatedusername+");>Modify</button> </td>"+
	    			"<td class='ListOfTables' width ='15%'><button type='button' class='btn btn-primary' onclick=javascript:deleteuser("+updatedusername+"); disabled='true'>Delete</button></tr>"; 
	
       	      	} 
       	
       	}
       buffer +="</table></div>"; 
       response.getWriter().println(buffer);	
  }			
         try { conn.close(); } catch (Exception e) { /* ignored */ }
}
catch(Exception e){
e.printStackTrace();
}         
%>


</body>
</html>