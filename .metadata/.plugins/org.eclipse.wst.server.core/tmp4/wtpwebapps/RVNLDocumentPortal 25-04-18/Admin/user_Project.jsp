<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page session="true"%>
<%@include file="sessionCheck.jsp"%>
<%@include file="included/NewHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.min.css"/>
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.css"/>
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RVNL Document Portal </title>
<script src="resources/JS/UserIndex.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
<script src="resources/jQuery/jquery-1.12.3.min.js"></script> 
<script src="resources/jQuery/jquery-ui.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to user page</title>
<style>

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

	<%
	String packageid=null;
		response.setHeader("Cache-control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", -1);
		String user1 = (String) session.getAttribute("user_name");
		
	%>
	
	
	
	<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[My Project] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div><br><br><br><br>

	<form name="Add_Project" id="Add_Project" method="get"
		style="margin-left: 40px;">



		<input type="hidden" id="userid_1" />
		 <input type="hidden" id="projectid" />
		 <input type="hidden" id="packages" />

		<c:if test="${param.Project_name == null}">
<table><tr><td style="background-color: unset;">
			Projects :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=Project_name id="Project_name" style="width: 205px"
				onchange="showpakage(this.value)">
				<option value="none">-- Select Project --</option>
				<%
				
					String user = (String) session.getAttribute("user_name");
						
						String piu = null;
						String piurvnl = null;
						String projects = null;
						Connection conn = null;
						Statement stmt = null;
						ResultSet rs = null, rs1 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs13 = null, rs14 = null;
						PreparedStatement ps1 = null, ps3 = null, ps4 = null, ps5 = null, ps6 = null, ps13 = null, ps14 = null;
						String userid = null;

						try {
							Context initCtx = new InitialContext();
							Context envCtx = (Context) initCtx.lookup("java:comp/env");
							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

							conn = ds.getConnection();

							String sql3 = "select User_ID from xx_user_master where User_name='"
									+ user + "'";
							ps3 = conn.prepareStatement(sql3);
							rs3 = ps3.executeQuery();
							if (rs3.next()) {
								userid = rs3.getString("User_ID");
								

								String sql4 = "select PIU_ID from xx_user_master where User_ID='"
										+ userid + "'";

								ps4 = conn.prepareStatement(sql4);
								rs4 = ps4.executeQuery();
								while (rs4.next()) {

									String piuid = rs4.getString("PIU_ID");
									System.out.println("piuid:" + piuid);
									String sql5 = "select PIU_Name from xx_piu_master where PIU_Id='"
											+ piuid + "'";
									ps5 = conn.prepareStatement(sql5);
									rs5 = ps5.executeQuery();
									while (rs5.next()) {

										String piuname = rs5.getString("PIU_Name");
										System.out.println("piuname:" + piuname);

										String sql6 = "select Project_ID,Project from xx_projectattributes_master where PIU_of_RVNL='"
												+ piuname + "' and completed='y' order by Project";
										ps6 = conn.prepareStatement(sql6);
										rs6 = ps6.executeQuery();
										String project = null;
										String projectId = null;
										while (rs6.next()) {
											project = rs6.getString("Project");
											projectId = rs6.getString("Project_ID");
											
				%>
				<option value="<%=projectId%>"><%=project%></option>
				<%
					
				%>
				<%
					}

									}
								}

							}
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
						    try { conn.close(); } catch (Exception e) { /* ignored */ }
						}
				%>

			</select>
			<input type="hidden" name="userId" id="userId" value="<%=userid%>" />
</td><td style="background-color: unset;">

			<div id="package"  Style="margin: -23px 0px -29px 28px;">
				<%
					/*String packname = null;
						String sql ="select package_id from xx_packages_project where package_name='"+packname+"'";
						ps13 = conn.prepareStatement(sql);
						rs13 = ps13.executeQuery();
						while(rs13.next()){

							
							String packname1 = rs13.getString("package_id");
							System.out.println("packname1:"+packname1);

						}*/
				%>
			</div>

			<br>
			</td></tr></table>
			<br>
			<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<div>
		<button id="addto"  type="button" class="btn btn-primary"
				onclick="validateProject1();">Add To Me</button>
				
				<button id="addto" onclick="button1();" type="button" class="btn btn-primary">Back</button>
				</div>
				
				
				
			<br>
			<br>
<div id="dialogid" style="display: none"
								align="center">
								<br> Select a Package !<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');">Ok</button>
							</div>  
			<div class='scrollit' style="width:70%;margin-left:15%;margin-right:15%;">


				<table class='table table-hover table-bordered' id="example" class="display"
					style='background-color: #FFFAF0;width=100%'>
					<thead>
					<tr class='success'>
					<td class='ListOfTables' width='5%'><b>SNo</b></td>
						<td class='ListOfTables' width='10%'><b>Project id</b></td>
						<td class='ListOfTables' width='50%'><b>Project Name</b></td>
						<!-- <td class='ListOfTables' width ='35%'>
		<b>PIU Name</b> </td> -->
						<td class='ListOfTables' width='35%'><b>Package Name</b></td>
					</tr></thead>
                   <tbody id="people">
					<%
					int count=0;
						try {
								Context initCtx = new InitialContext();
								Context envCtx = (Context) initCtx.lookup("java:comp/env");
								DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

								conn = ds.getConnection();

								String sql3 = "select distinct(Project_ID) from xx_project_user_mapping where User_ID='"
										+ userid + "'";
								ps3 = conn.prepareStatement(sql3);
								rs3 = ps3.executeQuery();
								while (rs3.next()) {
									String projectid1 = rs3.getString("Project_ID");
									

									String sql4 = "select distinct(Package_Id) from xx_project_user_mapping where Project_ID='"
											+ projectid1 + "'";
									ps4 = conn.prepareStatement(sql4);
									rs4 = ps4.executeQuery();
									while (rs4.next()) {
										String packageid1 = rs4.getString("Package_Id");
									
									
									
									
									
									
									
									
									String sql5 = "select * from xx_projectattributes_master where Project_ID='"
											+ projectid1 + "'";
									ps5 = conn.prepareStatement(sql5);
									ResultSet Project_rs1 = ps5.executeQuery();
									while (Project_rs1.next()) {
										String packname = null;
										String proj_id = Project_rs1
												.getString("Project_id");
										String project = Project_rs1.getString("project");
										String piu1 = Project_rs1.getString("PIU_of_RVNL");
										String sql51 = "select * from xx_packages_project where project_id='"
												+ proj_id + "'  AND package_id='"+packageid1+"'";
										
										PreparedStatement ps51 = conn
												.prepareStatement(sql51);
										ResultSet Project_rs11 = ps51.executeQuery();
										while (Project_rs11.next()) {
											packname = Project_rs11
													.getString("package_name");
											//packageid = Project_rs11.getInt("package_id");
											//System.out.println("printing my package id first one-----------------------------"+packageid);
											
											count=count+1;
					%>
					<tr class='active'>
					<td class='ListOfTables'><%=count%></td>
						<td class='ListOfTables'><%=proj_id%></td>
						<td class='ListOfTables'><%=project%></td>
						<%-- <td class='ListOfTables'><%=piu1 %></td> --%>
						<td class='ListOfTables'><%=packname%></td>
					</tr>

					<%
						}

									}
									}
								}

							} catch (Exception e) {

								e.printStackTrace();
							} finally {
							    try { conn.close(); } catch (Exception e) { /* ignored */ }
							}
					%>






</tbody>


				</table>
			</div>





			<%
				//String user1 = request.getParameter("user_name");
					//String userid =request.getParameter("User_ID");
					//String piuid = request.getParameter("PIU_ID");
					//String piuname = request.getParameter("PIU_Name");
					//String project1 = request.getParameter("Project");
			%>
		</c:if>




		<c:if test="${param.Project_name != null}">
<%    		

int insertpackage=0;
String Project_ID = null;
String user_Id = null,msg1=null;
Connection conn1 = null, conn = null;
PreparedStatement ps11 = null;
ResultSet rs11 = null;
ResultSet rs = null, rs1 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs13 = null, rs14 = null, rs21=null;
PreparedStatement ps1 = null, ps3 = null, ps4 = null, ps5 = null, ps6 = null, ps13 = null, ps14 = null,ps21=null;
String user_id = request.getParameter("userId");
String project_id = request.getParameter("Project_name");
String package_name1 = request.getParameter("packages1");
System.out.println("user_id:" + user_id);
System.out.println("package_name:" + package_name1);

	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	conn1 = ds.getConnection();
	
	String query11 = "select * from xx_project_user_mapping where User_ID='"
			+ user_id + "'";
	
	ps11 = conn1.prepareStatement(query11);
	ps21 = conn1.prepareStatement(query11);
	rs11 = ps11.executeQuery();
	rs21 = ps21.executeQuery();
	ArrayList<String> al=new ArrayList<String>();
	ArrayList<String> al1=new ArrayList<String>();
	ArrayList<String> al2=new ArrayList<String>();
if(rs21.next()) {
	while(rs11.next()) {
		
		Project_ID = rs11.getString("Project_ID");
		packageid = rs11.getString("Package_Id");

		al.add(Project_ID);
		al1.add(packageid);
				user_Id = rs11.getString("User_ID");
				al2.add(user_Id);
	}
	if (al.contains(project_id) && al1.contains(package_name1) && al2.contains(user_id)){       %>
	<div style="margin-left:50%;"><button type="button" class="btn btn-primary" onclick="location.href='user_Project.jsp'">Add More Projects</button></div>
	<div class='scrollit' style="width:70%;margin-left:15%;margin-right:15%;"><br>

  <table class='table table-hover table-bordered'
		style='background-color: #FFFAF0;width=100%'>
		<tr class='success'>
		<td class='ListOfTables' width='12%'><b>SNo</b></td>
			<td class='ListOfTables' width='12%'><b>Project id</b></td>
			<td class='ListOfTables' width='25%'><b>Project Name</b></td>
			<!-- <td class='ListOfTables' width ='25%'>
<b>PIU Name</b> </td> -->
			<td class='ListOfTables' width='25%'><b>Package Name</b></td>
		</tr>

		<%int count=0;
			try {
					/* Context initCtx = new InitialContext();
					Context envCtx = (Context) initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
*/
					conn = ds.getConnection();

					String sql3 = "select distinct(Project_ID) from xx_project_user_mapping where User_ID='"
							+ user_id + "'";	 
					 ps3 = conn.prepareStatement(sql3);
					 rs3 = ps3.executeQuery();
					while (rs3.next()) {
						String projectid1 = rs3.getString("Project_ID");
						
						String sql4 = "select distinct(Package_Id) from xx_project_user_mapping where Project_ID='"
								+ projectid1 + "'";
						
						ps4 = conn.prepareStatement(sql4);
						rs4 = ps4.executeQuery();
						while (rs4.next()) {
							String packageid1 = rs4.getString("Package_Id");
						String sql5 = "select * from xx_projectattributes_master where Project_ID='"
								+ projectid1 + "'";
						
						 ps5 = conn.prepareStatement(sql5);
						ResultSet Project_rs1 = ps5.executeQuery();
						while (Project_rs1.next()) {
							String packname = null;
							String proj_id = Project_rs1
									.getString("Project_id");
							String project = Project_rs1.getString("project");
							String piu1 = Project_rs1.getString("PIU_of_RVNL");
							String sql51 = "select * from xx_packages_project where project_id='"
									+ projectid1 + "' AND package_id='"+packageid1+"'";
							
							
							
							PreparedStatement ps51 = conn
									.prepareStatement(sql51);
							ResultSet Project_rs11 = ps51.executeQuery();
							while (Project_rs11.next()) {
								packname = Project_rs11
										.getString("package_name");
								packageid = Project_rs11.getString("package_id");
								
								count=count+1;
		%>
		<tr class='active'>
		<td class='ListOfTables'><%=count%></td>
			<td class='ListOfTables'><%=proj_id%></td>
			<td class='ListOfTables'><%=project%></td>
			<%-- <td class='ListOfTables'><%=piu1 %></td> --%>
			<td class='ListOfTables'><%=packname%></td>
		</tr>


		<%
			}
						}
						}
						}
			}catch(Exception e){
			e.printStackTrace();
			} finally {
			    try { conn.close(); } catch (Exception e) { /* ignored */ }
			    try { conn1.close(); } catch (Exception e) { /* ignored */ }
			}
					
					
					%>
					</table>
			</div>
          <script type="text/javascript">
          
          
          jQuery.noConflict();
			
			 var dialogid="#dialogid";
			 
			$(function(){
				$(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			});
          </script>       
                                                                 
		<%
		}
		else{
			insertpackage=2;
		}
	//}
	
	
	
	if(insertpackage==2){
		
		%>
		
		<sql:update dataSource="jdbc/MySQLDB" var="rs">
INSERT INTO xx_project_user_mapping (User_ID,Project_ID,Package_Id) VALUES ('<%=user_id%>','<%=project_id%>','<%=package_name1%>');
</sql:update>	

<div align="center" style="margin: 0% 70% 0% 0%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-primary" onclick="location.href='user_Project.jsp'">Add More Projects</button></div>
<div class='scrollit' style="width:50%;margin-left:200px;"><br>

  <table class='table table-hover table-bordered'
		style='background-color: #FFFAF0;width=100%'>
		<tr class='success'>
		<td class='ListOfTables' width='12%'><b>SNo</b></td>
			<td class='ListOfTables' width='12%'><b>Project id</b></td>
			<td class='ListOfTables' width='25%'><b>Project Name</b></td>
			<!-- <td class='ListOfTables' width ='25%'>
<b>PIU Name</b> </td> -->
			<td class='ListOfTables' width='25%'><b>Package Name</b></td>
		</tr>

		<%int count=0;
			try {
					/* Context initCtx = new InitialContext();
					Context envCtx = (Context) initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
*/
					conn = ds.getConnection();

					String sql3 = "select distinct(Project_ID) from xx_project_user_mapping where User_ID='"
							+ user_id + "'";
					 ps3 = conn.prepareStatement(sql3);
					 rs3 = ps3.executeQuery();
					while (rs3.next()) {
						String projectid1 = rs3.getString("Project_ID");
						
						String sql4 = "select distinct(Package_Id) from xx_project_user_mapping where Project_ID='"
								+ projectid1 + "'";
						
						ps4 = conn.prepareStatement(sql4);
						rs4 = ps4.executeQuery();
						while (rs4.next()) {
							String packageid1 = rs4.getString("Package_Id");
						String sql5 = "select * from xx_projectattributes_master where Project_ID='"
								+ projectid1 + "'";
						
						 ps5 = conn.prepareStatement(sql5);
						ResultSet Project_rs1 = ps5.executeQuery();
						while (Project_rs1.next()) {
							String packname = null;
							String proj_id = Project_rs1
									.getString("Project_id");
							String project = Project_rs1.getString("project");
							String piu1 = Project_rs1.getString("PIU_of_RVNL");
							String sql51 = "select * from xx_packages_project where project_id='"
									+ projectid1 + "' AND package_id='"+packageid1+"'";
							
							
							
							PreparedStatement ps51 = conn
									.prepareStatement(sql51);
							ResultSet Project_rs11 = ps51.executeQuery();
							while (Project_rs11.next()) {
								packname = Project_rs11
										.getString("package_name");
								packageid = Project_rs11.getString("package_id");
								
								count=count+1;
		%>
		<tr class='active'>
		<td class='ListOfTables'><%=count%></td>
			<td class='ListOfTables'><%=proj_id%></td>
			<td class='ListOfTables'><%=project%></td>
			<%-- <td class='ListOfTables'><%=piu1 %></td> --%>
			<td class='ListOfTables'><%=packname%></td>
		</tr>


		<%
			}
						}
						}
						}
					
					
					
					%>
					</table>
			</div>
					<%					

				} catch (Exception e) {

					e.printStackTrace();
				} finally {
				    try { conn.close(); } catch (Exception e) { /* ignored */ }
				}
		
		
	}
}else{

	
	%>
	
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
INSERT INTO xx_project_user_mapping (User_ID,Project_ID,Package_Id) VALUES ('<%=user_id%>','<%=project_id%>','<%=package_name1%>');
</sql:update>	


<div class='scrollit' style="width:70%;margin-left:212px;">

<table class='table table-hover table-bordered'
	style='background-color: #FFFAF0;width=100%'>
	<tr class='success'>
	<td class='ListOfTables' width='12%'><b>SNo</b></td>
		<td class='ListOfTables' width='12%'><b>Project id</b></td>
		<td class='ListOfTables' width='25%'><b>Project Name</b></td>
		<!-- <td class='ListOfTables' width ='25%'>
<b>PIU Name</b> </td> -->
		<td class='ListOfTables' width='25%'><b>Package Name</b></td>
	</tr>

	<%int count=0;
		try {
				/* Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");
				DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
*/
				 conn = ds.getConnection();

				String sql3 = "select distinct(Project_ID) from xx_project_user_mapping where User_ID='"
						+ user_id + "'";
				 ps3 = conn.prepareStatement(sql3);
				 rs3 = ps3.executeQuery();
				while (rs3.next()) {
					String projectid1 = rs3.getString("Project_ID");
					
					String sql4 = "select distinct(Package_Id) from xx_project_user_mapping where Project_ID='"
							+ projectid1 + "'";
					
					ps4 = conn.prepareStatement(sql4);
					rs4 = ps4.executeQuery();
					while (rs4.next()) {
						String packageid1 = rs4.getString("Package_Id");
					String sql5 = "select * from xx_projectattributes_master where Project_ID='"
							+ projectid1 + "'";
					
					 ps5 = conn.prepareStatement(sql5);
					ResultSet Project_rs1 = ps5.executeQuery();
					while (Project_rs1.next()) {
						String packname = null;
						String proj_id = Project_rs1
								.getString("Project_id");
						String project = Project_rs1.getString("project");
						String piu1 = Project_rs1.getString("PIU_of_RVNL");
						String sql51 = "select * from xx_packages_project where project_id='"
								+ projectid1 + "' AND package_id='"+packageid1+"'";
						
						
						
						PreparedStatement ps51 = conn
								.prepareStatement(sql51);
						ResultSet Project_rs11 = ps51.executeQuery();
						while (Project_rs11.next()) {
							packname = Project_rs11
									.getString("package_name");
							packageid = Project_rs11.getString("package_id");
							
							count=count+1;
	%>
	<tr class='active'>
	<td class='ListOfTables'><%=count%></td>
		<td class='ListOfTables'><%=proj_id%></td>
		<td class='ListOfTables'><%=project%></td>
		<%-- <td class='ListOfTables'><%=piu1 %></td> --%>
		<td class='ListOfTables'><%=packname%></td>
	</tr>


	<%
		}
					}
					}
					}
				
				
				
				%>
				</table>
		</div>
				<%					

			} catch (Exception e) {

				e.printStackTrace();
			} finally {
			    try { conn.close(); } catch (Exception e) { /* ignored */ }
			}
	
}


%>


<div id="dialogid" style="display: none"
								align="center">
								<br> This Package Already Exists!<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');location.href = 'user_Project.jsp';">Ok</button>
							</div> 

		</c:if>
		
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<script type="text/javascript">
		
          function validateProject1(){

        		//alert("asdads");
        		var userid=document.getElementById("userId").value;
        		var Project_names=document.getElementById("Project_name");
        		var pack=document.getElementById("packages1");
        		
        		var pack_nam = pack.options[ pack.selectedIndex ].value;
        		//alert(pack);
        		//alert("pack_name"+pack_name);
        		var Project_name = Project_names.options[ Project_names.selectedIndex ].value;	
        		if(Project_name=="none" || Project_name=="" || Project_name=="null" ||pack_nam=="none" || pack_nam=="" || pack_nam=="null" )
        			{
        			
        			 jQuery.noConflict();
        				
        				 var dialogid="#dialogid";
        				 
        				$(function(){
        					$(dialogid).dialog({
        			        modal: true,
        			        autoOpen: false,
        			        title: "Alert",
        			        width: 400,
        			        height: 200
        			    });
        				 
        				  $(dialogid).dialog('open');
        				});
        			}
        		else{
        		
        		document.Add_Project.userid_1.value=userid;
        		document.Add_Project.projectid.value=Project_name;
        		document.getElementById("Add_Project").submit();
        	}}
</script>

<script type="text/javascript">

function button1(){
	
	/*var bck1= window.open('NewIndex.jsp','_self');
	if(window.focus){
		bck1.focus();
	}*/
	window.history.back();
	
}
</script>

	</form>
	<%@include file="included/footer.jsp"%>
	
	
	
</body>

</html>