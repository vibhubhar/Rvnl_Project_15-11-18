<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@include file="sessionCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RVNL Document Portal</title>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<script src="resources/JS/Approval_wf230.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	<%
		String user = (String) session.getAttribute("user_name");
		//System.out.println("UZER:"+user);
	%>
	<form id='approve_pop' name='approve_pop' method="post">
		<INPUT TYPE="HIDDEN" NAME="Doc_Id"> <INPUT TYPE="HIDDEN"
			NAME="Action"> <INPUT TYPE="HIDDEN" NAME="AddedBy"> <INPUT
			TYPE="HIDDEN" NAME="checkedval"> <INPUT TYPE="HIDDEN"
			NAME="C_Level"> <INPUT TYPE="HIDDEN" NAME="remarks">

		<%
			String Document_id = request.getParameter("doc_id");
			String Added_by = request.getParameter("added_by");
			
			String Clevel = request.getParameter("C_Level");
		%>
		<c:choose>



			<c:when test="${param.Action == null}">


				<INPUT TYPE="text" NAME="Approval" id="Approval" VALUE="2" />
Return with Remarks
<div id="App1" class="desc"></div>
				<div id="App2" class="desc" style='display: none;'>
					<br> &nbsp;&nbsp;&nbsp;
					<textarea name="remark" id="remark" maxlength="500" rows="10" cols="50"
						name="comment" placeholder="Enter Remark"></textarea>


				</div>

				<br>
				<br>
&nbsp;&nbsp;&nbsp;<button id="Approve" type="button"
					class="btn btn-primary"
					onclick="approvedpopup('<%=Document_id%>','<%=Added_by%>','<%=Clevel%>')">Submit</button>


			</c:when>
			<c:when test="${param.Action != null}">
				<%
					String action = request.getParameter("Action");
							if (action.equalsIgnoreCase("approved")) {
								String doc_id = request.getParameter("Doc_Id");
								String document_id = request
										.getParameter("document_id");
								String addedBy = request.getParameter("AddedBy");
								String check = request.getParameter("checkedval");

								//System.out.println("DocID :" +doc_id);
								PreparedStatement getLevelPS = null, getUserPS = null, MaxPS = null, getUser = null;
								ResultSet getLevelRS = null, getUserRS = null, MaxRS = null, UserRs = null;
								Context initCtx = new InitialContext();
								Context envCtx = (Context) initCtx
										.lookup("java:comp/env");
								DataSource ds = (DataSource) envCtx
										.lookup("jdbc/MySQLDB");
								Connection conn = null;
								conn = ds.getConnection();

								String getLevel = "select * from xx_approval_workflow where document_id = '"
										+ doc_id + "'";
								getLevelPS = conn.prepareStatement(getLevel);
								getLevelRS = getLevelPS.executeQuery();
								String zh_id = null, hier_id = null, dh_id = null, assigned_to = null;

								String c_levels = request.getParameter("C_Level");
								
								int c_level = Integer.parseInt(c_levels);
								if (getLevelRS.next()) {
									zh_id = getLevelRS.getString(4);
									assigned_to = getLevelRS.getString(5);
									dh_id = getLevelRS.getString(6);

									PreparedStatement hierPS = null;
									ResultSet hierRS = null;

									
									if (zh_id != null) {
										hier_id = getLevelRS.getString(4);
										String getMax = "select MAX(CAST(level AS SIGNED)) from xx_doc_zones_hierarchy where hierarchy_id ='"
												+ hier_id + "'";
										MaxPS = conn.prepareStatement(getMax);
										MaxRS = MaxPS.executeQuery();
										int level = 0;
										String slevel = null;
										while (MaxRS.next()) {
											slevel = MaxRS.getString(1);
											level = Integer.parseInt(slevel);
										}
										if (c_level < level) {
											int c_level2 = c_level + 1;
											String getHier = "select * from xx_doc_zones_hierarchy where hierarchy_id ='"
													+ hier_id
													+ "' and level = '"
													+ c_level2 + "'";
											hierPS = conn.prepareStatement(getHier);
											hierRS = hierPS.executeQuery();
											String zone = null, dept = null, desg = null;
											while (hierRS.next()) {
												zone = hierRS.getString(4);
												dept = hierRS.getString(6);
												desg = hierRS.getString(7);
											}
											String getU = "select user_name from xx_user_master where zone_id =(select zone_id from xx_zones_master where zone_name = '"
													+ zone
													+ "') and division_id = 86 and department_id =  (select department_id from xx_departments_master where department_name = '"
													+ dept
													+ "') and Designation_Id = (select designation_id from xx_designation_master where designation_name ='"
													+ desg + "')";
											getUser = (PreparedStatement) conn
													.prepareStatement(getU);
											                	
											UserRs = getUser.executeQuery();
											String assign_to = null;
											while (UserRs.next()) {
												assign_to = UserRs.getString(1);
											}
											Date dNow = new Date();
											SimpleDateFormat ft = new SimpleDateFormat(
													"dd/MM/yyyy");
											ft.format(dNow);
											

											Statement insertStmt = (Statement) conn
													.createStatement();
											String insertStg = "insert into xx_approval_workflow (Document_id,Added_byUser,zone_hierarchy_id,Assigned_To,Action,CurrentDate,level) Values ('"
													+ doc_id
													+ "','"
													+ addedBy
													+ "','"
													+ hier_id
													+ "','"
													+ assign_to
													+ "','N',CURDATE(),'"
													+ c_level2
													+ "')";
											insertStmt.executeUpdate(insertStg);
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
                    update xx_approval_workflow set action ='Y' where document_id =<%=doc_id%> and level ='<%=c_level%>'
                  </sql:update>
				<%
					}
									} else if (dh_id != null) {
										hier_id = getLevelRS.getString(6);
										//System.out.println("HZ. "+hier_id);
										String getMax = "select MAX(CAST(level AS SIGNED)) from xx_doc_divisions_hierarchy where hierarchy_id ='"
												+ hier_id + "'";
										MaxPS = conn.prepareStatement(getMax);
										MaxRS = MaxPS.executeQuery();
										int level = 0;
										String slevel = null;
										while (MaxRS.next()) {
											slevel = MaxRS.getString(1);
											
											level = Integer.parseInt(slevel);
										}
										if (c_level < level) {
											int c_level2 = c_level + 1;
											String getHier = "select * from xx_doc_divisions_hierarchy where hierarchy_id ='"
													+ hier_id
													+ "' and level = '"
													+ c_level2 + "'";
											hierPS = conn.prepareStatement(getHier);
											hierRS = hierPS.executeQuery();

											String division = null, dept = null, desg = null;
											while (hierRS.next()) {
												division = hierRS.getString(4);
												dept = hierRS.getString(6);
												desg = hierRS.getString(7);
												
											}
											String getU = "select user_name from xx_user_master where division_id =(select division_id from xx_divisions_map where division_name ='"
													+ division
													+ "') and department_id = (select department_id from xx_departments_master where department_name = '"
													+ dept
													+ "') and Designation_Id = (select designation_id from xx_designation_master where designation_name ='"
													+ desg + "')";
											getUser = (PreparedStatement) conn
													.prepareStatement(getU);
											UserRs = getUser.executeQuery();
											String assign_to = null;
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
       update xx_approval_workflow set action ='Y' where document_id ="doc_id+" and level ='"+c_level+"'
     </sql:update>



				<%
					while (UserRs.next()) {
												assign_to = UserRs.getString(1);
												//System.out.println("UZ.N. "+assign_to);
											}
											Statement insertStmt = (Statement) conn
													.createStatement();
											String insertStg = "insert into xx_approval_workflow (Document_id,Added_byUser,division_hierarchy_id,Assigned_To,CurrentDate,Action,level) Values ('"
													+ doc_id
													+ "','"
													+ addedBy
													+ "','"
													+ hier_id
													+ "','"
													+ assign_to
													+ "',CURDATE(),'N','"
													+ c_level2
													+ "')";
											insertStmt.executeUpdate(insertStg);

										}
									}
									if (check.equalsIgnoreCase("1")) {
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
       insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy) Values ('<%=doc_id%>',CURDATE(),'approved','<%=user%>')
     </sql:update>
				<%
					} else {
										String remark = request.getParameter("remarks");
										String query = "insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Information,Real_ActionDate) Values ("
												+ doc_id
												+ ",CURDATE(),'approved','"
												+ user + "','" + remark + "',now())";
										conn.createStatement().executeUpdate(query);
										conn.close();
									}

								}
				%>
				<div class="alert alert-success" align="center">
					<strong>Success!</strong> Document has been approved.
				</div>
				<%
					}
				%>

			</c:when>
			<c:otherwise>

			</c:otherwise>


		</c:choose>


	</form>

</body>
</html>