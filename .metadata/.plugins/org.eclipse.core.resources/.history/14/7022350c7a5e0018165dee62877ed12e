<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.io.*,java.util.*,javax.script.*,java.nio.file.*,java.nio.charset.*,java.text.DateFormat" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page import ="java.text.SimpleDateFormat"%>
 <%@ page import ="java.util.Date"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
 <%@ page session="true" %>
 <%@include file="included/NewHeader.jsp"%>  
 <%@include file="sessionCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script><link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reports</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>

  <script src="resources/JS/Reports230.js"></script>
    <link href="http://code.jquery.com/ui/1.10.4/themes/blitzer/jquery-ui.css" rel="stylesheet"> 
      <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
      <script type="text/javascript"  src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
             

<script type="text/javascript">
function mywinClose() {
	var sessionTimeout1 = "<%= session.getMaxInactiveInterval() %>";
	window.setTimeOut("window.close();",(sessionTimeout1-10)*1000)
}
</script>

<script type="text/javascript">

var $j = jQuery.noConflict();
 $j(function() {
	  $j('#DateStart' ).datepicker({ dateFormat: 'dd/mm/yy',maxDate:'0', changeYear: true}).change (function() {
	  $j('#DateEnd').datepicker('option', 'minDate', $j(this).datepicker('getDate'),{ dateFormat: 'dd/mm/yy',maxDate:'0', changeYear: true});
	  $j('#DateEnd').attr('disabled',false)});
	  $j('#DateEnd').datepicker({ dateFormat: 'dd/mm/yy',maxDate:'0', changeYear: true});
	   });
   </script>
  
<style>

.ui-datepicker-year {
   background-color: #cc0000;
 padding-left:20px;
}
/*
.ui-datepicker-month {
   background-color: #cc0000;
// color: black;
 //padding-left:20px;
}
*/

div.absolute {
   	position:absolute;
   	margin-top: 5px;
   	margin-left: 37px;
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
<script>

function displaymessage() {
	 location.reload();
}
function Locselect(projname) {
	disablekm_Report("none",1);
	$("#Majsec").val(null);
	$("#sMajsec").val(null);
	disablekm_Report("none",3);
	$("#LocationDiv").hide();	
		//alert("loctype"+projname);
		if (projname!="" && !document.getElementById("ProjNos").checked && !document.getElementById("Monthwise").checked ) {
		$("#loctype").show();
		$("input[name$='myRadios2']").prop("checked",null);
		} else {
		$("#loctype").hide();
			}
}
function showlocStn(projname,str) {
	disablekm_Report(str,3); 
ShowLocation_Report(5,projname,str, null, null);
	setTimeout(function(){ ShowLocation_Report(7,projname,str, null, null);}, 1200 );
}
</script>
</head>
<body onload="mywinClose();">
<%
String role1=(String)session.getAttribute("role");
String role=(String)session.getAttribute("Type");
String zone_id1=(String)session.getAttribute("zone_id"); 
String piu_id1=(String)session.getAttribute("piu_id"); 
String div_id1=(String)session.getAttribute("Division_Id");
String user = (String) session.getAttribute("user_name");
System.out.println(",,,,,"+role1+role+zone_id1+piu_id1+div_id1+user);
response.setHeader("Cache-control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", -1);

%>
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[Reports] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>

<div id="head1" ><h2 Style="color:gray;margin-top:50px"> <center><b>Report Selection Panel</b></center></h2></div>
<div id="head2" ><h4 Style="color:brown;"> <center><b>(select appropriate filters for report generation)</b></center></h4></div>
<form name="piureport" id="piureport" method="post" target="_blank" style="margin:40px;" >
<br>
<INPUT TYPE="HIDDEN" NAME="stage" id="stage">
<input type="hidden" name="zonename"> 
<INPUT TYPE="HIDDEN" NAME="piuname" id="piuname">
<INPUT TYPE="HIDDEN" NAME="Status1" id="Status">
<input type="hidden" name="projectname"> 
<input type="hidden" name="docname">
<INPUT TYPE="HIDDEN" NAME="DStart1" id="DStart">
<INPUT TYPE="HIDDEN" NAME="DEnd1" id="DEnd">


<c:if test="${param.stage == null}">
	
<table class="table table-hover table-bordered" style="margin-top: -40px;">
<tr ><td colspan="3" style="padding:0px;"> <div id="reporttype" Style="color:black;margin-top: 0px;margin-left: 0px; padding:0px; height:60px; background-color:#C2D8AD; "> <center><b><Br>Report Type:</b>
<input type = "radio" name="myRadios" id="Detailed" value ="1" style='margin-left:80px' checked="checked">  Detailed Report &nbsp;&nbsp;
					<input type = "radio" name="myRadios" id="Summary" value ="2">  Project wise Summary Report &nbsp;&nbsp;
					 <input type = "radio" name="myRadios" id="Special" value ="3">  Department wise Summary Report &nbsp;&nbsp;
					 <input type = "radio" name="myRadios" id="ProjNos" value ="4" >  Project Specific Status Report &nbsp;&nbsp;
					 <input type = "radio" name="myRadios" id="Monthwise" value ="5" >  Monthwise Summary Report </center></div>
 <!-- <div Style="color:black;  margin-top: 0px;height:40px;   width:100%; background-color:#e6ffe6;"> </div> -->
<div id="timezone" Style="color:black;  margin-left:20%; margin-top: 0px; padding-bottom:10px; height:60px;  valign:top; width:60%; background-color:#e6ffe6;//#C2D8AD; border:solid 1px lightgray; display:none"> <center><b><Br>Time Periods for Summary Report: <span style="background-color: #bfff80;//#C2D8AD;"> &nbsp;&nbsp;&nbsp;&nbsp;    Period 1 &nbsp;&nbsp;&nbsp;&nbsp; <=
<input type = "number" name="t1" id="t1"  step="1" min="1"  max="999" style="width:50px; height:20px; text-align:center;" value="30">days <  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Period 2   &nbsp;&nbsp;&nbsp;&nbsp;   <= &nbsp;&nbsp;
					<input type = "number" name="t2" id="t2" step="1"  min="1" max="999" style="width:50px; height:20px;  //margin-top:-20px; text-align:center;" value="60">days < &nbsp;&nbsp;&nbsp;&nbsp;      Period 3 </span></b></center></div>
				</td></tr>
<tr class="success">
<td><font color="green"><br />
<%
String Zone2="";
String dname1="";
String project=null;
String dname="", Zone=null,dname11=null;
Connection conn1=null;
PreparedStatement  ps3=null, ps31 = null,  ps32=null, ps33=null, ps36=null;
ResultSet  rs3=null, rs31 = null, rs32=null, rs33=null, rs36=null;
String userid=null;
int piuid1=0;
try {
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn1 = ds.getConnection();
			%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Zone :</b>&nbsp;
			<select name="zone" id="zone" 
			style="width: 200px;margin: 1px 0px 6px 74px;" onchange="showDivisions(this.value);showprojectspkzonechange();showuserspkzonechange();">
				 
			<%
			if((piu_id1==null || piu_id1=="") && role.equalsIgnoreCase("MOR")){ 
				
				if (zone_id1.equalsIgnoreCase("18")){	
					%><option value="">-- Select Zone --</option><%
					
					String sql35 = "select * from xx_zones_master where Zone_Id<>'18' order by Zone_Name";
					ps31 = conn1.prepareStatement(sql35);
					rs31 = ps31.executeQuery();
					while (rs31.next()) {
						 Zone2=rs31.getString("Zone_Name");
						%>
						<option value="<%=Zone2%>"><%=Zone2%></option>
						<%
					} 
				} else {
					
					String sql33 = "select * from xx_zones_master where Zone_Id="+zone_id1+" order by Zone_Name";
					ps31 = conn1.prepareStatement(sql33);
					rs31 = ps31.executeQuery();
					
					while (rs31.next()) {
						 Zone2=rs31.getString("Zone_Name");
						%>
						<option value="<%=Zone2%>" selected ><%=Zone2%></option>
						<%
					} 
				}
			} else 
				{
				if (piu_id1.equalsIgnoreCase("27")){
					%><option value="">-- Select Zone --</option><%
					
					String sql35 = "select * from xx_zones_master where Zone_Id<>'18' order by Zone_Name";
					ps31 = conn1.prepareStatement(sql35);
					rs31 = ps31.executeQuery();
					while (rs31.next()) {
						 Zone2=rs31.getString("Zone_Name");
						%>
						<option value="<%=Zone2%>"><%=Zone2%></option>
						<%
					} 
				} else { 
				
				%><option value="">-- Select Zone --</option><%
						String sql31 = "select distinct Zone_Name from xx_zones_master a join xx_user_zone_mapping b on a.Zone_Id = b.Zone_ID where b.Piu_Id="+piu_id1+ " order by a.Zone_Name"; 
					ps31 = conn1.prepareStatement(sql31);
					rs31 = ps31.executeQuery();
				while (rs31.next()) {
					Zone2=rs31.getString("Zone_Name");
					%>
					<option value="<%=Zone2%>"><%=Zone2%></option>
					<%
					
				}
				}
				}
				
			%>
			</select>
	 </font><br /> 
				</td>  
		<td>
					<br /><font color="grey">
					
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Division :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div id ='DivsionsDiv' style='display: inline;'>
					<select name='division' id='division1' style="width: 200px;margin:0px 0px 0px 18px;" onchange="showprojectspk(); showuserspk();">
						
					
				<%	
				String sql6="";
				int n=0;
				if (role.equalsIgnoreCase("MOR") && div_id1 !=null) {
					if ( !div_id1.equalsIgnoreCase("86")) {
				sql6 =	"select division_name from xx_divisions_master where division_id =(select division_id from xx_user_master where user_name='"+user+"') order by Division_Name";
				n=1;
				} else {
					%>
					<option value="">-- Select Division --</option>
					<%
				sql6 = "select Division_Name from xx_divisions_map where Ext_Zone_Id=(select zone_id from xx_zones_master where zone_Name='"+Zone2+"') and Division_Name !='Headquarters' order by Division_Name";
				n=2;
				}
			
				ps31 = conn1.prepareStatement(sql6);
				rs31 = ps31.executeQuery();
				
				while (rs31.next()) {
					String div3=rs31.getString("Division_Name");
					
					
					if (n==1) {
					%>
					<option value="<%=div3%>" selected ><%=div3%></option>
					<%
					} else if (n==2) {
						%>
						<!-- <option value="">-- Select Division --</option>	 -->
						<option value="<%=div3%>"><%=div3%></option>
						<%
					}
					}
				}		else{
					%>
					<option value="">-- Select Division --</option>
					<%
				}			
				%>
			     	</select> 
				   </div> 
					</font><br />
					</td>
				  <td><font color="grey" ><br />
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>PIU Of RVNL :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id="piuid" style="margin: -19px 33px 0px 145px;">
					<select name=PIU_name id="PIU_name" style="width: 200px" onchange="showprojectspk(); showuserspk();" readonly>
								
					 <%
						if ( (piu_id1==null || piu_id1=="") && role.equalsIgnoreCase("MOR")) {
							%>
							<option value="">-- Select PIU --</option>
							<%		
							
							if (zone_id1.equalsIgnoreCase("18")) {
								
								String sql35 = "select * from xx_piu_master where PIU_Id<>'27' order by PIU_Name";
								
								ps32 = conn1.prepareStatement(sql35);
						rs32 = ps32.executeQuery();
					%>
								 
					<%
						while (rs32.next()) {
							 dname=rs32.getString("PIU_Name");
							
							%>
							<option value="<%=dname%>"><%=dname%></option>
							<%
						
					} 
					} else {
						
						String sql32 = "select distinct PIU_Name from xx_piu_master a join xx_user_zone_mapping b on a.PIU_Id = b.Piu_Id where b.Zone_ID="+zone_id1+" order by a.PIU_Name";
						ps32 = conn1.prepareStatement(sql32);
						rs32 = ps32.executeQuery();
					while (rs32.next()) {
						 dname=rs32.getString("PIU_Name");
						
						 
						%>
						<option value="<%=dname%>"><%=dname%></option>
						<%
						
					}
									
					} 
					} else if(piu_id1.equalsIgnoreCase("27")) {	
						%>
						<option value="">-- Select PIU --</option>
						<%
						
							String sql35 = "select * from xx_piu_master where PIU_Id<>'27' order by PIU_Name";
							ps32 = conn1.prepareStatement(sql35);
							rs32 = ps32.executeQuery();
							while (rs32.next()) {
								 dname=rs32.getString("PIU_Name");
								%>
								<option value="<%=dname%>"><%=dname%></option>
								<%
							} 
						} else if(piu_id1 != null){
							
							String sql3 = "select * from xx_piu_master where Piu_Id="+piu_id1;
							ps32 = conn1.prepareStatement(sql3);
							rs32 = ps32.executeQuery();

							while (rs32.next()) {
								 dname = rs32.getString("PIU_Name");
					%>
					<option value="<%=dname%>" selected ><%=dname%></option>
					<% 
					   }	
					}
					
					 %>
					 </select></div>
					<br /></font>
					</td>
					</tr>
					<tr class="success">
					
							<td><font color="grey"><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Project Type :</b>
							&nbsp;&nbsp; 
						<div id="project_type" style="margin:-45px 0px 0px 49px;"> 
						<select name='proj_type' id='proj_type' style="width: 200px;margin: 20px 0px 0px 98px;" onchange="showprojectspk();" >
						<option value="">-- Select Project Type --</option>
						
	<%
						String projtype = null;
					String sql36 = "select * from xx_projecttypes_master order by Project_type";
								ps36 = conn1.prepareStatement(sql36);
								rs36 = ps36.executeQuery();

								while (rs36.next()) {
									projtype = rs36.getString("Project_type");
									

						%>
						<option value="<%=projtype%>"><%=projtype%></option>
						<%
							}
								
								%>
		
		</select></div>
				<br /></td>	
		
							<td><font color="grey"><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Project :</b>
							 
						<div id="project_select" style="margin:-45px 0px 0px 40px;"> 
						<select name='projects' id='project1' style="width: 240px;margin: 20px 0px 0px 98px;" onchange="Locselect(this.value);" >
						<option value="">-- Select Project --</option>
						</select></div>
									
<br><div id="loctype"  style='margin-left: 15px; display:none; background-color:#e6ffe6; border-color:brown;'> <br><b>&nbsp;&nbsp;&nbsp;Location Details:</b>
<input type = "radio" name="myRadios2" id="km1" value ="1" style='margin-left:100px' >KM wise &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type = "radio" name="myRadios2" id="stn1" value ="2">Station wise
<br><br><div id="LocationDiv" style="background-color:#e6ffe6; border-color:brown;"> </div><br></div>
<%  ps31.close();ps32.close(); ps36.close();
						rs31.close();rs32.close(); rs36.close();
						
}catch(Exception e){
		
		e.printStackTrace();
	}		
		 
		      
			
%>		
		
		
				<br /></td>	
					<td><font color="grey"><br />
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Status :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  &nbsp;
				  
				  <select name="status" id="status" 
					style="width: 200px;">
						<option value="">-- Select Status --</option>
						
						<option value="Finally Approved">Approved</option>
						<option value="pending">Pending</option>
						
						
										  </select></font> <br />
										  					</td>
					
					</tr>
					<tr class="success">
					
					<td><font color="grey"><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Document Type :</b>&nbsp;&nbsp;
				<select name="document" id="document" 
					style="width: 200px">
						<option value="">-- Select Document Type --</option>
						<%
						String doctype = null;
						try {
					String sql3 = "select * from xx_documentattributes_master order by Document_Type";
								ps3 = conn1.prepareStatement(sql3);
								rs3 = ps3.executeQuery();

								while (rs3.next()) {
									doctype = rs3.getString("Document_Type");
									

						%>
						<option value="<%=doctype%>"><%=doctype%></option>
						<%
							}
								rs3.close();ps3.close();
								conn1.close();
						}	catch(Exception e){
									e.printStackTrace();
								}
						
												%>
				  </select> </font><br /> 
					
					</td>
					
									
					<td><br /><font color="grey">
					
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Submitted Between Dates</b>&nbsp;&nbsp;
					<input type="text"  name="DateStart" id ="DateStart" style="width:100px;" />
				<b>And</b>&nbsp;&nbsp;
					<input type="text"  name="DateEnd" id ="DateEnd" style="width:100px;" disabled />
				<br></font><br /></td>
									
									
						<td><font color="grey"><br />
<%
String suser="";
//String dname1="";
//String project=null;
//String dname="", Zone=null,dname11=null;
Connection conn2=null;
PreparedStatement  ps5=null, ps51 = null,  ps52=null;
ResultSet  rs5=null, rs51 = null, rs52=null;
//String userid=null;
//int piuid1=0;
try {
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn2 = ds.getConnection();
			%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Railway User :</b>
				<div id ='UserDiv' style='display: inline;'>
			<select name="suser" id="suser" 
			style="width: 200px;margin: 0px 0px 0px 20px;" >
				
			<%
			if((piu_id1==null || piu_id1=="") && role.equalsIgnoreCase("MOR")){ 
				%><option value="">-- Select User id --</option><%
				if (zone_id1.equalsIgnoreCase("18")){	
								
					String sql55 = "select * from xx_user_master where Type='MOR' order by User_name";
					ps51 = conn2.prepareStatement(sql55);
					rs51 = ps51.executeQuery();
					while (rs51.next()) {
						 suser=rs51.getString("User_name");
						%>
						<option value="<%=suser%>"><%=suser%></option>
						<%
					} 
				} else {
					
					String sql53 = "select * from xx_user_master where Zone_Id="+zone_id1+" order by User_name";
					ps51 = conn2.prepareStatement(sql53);
					rs51 = ps51.executeQuery();
					
					while (rs51.next()) {
						 suser=rs51.getString("User_name");
						%>
						<option value="<%=suser%>" ><%=suser%></option>
						<%
					} 
				}
			} else 
				{
				if (piu_id1.equalsIgnoreCase("27")){
					%><option value="">-- Select User id --</option><%
					
					String sql55 = "select * from xx_user_master where Type='MOR' order by User_name";
					ps51 = conn2.prepareStatement(sql55);
					rs51 = ps51.executeQuery();
					while (rs51.next()) {
						 suser=rs51.getString("User_name");
						%>
						<option value="<%=suser%>"><%=suser%></option>
						<%
					} 
				} else { 
					%><option value="">-- Select User id --</option><%
							
							String sql55 = "select distinct User_name from xx_user_master a join xx_user_zone_mapping b on a.Zone_Id = b.Zone_ID where b.Piu_Id="+piu_id1+ " order by a.User_name";
							ps51 = conn2.prepareStatement(sql55);
							rs51 = ps51.executeQuery();
							while (rs51.next()) {
								 suser=rs51.getString("User_name");
								%>
								<option value="<%=suser%>"><%=suser%></option>
								<%
							}
							
					 }
				}
}catch(Exception e){
	
	e.printStackTrace();
}	finally {
    try { conn2.close(); } catch (Exception e) { /* ignored */ }
}	

			%>
			</select> </font><br /> </td>  	
			</tr>
					<tr class="success">
					
			<td><font color="grey"><br />
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Under Approval for more than :</b>&nbsp;&nbsp;
				  <input type = "number" name="t3" id="t3" style="width:50px;  text-align:center;" disabled > days 
				  					</font> <br />
						  					</td> 
						  					
				<td colspan="1"><font color="grey"><br />
<%
String orgName="";
Connection conn3=null;

PreparedStatement  ps35=null;
ResultSet  rs35=null;
//String userid=null;
//int piuid1=0;
try {
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn3 = ds.getConnection();
			%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Organization (other than Railway & RVNL) :</b>
				<div id ='OrgDiv' style='display: inline;'>
			<select name="Org" id="Org" 
			style="width: 200px;margin: 0px 0px 0px 20px;" >
			<option value="">-- Select Organization --</option>
			<%
					
					String sql29 = "select * from xx_org_master  order by Org_Name";
					ps35 = conn3.prepareStatement(sql29);
					rs35 = ps35.executeQuery();
					while (rs35.next()) {
						 orgName=rs35.getString("Org_Name");
						%>
						<option value="<%=orgName%>"><%=orgName%></option>
						<%
					} 
}catch(Exception e){
	
	e.printStackTrace();
}	finally {
    try { conn3.close(); } catch (Exception e) { /* ignored */ }
}	

			%>
			</select> </font><br /> <br></td>  <td></td>	
					</tr>		
		</table>	
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<Center><button type="button" id="btnclick" class="btn btn-primary" onClick="formsubmitreport();"   ><center>Submit</center></button>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="clear" class="btn btn-primary" value="Reset" onclick="displaymessage();" style=""></center>
<div id="dialogid1" style="display: none;" align="center">
								<br> Please Select a Project for which the Status Report is required...<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$j('#dialogid1').dialog('close');">cancel</button>
							</div>

<div id="dialogid2" style="display: none;" align="center">
								<br> The time period limits should be between 1 and 999.....<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$j('#dialogid2').dialog('close');">cancel</button>
							</div>
<div id="dialogid3" style="display: none;" align="center">
								<br> Period2 limit should be more than Period1 limit........<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$j('#dialogid3').dialog('close');">cancel</button>
							</div>
							
<br><br>
</c:if>
<c:if test="${param.stage != null}">
<%
String Piuname=request.getParameter("PIU_name");
String doctype=request.getParameter("document");
String status=request.getParameter("status");
String t1=request.getParameter("t1");
String t2=request.getParameter("t2");
String t3=request.getParameter("t3");
String suser=request.getParameter("suser");
String zone=request.getParameter("zone");
String division=request.getParameter("division");
//String projecttype=request.getParameter("project");
String majsec=request.getParameter("Majsec");
String smajsec=request.getParameter("sMajsec");
//System.out.println("majsec="+majsec+" smajsec="+smajsec);
if (majsec!=null) {
if (majsec.equalsIgnoreCase("none")) {
	majsec="";
}}
if (smajsec!=null) {
if (smajsec.equalsIgnoreCase("none")) {
	smajsec="";
}}
String frmkm=request.getParameter("frmKm");
String tokm=request.getParameter("toKm");
String frmstnkm=request.getParameter("frmstnKm");
String tostnkm=request.getParameter("tostnKm");
String frmstn=request.getParameter("frmstn");
String tostn=request.getParameter("tostn");
String projtype=request.getParameter("proj_type");
String project=request.getParameter("projects");
String orgName=request.getParameter("Org");
String sDate=request.getParameter("DateStart");
String eDate=request.getParameter("DateEnd");
//session.setAttribute("sDate", sDate);
//session.setAttribute("eDate", eDate);
String backurl="check";
String url1=null;
if (request.getParameter("stage").equalsIgnoreCase("first")) {
	 url1="ReportPIU.jsp";
} else if (request.getParameter("stage").equalsIgnoreCase("second")) {
	url1="ReportPIU_summary.jsp";
	} else if (request.getParameter("stage").equalsIgnoreCase("third")){
		url1="ReportPIU_special.jsp";
		} else if (request.getParameter("stage").equalsIgnoreCase("fourth")) {
			url1="ReportPIU_ProjStatus.jsp";
}  else if (request.getParameter("stage").equalsIgnoreCase("fifth")) {
	url1="ReportPIU_Monthwise.jsp";
}
//System.out.println("Stage="+request.getParameter("stage")+", URL="+url1);
%>
<c:redirect url="<%=url1%>">
<c:param name="PIU_name" value="<%=Piuname %>"></c:param>
<c:param name="projtype" value="<%=projtype %>"></c:param>
<c:param name="project" value="<%=project %>"></c:param>
<c:param name="status" value="<%=status %>"></c:param>
<c:param name="doctype" value="<%=doctype %>"></c:param>
<c:param name="DateStart" value="<%=sDate %>"></c:param>
<c:param name="DateEnd" value="<%=eDate %>"></c:param>
<c:param name="zone" value="<%=zone %>"></c:param>
<c:param name="division" value="<%=division %>"></c:param>
<c:param name="backurl" value="<%=backurl %>"></c:param>
<c:param name="t1" value="<%=t1 %>"></c:param>
<c:param name="t2" value="<%=t2 %>"></c:param>
<c:param name="t3" value="<%=t3 %>"></c:param>
<c:param name="suser" value="<%=suser %>"></c:param>
<c:param name="majsec" value="<%=majsec %>"></c:param>
<c:param name="smajsec" value="<%=smajsec %>"></c:param>
<c:param name="frmkm" value="<%=frmkm %>"></c:param>
<c:param name="tokm" value="<%=tokm %>"></c:param>
<c:param name="frmstn" value="<%=frmstn %>"></c:param>
<c:param name="tostn" value="<%=tostn %>"></c:param>
<c:param name="frmstnkm" value="<%=frmstnkm %>"></c:param>
<c:param name="tostnkm" value="<%=tostnkm %>"></c:param>
<c:param name="orgName" value="<%=orgName %>"></c:param>
</c:redirect>
</c:if>
</form>
<script> 


 $(document).ready(function() { 
	 window.name="report_master";
	 document.getElementById("stage").value = "first";
 
 $("#project1").focus(function(){
		//alert("hello  project refresh..");
	showprojectspk();
	}); 
 
   $("#suser").focus(function(){
	 //alert("hhhjj");
	 showuserspk();
	 }); 

 $("#status").change(function(){
	 if (this.value=="Finally Approved") {
		 var style3 = {'background-color':'rgb(235,235,228)', 'text-shadow': '1px 1px white'};
    	 $("#t3").css(style3);
    	 $("#t3").val(null);
    	  	   $("#t3").prop("disabled",true); } else {
    		  var style3 = {'background-color':'white', 'text-shadow': ''};
    	    	 $("#t3").css(style3);
    	    	 //$("#t3").val(30);
    	    	 
    	    	  $("#t3").prop("disabled",false);  }
  }); 
 $("input[name$='myRadios2']").click(function() {
	 var test = $(this).val();
    if (test==1 || test==5) {
 	   ShowLocation_Report(1,$("#project1").val(),1, null, null);
 	  setTimeout(function(){ $("#frmKm").prop("disabled",true); $("#toKm").prop("disabled",true);}, 1200 ); 
 	 
    } else {
 	   ShowLocation_Report(1,$("#project1").val(),2, null, null);
    }
    $("#LocationDiv").show();	
    });
 $("input[name$='myRadios']").click(function() {
	
     var test = $(this).val();
    
     if (test=="1") {
    	document.getElementById("stage").value = "first";
    	// alert("hello..."+test);
    	   	 var style2 = {'background-color':'white', 'text-shadow': ''};
    	   	var style3 = {'background-color':'white', 'text-shadow': ''};
    	 $("#status").css(style2);
    	 $("#timezone").hide();
    	 $("#status").prop("disabled",false); 
    	 $("#suser").css(style2);
    	 $("#suser").prop("disabled",false);
    	 $("#Org").css(style3);
	  	  $("#Org").prop("disabled",false);
	  	  $("#DateStart").prop("disabled",false);
	  	  if ($("#project1").val()!="" ) { 
  			  $("#loctype").show();
  	  }
    	 } else if (test=="2") {
    	 document.getElementById("stage").value = "second";
    	// alert("hello..."+test); 
    	$("#timezone").show();
    	 var style2 = {'background-color':'rgb(235,235,228)', 'text-shadow': '1px 1px white'};
    	 $("#status").css(style2);
    	 $("#status").html("<option value='' selected>-- Select Status --</option> <option value='Finally Approved'>Approved</option><option value='pending'>Pending</option>");
    	$("#status").prop("disabled",true); 
    	var style3 = {'background-color':'white', 'text-shadow': ''};
   	 $("#t3").css(style2);
   	     	$("#t3").val(null);
	  	   $("#t3").prop("disabled",true);
	  	 $("#suser").css(style2);
	     	$("#suser").val(null);
	  	   $("#suser").prop("disabled",true);
	  	 $("#Org").css(style3);
	  	  $("#Org").prop("disabled",false);
	  	  $("#DateStart").prop("disabled",false);
	  	  if ($("#project1").val()!="" ) { 
  			  $("#loctype").show();
  	  }
	  	 	} else if (test=="3") { document.getElementById("stage").value = "third";
    	  	// alert("hello..."+test); 
    	$("#timezone").show();
    	 var style2 = {'background-color':'rgb(235,235,228)', 'text-shadow': '1px 1px white'};
    	 var style3 = {'background-color':'white', 'text-shadow': ''};
    	 $("#status").css(style2);
    	 $("#status").html("<option value='' selected>-- Select Status --</option> <option value='Finally Approved'>Approved</option><option value='pending'>Pending</option>");
    	$("#status").prop("disabled",true); 
    	//var style3 = {'background-color':'rgb(235,235,228)', 'text-shadow': '1px 1px white'};
   	 $("#t3").css(style2);
   	     	$("#t3").val(null);
	  	   $("#t3").prop("disabled",true);
	  	 $("#suser").css(style2);
	     	$("#suser").val(null);
	  	   $("#suser").prop("disabled",true);
	  	 $("#Org").css(style3);
	  	  $("#Org").prop("disabled",false);
	  	  $("#DateStart").prop("disabled",false);
	  	  if ($("#project1").val()!="" ) { 
	  			  $("#loctype").show();
	  	  }
	 
    	} else if (test=="4") { document.getElementById("stage").value = "fourth";
    	  	// alert("hello..."+test); 
    	$("#timezone").hide();
    	 var style2 = {'background-color':'rgb(235,235,228)', 'text-shadow': '1px 1px white'};
    	 //var style3 = {'background-color':'white', 'text-shadow': ''};
    	 $("#status").css(style2);
    	 $("#status").html("<option value='' selected>-- Select Status --</option> <option value='Finally Approved'>Approved</option><option value='pending'>Pending</option>");
    	$("#status").prop("disabled",true); 
       	 $("#t3").css(style2);
   	     	$("#t3").val(null);
	  	   $("#t3").prop("disabled",true);
	  	 $("#suser").css(style2);
	     	$("#suser").val(null);
	  	   $("#suser").prop("disabled",true);
	    $("#Org").css(style2);
	  	 $("#Org").val(null);
	  	   $("#Org").prop("disabled",true);
	  	 $("#DateStart").val(null);
	  	   $("#DateStart").prop("disabled",true);
	  	 $("#loctype").hide();
	  	 } else if (test=="5") { document.getElementById("stage").value = "fifth";
	// alert("hello..."+test); 
$("#timezone").hide();
var style2 = {'background-color':'rgb(235,235,228)', 'text-shadow': '1px 1px white'};
//var style3 = {'background-color':'white', 'text-shadow': ''};
$("#status").css(style2);
$("#status").html("<option value='' selected>-- Select Status --</option> <option value='Finally Approved'>Approved</option><option value='pending'>Pending</option>");
$("#status").prop("disabled",true); 
 $("#t3").css(style2);
 	$("#t3").val(null);
  $("#t3").prop("disabled",true);
$("#suser").css(style2);
	$("#suser").val(null);
  $("#suser").prop("disabled",true);
$("#Org").css(style2);
$("#Org").val(null);
  $("#Org").prop("disabled",true);
$("#DateStart").val(null);
  $("#DateStart").prop("disabled",true);
$("#loctype").hide();
}

    });

 $('#DateStart').attr('readonly', true);
$('#DateEnd').attr('readonly', true);
 var style1 = {'color':'gray', 'text-shadow': '1px 1px white'};
if ($('#zone').val()!="") {$('#zone').css(style1); }
if ($('#division1').val()!="") {$('#division1').css(style1);}
if ($('#PIU_name').val()!="") {$('#PIU_name').css(style1);}
	});
	
	
</script>
</body>
 <%@include file="included/Newfooter.jsp" %>
</html>
