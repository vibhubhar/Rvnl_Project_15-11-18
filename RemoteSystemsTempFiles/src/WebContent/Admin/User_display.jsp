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

Zone=Zone.replace("~"," ");

String buffer="";
int flag=0;
int projectval=0;
/*
if(piu !="" ) {
	scond=" b.PIU_Id='"+piu+"' ";
}
if (division_name!=""){
	if (scond!=""){
		scond=scond+" and a.division_name='"+division_name+"' ";	
} else {
	scond=" c.division_name='"+division_name+"' ";
}
}
*/
//System.out.println("coming upto here--------------------------"+scond);
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     String division=null;
	     Connection conn = ds.getConnection();
	     ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null;
	     PreparedStatement ps1 = null, ps2=null, ps3 = null, ps4 = null;
         buffer="<select name='suser' id='suser' style='width: 200px; margin: 0px 0px 0px 20px;' ><option value=''>-- Select User id --</option>";
				
         if(Zone!=""){
	    	 String zone_id1=null;
	    	
	    	 String sql1="select * from xx_zones_master where Zone_Name='"+Zone+"'";
	    	 ps1 = conn.prepareStatement(sql1);
				rs1 = ps1.executeQuery();
				while(rs1.next()){ 
	    	 zone_id1=rs1.getString("Zone_Id");
	    	 
				}
				if (scond!=""){
					scond=scond+" and a.zone_id="+zone_id1+" ";	
			} else {
				scond=" a.zone_id="+zone_id1+" ";
			}
	     } 	
         if(piu!=""){
  	    	 String piu_id1=null;
  	    	
  	    	 String sql2="select * from xx_piu_master where PIU_Name='"+piu+"'";
  	    	 ps2 = conn.prepareStatement(sql2);
  				rs2 = ps2.executeQuery();
  				while(rs2.next()){ 
  	    	 piu_id1=rs2.getString("PIU_Id");
  	    	 
  				}
  				if (scond!=""){
  					scond=scond+" and b.piu_id="+piu_id1+" ";	
  			} else {
  				scond=" b.piu_id="+piu_id1+" ";
  			}
  	     } 	
      
         if(division_name!=""){
  	    	 String div_id1=null;
  	    	
  	    	 String sql3="select * from xx_divisions_master where division_name='"+division_name+"'";
  	    	 ps3 = conn.prepareStatement(sql3);
  				rs3 = ps3.executeQuery();
  				while(rs3.next()){ 
  	    	 div_id1=rs3.getString("division_id");
  	    	 
  				}
  				if (scond!=""){
  					scond=scond+" and (a.division_id="+div_id1+" or a.division_id=86)";	
  			} else {
  				scond=" (a.division_id="+div_id1+" or a.division_id=86)";
  			}
  	     } 	
         System.out.println("User display condition --------------------------"+scond);

         String sql="";
	    	  if (scond.equalsIgnoreCase("")) {
	    		sql="select * from xx_user_master where Type='MOR' order by User_name";
	      	 } else {
	    	   sql="select distinct User_name from xx_user_master a join xx_user_zone_mapping b on a.Zone_Id = b.Zone_ID where " + scond+ " order by a.User_name";
				 }
	    	  
	    	 	ps4 = conn.prepareStatement(sql);
				rs4 = ps4.executeQuery();
				try{
				while(rs4.next()){
				String User_Id=rs4.getString("User_name");						
										flag=1;
									       
								    	  buffer=buffer+"<option value='"+User_Id+"'>"+User_Id+"</option>";
							
				}	 
				buffer=buffer+"</select>";
				// System.out.println("User display 2");
				if (ps1!=null) {ps1.close();}
				if (ps2!=null) {ps2.close();}
				if (ps3!=null) {ps3.close();}
				if (ps4!=null) {ps4.close();}
				if (rs1!=null) {rs1.close();}
				if (rs2!=null) {rs2.close();}
				if (rs3!=null) {rs3.close();}
				if (rs4!=null) {rs4.close();}
							}
	     catch(Exception e)
	     {
	    	e.printStackTrace(); 
	     }
				
	       if(flag==1){
		        response.getWriter().println(buffer); 
		        //System.out.println("User display 4");
		       }else{
		    	 buffer="<select name='suser' id='suser' style='width: 200px; margin: 0px 0px 0px 20px;' ><option value=''>-- Select User id --</option></select>";
		    	response.getWriter().println(buffer);

		       }
	       conn.close();
	       //System.out.println("User display 5");

}			catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>