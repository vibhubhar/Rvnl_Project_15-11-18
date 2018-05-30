<%@page import="com.itextpdf.text.log.SysoLogger"%>
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
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to user page</title>
  
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<script src="resources/JS/UserIndex.js"></script>
<script src="resources/JS/Reports230.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
<!-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/blitzer/jquery-ui.css"/> -->
<script src="resources/jQuery/jquery-1.12.3.min.js"></script>
<script src="resources/jQuery/jquery-ui.js"></script>
<!--<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <link href="http://code.jquery.com/ui/1.10.4/themes/blitzer/jquery-ui.css" rel="stylesheet">  -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
	<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<style>
.ui-datepicker-year {
   background-color: #cc0000;
 padding-left:20px;
}
</style>
<script type="text/javascript">

    function ValidateNo1() {
        var phoneNo = document.getElementById('ApprovalDate');
        if (phoneNo.value == "" || phoneNo.value == null) {
    	document.getElementById("error5").style.color="RED";
    	document.getElementById("error5").innerHTML="Please Select a date";
            return false;
        } else{
       
        var phoneno = /^\d{10}$/;  
        if(phoneNo.value.match(phoneno))  
        {  document.getElementById("error5").style.color="green";
        	document.getElementById("error5").innerHTML="Mobile Number is Valid";
        	document.getElementById("btnclick").disabled = false;
            return true;  
        }  
        else  
        {  document.getElementById("error5").style.color="red";
        	document.getElementById("error5").innerHTML="Not a Valid Mobile Number";
        	document.getElementById("btnclick").disabled = true;
           return false;  
        }  
        }

        alert("Success ");
        return true;
        }
</script>
<script>
var $j = jQuery.noConflict();
$j(document).ready(function() {
    $j( ".mydatepickers" ).datepicker({
		dateFormat : 'dd/mm/yy'
	}).val();
  });


</script>
<script type="text/javascript">
	function frezedate(id, startDate) {
		var $j = jQuery.noConflict();

		var idof = id;
		//alert(startDate);
		var chunks = startDate.split('-');
		var formattedDate = [ chunks[2], chunks[1], chunks[0] ].join("/");
		//alert(formattedDate);
		$j("#" + idof).datepicker({

			dateFormat : 'dd/mm/yy',
			minDate : formattedDate,
			maxDate : '0', changeYear: true

		}).datepicker("show").val();
		//var today = new Date(); var dd = today.getDate(); 

	}
</script>
<script>
var request;  
function sendInfo(packageid)  
{  
//var v=document.vinform.t1.value;  
var url="pullbackdocumentlist.jsp?packageid="+packageid;  
  var userid=document.getElementById('userId').value;
  var url="pullbackdocumentlist.jsp?packageid="+packageid+"&userid="+userid;  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('docs').innerHTML=val;  
}  
}  
</script>
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
<%-- <div><h4 style='width: 300px; margin-left: 27px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pullback Documents</h4></div>
<h4 align="left" style='width: 300px; margin-left: 27px'>
		<font style="color: red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font
			color="#99CC00">:&nbsp;<%=(String) session.getAttribute("user_name")%></font>
	</h4> --%>
	
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Pullback Documents] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>	
<form name="Add_Document" id="Add_Document"  method="get" style="margin:80px;" >
<%

response.setHeader("Cache-control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", -1);

%>
<!-- <div style="text-align:center;font-size: 20px;"><b> Pull Back Document List </b></div>
 -->
<input type="hidden" id="userid_1" />
<input type="hidden" id="projectid"/>
<input type="hidden" id="packageid"/>
<input type="hidden" id="packagename"/>
<input type="hidden" id="docid"/>
<input type="hidden" id="pulldate"/>
<c:if test="${param.Project_name == null}">
<table><tr style="margin-top: -56px;
display: block;"><td style="background-color: unset;">
<br>Projects :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=Project_name id="Project_name" style="width: 205px" onchange="showpakages(this.value)" style="width: ;
margin: 0px 0px 0px 25px;">
						<option value="none">-- Select Project --</option>
<%
String user = (String)session.getAttribute("user_name");

String piu=null;
String piurvnl=null;
String projects=null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs6=null,rs13=null,rs14=null;
PreparedStatement ps1 = null, ps3 = null,ps4=null,ps5=null,ps6=null,ps13=null,ps14=null;
String userid = null;

try {
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn = ds.getConnection();
		String project_id=null;	
		String sql3 = "select User_ID from xx_user_master where User_name='"+user+"'";
		ps3 = conn.prepareStatement(sql3);
		rs3 = ps3.executeQuery();
		if (rs3.next()) {
			 userid = rs3.getString("User_ID");
			
					
			String sql4 = "select distinct(Project_ID) from xx_project_user_mapping where User_ID='"+userid+"'";
			ps4 = conn.prepareStatement(sql4);
			rs4 = ps4.executeQuery();	
			while(rs4.next()){

				
				project_id = rs4.getString("Project_ID");
			
					
					
					String sql6 = "select Project_ID,Project from xx_projectattributes_master where Project_ID='"+project_id+"'";
					ps6 = conn.prepareStatement(sql6);
					rs6 = ps6.executeQuery();
					String project = null;
					String projectId = null;
					while(rs6.next()){
						project = rs6.getString("Project");
						projectId = rs6.getString("Project_ID") ;
						

						%>
						<option value="<%=projectId%>"><%=project%></option>
						<%
						%>
			<%
							
					}
			}
			
	}}catch(Exception e){
		e.printStackTrace();
	}	finally {
	    try { conn.close(); } catch (Exception e) { /* ignored */ }
	}
		
%>

</select>
<input type="hidden" name="userId" id="userId" value="<%=userid%>"/>
</td><td style="background-color: unset;">

<div id="package" Style="margin: 10px 10px -9px 47px;"></div>
<br>
</td></tr></table>
<div id="docs"></div>
<!--  <div id="document" style="margin: -20px 0px 17px 0px;">
</div>-->
<!-- <td>PullBack Date :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" id="ApprovalDate" name="ApprovalDate" class="mydatepickers" onkeyup="ValidateNo1()"
							style="width: 205px;
margin: 8px 0px 0px -7px;"></td> -->
<br><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<button id ="addto" type="button" class="btn btn-primary" onclick="javascript:validateDocument();" style="margin-top: -100px;" target="_blank">Pull Back</button>
		<br>
		<br>
		<div id="dialogid" style="display: none"
								align="center">
								<br> Please Fill Date for Selected Document<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="var j=jQuery.noConflict();$j('#dialogid').dialog('close');">Ok</button>
							</div>
							<div id="dialogid1" style="display: none"
								align="center">
								<br> Please Select A Project<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="var j=jQuery.noConflict();$j('#dialogid1').dialog('close');">Ok</button>
							</div>
		

</c:if>

<c:if test="${param.Project_name != null}">

<%
String user = (String)session.getAttribute("user_name");


String user_id = request.getParameter("userId");

String docid=request.getParameter("pullbackrec");
String indexi="ApprovalDate"+docid;
String date=request.getParameter(indexi);


Date date1 =new SimpleDateFormat("dd/MM/yyyy").parse(date);
java.sql.Date pullbackdate= new java.sql.Date(date1.getTime());
String docno1=null,package_name=null,pCoordinator=null,package_director=null,requested_by=null,package_id=null,pro_id=null,project_name=null,mapid=null;
Connection conn = null;
try{
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
conn = ds.getConnection();
Statement selectStmt = (Statement) conn
.createStatement();
String select = "select * from xx_document_mapping where document_map_id ="
+ docid ;
ResultSet rs = selectStmt.executeQuery(select);
while (rs.next()){
	docno1=rs.getString("Document_Number");
	mapid=rs.getString("Document_Map_ID");
	requested_by=rs.getString("Submitted_by");
	package_id=rs.getString("Package_ID");
	
}
Statement selectStmt1 = (Statement) conn
.createStatement();
String select1 = "select * from xx_packages_project where package_id="
+package_id;
ResultSet rs1 = selectStmt.executeQuery(select1);
while (rs1.next()){
	package_name=rs1.getString("Package_name");
	package_director=rs1.getString("package_director");
	pro_id=rs1.getString("project_id");
	
}
Statement selectStmt2 = (Statement) conn
.createStatement();
String select2 = "select * from xx_projectattributes_master where project_id="
+pro_id;
ResultSet rs2 = selectStmt.executeQuery(select2);
while (rs2.next()){
	pCoordinator=rs2.getString("project_coordinator");
	
	project_name=rs2.getString("Project");
}

//conn.close();



%>
 <sql:update dataSource="jdbc/MySQLDB" var="rs">
  update xx_approval_workflow set action ='Y' where document_id =<%=docid%> 
</sql:update>
<sql:update dataSource="jdbc/MySQLDB" var="rs">
	update xx_record_actions set ActionPerformed='Pulled back by RVNL', ActionedOn='<%=pullbackdate%>',Real_ActionDate=now() where Document_id='<%=docid%>' and ActionPerformed='pending'
	
</sql:update>		
<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_record_actions (Document_id,CurrentDate,ActionPerformed,ActionPerformedBy,Information,Real_ActionDate)  Values ('<%=docid%>','<%=pullbackdate %>','pending','<%=user%>','Pulled back', now())
</sql:update>
<%
String select21 = "select * from xx_moreammendments where document_id ='"+docid+"'";

Statement st=null;

int flag=0;
st=(Statement) conn.createStatement();
ResultSet rs222 = st.executeQuery(select21);
if(rs222.next()){
	flag=1;
	
}
if(flag==1)
{
	
%>
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
	update xx_moreammendments set status ='return', action_To='<%=user%>', Information='Pulled back' where document_id =<%=docid%>
	</sql:update>
<%
}
else
{
	
	%>
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
  insert into xx_moreammendments (Document_id,document_number,status,action_performedBy,project,package,projectCoordinator,
  packageDirector,action_to,Information) Values ('<%=docid%>','<%=docno1 %>','return','<%=user%>','<%=project_name%>',
  '<%=package_name%>','<%=pCoordinator%>','<%=package_director%>','<%=user%>','Pulled back')
</sql:update>	
<%


}
}catch(Exception e){
	e.printStackTrace();
} finally {
    try { conn.close(); } catch (Exception e) { /* ignored */ }
}
//response.setHeader("Refresh", "0; URL=http://localhost:8080/RVNLDocumentPortal/Admin/PullBack.jsp");
response.sendRedirect("PullBack.jsp");
%>
<!-- 
<div class="alert alert-success" align="center">
					    <strong> Document has been pullbacked successfully.</strong>
					    </div>

 -->


<br><br><br>
		




</c:if>



<br><br><br><br><br><br>

</form>
<%@include file="included/Newfooter.jsp" %>
</body>

</html>