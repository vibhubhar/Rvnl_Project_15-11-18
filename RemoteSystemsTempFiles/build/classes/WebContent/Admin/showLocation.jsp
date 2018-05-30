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
</head>
<body>

<%
double km1=0.00;
String code2 = request.getParameter("code");
int code1=Integer.parseInt(code2);
String projectid = request.getParameter("projectid");
String doctype=request.getParameter("doctype");
String majsec1 = request.getParameter("majsec");
String smajsec1 = request.getParameter("smajsec");
String km2 = request.getParameter("Km");
if (km2!=null && km2!="") {
 km1=Double.parseDouble(km2);
}
String stn1 = request.getParameter("stn");

String buffer="";
int flag=0;

try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	    // System.out.println("doctype="+doctype+smajsec1+stn1);
	     Connection conn = ds.getConnection();
	if (code1==1) {
	     
	     String sql="select * from xx_documentattributes_master where Document_Type='"+doctype+"'";

	     PreparedStatement ps4 = conn.prepareStatement(sql);
	       ResultSet rs1 = ps4.executeQuery();
	       
	       buffer="";
	        while(rs1.next()){
	    	   String loctype = rs1.getString("Location_Type");
	    	   System.out.println("loc="+loctype);
	    	   buffer=buffer+"<INPUT TYPE='hidden' Name='loc_type' Id='loc_type' value='"+loctype+"'>";
	  	     	if (loctype.equalsIgnoreCase("Section")) {
	    				buffer=buffer+"<div id='KmMajsecDiv' style='display:inline;'> &nbsp;&nbsp;Major Section:&nbsp;&nbsp;&nbsp;<select name='Majsec' id='Majsec' style='width:262px;' onchange='disablekm(this.value,1)'><option value='none'>-- Select Major Section--</option>";
	    				 String sql5="select Major_Section from xx_project_km  where Project_Id='"+projectid+"' order by Major_Section";
	    			     PreparedStatement ps5 = conn.prepareStatement(sql5);
	    			       ResultSet rs5 = ps5.executeQuery();
	    			       String majsec=null;
	    			        while(rs5.next()){
	    			    	   majsec = rs5.getString("Major_Section");
								buffer=buffer+"<option value='"+majsec+"'>"+majsec+"</option>";
								flag=1;
	    			        }
	    			        buffer=buffer+"</select> </div> <div id='fkmDiv' style='display:inline;'><br> <br>&nbsp;&nbsp;From Km:&nbsp;&nbsp;<input type='number' step='0.001' name='frmKm' id='frmKm'  style='width: 102px' onchange='ShowLocation("+2+","+projectid+",$(\"#Majsec\").val(), null, this.value);'></div><div id='tkmDiv' style='display:inline;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To Km:&nbsp;&nbsp;<input type='number' step='0.001' name='toKm' id='toKm'  style='width: 102px' onchange='ShowLocation("+3+","+projectid+",$(\"#Majsec\").val(), null, this.value);'></div> <span id='err8'><INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value='null'> </span><span id='err9'><INPUT TYPE='HIDDEN' NAME='exist2' ID='exist2' value='null'> </span>";
	    			       
	    			    } else if (loctype.equalsIgnoreCase("KM")) {
		    				buffer=buffer+"<div id='KmMajsecDiv' style='display:inline;'> &nbsp;&nbsp;Major Section:&nbsp;&nbsp;&nbsp;<select name='Majsec' id='Majsec' style='width:262px;' onchange='disablekm(this.value,2)'><option value='none'>-- Select Major Section --</option>";
		    				 String sql5="select Major_Section from xx_project_km  where Project_Id='"+projectid+"' order by Major_Section";
		    			     PreparedStatement ps5 = conn.prepareStatement(sql5);
		    			       ResultSet rs5 = ps5.executeQuery();
		    			       String majsec=null;
		    			        while(rs5.next()){
		    			    	   majsec = rs5.getString("Major_Section");
									buffer=buffer+"<option value='"+majsec+"'>"+majsec+"</option>";
									flag=1;
		    			        }
		    			        buffer=buffer+"</select></div><div id='fkmDiv' style='display:inline;'> <br> <br> &nbsp;&nbsp;Km:&nbsp;&nbsp;<input type='number' step='0.001' name='frmKm'	id='frmKm'  style='width: 102px' onchange='ShowLocation("+4+","+projectid+",$(\"#Majsec\").val(), null, this.value); document.getElementById(\"toKm\").value=this.value;'></div><div id='tkmDiv' style='display:none;'><input type='hidden' name='toKm' id='toKm' style='width: 102px' ></div><span id='err8'><INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value=''> </span> <span id='err9'><INPUT TYPE='HIDDEN' NAME='exist2' ID='exist2' value=''> </span>";
		    			     								   
	    			    } else if (loctype.equalsIgnoreCase("Station")) {
			    				buffer=buffer+"<div id='stnMajsecDiv' style='display:inline;'> &nbsp;&nbsp;Major Section:&nbsp;&nbsp;&nbsp;<select name='sMajsec' id='sMajsec' style='width:262px;' onchange='disablekm(this.value,3); ShowLocation("+5+","+projectid+",this.value, null, null);'><option value='none'>-- Select Major Section --</option>";
			    				 String sql5="select distinct Major_Section from xx_project_station  where Project_Id='"+projectid+"' order by Major_Section";
			    			     PreparedStatement ps5 = conn.prepareStatement(sql5);
			    			       ResultSet rs5 = ps5.executeQuery();
			    			       String smajsec=null;
			    			        while(rs5.next()){
			    			    	   smajsec = rs5.getString("Major_Section");
										buffer=buffer+"<option value='"+smajsec+"'>"+smajsec+"</option>";
										flag=1;
			    			        }
			    			        buffer=buffer+"</select></div><div id='stnDiv' style='display:inline;'> <br> <br> &nbsp;&nbsp;Station Name:&nbsp;&nbsp;<select name='stn' id='stn' style='width:152px;' ><option value='none'>-- Select Station --</option></select></div><div id='stnkmDiv' style='display:none;'><input type='hidden'  name='stnKm' id='stnKm' style='width: 102px'></div>";									    			     	
			    			         
	    			    }
	    			    	
	    			   	}
	          if(flag==1){
		        response.getWriter().println(buffer); 
		       }else{
		    	   response.getWriter().println(buffer);
		       }
	      
	       } else if (code1==2 || code1==3 || code1==4 ) {
	    	   String sql5 = "select * from xx_project_km where Project_Id='"+projectid+"' and Major_Section='"+majsec1+"'"; 
              // System.out.println("query="+query);
               PreparedStatement ps5 = conn.prepareStatement(sql5);
				ResultSet rs5 = ps5.executeQuery();
				int ans=0;
				if(rs5.next())  {   
                	double   fk1=rs5.getDouble("From_Km");
                    double   tk1=rs5.getDouble("To_Km");
                   
    				if (fk1<tk1) {
    				if (km1<fk1 || km1>tk1) {ans=1;} } else  {if (km1<tk1 || km1>fk1) {ans=1;} }
    				 //System.out.println("ans="+ans);    				
				if (ans==1) {
					if (code1==3) {
						buffer="<INPUT TYPE='HIDDEN' NAME='exist2' ID='exist2' value='true'><font color=red>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Invalid entry... [To Km] should be between ";
						} else {
						if (code1==2) {
							buffer="<INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value='true'><font color=red>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Invalid entry... [From Km] should be between ";
						} else {
							buffer="<INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value='true'><font color=red>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Invalid entry... [Km] should be between ";
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
	    	   buffer= "<br> <br> &nbsp;&nbsp;Station Name:&nbsp;&nbsp;<select name='stn' id='stn' style='width:152px;' onchange='ShowLocation("+6+","+projectid+",$(\"#sMajsec\").val(),this.value, null);'><option value='none'>-- Select Station --</option>";
	     			    
	    	   String sql5 = "select * from xx_project_station where Project_Id='"+projectid+"' and Major_Section='"+smajsec1+"' order by Station_Km asc"; 
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
	    	   String sql5 = "select * from xx_project_station where Project_Id='"+projectid+"' and Major_Section='"+smajsec1+"' and Station_Name='"+stn1+"'"; 
	              //System.out.println("query="+sql5+smajsec1+stn1);
	               PreparedStatement ps5 = conn.prepareStatement(sql5);
					ResultSet rs5 = ps5.executeQuery();
					double sk1;
					if(rs5.next())  {   
	                	   sk1=rs5.getDouble("Station_Km");
	                buffer="<br><br>&nbsp;&nbsp;Station Km:&nbsp;&nbsp;	&nbsp;&nbsp;<input type='number' step='0.001' name='stnKm' id='stnKm' style='width: 102px'  value="+sk1+">";
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