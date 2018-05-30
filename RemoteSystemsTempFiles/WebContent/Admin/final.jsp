<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="included/NewHeader.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<jsp:include page="Divisions.jsp" flush="true" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	int formCount = 1,doccount=1,eltcnt=0;
	String formC = request.getParameter("formCount");
	String doctypes=request.getParameter("doctype");
	String [] st=doctypes.split("~");
	formCount = Integer.parseInt(formC);
%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Create User</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script src="resources/JS/validate230.js"></script>
<%
	for (int j = 1; j <= formCount; j++) {
%>
<script type="text/javascript">
document.getElementById('addMoreForm').onclick = duplicate;

function duplicate<%=j%>() {
		var i = 0;
		var original = document.getElementById('duplicater<%=j%>');
	    var clone = original.cloneNode(true); // "deep" clone
	    clone.id = "duplicetor" + ++i; // there can only be one element with an ID
	    original.parentNode.appendChild(clone);
	}
</script>
<%
	}
%>
</head>
<body>
	<br>
	<br>
	<br>
	<form action="update.jsp">
	 
		<%
			for (int i = 1; i <= formCount; i++) {
		%>
		<table align="center">
			<tr align="center">
				<td><b><%=st[doccount]%></b></td>
			</tr>


			<tr>
				<td>
					<div id="duplicater<%=i%>">
						<table width="100%" border="0">
							<tr>
								<td>
									<table>
										<tr>
											<td><h3 style="margin: 100px">RVNL</h3> </td>
										<tr>
											<td>&nbsp;
											<td></td>
										<tr>
											<td>
									 PIU Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<select name=PIU_name id="PIU_name" onchange="showDept(this.value)"
					style="width: 205px">
						<option value="none">-- Select PIU --</option>
												
													
													<%
														Connection conn = null;
															Statement stmt = null;
															ResultSet rs = null, rs1 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs7 = null, rs11 = null, rs33 = null,rs12=null;
															PreparedStatement ps = null, ps1 = null, ps3 = null, ps4 = null, ps5 = null, ps6 = null, ps7 = null, ps33 = null, ps11 = null,ps12=null;
															try {
																Context initCtx = new InitialContext();
																Context envCtx = (Context) initCtx.lookup("java:comp/env");
																DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

																conn = ds.getConnection();

																String sql3 = "select * from xx_piu_master";
																ps3 = conn.prepareStatement(sql3);
																rs3 = ps3.executeQuery();

																while (rs3.next()) {
																	String dname = rs3.getString("PIU_Name");
														%>
														<option value="<%=dname%>"><%=dname%></option>
														<%
															}
																
														%>
												  </select> <br /> <br />
											</td>
										</tr>
										<tr>
											<td>
												Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<div id ='DeptDiv_RVNL' style='display: inline;' >			  
				                                 <select name='Department_RVNL' id='<%=st[doccount]%>Department_RVNL1' style="width: 205px">
					                            	<option value="none">-- Select Department --</option>
			           						 	 </select> 
				 							    </div><br /> <br />
											</td>
										</tr>
										<tr>
											<td>
												Designation:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<div id ='DesgDiv_RVNL' style='display: inline;'>
												 <select name='designation_RVNL' id='<%=st[doccount]%>designation_RVNL1' style="width: 205px">
												  <option value="none">-- Select Designation --</option>
												 </select> <br /> <br />
											    </div>
											</td>
										</tr>
									</table>
								</td>
								<td>
									<table>
									    <tr>
											<td><h3 style="margin: 100px">MOR</h3> </td>
										<tr>
										<tr>
											<td>
												Zone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<select name='Zone' id="<%=st[doccount]%>Zone" style="width: 205px"
												onchange="showDivision(this.value)">
													<option value="none">-- Select Zone --</option>
													<%
														//Connection conn7 = ds.getConnection();
																String sql7 = "SELECT * FROM XX_zones_master";
																ps7 = conn.prepareStatement(sql7);
																rs7 = ps7.executeQuery();
																String zname = null;// request.getParameter("Zone_name");
																while (rs7.next()) {
																	zname = rs7.getString("zone_name");
													%>
													<option value="<%=zname%>"><%=zname%></option>
													<%
														}
													%>
											</select> <br /> <br />

											</td>
										</tr>
										<tr>
											<td>
												Division:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<select name='division' id='<%=st[doccount]%>division' style="width: 205px">
													<option value="none">-- Select Division --</option>

											</select> <br /> <br />
											</td>
										</tr>
										
										<tr>
											<td>Department:&nbsp;&nbsp;&nbsp;&nbsp; <select
												name=Department_name id="<%=st[doccount]%>Department_name"
												style="width: 205px">
													<option value="none">-- Select Department --</option>
													<%
														//Connection conn11 = ds.getConnection();

																String sql11 = "SELECT * FROM xx_departments_master";
																ps11 = conn.prepareStatement(sql11);
																rs11 = ps11.executeQuery();

																while (rs11.next()) {
																	String dname = rs11.getString("Department_Name");
													%>
													<option value="<%=dname%>"><%=dname%></option>

													<%
														}
													%>
											</select> <br /> <br />

											</td>
										</tr>
										<tr>
											<td>Designation:&nbsp;&nbsp;&nbsp;&nbsp; <select
												name='designations' id='<%=st[doccount]%>designations' style="width: 205px">
													<option value="none">-- Select Designation --</option>
                                               <%
																String sql12 = "select designation_name from xx_designation_master where type = 'MOR'";
																ps12 = conn.prepareStatement(sql12);
																rs12 = ps12.executeQuery();

																while (rs12.next()) {
																	String desg_name = rs12.getString("designation_name");
													%>
													<option value="<%=desg_name%>"><%=desg_name%></option>

													<%
														}
													%>
											</select> <br /> <br />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
					<div>&nbsp;</div>
				</td>
			  	<td align="top"><input type="button" value="Add" onClick="duplicate<%=i%>()"> </td>  
			</tr>
		</table>
		<br> <br>
		<%
			String Type = request.getParameter("Type");
					String Zone = request.getParameter("Zone");
					//	String Division = request.getParameter("Division");
					String Department = request.getParameter("Department_name");
					//	String Designation = request.getParameter("Designation");

					String Div = request.getParameter("state");
					String msg = Div;

					String Designation = request.getParameter("designation");
					System.out.println("DesgnName:" + Designation + "Type is"
							+ Type);

					System.out.println("Zon Name :" + Zone);
					System.out.println("--" + Type + "//" + Zone + "//" + msg
							+ "//" + Department + "//" + Designation);

					//Connection conn3 = ds.getConnection();

					String sql13 = "select zone_id from xx_zones_master where zone_name =?";
					ps3 = conn.prepareStatement(sql13);
					ps3.setString(1, Zone);
					rs3 = ps3.executeQuery();

					String z_id = null;
					while (rs3.next()) {
						z_id = rs3.getString("zone_id");

					}

					//Connection conn4 = ds.getConnection();
					String sql4 = "select division_id from xx_divisions_map where division_name =?";
					ps4 = conn.prepareStatement(sql4);
					ps4.setString(1, msg);
					rs4 = ps4.executeQuery();
					String div_id = null;
					while (rs4.next()) {
						div_id = rs4.getString("division_id");
					}

					//Connection conn5 = ds.getConnection();
					String sql5 = "select department_id from xx_departments_master where department_name =?";
					ps5 = conn.prepareStatement(sql5);
					ps5.setString(1, Department);
					rs5 = ps5.executeQuery();
					String dept_id = null;
					while (rs5.next()) {
						dept_id = rs5.getString("department_id");
					}

					//Connection conn6 = ds.getConnection();

					String sql6 = "select designation_id from xx_Designation_master where designation_name =?";
					ps6 = conn.prepareStatement(sql6);
					ps6.setString(1, Designation);
					rs6 = ps6.executeQuery();

					String desg_id = null;
					while (rs6.next()) {
						desg_id = rs6.getString("designation_id");
					}

					if (Type == "-- Select Type --" || Zone == "none"
							|| msg == "none" || msg == "-1"
							|| Department == "none" || Designation == "none"
							|| Designation == "-1") {

						System.out.println("Fill all data !!");

					} else {
		%>
		<sql:update dataSource="jdbc/MySQLDB" var="rs">
   INSERT INTO xx_user_master (Zone_id,Type,Division_id,Department_id,Designation_id) VALUES ('<%=z_id%>','<%=Type%>','<%=div_id%>','<%=dept_id%>','<%=desg_id%>');
</sql:update>

		<%
			}
				} catch (Exception e) {
					System.out.print(e);
					e.printStackTrace();
				} finally {

					try {
						if (rs != null)
							rs.close();
					} catch (Exception e) {
					}
					;
					try {
						if (rs1 != null)
							rs1.close();
					} catch (Exception e) {
					}
					;

					try {
						if (rs3 != null)
							rs3.close();
					} catch (Exception e) {
					}
					;
					try {
						if (rs4 != null)
							rs4.close();
					} catch (Exception e) {
					}
					;
					try {
						if (rs5 != null)
							rs5.close();
					} catch (Exception e) {
					}
					;
					try {
						if (rs6 != null)
							rs6.close();
					} catch (Exception e) {
					}
					;

					try {
						if (stmt != null)
							stmt.close();
					} catch (Exception e) {
					}
					;

					try {
						if (ps1 != null)
							ps1.close();
					} catch (Exception e) {
					}
					;

					try {
						if (ps3 != null)
							ps3.close();
					} catch (Exception e) {
					}
					;
					try {
						if (ps4 != null)
							ps4.close();
					} catch (Exception e) {
					}
					;
					try {
						if (ps5 != null)
							ps5.close();
					} catch (Exception e) {
					}
					;
					try {
						if (ps6 != null)
							ps6.close();
					} catch (Exception e) {
					}
					;
					try {
						if (conn != null)
							conn.close();
					} catch (Exception e) {
					}
					;
				}
															doccount++;										
			}//}
		%>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    
		<button type="button" onclick="javascript:validateUser();">Submit</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
			type="reset" value="Cancel" onclick="goBack()" />

	</form>
											      <%@include file="included/Newfooter.jsp" %>
	
</body>
</html>
