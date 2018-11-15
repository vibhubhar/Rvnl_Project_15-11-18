<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>
  <%@include file="included/NewHeader.jsp"%>     
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.min.css"/>
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.css"/>
<script src="resources/JS/UserIndex.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
<script src="resources/JS/gs_sortable.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Home page</title>
</head>

<style>

div.absolute {
   	position:absolute;
   	margin-top: 5px;
   	
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
<body>

<%


response.setHeader("Cache-control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", -1);


String role=(String)session.getAttribute("Type");
String zone_id1=(String)session.getAttribute("zone_id"); 

 %>

<div class="container" style="margin-top:30px;">
<form id='user_index' name='user_index' method="post">
<INPUT TYPE="HIDDEN" NAME="userid">
<INPUT TYPE="HIDDEN" NAME="projectid">
<INPUT TYPE="HIDDEN" NAME="packageid">
<INPUT TYPE="HIDDEN" NAME="Zones">
<INPUT TYPE="HIDDEN" NAME="Divisions">
<%String user = (String)session.getAttribute("user_name");
//System.out.println("UZER:"+user);
%>
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;[Add-Modify Documents] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div><br><br><br>


<c:if test="${param.userid == null}">
<%
String username=(String)session.getAttribute("user_name");

Connection conn =null;PreparedStatement ps3 = null,ps4 = null,ps5 = null,ps41=null;
ResultSet User_rs=null,rs3=null,rs4=null,rs5=null,Project_rs=null,Package_rs=null,Division_rs=null,Zone_rs=null,CheckUser_rs=null,rs41=null;
PreparedStatement UserPS=null,ProjectPS=null,PackagePS=null,DivisionPS=null,ZonePS=null,CheckUserPS=null;
String userid = null;
String projectid = null;
int count=1;
try{
if(username != null && !username.isEmpty()){

					Context initCtx = new InitialContext();
					Context envCtx = (Context) initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

					conn = ds.getConnection();
					String sql3 = "select User_ID from xx_user_master where User_name='"+username+"'";
					ps3 = conn.prepareStatement(sql3);
					rs3 = ps3.executeQuery();
					if (rs3.next()) {
						 userid = rs3.getString("User_ID");
						
						
						String sql4 = "select distinct(Project_ID) from xx_project_user_mapping where User_ID='"+userid+"'";
						ps4 = conn.prepareStatement(sql4);
						rs4 = ps4.executeQuery();	
						while(rs4.next()){
							projectid = rs4.getString("Project_ID");
							
							
							String sql5 = "select * from xx_projectattributes_master where Project_ID='"+projectid+"'";
							ps5 = conn.prepareStatement(sql5);
							Project_rs = ps5.executeQuery();
							while(Project_rs.next()){
							
						String proj_id = Project_rs.getString("Project_id");
						
						
						String project = Project_rs.getString("project");
						String piu = Project_rs.getString("PIU_of_RVNL");
						String projectType = Project_rs.getString("Project_Type");
						Date startDate = Project_rs.getDate("startdate");
						String pcoordinator = Project_rs.getString("project_coordinator");
						
						String sD ="-";
						if(!Project_rs.wasNull()) {
						 sD =new SimpleDateFormat("dd/MM/yyyy").format(startDate);
						
						}
						
							
							%>	<table class="table table-hover table-bordered" style="background-color: #F0FFFF">											
							<td width ="20%"><b>SNo:</b><%=count %></td>
							<tr class ="success">
							
							 <td width ="20%">
							 <b>
							 Project Name:</b> <%=project %></td>
							 <td width ="20%"><b>PIU of RVNL:</b> <%=piu %></td>
							 <td width ="20%"><b>Project Type:</b> <%=projectType %></td>
							 <td width ="20%"><b>Start Date:</b> <%=sD %></td>
							 <td width ="20%"><b>Project Coordinator:</b><%=pcoordinator %></td>
							</tr>	
						     <tr class="active">
								<td><b><font color="#1a0000">Package Name</font></b></td>
								<td><b><font color="#1a0000">Package Start Date</font></b></td>
								<td><b><font color="#1a0000">Zone</font></b></td>
								<td><b><font color="#1a0000">Division</font></b></td>
								
								</tr>
						
						<%
							
						count++;
							String sql41 = "select distinct(Package_Id) from xx_project_user_mapping where Project_ID='"
									+ projectid + "' and User_ID='"+userid+"'";
							ps41 = conn.prepareStatement(sql41);
							rs41 = ps41.executeQuery();
							while (rs41.next()) {
								String packageid1 = rs41.getString("Package_Id");
							
							
						
					
						String PackageSql = "select * from xx_packages_project where project_id = '"+proj_id+"'   AND package_id='"+packageid1+"'";
						PackagePS = conn.prepareStatement(PackageSql);
						Package_rs = PackagePS.executeQuery();

						while (Package_rs.next()) {
							String pack_id = Package_rs.getString("Package_id");
							String pack_name = Package_rs.getString("package_name");
							Date pack_StartDate = Package_rs.getDate("packageStartDate");
							String pSD ="-";										
							if(!Package_rs.wasNull()){						 
								pSD =new SimpleDateFormat("dd/MM/yyyy").format(pack_StartDate);
								
								
							}
							
							String DivisionSql = "select DISTINCT Division_name,zone_id from xx_project_division_map where package_id = '"+pack_id+"'" ;
							DivisionPS = conn.prepareStatement(DivisionSql);
							Division_rs = DivisionPS.executeQuery();
							ArrayList division=new ArrayList();
							Set<String> zone = new HashSet<String>();
							
							%>
								
								<tr>
								<td><%=pack_name %></td>
							 <td><%=pSD %></td>					 
										
							<% 
							while (Division_rs.next()) {
								String div_name = Division_rs.getString("Division_name");
								String zone_id = Division_rs.getString("zone_id");
								
								division.add(div_name);
								
								String ZoneSql = "select * from xx_zones_master where zone_id ='"+zone_id+"'";
							    ZonePS = conn.prepareStatement(ZoneSql);
								Zone_rs = ZonePS.executeQuery();
 
								
								while (Zone_rs.next()) {
									
									String z_name = Zone_rs.getString("Zone_name");
									zone.add(z_name);
									
																	
							}
						}
							%><td>
							<% 
							String ZoneStr ="",zn="",str="",str2="";
							Iterator itr=zone.iterator();
							while(itr.hasNext()){
								 zn=itr.next().toString();							 															 
								 ZoneStr=ZoneStr+"~"+zn;
								 
								pageContext.setAttribute("ZoneString",ZoneStr,PageContext.SESSION_SCOPE);
								
								%>
							<%=zn %><br>
								<%
							}						 
							 
						%></td>
						<td>
						<%	String DivisionStr ="";	
							for(int i=0;i<division.size();i++){
								String di=division.get(i).toString();
								DivisionStr=DivisionStr+"~"+di;
								
								%>
							<%=di %><br>
								<%
							}
						
							%>												
							</td><td><button id ="AddDoc" type="button" class="btn btn-primary" style="color:white;" onclick="AddDocument('<%=proj_id %>','<%=pack_id %>','<%=userid%>','<%=ZoneStr%>','<%=DivisionStr%>')">Add Document for Approval of Railways</button></td>
					
							</tr>									
							<%
												}	
							}
					
						
						
				
				
						
							}
							%>		
							</table> <%
							// end projectrs
					}
					}
					
					
	
}
else{
	
}
}catch(Exception e) {
	e.printStackTrace();
}finally{
	try {
		if (conn != null)
			conn.close();
	} catch (Exception e) {
	}
	try {
		if (User_rs != null)
			User_rs.close();
		} catch (Exception e) {
		}
	try {
		if (Project_rs != null)
			Project_rs.close();
		} catch (Exception e) {
		}
	try {
		if (Package_rs != null)
			Package_rs.close();
		} catch (Exception e) {
		}
	try {
		if (Division_rs != null)
			Division_rs.close();
		} catch (Exception e) {
		}
	try {
		if (Zone_rs != null)
			Zone_rs.close();
		} catch (Exception e) {
		}
	try {
		if (UserPS != null)
			UserPS.close();
		} catch (Exception e) {
		}
	try {
		if (ProjectPS != null)
			ProjectPS.close();
		} catch (Exception e) {
		}
	try {
		if (PackagePS != null)
			PackagePS.close();
		} catch (Exception e) {
		}
	try {
		if (DivisionPS != null)
			DivisionPS.close();
		} catch (Exception e) {
		}
	try {
		if (ZonePS != null)
			ZonePS.close();
		} catch (Exception e) {
		}
}
%>
</c:if>
<c:if test="${param.userid != null}">
<%
String projectid=request.getParameter("projectid");
String packageid=request.getParameter("packageid");
String userid=request.getParameter("userid");
String zonestr =request.getParameter("Zones");
String divstr =request.getParameter("Divisions");

%>
<c:redirect url="c_document.jsp">
<c:param name="projectid" value="<%=projectid %>"></c:param>
<c:param name="packageid" value="<%=packageid %>"></c:param>
<c:param name="userid" value="<%=userid %>"></c:param>
<c:param name="zoneString" value="<%=zonestr%>"></c:param>
<c:param name="divisionString" value="<%=divstr%>"></c:param>
</c:redirect>


</c:if>

</form>	
</div>
								<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>	      
<%@include file="included/footer.jsp" %>

</body>
</html>