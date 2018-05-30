<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="resources/JS/validate230.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

				

<%
double km1=0.00;
String code2 = request.getParameter("code");
int code1=Integer.parseInt(code2);
String projname = request.getParameter("projname");
String type1=request.getParameter("type");
String majsec1 = request.getParameter("majsec");
String smajsec1 = request.getParameter("smajsec");
String km2 = request.getParameter("Km");
if (km2!=null && km2!="") {
 km1=Double.parseDouble(km2);
}
String stn1 = request.getParameter("stn");

String buffer="";
int flag=0;
System.out.println("inside sowlocation_report.."+code1+projname+type1+majsec1+smajsec1+km1+stn1);
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	    // System.out.println("doctype="+doctype+smajsec1+stn1);
	     Connection conn = ds.getConnection();
	if (code1==1) {
	   /*  
	     String sql="select * from xx_documentattributes_master where Document_Type='"+doctype+"'";

	     PreparedStatement ps4 = conn.prepareStatement(sql);
	       ResultSet rs1 = ps4.executeQuery();
	     */  
	       buffer="";
	       // while(rs1.next()){
	    	 //  String loctype = rs1.getString("Location_Type");
	    	 //  System.out.println("loc="+loctype);
	    	  // buffer=buffer+"<INPUT TYPE='hidden' Name='loc_type' Id='loc_type' value='"+loctype+"'>";
	  	     	if (type1.equalsIgnoreCase("1")) {
	    				buffer=buffer+"<div id='KmMajsecDiv' style='display:inline;'>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;Major Section:&nbsp;&nbsp;&nbsp;<select name='Majsec' id='Majsec' style='width:262px;' onchange='disablekm_Report(this.value,1)'><option value='none'>-- Select Major Section--</option>";
	    				 String sql5="select a.Major_Section from xx_project_km a JOIN xx_projectattributes_master b  on a.Project_Id = b.Project_ID  where b.Project='"+ projname+ "' order by a.Major_Section";
	    						 //"select Major_Section from xx_project_km  where Project_Id='"+projectid+"' order by Major_Section";
	    			     PreparedStatement ps5 = conn.prepareStatement(sql5);
	    			       ResultSet rs5 = ps5.executeQuery();
	    			       String majsec=null;
	    			        while(rs5.next()){
	    			    	   majsec = rs5.getString("Major_Section");
								buffer=buffer+"<option value='"+majsec+"'>"+majsec+"</option>";
								flag=1;
	    			        }
	    			        buffer=buffer+"</select> </div> <div id='fkmDiv' style='display:inline;'><br> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From Km:&nbsp;&nbsp;<input type='number' step='0.001' name='frmKm' id='frmKm'  style='width: 82px' onchange='ShowLocation_Report("+2+",\""+projname+"\",$(\"#Majsec\").val(), null, this.value);'></div><div id='tkmDiv' style='display:inline;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To Km:&nbsp;&nbsp;<input type='number' step='0.001' name='toKm' id='toKm'  style='width: 82px' onchange='ShowLocation_Report("+3+",\""+projname+"\",$(\"#Majsec\").val(), null, this.value);'></div> <span id='err8'><INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value='null'> </span><span id='err9'><INPUT TYPE='HIDDEN' NAME='exist2' ID='exist2' value='null'> </span>";
	    			       
	    			    } else if (type1.equalsIgnoreCase("2") ) {
		    				buffer=buffer+"<div id='stnMajsecDiv' style='display:inline;'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Major Section:&nbsp;&nbsp;&nbsp;<select name='sMajsec' id='sMajsec' style='width:262px;' onchange='showlocStn(\""+projname+"\",this.value);'><option value='none'>-- Select Major Section --</option>";
			    				String sql5="select distinct a.Major_Section from xx_project_station a JOIN xx_projectattributes_master b  on a.Project_Id = b.Project_ID where b.Project='"+ projname+ "' order by a.Major_Section";
			    				//				String sql5="select distinct Major_Section from xx_project_station  where Project_Id='"+projectid+"' order by Major_Section";
			    			     PreparedStatement ps5 = conn.prepareStatement(sql5);
			    			       ResultSet rs5 = ps5.executeQuery();
			    			       String smajsec=null;
			    			        while(rs5.next()){
			    			    	   smajsec = rs5.getString("Major_Section");
										buffer=buffer+"<option value='"+smajsec+"'>"+smajsec+"</option>";
										flag=1;
			    			        }
			    			        buffer=buffer+"</select></div><br> <br><div id='frmstnDiv' style='display:inline; margin-left:5px;'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From Station:&nbsp;&nbsp;<select name='frmstn' id='frmstn' style='width:152px;  margin-left:5px;' ><option value='none'>-- Select Station --</option></select></div><div id='tostnDiv' style='display:inline; margin-left:5px;'>  &nbsp;&nbsp;To Station:&nbsp;&nbsp;<select name='tostn' id='tostn' style='width:152px;' ><option value='none'>-- Select Station --</option></select></div><br><div id='frmstnkmDiv' style='display:inline;  margin-left:15px; margin-top:10px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(From Km):&nbsp;&nbsp;<input type='text'  name='frmstnKm' id='frmstnKm' style='width: 82px; margin-left:7px; margin-top:10px; background-color:lightgray;' readonly='true'></div><div id='tostnkmDiv' style='display:inline; margin-left:45px; margin-top:10px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(To Km):&nbsp;&nbsp;<input type='text'  name='tostnKm' id='tostnKm' style='width: 82px;  margin-left:15px; margin-top:10px; background-color:lightgray;'  readonly='true'></div>";									    			     	
			    			         
	    			    }
	  	     	System.out.println("type="+type1+"buffer="+buffer);	    	
	        if(flag==1){
		        response.getWriter().println(buffer); 
		       }else{
		    	   response.getWriter().println(buffer);
		       }
	      
	       } else if (code1==2 || code1==3 || code1==4 ) {
	    	   String sql5="select a.* from xx_project_km a JOIN xx_projectattributes_master b  on a.Project_Id = b.Project_ID where b.Project='"+ projname+ "' and a.Major_Section='"+majsec1+"'";
	    	    
              // System.out.println("query="+query);
               PreparedStatement ps5 = conn.prepareStatement(sql5);
				ResultSet rs5 = ps5.executeQuery();
				int ans=0;
				if(rs5.next())  {   
                	double   fk1=rs5.getDouble("From_Km");
                    double   tk1=rs5.getDouble("To_Km");
                   
    				if (fk1<tk1) {
    				if (km1<fk1 || km1>tk1) {ans=1;} } else  {if (km1<tk1 || km1>fk1) {ans=1;} }
    				 System.out.println("ans="+ans);    				
				if (ans==1) {
					if (code1==3) {
						buffer="<INPUT TYPE='HIDDEN' NAME='exist2' ID='exist2' value='true'><font color=red><br>&nbsp; Invalid entry... [To Km] should be between ";
						} else {
						if (code1==2) {
							buffer="<INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value='true'><font color=red><br>&nbsp; Invalid entry... [From Km] should be between ";
						} else {
							buffer="<INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value='true'><font color=red><br>&nbsp; Invalid entry... [Km] should be between ";
						}
					}
                  	
                     buffer=buffer + fk1+ " and "+tk1+" .... </font>";
                  } else {
                	  if (code1==3) {
                		  buffer="<INPUT TYPE='HIDDEN' NAME='exist2' ID='exist2' value='null'>";
  					} else {
  						buffer="<INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value='null'>";
  					}
                  }
				}
				
			        response.getWriter().println(buffer); 
			      
	       } else if (code1==5) {
	    	   buffer= "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From Station:&nbsp;&nbsp;<select name='frmstn' id='frmstn' style='width:152px;  margin-left:5px;' onchange='ShowLocation_Report("+6+",\""+projname+"\",$(\"#sMajsec\").val(),this.value, null);'><option value='none'>-- Select Station --</option>";
	    	   String sql5="select a.* from xx_project_station a JOIN xx_projectattributes_master b  on a.Project_Id = b.Project_ID where b.Project='"+ projname+ "' and a.Major_Section='"+smajsec1+"' order by a.Station_Km asc";
	    	    	   
	    	   //String sql5 = "select * from xx_project_station where Project_Id='"+projectid+"' and Major_Section='"+smajsec1+"' order by Station_Km asc"; 
	              	PreparedStatement ps5 = conn.prepareStatement(sql5);
					ResultSet rs5 = ps5.executeQuery();
					while (rs5.next())  {   
	                String stn=rs5.getString("Station_Name");
	            	buffer=buffer+"<option value='"+stn+"'>"+stn+"</option>";
					flag=1;
					//System.out.println("majsec="+smajsec1+"STN="+stn);
		              
		        }
		        buffer=buffer+"</select>";
		       	
					if(flag==1){
				        response.getWriter().println(buffer); 
				       }else{
				    	   response.getWriter().println(buffer);
				       }
						
	                  } else if (code1==6) {
	                	  String sql5="select a.* from xx_project_station a JOIN xx_projectattributes_master b  on a.Project_Id = b.Project_ID where b.Project='"+ projname+ "' and a.Major_Section='"+smajsec1+"' and a.Station_Name='"+stn1+"'";
	        	    	 System.out.println("query="+sql5+smajsec1+stn1);
	               PreparedStatement ps5 = conn.prepareStatement(sql5);
					ResultSet rs5 = ps5.executeQuery();
					double sk1;
					if(rs5.next())  {   
	                	   sk1=rs5.getDouble("Station_Km");
	                buffer="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(From Km):&nbsp;&nbsp;<input type='number' step='0.001' name='frmstnKm' id='frmstnKm' style='width: 82px; margin-left:7px; margin-top:10px; background-color:lightgray;'  value="+sk1+" readonly='true'>";
	                System.out.println(smajsec1+"stn Km="+sk1+"stn"+stn1);
 			       flag=1;
					}
					if(flag==1){
				        response.getWriter().println(buffer); 
				       }else{
				    	   response.getWriter().println(buffer);
				       }
						
	                  } else if (code1==7) {
	       	    	   buffer= "&nbsp;&nbsp;To Station:&nbsp;&nbsp;<select name='tostn' id='tostn' style='width:152px;  margin-left:5px;' onchange='ShowLocation_Report("+8+",\""+projname+"\",$(\"#sMajsec\").val(),this.value, null);'><option value='none'>-- Select Station --</option>";
	       	    	   String sql5="select a.* from xx_project_station a JOIN xx_projectattributes_master b  on a.Project_Id = b.Project_ID where b.Project='"+ projname+ "' and a.Major_Section='"+smajsec1+"' order by a.Station_Km asc";
	       	              	PreparedStatement ps5 = conn.prepareStatement(sql5);
	       					ResultSet rs5 = ps5.executeQuery();
	       					while (rs5.next())  {   
	       	                String stn=rs5.getString("Station_Name");
	       	            	buffer=buffer+"<option value='"+stn+"'>"+stn+"</option>";
	       					flag=1;
	       					//System.out.println("majsec="+smajsec1+"STN="+stn);
	       		              
	       		        }
	       		        buffer=buffer+"</select>";
	       		       	
	       					if(flag==1){
	       				        response.getWriter().println(buffer); 
	       				       }else{
	       				    	   response.getWriter().println(buffer);
	       				       }
	       						
	       	                  } else if (code1==8) {
	       	                	  String sql5="select a.* from xx_project_station a JOIN xx_projectattributes_master b  on a.Project_Id = b.Project_ID where b.Project='"+ projname+ "' and a.Major_Section='"+smajsec1+"' and a.Station_Name='"+stn1+"'";
	       	        	    	 System.out.println("query="+sql5+smajsec1+stn1);
	       	               PreparedStatement ps5 = conn.prepareStatement(sql5);
	       					ResultSet rs5 = ps5.executeQuery();
	       					double sk1;
	       					if(rs5.next())  {   
	       	                	   sk1=rs5.getDouble("Station_Km");
	       	                 buffer="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(To Km):&nbsp;&nbsp;<input type='number' step='0.001' name='tostnKm' id='tostnKm' style='width: 82px;  margin-left:15px; margin-top:10px; background-color:lightgray;'  value="+sk1+" readonly='true'>";
	       	            System.out.println(smajsec1+"stn Km="+sk1+"stn"+stn1);
	        			       flag=1;
	       					}
	       					if(flag==1){
	       				        response.getWriter().println(buffer); 
	       				       }else{
	       				    	   response.getWriter().println(buffer);
	       				       }
	       						
	       	                  }   
	       	     
	       
	       
	      // buffer=buffer+"</select>"; 
	       System.out.println("FLAG="+flag+"buffer"+buffer); 
	       
	       
	   //    rs5.close();
	    //   ps5.close();
	       conn.close();
}catch(Exception e){
	e.printStackTrace();
}
%>

</body>
</html>