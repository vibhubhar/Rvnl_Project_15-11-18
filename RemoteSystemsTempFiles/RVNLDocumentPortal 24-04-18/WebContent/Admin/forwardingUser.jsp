
<%@page import="java.net.HttpURLConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="included/NewHeader1.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
//$( window ).unload(function() { window.opener.location.reload(true);
//});
$(document).ready(function(){ /*code here*/  
	window.opener.location.reload(true);
//$(function() {
	var pkdate1=document.getElementById("subdate9").value;
      $('#Dateofsubmission3').datepicker({ dateFormat: 'dd/mm/yy',maxDate:'0', changeYear: true});
	  $('#Dateofsubmission3').datepicker('option', 'minDate', new Date(pkdate1));
});
	   
function fwdpk1(doc_id1,initatedfrm) {
var sdate3 = document.getElementById("Dateofsubmission3").value;
 if (isEmpty(sdate3))  {
	 var $j=jQuery.noConflict();
		
	 var dialogid="#dialogid";
	 
	 $j(dialogid).dialog({
        modal: true,
        autoOpen: false,
        title: "Please Fill the date of submission",
        width: 400,
        height: 200
    });
	 
	  $j(dialogid).dialog('open');
return false;
	}
 else {
document.ForwardUser.stage.value = "second";
document.ForwardUser.document_id.value = doc_id1;
document.ForwardUser.initatedfrm1.value = initatedfrm;
document.getElementById("ForwardUser").submit();
return true;
          }

}

function refreshAndClose()
{
   //alert("parent Name"+window.opener);
	window.close();
    
    if (window.opener && !window.opener.closed) 
    {
      window.opener.location.reload(True);
    } 
}
</script>
<html>
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<script src="resources/jQuery/jquery-1.12.3.min.js"></script>
<script src="resources/jQuery/jquery-ui.js"></script>
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
 <link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />
	<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
 <script type="text/javascript">
 //$( window ).unload(function() { window.opener.location.reload(true);
//	});
 </script>
<style>
.ui-datepicker-year {
   background-color: #cc0000;
 padding-left:20px;
}
div.absolute {
   	position:absolute;
   	margin-top: 5px;
   	margin-left: 13px;
   	margin-bottom: 20px;
 	padding: 15 px;
    width: auto;
    height: 30px;
    border: 3px double #ff4d4d;
    background-color:#ffe6e6;
        }
    table.center {
    margin-left:auto; 
    margin-right:auto;
  }
</style>
</head>

<body>
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Create Assignee List] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div><br>
<form id='ForwardUser' name='ForwardUser'>
<INPUT TYPE='HIDDEN' NAME="division1">
<INPUT TYPE='HIDDEN' NAME="stage">
<INPUT TYPE='HIDDEN' NAME="users">
<INPUT TYPE='HIDDEN' NAME="HierType">
<INPUT TYPE='HIDDEN' NAME="Zone_String">
<INPUT TYPE='HIDDEN' NAME="Division_String">
<INPUT TYPE='HIDDEN' NAME="DType">
<INPUT TYPE='HIDDEN' NAME="document_id">
<INPUT TYPE='HIDDEN' NAME="initatedfrm1">
<INPUT TYPE='HIDDEN' NAME="submitiondate1">

<%
String forwd1=null;
String sub_date3=null;
String sub_date6=null;
String rdstatus = (String) session.getAttribute("RealdateStatus");
String doc_id=request.getParameter("document_id");
String type=request.getParameter("HierType");
String zstr=request.getParameter("Zone_String");
String dstr=request.getParameter("Division_String");
String doc_type=request.getParameter("DType");
String docmap_id = request.getParameter("Document_Map_ID");
String submitiondate=request.getParameter("submitiondate");
System.out.println("pk check="+ doc_id+submitiondate);
%>
<c:if test="${param.stage == null}">
<%


String initatedfrm=request.getParameter("initatedfrm");
%>

<div style='vertical-align: baseline; padding: 10px; margin: 20px;'></div>
<%

String docdivision=null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs12=null;
java.util.ArrayList<String> userlistal=new java.util.ArrayList<String>();
java.util.ArrayList<String> userlistal123=new java.util.ArrayList<String>();
java.util.ArrayList<String> divisiondays=new java.util.ArrayList<String>();
java.util.ArrayList<String> zonedays=new java.util.ArrayList<String>();
PreparedStatement ps1 = null, ps3 = null,ps4=null,ps5=null,ps12=null;
try {
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn = ds.getConnection();

java.util.ArrayList<String> dival=new java.util.ArrayList<String>();		
java.util.ArrayList<String> zonal=new java.util.ArrayList<String>();	
String divisionid_u=null,userid_u=null,usrids_u=null,zoneid_u=null,zone_u=null; 
String div_sql_u = "select division_id from xx_divisions_master where division_name='"+dstr+"' ";
PreparedStatement divPS1_u = conn.prepareStatement(div_sql_u);


ResultSet divRS1_u = divPS1_u.executeQuery();
if (divRS1_u.next()){
	divisionid_u=divRS1_u.getString("division_id");


}

userid_u="select * from xx_user_master where Type='MOR' and Division_ID='"+divisionid_u+"' order by User_name";
PreparedStatement divPS2_u = conn.prepareStatement(userid_u);
ResultSet divRS2_u = divPS2_u.executeQuery();


while (divRS2_u.next()){
usrids_u=divRS2_u.getString("User_name");
	
dival.add(usrids_u);	

}
String div_sql2_u = "select Ext_Zone_Id from xx_divisions_map where division_id="+divisionid_u;
PreparedStatement divPS3_u = conn.prepareStatement(div_sql2_u);
	
	
	ResultSet divRS3_u = divPS3_u.executeQuery();
	if (divRS3_u.next()){
		zoneid_u=divRS3_u.getString("Ext_Zone_Id");
	}
	String zon_sql_u = "select Zone_Name from xx_zones_master where Zone_Id='"+zoneid_u+"'";
	PreparedStatement zonPS_u = conn.prepareStatement(zon_sql_u);
	ResultSet zonRS_u = zonPS_u.executeQuery();
	while(zonRS_u.next()){
	zone_u=zonRS_u.getString("Zone_Name");
	
	}
	

					
					String zone_sql2_u="select * from xx_user_master where Zone_ID='"+zoneid_u+"' and Division_Id= 86 order by User_name";
					PreparedStatement zonPS1_u = conn.prepareStatement(zone_sql2_u);
					ResultSet zonRS1_u = zonPS1_u.executeQuery();
					String userid1_u=null;
					while(zonRS1_u.next()){
						
						userid1_u=zonRS1_u.getString("User_name");
						
						// add to arraylist
						
						zonal.add(userid1_u);
					
					}

if(type.equalsIgnoreCase("Division")){
	
	
					String divisionHid=null,userid=null,usrids=null; 
					String div_sql1 = "select * from xx_document_mapping where document_Map_ID='"+doc_id+"'";
					PreparedStatement divPS1 = conn.prepareStatement(div_sql1);
					
					
					ResultSet divRS1 = divPS1.executeQuery();
					if (divRS1.next()){
						divisionHid=divRS1.getString("Division_HierarchyId");
					
					
					}
					if(divisionHid!=null){
					userid="select * from xx_doc_divisions_hierarchy where Hierarchy_id="+divisionHid;
					PreparedStatement divPS2 = conn.prepareStatement(userid);
					ResultSet divRS2 = divPS2.executeQuery();
					
					
					while (divRS2.next()){
					usrids=divRS2.getString("userid");
						
					// added in arraylist		
					userlistal.add(usrids);
					}
					}			
					}

else if(type.equalsIgnoreCase("Zone")){
	
	String zoneHid=null;
	String zon_sql = "select * from xx_document_mapping where document_Map_ID='"+doc_id+"'";
	PreparedStatement zonPS = conn.prepareStatement(zon_sql);
	ResultSet zonRS = zonPS.executeQuery();
	while(zonRS.next()){
		zoneHid=zonRS.getString("Zone_HierarchyId");
	
	}
	if(zoneHid!=null){
				String zone_sql2="select * from xx_doc_zones_hierarchy where Hierarchy_id="+zoneHid;
					PreparedStatement zonPS1 = conn.prepareStatement(zone_sql2);
					ResultSet zonRS1 = zonPS1.executeQuery();
					String userid1=null;
					while(zonRS1.next()){
						
						userid1=zonRS1.getString("userid");
						
				//added in arraylist	
						userlistal.add(userid1);
					}
	}
					
				
} else if(type.equalsIgnoreCase("Both")){
	String divisionHid=null,userid=null,usrids=null,days=null,testdays=null; 
	String div_sql1 = "select * from xx_document_mapping where document_Map_ID='"+doc_id+"'";
	
	PreparedStatement divPS1 = conn.prepareStatement(div_sql1);
	
	
	ResultSet divRS1 = divPS1.executeQuery();
	if (divRS1.next()){
		divisionHid=divRS1.getString("Division_HierarchyId");
	
	
	}
	if(divisionHid!=null){
	userid="select * from xx_doc_divisions_hierarchy where Hierarchy_id='"+divisionHid+"'";
	PreparedStatement divPS2 = conn.prepareStatement(userid);
	ResultSet divRS2 = divPS2.executeQuery();
	
	
	while (divRS2.next()){
	usrids=divRS2.getString("userid");
	days=divRS2.getString("Days");
	userlistal.add(usrids);
	divisiondays.add(days);
	// added in arraylist				
	}
	}
	String zoneHid=null;
	String zon_sql = "select * from xx_document_mapping where document_Map_ID='"+doc_id+"' order by Zone_HierarchyId";
	PreparedStatement zonPS = conn.prepareStatement(zon_sql);
	ResultSet zonRS = zonPS.executeQuery();
	while(zonRS.next()){
		zoneHid=zonRS.getString("Zone_HierarchyId");
	
	}
	if(zoneHid!=null){
				String zone_sql2="select * from xx_doc_zones_hierarchy where Hierarchy_id='"+zoneHid+"' order by userid";
					PreparedStatement zonPS1 = conn.prepareStatement(zone_sql2);
					ResultSet zonRS1 = zonPS1.executeQuery();
					String userid1=null;
					while(zonRS1.next()){
						
						userid1=zonRS1.getString("userid");
						days=zonRS1.getString("Days");
						userlistal.add(userid1);
						divisiondays.add(days);
						zonedays.add(days);
				//added in arraylist	
					
					}
	}
						



String performed=null,days1=null;
	String zone_sql22="select * from xx_record_actions where Document_id='"+doc_id+"' and ActionPerformed IN('Forward With Approval','pending','approved','return','Resubmitted','Finally Approved','Returned to rvnl','Forward Without Approval')";
	PreparedStatement zonPS12 = conn.prepareStatement(zone_sql22);
	ResultSet zonRS12 = zonPS12.executeQuery();
	
	while(zonRS12.next()){
		
		performed=zonRS12.getString("ActionPerformedBy");
		days1=zonRS12.getString("AssignedDays");
		userlistal123.add(performed);
		divisiondays.add(days1);
//added in arraylist	
	
	}


}

boolean retval = userlistal123.isEmpty();
int flag=0;
boolean ret = userlistal.isEmpty();

boolean div1 = dival.isEmpty();
boolean div2 = zonal.isEmpty();
 if (((div1 == true) && (div2 == true))){
	 
	 if(submitiondate!=null){
			
%>
<br><br><br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="javascript:submitlistusers('Both','<%=doc_id%>','<%=zstr%>','<%=dstr%>','<%=doc_type%>','<%=initatedfrm%>','<%=submitiondate%>');" disabled>Submit</button>				

<div style="text-align:center;color:red;font-size: 20px;"><b>No Assignee List exists !</b></div><br><br><br>
<div><button type="button" class="btn btn-primary" onclick="location.href='user_index.jsp'" style="margin-left:50%;">Close</button></div>

<%}
	 else{
		 %>
		 <br><br><br><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="javascript:submitlistusers('Both','<%=doc_id%>','<%=zstr%>','<%=dstr%>','<%=doc_type%>','<%=initatedfrm%>','<%=submitiondate%>');" disabled>Submit</button>				
		
		<div style="text-align:center;color:red;font-size: 20px;"><b>No Assignee List exists !</b></div><br><br><br>
		<div><button type="button" class="btn btn-primary" onClick="refreshAndClose()" style="margin-left:50%;width:8%;">Close</button></div>
		
		<%	 
	 }
 }
 else if (((retval == false) || (ret == false)) && (type.equalsIgnoreCase("Both"))){
%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Division:</strong><br>
<div>	<table  class="table table-hover table-bordered" style="width:40%; margin-left:50px;">
<tr><th style="padding-left: 75px;"><strong> Users </strong></th> <th ><center><strong>Target Time For Approval (Days)</strong></center></th></tr>
<%          
	        Iterator<String> divitr=dival.iterator();
			Iterator<String> divitr1=divisiondays.iterator();
				String username=null,days=null;
			while(divitr.hasNext()){
				username=divitr.next();

				if(userlistal123.contains(username) && userlistal.contains(username) && divitr1.hasNext()){
					days=divitr1.next();
				%>
					  <tr><td>
					 <input type ="checkbox"  name="useriddiv1" id="useriddiv1" style="margin-left:50px;" value="<%=username%>" checked disabled> <%=username%> <input type ="hidden" name="useriddiv" id="useriddiv" style="margin-left:50px;" value="<%=username%>"> <br></td><td><center><input type="number" id="divisionnumber1"  name="divisionnumber1" readonly="readonly"  value="<%=days%>" min="1" style="width: 20%; text-align:center;" disabled> <input type ="hidden" name="divisionnumber" id="divisionnumber" style="margin-left:50px;" value="<%=days%>"> </center></td></tr>
									<%
					userlistal.remove(username);
				}
				
				else if(userlistal.contains(username) && divitr1.hasNext()){
					days=divitr1.next();
					%>
					 <tr> <td>
					<input type ='checkbox' class="Blocked" name='useriddiv' id='useriddiv' style="margin-left:50px;" value="<%=username%>" checked> <%=username%><br></td><td><center><input type="number" id="divisionnumber" class="textbox" value="<%=days%>" name="divisionnumber" min="1" style="width: 20%; text-align:center;"></center></td>
					
					<%
					
				}else{
					%>
			 	<tr> <td><input type ='checkbox' class="Blocked" name='useriddiv' id='useriddiv' style="margin-left:50px;" value="<%=username%>" > <%=username%><br></td><td><center><input type="number" id="divisionnumber" class="textbox" name="divisionnumber"  min="1" style="width: 20%; text-align:center;" disabled></center></td>
				 
				 <%
				}
			}
			%>
			</table></div>
			<br> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Zone:</strong><br>
<div>	<table  class="table table-hover table-bordered" style="width:40%; margin-left:50px;">
<tr><th style="padding-left: 75px;"><strong> Users </strong></th> <th ><center><strong>Target Time For Approval (Days)</strong></center></th></tr>
	
			<%
			 Iterator<String> zonitr=zonal.iterator();
			Iterator<String> zonitr1=zonedays.iterator();
			String userdays=null;
		while(zonitr.hasNext()){
			username=zonitr.next();
			if(userlistal123.contains(username) && userlistal.contains(username)  && zonitr1.hasNext()){
				userdays=zonitr1.next();
				%>
				<tr><td>
				 <input type ='checkbox' name='useridzon1' id='useridzon1' style="margin-left:50px;" value="<%=username%>" checked disabled> <%=username%><input type ='hidden' name='useridzon' id='useridzon' style="margin-left:50px;" value="<%=username%>" ><br></td><td><center><input type="number" id="zonenumber" value="<%=userdays%>" name="zonenumber" readonly="readonly" min="1" style="width: 20%; text-align:center;" disabled> <input type ="hidden" name="zonenumber" id="zonenumber" style="margin-left:50px;" value="<%=days%>"> </td></center></tr>
				
				<%
				userlistal.remove(username);
			}
			
			else if(userlistal.contains(username) && zonitr1.hasNext()){
				userdays=zonitr1.next();
				%>
				 <tr><td>
				 <input type ='checkbox' class="Blocked" name='useridzon' id='useridzon' style="margin-left:50px;" value="<%=username%>" checked> <%=username%><br></td><td><center><input type="number" class="textbox" id="zonenumber" value="<%=userdays%>" name="zonenumber" min="1" style="width: 20%; text-align:center;" ></center></td></tr> 
				<%
				
			}else{
				%>
		 	<tr><td><input type ='checkbox' class="Blocked" name='useridzon' id='useridzon' style="margin-left:50px;" value="<%=username%>" > <%=username%><br></td><td><center><input type="number" class="textbox" id="zonenumber" name="zonenumber" min="1" style="width: 20%; text-align:center;" disabled></center></td></tr>
			 <%
			}
		}
 %>
</table></div>
<br><br> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" style="margin-left:150px;" class="btn btn-primary" onclick="javascript:submitlistusers('Both','<%=doc_id%>','<%=zstr%>','<%=dstr%>','<%=doc_type%>','<%=initatedfrm%>','<%=submitiondate%>');">Submit</button>		
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class='btn btn-primary' value='Cancel'  style="margin-left:100px;" onClick=" javascript:window.close(); return refreshAndClose();" type='button'/>	
<br><br><%			
		} else {
	%>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Division:</strong><br>
<div><table  class="table table-hover table-bordered" style="width:40%; margin-left:50px;">
<tr><th style="padding-left: 75px;"><strong> Users </strong></th> <th ><center><strong>Target Time For Approval (Days)</strong></center></th></tr>
	<%
		
	Iterator<String> divitr=dival.iterator();
					String username=null;
				while(divitr.hasNext()){
					username=divitr.next();
					
						%>
				 	<tr><td>
				 	<input type ='checkbox'  class="Blocked" name='useriddiv' id='useriddiv' onclick="myFunction(this)" style="margin-left:50px;" value="<%=username%>" > <%=username%></td><td><center><input type="number" id="divisionnumber" class="textbox" name="divisionnumber" min="1" style="width: 20%; text-align:center;" disabled></center></td>
				 	 
					 <%
				}
				%>
				</table><br> <br></div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Zone:</strong><br>
<div>	<table  class="table table-hover table-bordered" style="width:40%; margin-left:50px;">
<tr><th style="padding-left: 75px;"><strong> Users </strong></th> <th ><center><strong>Target Time For Approval (Days)</strong></center></th></tr>
				<%
				 Iterator<String> zonitr=zonal.iterator();
				//String username=null;
			while(zonitr.hasNext()){
				username=zonitr.next();
				
					%>
			 <tr><td>
			<input type ='checkbox' name='useridzon'  class="Blocked" id='useridzon' onclick="myFunction(this)" style="margin-left:50px;" value="<%=username%>" > <%=username%></td><td><center><input type="number" class="textbox" id="zonenumber" name="zonenumber" min="1" style="width: 20%; text-align:center;" disabled></center></td>
			 		 		 					 
				 <%
				
			}
	%></table>	<br><br></div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="javascript:submitlistusers('Both','<%=doc_id%>','<%=zstr%>','<%=dstr%>','<%=doc_type%>','<%=initatedfrm%>','<%=submitiondate%>');" style="margin-left:150px;">Submit</button>				
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
				class="btn btn-primary" value="Cancel" style="margin-left:100px;" onClick="window.open('javascript:location.reload(true);', 'c_document'); javascript:window.close(); return refreshAndClose();"  />
	<br><br>
	<%
		}
 } catch(Exception e){
							e.printStackTrace();
						}	finally {
						    try { conn.close(); } catch (Exception e) { /* ignored */ }
						}
 %>	
<br>
 </c:if>
 <div id="dialogid" style="display: none"
								align="center">
								<br> Please Select Data<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');">OK</button>
							</div>
 <c:if test="${param.stage !=null}">

 <%
 
 //System.out.println("my stage val="+ request.getParameter("stage"));
 String stageofpage=request.getParameter("stage");
 if(stageofpage.equalsIgnoreCase("first")){
 String document_id=request.getParameter("document_id");
 
 String DType=request.getParameter("DType");
 
 String Zone_String=request.getParameter("Zone_String");
 
 String Division_String=request.getParameter("Division_String");
 
 String usersdiv[]=request.getParameterValues("useriddiv");
 
 String initatedfrm=request.getParameter("initatedfrm1");
 String submitiondate2=request.getParameter("submitiondate1");
 String divisionnumber[]=request.getParameterValues("divisionnumber");
 String userszon[]=request.getParameterValues("useridzon");
 String zonenumber[]=request.getParameterValues("zonenumber"); 

	
  Connection conn=null;
 try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

		conn = ds.getConnection();
  
if(initatedfrm.equalsIgnoreCase("recreate") ){
	 Statement selectStmt = conn.createStatement();
     String selecthier = "select Ext_Zone_Id from xx_divisions_map where Division_Name='"+Division_String+"'";
     ResultSet rs = selectStmt.executeQuery(selecthier);
     String zoneid1 = null;
     while(rs.next()){
    	 zoneid1 = rs.getString(1);
     }
     String selecthier1 = "select zone_name from xx_zones_master where zone_id="+zoneid1;
     ResultSet rs1 = selectStmt.executeQuery(selecthier1);
     String zonename1 = null;
     while(rs1.next()){
    	 zonename1 = rs1.getString(1);
     }

     Zone_String=zonename1;
	
	
 }

 
 String HierType=request.getParameter("HierType");
 if(HierType.equalsIgnoreCase("Division")){
	 
	 Statement selectStmt = conn.createStatement();
     String selecthier = "select max(hierarchy_id)+1 from xx_doc_divisions_hierarchy";
     ResultSet rs = selectStmt.executeQuery(selecthier);
     String hierId = null;
     while(rs.next()){
  	  hierId = rs.getString(1);
     }
     
     
     
     
     
     Statement stmt = conn.createStatement();

     for (int i=0;i<usersdiv.length;i++){
    	 int j=i+1;
     
     String sql = "INSERT INTO xx_doc_divisions_hierarchy (division,document_type,level,hierarchy_id,document_id,userid,Days)" +
             "VALUES ('"+Division_String+"','"+DType+"',"+j+",'"+hierId+"','"+document_id+"','"+usersdiv[i]+"',"+divisionnumber[i]+")";
	 stmt.executeUpdate(sql); 
     } 
     if(initatedfrm.equalsIgnoreCase("recreate") ){
    	 Statement stmtupd = conn.createStatement();
         String sqlupd = "update xx_document_mapping set Division_HierarchyID="+hierId+",HierarchyType='Division' where Document_Map_ID ="+document_id;
    	 stmt.executeUpdate(sqlupd); 
    		 
     }else{
    
    Statement stmtupd = conn.createStatement();
     String sqlupd = "update xx_document_mapping set Forwarded ='No',Division_HierarchyID="+hierId+",HierarchyType='Division' where Document_Map_ID ="+document_id;
	 stmt.executeUpdate(sqlupd); 
		
     	
     	
     }
	 
	 
 }else if(HierType.equalsIgnoreCase("Zone")){
	 
	 Statement selectStmt = conn.createStatement();
	 String selectzon = "select max(hierarchy_id)+1 from xx_doc_zones_hierarchy";
     ResultSet rs = selectStmt.executeQuery(selectzon);
     String hierId = null;
     while(rs.next()){
  	  hierId = rs.getString(1);
     }
     
     
     
     
     Statement stmt = conn.createStatement();
     for (int i=0;i<userszon.length;i++){
    	 int j=i+1;
    	 String sql = "INSERT INTO xx_doc_zones_hierarchy (zone,document_type,level,hierarchy_id,document_id,userid,Days)" +
                 "VALUES ('"+Zone_String+"','"+DType+"',"+j+",'"+hierId+"','"+document_id+"','"+userszon[i]+"',"+zonenumber[i]+")";
		 stmt.executeUpdate(sql);
    	 
    	 }
     if(initatedfrm.equalsIgnoreCase("recreate")){
    	 Statement stmtupd = conn.createStatement();
         String sqlupd = "update xx_document_mapping Zone_HierarchyID="+hierId+",HierarchyType='Zone' where Document_Map_ID ="+document_id;
    	 stmtupd.executeUpdate(sqlupd);
     }else{
    	 Statement stmtupd = conn.createStatement();
         String sqlupd = "update xx_document_mapping set Forwarded ='No',Zone_HierarchyID="+hierId+",HierarchyType='Zone' where Document_Map_ID ="+document_id;
    	 stmtupd.executeUpdate(sqlupd);	 
     }
      
	 
	 
 }else if(HierType.equalsIgnoreCase("Both")){
	 //System.out.println("..   you are here ....."+document_id);
	 Statement selectStmtdiv = conn.createStatement();
	 String selecthierdiv =null;
	 String selecthierdiv1 =null;
	 String divExist="No";
	 String hierIddiv = null;
	 if(initatedfrm.equalsIgnoreCase("create")){
	  selecthierdiv = "select max(hierarchy_id)+1 from xx_doc_divisions_hierarchy";
	 } else if(initatedfrm.equalsIgnoreCase("recreate")) {
		 //System.out.println(".. 132532 you ...."+initatedfrm);
		  selecthierdiv1 = "select Division_HierarchyId from xx_document_mapping where document_Map_ID='"+document_id+"'";
		  ResultSet rsdiv1 = selectStmtdiv.executeQuery(selecthierdiv1);
		     String hierIddiv1 = null;
		     //System.out.println(".. 1 you ...."+selecthierdiv1);
		     while(rsdiv1.next()){
		  	  hierIddiv1 = rsdiv1.getString(1);
		     }
		   //  System.out.println(".. 11 you ...."+hierIddiv1);
		     if (hierIddiv1!=null) {
		    	 divExist="Yes";
		    	 hierIddiv = hierIddiv1;
		     } else {
		  selecthierdiv = "select max(hierarchy_id)+1 from xx_doc_divisions_hierarchy";
		     }
	 }
	 //System.out.println(".. 1 you ...."+selecthierdiv);
	 if (divExist.equalsIgnoreCase("No")) {
     ResultSet rs = selectStmtdiv.executeQuery(selecthierdiv);
    // String hierIddiv = null;
     while(rs.next()){
  	  hierIddiv = rs.getString(1);
  	 //System.out.println(".. 3 you ...."+hierIddiv);
     }
   }
	 
	 //System.out.println("..0000. pk here -----updated zone length......."+usersdiv+userszon);
     Statement selectStmt = conn.createStatement();
     String selectzon=null;
     String selectzon1=null;
     String zonExist = "No";
     String hierIdzon = null;
     if(initatedfrm.equalsIgnoreCase("create")){
      selectzon = "select max(hierarchy_id)+1 from xx_doc_zones_hierarchy";
     } else if(initatedfrm.equalsIgnoreCase("recreate")){
    	 selectzon1 = "select Zone_HierarchyId from xx_document_mapping where document_Map_ID='"+document_id+"'";
    	 ResultSet rszon1 = selectStmtdiv.executeQuery(selectzon1);
	     String hierIdzon1 = null;
	     while(rszon1.next()){
	  	  hierIdzon1 = rszon1.getString(1);
	     }
	   //  System.out.println("..02....updated zone length......."+hierIdzon1);
	     if (hierIdzon1!=null) {
	    	 zonExist="Yes";
	    	 hierIdzon = hierIdzon1;
	        } else {
    	 selectzon = "select max(hierarchy_id)+1 from xx_doc_zones_hierarchy";
     }
 }
     if (zonExist.equalsIgnoreCase("No")) { 
     ResultSet rszon = selectStmt.executeQuery(selectzon);
     //System.out.println("..03....updated zone length......."+selectzon);
     while(rszon.next()){
  	  hierIdzon = rszon.getString(1);
  	//System.out.println("..04....updated zone length......."+hierIdzon);
     }
     } 
     //System.out.println("..01....updated zone length......."+usersdiv+userszon);
     Statement stmt = conn.createStatement();
	// if(userszon!=null){
		 if(initatedfrm.equalsIgnoreCase("create") && userszon!=null){
			for (int i=0;i<userszon.length;i++){
	    	 int j=i+1;
	    	 String sql = "INSERT INTO xx_doc_zones_hierarchy (zone,document_type,level,hierarchy_id,document_id,userid, Days)" +
	                 "VALUES ('"+Zone_String+"','"+DType+"',"+j+",'"+hierIdzon+"','"+document_id+"','"+userszon[i]+"',"+zonenumber[i]+")";
			 stmt.executeUpdate(sql);
	    	
	    	 }
		 
		// System.out.println("..1....updated zone assignees....");
	 } else  if(initatedfrm.equalsIgnoreCase("recreate")){
		 
		 %>
		 <sql:update dataSource="jdbc/MySQLDB" var="rs">
			   DELETE FROM xx_doc_zones_hierarchy where document_id='<%=document_id%>';
			</sql:update>
		 <%
		 if (userszon!=null){
		 for (int i=0;i<userszon.length;i++){
	    	 int j=i+1;
	    	 String sql = "INSERT INTO xx_doc_zones_hierarchy (zone,document_type,level,hierarchy_id,document_id,userid, Days)" +
	                 "VALUES ('"+Zone_String+"','"+DType+"',"+j+",'"+hierIdzon+"','"+document_id+"','"+userszon[i]+"',"+zonenumber[i]+")";
			 stmt.executeUpdate(sql);
	    	
	    	 }
		  }
	 }
	 //}
	// if(usersdiv!=null){
		 Statement stmt1 = conn.createStatement();
		 if(initatedfrm.equalsIgnoreCase("create") && usersdiv!=null){
			 
		     for (int i=0;i<usersdiv.length;i++){
		    	 int j=i+1;
		     
		     String sql = "INSERT INTO xx_doc_divisions_hierarchy (division,document_type,level,hierarchy_id,document_id,userid, Days)" +
		             "VALUES ('"+Division_String+"','"+DType+"',"+j+",'"+hierIddiv+"','"+document_id+"','"+usersdiv[i]+"',"+divisionnumber[i]+")";
		    
			 stmt1.executeUpdate(sql); 
		     }  
		    // System.out.println("..2....updated division assignees....");
			 }
			 else  if(initatedfrm.equalsIgnoreCase("recreate")){
				 
				 %>
				 <sql:update dataSource="jdbc/MySQLDB" var="rs">
					   DELETE FROM xx_doc_divisions_hierarchy where document_id='<%=document_id%>';
					</sql:update>
				 <%

				 if (usersdiv!=null) {
	     for (int i=0;i<usersdiv.length;i++){
	    	 int j=i+1;
	     
	     String sql = "INSERT INTO xx_doc_divisions_hierarchy (division,document_type,level,hierarchy_id,document_id,userid, Days)" +
	             "VALUES ('"+Division_String+"','"+DType+"',"+j+",'"+hierIddiv+"','"+document_id+"','"+usersdiv[i]+"',"+divisionnumber[i]+")";
		 stmt1.executeUpdate(sql); 
	     }  
			//	 System.out.println("..3....updated divn assignees...."); 
	 }
	}
	 String sqlupd = null;
     if(initatedfrm.equalsIgnoreCase("recreate")){
    	 Statement stmtupd = conn.createStatement();
    	 if (usersdiv!=null && userszon!=null) {
    	      sqlupd = "update xx_document_mapping set Division_HierarchyID="+hierIddiv+",HierarchyType='Both',Zone_HierarchyID="+hierIdzon+" where Document_Map_ID ="+document_id;
    	 } else if (userszon!=null) {
    		 sqlupd = "update xx_document_mapping set HierarchyType='Both',Zone_HierarchyID="+hierIdzon+" where Document_Map_ID ="+document_id;
    	 } else if (usersdiv!=null) {
    		 sqlupd = "update xx_document_mapping set Division_HierarchyID="+hierIddiv+",HierarchyType='Both'  where Document_Map_ID ="+document_id;
    	 } else { 
    	//	 sqlupd = "update xx_document_mapping set Division_HierarchyID=null, HierarchyType='Both',Zone_HierarchyID=null where Document_Map_ID ="+document_id;
    	 }
    		 
    		 stmt.executeUpdate(sqlupd); 
    		 String sql1 = "Select * from xx_document_mapping where Document_Map_ID ="+document_id;
  		 ResultSet rs1 = selectStmt.executeQuery(sql1);
  		Date sub_date4=null;
  		Date sub_date5=null;
  		
 	     while(rs1.next()){
 	  	  forwd1 = rs1.getString("Forwarded");
 	  	sub_date4=rs1.getDate("Date_of_Submission");
 	  	sub_date5=rs1.getDate("DateFinalize");
 	  	  if (forwd1 == null) {forwd1="nm";}
 	  	  }
 	   SimpleDateFormat df= new SimpleDateFormat("dd/MM/yyyy");
 	   //java.util.Date sub_date5 = new java.util.Date(sub_date4.getTime());
 	  	 sub_date3=df.format(sub_date4);
 	  	SimpleDateFormat df1= new SimpleDateFormat("MM/dd/yyyy");
  	   
 	  	sub_date6=df1.format(sub_date5);
 	    System.out.println("111..22.forwrded="+forwd1+"date111..="+sub_date3);
     }else{
     
	    Statement stmtupd = conn.createStatement();
	     if (usersdiv!=null && userszon!=null) {
	    	 sqlupd = "update xx_document_mapping set Forwarded ='No',Division_HierarchyID="+hierIddiv+",HierarchyType='Both',Zone_HierarchyID="+hierIdzon+" where Document_Map_ID ="+document_id;
   	 } else if (userszon!=null) {
   		sqlupd = "update xx_document_mapping set Forwarded ='No', HierarchyType='Both',Zone_HierarchyID="+hierIdzon+" where Document_Map_ID ="+document_id;
   	 } else if (usersdiv!=null) {
   		sqlupd = "update xx_document_mapping set Forwarded ='No',Division_HierarchyID="+hierIddiv+",HierarchyType='Both' where Document_Map_ID ="+document_id;
   	 } else { 
   		sqlupd = "update xx_document_mapping set Forwarded ='No', HierarchyType='Both' where Document_Map_ID ="+document_id;
   	 }
	     
	     stmt.executeUpdate(sqlupd); 
     }
  }

if(initatedfrm.equalsIgnoreCase("recreate") && forwd1.equalsIgnoreCase("yes") ){
	%>
		  <div style='vertical-align: baseline; padding: 10px; margin: 20px;'>
	<center> <div class="alert alert-success" align="center" style="margin-top:100px; width:400px;">
	 <strong>Success!</strong> User list has been updated successfully.
	 <br>
	 <br>
	 <input class='btn btn-primary' value='OK'  onClick="refreshAndClose()" type='button'/>
	 </div></center>
</div>
	 <%
	 
	 
 }else  { 
String doc_id1=request.getParameter("document_id");
if(initatedfrm.equalsIgnoreCase("recreate")){
	submitiondate2 = sub_date3;
	//System.out.println("9999...doc-id="+ doc_id1+" .. initated=" + initatedfrm+"...dare2="+submitiondate2+"fdghfdhfdh.."+sub_date6);
	%>
	<INPUT TYPE='HIDDEN' id="subdate9" value="'<%=sub_date6 %>'">
	<%
	SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	String rd = df.format(new Date());
	if (rdstatus.equalsIgnoreCase("0"))  {
	%>								
	
	<center><div id="changesubmitiondate" class="alert alert-success" align="center" style="margin-top:100px; width:500px; height:220px; color:black;">	
	<br> <br>&nbsp;Date of submission to Railways: <input type="text" name="Dateofsubmission3" id="Dateofsubmission3" style="width: 100px; text-align:center;" value='<%=submitiondate2%>'><br>
	<span style="color:blue;"><br>(Please change the date, if required before submission of the document)</span><br><br> <br>
<button id="appcancle" class="btn btn-primary" onclick="fwdpk1('<%=doc_id1%>', '<%=initatedfrm%>');">OK</button>
<br> </div></center>
<% } else { %>

	<center><div id="changesubmitiondate" class="alert alert-success" align="center" style="margin-top:100px; width:500px; height:220px; color:black;">	
	<br> <br>&nbsp;Date of submission to Railways: <input type="text" name="Dateofsubmission3" id="Dateofsubmission3" style="width: 100px; text-align:center; background-color: lightgray;" value='<%=rd%>' readonly='true'><br>
	<br><br> <br>
<button id="appcancle" class="btn btn-primary" onclick="fwdpk1('<%=doc_id1%>', '<%=initatedfrm%>');">OK</button>
<br> </div></center>
<%
}
//System.out.println("8888...forwd1="+ forwd1+" .. date2="+submitiondate2);
} else {
	//background-color:#F0FFFF; var $j=jQuery.noConflict();$j('#changesubmitiondate').dialog('close');
	// System.out.println("777...forwd1="+ forwd1+" .. date2="+submitiondate2);
	 %>
<c:redirect url="forwarding_usr.jsp">
<c:param name="document_id" value="<%=doc_id1 %>"></c:param>
<c:param name="submitiondate" value="<%=submitiondate2 %>"></c:param>
<c:param name="initatedfrm" value="<%=initatedfrm %>"></c:param>
</c:redirect>
	 
	 <%
}
}
 %>
 <!--  <div style='vertical-align: baseline; padding: 10px; margin: 20px;'>
 <div class="alert alert-success">
 <strong>Success!</strong> Document has been saved successfully.
 <br>
 <br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="javascript:forwardlistusers('<%=doc_id%>');">want to forward now</button>				
 
</div>
</div> -->
<%
 }catch(Exception e){
	 e.printStackTrace();
 } finally {
	    try { conn.close(); } catch (Exception e) { /* ignored */ }
 }
 } else if(stageofpage.equalsIgnoreCase("second")){
	 String doc_id1=request.getParameter("document_id");
	 String initatedfrm=request.getParameter("initatedfrm1");
	 String sdate4=request.getParameter("Dateofsubmission3");
	 Date date = new SimpleDateFormat("dd/MM/yyyy").parse(sdate4);
		java.sql.Date subDate = new java.sql.Date(date.getTime());
		System.out.println("second..."+doc_id1+"date="+sdate4+"ini.."+initatedfrm);
	  Connection conn=null;
	 try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

			conn = ds.getConnection();

	 Statement stmtupd1 = conn.createStatement();
	     String sqlupd1 = "update xx_document_mapping set Date_of_Submission='"+subDate+"' where Document_Map_ID ="+doc_id1;
	     System.out.println("update sql....."+sqlupd1);
		 
	     stmtupd1.executeUpdate(sqlupd1); 

	 %>
	 <c:redirect url="forwarding_usr.jsp">
<c:param name="document_id" value="<%=doc_id1 %>"></c:param>
<c:param name="submitiondate" value="<%=sdate4 %>"></c:param>
<c:param name="initatedfrm" value="<%=initatedfrm %>"></c:param>

</c:redirect>
	 
	 <%
 }catch(Exception e){
	 e.printStackTrace();
 } finally {
	    try { conn.close(); } catch (Exception e) { /* ignored */ }
 }
 }
	 %>


 </c:if>
 
 
 
 
 </form>
 </body>
 <script>
 $('.Blocked').change( function() {
	    $(this).parents("tr:eq(0)").find(".textbox").prop("disabled", !this.checked).val(''); 
	   ; 
	});
 </script>
 </html>