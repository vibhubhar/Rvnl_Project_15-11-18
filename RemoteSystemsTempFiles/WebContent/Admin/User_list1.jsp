<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@include file="included/NewHeader.jsp"%>
<%-- <jsp:include page="Divisions.jsp" flush="true" /> --%>
<%@ page autoFlush="true" buffer="1094kb"%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Create User</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/JS/Approval_wf230.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script src="resources/JS/Headquarter.js"></script>
<script src="resources/JS/Reports230.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<style>
div.absolute {
   	position:absolute;
   	margin-top: 5px;
   	margin-left: 45px;
   	margin-bottom: 20px;
 	padding: 15 px;
    width: 350px;
    height: 25px;
    border: 2px solid #ff4d4d;
    background-color:#ffe6e6;
    }
    table.center {
    margin-left:auto; 
    margin-right:auto;
  }
</style>
</head>
<body>
<%
response.setHeader("Cache-control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", -1);

String role1=(String)session.getAttribute("role");
String role=(String)session.getAttribute("Type");
String zone_id1=(String)session.getAttribute("zone_id"); 
String piu_id1=(String)session.getAttribute("piu_id"); 
 
String user = (String)session.getAttribute("user_name");
//System.out.println("UZER:"+user);
%>
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[User List] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %></font></h8>
</div>
<div class="container" style="position:relative; margin-top:70px;">
	<form id="loginForm11" name="loginForm11" method="post">
	<INPUT TYPE="HIDDEN" NAME="Depatment">
	<INPUT TYPE="HIDDEN" NAME="cbResults">
	<INPUT TYPE="HIDDEN" NAME="Project_stage">		
	<c:if test="${param.Project_stage == null}">	
	
				
			<%		
			//String dname="";
			Connection conn = null;
			PreparedStatement ps31=null,ps311 = null;
			ResultSet rs31=null, rs311 = null;
			PreparedStatement ps3 = null, ps32=null,ps321 = null;
			ResultSet rs3 = null, rs32=null, rs321 = null;
			String userid=null;
			int piuid1=0;
						
						Statement stmt = null;
						//ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs12=null,rs13=null,rs14=null;
						//PreparedStatement ps1 = null, ps3 = null,ps4=null,ps5=null,ps12=null,ps13=null,ps14=null;
						try {
							Context initCtx = new InitialContext();
							Context envCtx = (Context) initCtx.lookup("java:comp/env");
							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

							conn = ds.getConnection();
					
							
							%>
				<table style="margin: -16px 0px 0px 18px;"><tr><td>
						&nbsp;&nbsp;&nbsp;<strong>Zone:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name='Zone' id ="Zoneunderlist" style="width: 205px"
					onchange="showZoneUnderlist(this.value)">
						<option value="none">-- Select Zone --</option>
						<%
						if((piu_id1==null || piu_id1=="") && role.equalsIgnoreCase("MOR")){ 
							if (zone_id1.equalsIgnoreCase("18")){	
								//System.out.println("hello 1 zone:"+zone_id1);
								String sql35 = "select * from xx_zones_master";
								ps31 = conn.prepareStatement(sql35);
								rs31 = ps31.executeQuery();
								while (rs31.next()) {
									String Zone=rs31.getString("Zone_Name");
									%>
									<option value="<%=Zone%>"><%=Zone%></option>
									<%
								} 
							} else {
								//System.out.println("hello 2 zone:"+zone_id1);
								String sql33 = "select * from xx_zones_master where Zone_Id="+zone_id1;
								ps31 = conn.prepareStatement(sql33);
								rs31 = ps31.executeQuery();
								
								while (rs31.next()) {
									String Zone=rs31.getString("Zone_Name");
									%>
									<option value="<%=Zone%>"><%=Zone%></option>
									<%
								} 
							}
						} else 
							{
							if (piu_id1.equalsIgnoreCase("27")){
								//System.out.println("hello 1 zone:"+zone_id1);
								String sql35 = "select * from xx_zones_master order by Zone_Name";
								ps31 = conn.prepareStatement(sql35);
								rs31 = ps31.executeQuery();
								while (rs31.next()) {
									String Zone=rs31.getString("Zone_Name");
									%>
									<option value="<%=Zone%>"><%=Zone%></option>
									<%
								} 
							} else { 
							//System.out.println("hello 3 zone:"+zone_id1);
									String sql31 = "select distinct Zone_ID from xx_user_zone_mapping where piu_Id="+piu_id1;
								ps311 = conn.prepareStatement(sql31);
								rs311 = ps311.executeQuery();
							while (rs311.next()) {
							String zone_id = rs311.getString("Zone_ID");
							
							sql31 = "select * from xx_zones_master where Zone_Id="+zone_id;
							ps31 = conn.prepareStatement(sql31);
							rs31 = ps31.executeQuery();
							
							while (rs31.next()) {
								String Zone=rs31.getString("Zone_Name");
								%>
								<option value="<%=Zone%>"><%=Zone%></option>
								<%
								
							}
							}
						}
							}
						
						%>
				</select> 
					
				
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>PIU Of RVNL:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=PIU_name id="PIUunderList" onchange="showPiuUnderList(this.value)"
					style="width: 205px">
						<option value="none">-- Select PIU --</option>
						<%
						if ((piu_id1 == null || piu_id1=="") && role.equalsIgnoreCase("MOR")) {
								if (zone_id1.equalsIgnoreCase("18")) {
									String sql35 = "select * from xx_piu_master order by PIU_Name";
									
									ps32 = conn.prepareStatement(sql35);
							rs32 = ps32.executeQuery();
							

							while (rs32.next()) {
								String dname=rs32.getString("PIU_Name");
								%>
								<option value="<%=dname%>"><%=dname%></option>
								<%
							
						} 
						} else {
							//System.out.println("hello 2");
							String sql32 = "select distinct Piu_Id from xx_user_zone_mapping where Zone_Id="+zone_id1;
							ps321 = conn.prepareStatement(sql32);
							rs321 = ps321.executeQuery();
						while (rs321.next()) {
						String piu_id34 = rs321.getString("Piu_Id");
						
						sql32 = "select * from xx_piu_master where Piu_Id="+piu_id34;
						ps32 = conn.prepareStatement(sql32);
						rs32 = ps32.executeQuery();
						
						while (rs32.next()) {
							String dname=rs32.getString("Piu_Name");
							%>
							<option value="<%=dname%>"><%=dname%></option>
							<%
							
						}
						}
								
						} 
						} else if(piu_id1.equalsIgnoreCase("27")) {	
								
								String sql35 = "select * from xx_piu_master order by PIU_Name";
								ps32 = conn.prepareStatement(sql35);
								rs32 = ps32.executeQuery();
								while (rs32.next()) {
									String dname=rs32.getString("PIU_Name");
									%>
									<option value="<%=dname%>"><%=dname%></option>
									<%
								} 
							} else {
								
								String sql3 = "select * from xx_piu_master where Piu_Id="+piu_id1;
								ps321 = conn.prepareStatement(sql3);
								rs321 = ps321.executeQuery();

								while (rs321.next()) {
									String dname = rs321.getString("PIU_Name");
						%>
						<option value="<%=dname%>"><%=dname%></option>
						<% 
						   }	
						}
						
						%>
				  </select>
						  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Others:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=OrgUnderlist id="OrgUnderlist" onchange="showOrgUserList(this.value)"
					style="width: 205px">
						<option value="" selected="selected">-- Select Organization --</option>
						<%
						
								String sql31 = "select * from xx_org_master order by Org_Name";
								ps3 = conn.prepareStatement(sql31);
								rs3 = ps3.executeQuery();

								while (rs3.next()) {
									String orgname = rs3.getString("Org_Name");
						%>
						<option value="<%=orgname%>"><%=orgname%></option>
						<%
							}
								
						%>
				  </select> <br /> <br />
						
					<div id = 'PIU_Table' style="text-align: center;"></div>	
						
			</td></tr></table>
										
			<%
			//conn.close();
			}catch(Exception e){
				e.printStackTrace();
			} finally {
			    try { conn.close(); } catch (Exception e) { /* ignored */ }
			}
				
				
%>

	</c:if>	
	</form>
	</div><br><br><br><br><br><br><br><br><br><br><br>
	<script type="text/javascript">
	$('#PIUunderList').change(function(){
	    $('#Zoneunderlist option:first').prop('selected', 'selected');
	    $('#OrgUnderlist option:first').prop('selected', 'selected');

	});

	$('#Zoneunderlist').change(function(){
	   $('#PIUunderList option:first').prop('selected', 'selected');
	   $('#OrgUnderlist option:first').prop('selected', 'selected'); 
	});

	  $('#OrgUnderlist').change(function(){
	      $('#PIUunderList option:first').prop('selected', 'selected');
	      $('#Zoneunderlist option:first').prop('selected', 'selected');
	  });
	  </script>
</body>
<br><br><br><br><br>
		      <%@include file="included/Newfooter.jsp" %>
</html>