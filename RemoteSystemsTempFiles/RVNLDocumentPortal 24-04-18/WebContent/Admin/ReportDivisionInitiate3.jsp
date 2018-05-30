<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.io.*,java.util.*,javax.script.*,java.nio.file.*,java.nio.charset.*,java.text.DateFormat" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@include file="sessionCheck.jsp"%>
 <%@ page import ="java.text.SimpleDateFormat"%>
 <%@ page import ="java.util.Date"%>
 <%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
 <%@include file="included/NewHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="resources/JS/Reports230.js"></script>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- 
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<script src="resources/jQuery/jquery-1.12.3.min.js"></script>
<script src="resources/jQuery/jquery-ui.js"></script>
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
  
  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<!-- <script src="resources/jQuery/jquery-1.12.3.min.js"></script>
<script src="resources/jQuery/jquery-ui.js"></script>
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>  -->
  
  
   <link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
      <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>
      <script type="text/javascript"  src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
     <script src="resources/JS/Reports230.js"></script>
<script>
var $j = jQuery.noConflict();
  $j(function() {
	  
	  
	  $j('#DateStart' ).datepicker({ dateFormat: 'dd/mm/yy', changeYear: true}).val();
	  $j('#DateEnd').datepicker({ dateFormat: 'dd/mm/yy', changeYear: true}).val();
	   //  $( "#Dateofsubmission" ).datepicker();
	   });
  </script>
</head>
<body>
  
<%String user = (String)session.getAttribute("user_name");
//System.out.println("UZER:"+user);
%>
<h4 align="left"  style='width: 300px; margin-left:27px'><font style="color:red">&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font color="#99CC00">:&nbsp;<%=(String)session.getAttribute("user_name") %></font></h4>

<form action="ReportDivision.jsp"  name="reports" method="post" style="margin:40px;" >
<br>



<c:if test="${param.stage == null}">
<table class="table table-hover table-bordered">
<tr class="success" align="top">
<td><font color="grey">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Railway :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="zone_name" id="zone_name" 
					style="width: 205px" onchange="showDivisions(this.value)">
						<option value="">-- Select Zone --</option>
						<%
						String pname = request.getParameter("Projects");
						String zoneid = request.getParameter("Zone_ID");
						System.out.println("zoneid:"+zoneid);

						Connection conn = null;
						Statement stmt = null;
						ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs12=null,rs13=null,rs14=null;
						PreparedStatement ps1 = null, ps3 = null,ps4=null,ps5=null,ps12=null,ps13=null,ps14=null;
						try {
							Context initCtx = new InitialContext();
							Context envCtx = (Context) initCtx.lookup("java:comp/env");
							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

							conn = ds.getConnection();
							String sql3 = "select * from xx_zones_master";
								ps3 = conn.prepareStatement(sql3);
								rs3 = ps3.executeQuery();

								while (rs3.next()) {
									String zones = rs3.getString("Zone_Name");
						%>
						<option value="<%=zones%>"><%=zones%></option>
						<%
							}
						}catch(Exception e){
									e.printStackTrace();
								} 
								
						%>
				  </select> </font><br /> <br />
				</td>  
				<td><font color="grey">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Division :</b>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   <div id ='DivsionsDiv' style='display:inline;'>
					<select name='division' id='division1' style="width: 205px" onchange="showproject(this.value)">
						<option value="">-- Select Division --</option>						
			     	</select> 
				   </div><br /> <br />
				   </font>
				</td>
				 		<td>
				 		<div id="project_select">
				 		
				 		</div>
				 		</td>					</tr>
					<tr class="success">
					
					
					
					<td><font color="grey">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Document Type :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="document" id="document" 
					style="width: 205px">
						<option value="">-- Select Document --</option>
						<%
						String doctype = null;
						try {
					String sql3 ="select * from xx_documentattributes_master";
								ps3 = conn.prepareStatement(sql3);
								rs3 = ps3.executeQuery();

								while (rs3.next()) {
									doctype = rs3.getString("Document_Type");
									System.out.println("doctype:"+doctype);

						%>
						<option value="<%=doctype%>"><%=doctype%></option>
						<%
							}
						}	catch(Exception e){
									e.printStackTrace();
								}
								
						%>
				  </select> </font><br /> <br />
					
					</font></td>
					 <td><font color="grey">
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Status :</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				  &nbsp;
				  
				  <select name="status" id="status" 
					style="width: 205px">
						<option value="">-- Select Status --</option>
						<option value="Finally Approved">Approved</option>
								<option value="pending">Pending</option>
										  </select></font> <br /> 
					</td>
<td><font color="grey">
					
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Submitted Between Dates</b>&nbsp;&nbsp;
					<input type="text"  name="DateStart" id ="DateStart" style="width:100px" />
				<b>And</b>&nbsp;&nbsp;
					<input type="text"  name="DateEnd" id ="DateEnd" style="width:100px" />
				<br></font></td>					</tr>
				
				                <tr class="success">
                <td><font color="grey">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>PIU:</b>&nbsp;&nbsp;
                <select name="piu" id="piu" style="width: 205px;margin: 1px 0px 14px 114px;">
                                <option value="">-- Select piu --</option>
                                <%
                                
                                    String piuid1 = null,piuname=null;
                                        try {
                                            String sql3 = "select * from xx_piu_master";
                                            ps3 = conn.prepareStatement(sql3);
                                            rs3 = ps3.executeQuery();
 
                                            while (rs3.next()) {
                                                piuid1 = rs3.getString("Piu_Id");
                                                piuname=rs3.getString("Piu_Name");
                                                		
                                                		
                                                		%>
                                                		      
                                                    <option value="<%=piuname%>"><%=piuname%></option>
                                                               <%
                                                               
                                            }
                                            
                                        
                                        //conn.close();
                                        }catch(Exception e){
                                            	e.printStackTrace();
                                            	
                                            } finally {
                                                try { conn.close(); } catch (Exception e) { /* ignored */ }
                                            }
                                                               
                                                               %>
                                                               
                                                               
                                                                                           
                                                		</select>
                                                		</font>
                                                		                </td>
                <td>
                </td>
                <td>
                </td>
                </tr>
				
				
				
				
				
				
					</table>	
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	 
			 <button type="submit" value="Submit" formtarget='_blank' onClick="window.location.reload()">Submit</button>
</c:if>



<c:if test="${param.stage != null}">
<%
String division=request.getParameter("division_name");
String doctype=request.getParameter("document");
String status=request.getParameter("status");
String DateStart=request.getParameter("DateStart");
String DateEnd=request.getParameter("DateEnd");
String piu = request.getParameter("piu");
System.out.println("my data="+doctype+DateStart+DateEnd);




System.out.println("division_name="+division);
//String projecttype=request.getParameter("project");

String projects=request.getParameter("projects");
//System.out.println("projecttype="+projecttype);
%>

<c:redirect url="ReportDivision.jsp">
<c:param name="division_name" value="<%=division %>"></c:param>
<c:param name="projects" value="<%=projects %>"></c:param>
<c:param name="status" value="<%=status %>"></c:param>
<c:param name="doctype" value="<%=doctype %>"></c:param>
  <c:param name="piu" value="<%=piu%>"></c:param>


</c:redirect>

</c:if>

</form>
</body>
</html>