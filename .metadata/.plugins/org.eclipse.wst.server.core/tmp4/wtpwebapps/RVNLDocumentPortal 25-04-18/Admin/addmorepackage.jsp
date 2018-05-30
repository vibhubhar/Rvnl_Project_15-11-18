<%@page import="javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.io.*,java.util.*,javax.script.*,java.nio.file.*,java.nio.charset.*,java.text.DateFormat" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import = "java.lang.Integer"%>
<%@include file="included/NewHeader.jsp"%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<script src="resources/JS/Approval_wf230.js"></script>
 <link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RVNL Document Portal </title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">    
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script src="resources/jQuery/jquery-1.12.3.min.js"></script> 
<style>
.ui-datepicker-year {
   background-color: #cc0000;
 padding-left:20px;
}
textarea {
   resize: none;
}


* { font-family:Arial; }
h2 { padding:0 0 5px 5px; }
h2 a { color: #224f99; }
a { color:#999; text-decoration: none; }
a:hover { color:#802727; }
p { padding:0 0 5px 0; }

input { padding:5px; border:1px solid #999; border-radius:4px; -moz-border-radius:4px; -web-kit-border-radius:4px; -khtml-border-radius:4px; }
div.absolute {
   	position:absolute;
   	margin-top: 5px;
   	margin-left: 39px;
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
<script src="resources/jQuery/jquery-ui.js"></script>
<!--  <script src="resources/jQuery/CSS/jquery-ui.css"></script> -->
 <!--  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>-->
<script type="text/javascript">
    function refreshAndClose() {
        window.opener.location.reload(true);
        window.close();
    }
</script>
   <script>
	$(function() {
		
		$("#start_Date").datepicker({
			dateFormat : 'dd/mm/yy',
				maxDate:'0', changeYear: true
		}).val();
		//  $( "#Dateofsubmission" ).datepicker();
	});
</script>
   <script type="text/javascript">
	function frezedate(id, startDate) {
		
		var $j = jQuery.noConflict();

		var idof = id;
		
		/* var chunks = startDate.split('-'); */
		var formattedDate =startDate;// [ chunks[2], chunks[1], chunks[0] ].join("/");
		
		$j("#" + idof).datepicker({

			dateFormat : 'dd/mm/yy',
			minDate : formattedDate,
			maxDate : '0', changeYear: true

		}).datepicker("show").val();
		//var today = new Date(); var dd = today.getDate(); 

	}
</script>
<script type="text/javascript">

function stopRKey(evt) { 
	  var evt = (evt) ? evt : ((event) ? event : null); 
	  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
	  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
	} 

	document.onkeypress = stopRKey; 


</script>

<script type="text/javascript">
function loadXMLDoc(element,er)
{
var xmlhttp;
var k=document.getElementById(element).value;
var urls="projectexist.jsp?ver="+k;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4)
    {
        //document.getElementById("err").style.color="red";
        document.getElementById(er).innerHTML=xmlhttp.responseText;
		var ex=document.getElementById("exist");
		if(ex!=null){
			document.getElementById("btnclick").disabled = true;
			
			
		}else{
			
			document.getElementById("btnclick").disabled = false;
			
		}

    }
  }
xmlhttp.open("GET",urls,true);
xmlhttp.send();
}
</script>
<script>



function showDivisionspackage(str,index) {
	showDivisionspackagesub1(str,index);
	showDivisionspackagesub2(str,index);
	
}

function showDivisionspackagesub1(str1,index){
	index1=index;
	var str = encodeURIComponent(str1);
	
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp3 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp3 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp3 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Divisions_checkBoxPackage.jsp";
	var z="Zone1";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=1";
	xmlHttp3.onreadystatechange = stateChangespackage;
	xmlHttp3.open("GET", url, true);
	xmlHttp3.send(null);
	
}
function showDivisionspackagesub2(str1,index){
	var str = encodeURIComponent(str1);
	index1=index;
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp2 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp2 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Divisions_checkBoxPackage.jsp";
	var z="Zone1";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=1";
	xmlHttp2.onreadystatechange = stateChangespackage;  // need to be changed for another dropdown
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
	
}


function stateChangespackage() {
	var divid="state"+index1;

	if (xmlHttp3.readyState == 4 || xmlHttp3.readyState == "complete") {
		document.getElementById(divid).innerHTML = xmlHttp3.responseText
	}
}

function showDivisions2package(str1,index) {
	var str = encodeURIComponent(str1);
	index2=index;
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp3 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp3 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp3 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp2 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp2= new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp2== null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Divisions_checkBoxPackage.jsp";
	var z="Zone2";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=2";
	xmlHttp3.onreadystatechange = stateChanges2package;
	xmlHttp3.open("GET", url, true);
	xmlHttp3.send(null);
//	var piu=document.getElementById('piuid1');
//	var url1 = "zone2inner.jsp";
//	var z1="Zonetwo"+index;
//	url1 += "?cont=" + piu+"&zone="+z1+"&index="+index+"&id=2";
//	xmlHttp2.onreadystatechange = stateChanges2package;
//	xmlHttp2.open("GET", url1, true);
//	xmlHttp2.send(null);
	
}
function packnamecheck(str,packal3) {
	//alert(str+"hiiiiii"+packal3);
	if (packal3.includes(str)) {
			 var dialogid="#dialogid1";
//alert("inside...");
				 $(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title: "Alert Same Package Name",
			        width: 400,
			        height: 200
			    });
				 document.getElementById("btnclick").disabled = true;
		  		 $(dialogid).dialog('open');
		          return false;
		       	  			
		  		}else{
		  			
		  			document.getElementById("btnclick").disabled = false;
		  			
		  		}
			}
function stateChanges2package() {
	var divid="state2"+index2;

	if (xmlHttp3.readyState == 4 || xmlHttp3.readyState == "complete") {
		document.getElementById(divid).innerHTML = xmlHttp3.responseText
	}
}


</script>


</head>
<body>
<%String user = (String)session.getAttribute("user_name");
//System.out.println("UZER:"+user);
String Id =request.getParameter("ID");

System.out.println("Docid="+Id);
int count1=1,i=0;
%>
<input type="hidden" name="project_Id" id="project_Id" value="<%=Id%>">
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[Create Project] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>
<form name="CreateProject" id="CreateProject" method="post" style="margin-left:40px;" >

<INPUT TYPE="HIDDEN" NAME="count">
<INPUT TYPE="HIDDEN" NAME="ProjectID">
<INPUT TYPE="HIDDEN" NAME="Project_stage">
<INPUT TYPE="HIDDEN" NAME="document_type">
<INPUT TYPE="HIDDEN" NAME="designation">
<INPUT TYPE="HIDDEN" NAME="Department_RVNL">

<c:if test="${param.Project_stage == null}">
			<%
			String startdate1=request.getParameter("dateofproject");
			String projectid=request.getParameter("projectid");
			//java.util.ArrayList<String> packal3=new java.util.ArrayList<String>();
			String packal3=request.getParameter("packal3");
			//packal3 = packal4.split("~");
			String piu11=request.getParameter("PIU");
			%>
			<input type="hidden" name="projectidmain" id="projectidmain" value="<%=projectid%>">
			<table style="background-color: #F0FFFF;width:100%;  margin-top:70px;"" class="table table-hover table-bordered">
				<tr>
					
		
					<td>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Package name : </b>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="Package<%=i %>" id ="Package<%=i %>" maxlength="50" onchange="packnamecheck(this.value,'<%=packal3%>');" style="width:204px; margin-left:15px">
						<br><br>
						
						
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Package Start Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				<input type="text" name="pacstart_Date<%=i%>" id ="pacstart_Date<%=i%>" readonly="true" onclick="frezedate('pacstart_Date<%=i%>','<%=startdate1%>')" style="width:204px"> <br />
						<br>
						
						<%
						Connection con =null;
						ResultSet  rs21=null,rs31=null,rs311=null,rs32=null,rs312=null,dep_rs=null, drg_rs7=null;
						
						try {
							Context initCtx = new InitialContext();
							Context envCtx = (Context) initCtx.lookup("java:comp/env");
							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

							 con = ds.getConnection();

						%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Railway:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<select name='Railway<%=i%>'  class="drop<%=i%>" style="width:205px" id ="Railway<%=i%>" onchange="showDivisionspackage(this.value,<%=i%>)">
							<option value="none">--Select Zone --</option>
			<%
			//String piu11 =(String)pageContext.getAttribute("PIU",PageContext.SESSION_SCOPE);
			System.out.println("piu is xx "+piu11);
			Statement stmt1 = con.createStatement();
			 rs21 = stmt1.executeQuery("select PIU_Id from xx_piu_master where PIU_Name='"+piu11+"'");
			int test3=0;
			while (rs21.next()) {
				test3 = rs21.getInt("PIU_Id");
			
			}
				
					Statement stmt = con.createStatement();
					 rs311 = stmt.executeQuery("select distinct Zone_ID from xx_user_zone_mapping where piu_Id="+test3);

					while (rs311.next()) {
					String Zid = rs311.getString("Zone_ID");
					String sql31 = "select * from xx_zones_master where Zone_Id="+Zid+" order by Zone_Name";
					PreparedStatement ps31 = con.prepareStatement(sql31);
					 rs31 = ps31.executeQuery();
					while (rs31.next()) {
						String zname=rs31.getString("Zone_Name");
								
			
			%>
			<option value="<%=zname%>"><%=zname%></option>
			<%
				}
				}
			%>
			</select> 
					
		
			<select name='secondRailway<%=i%>' class="drop<%=i%>" style="width: 205px; margin-left:50px" id ="secondRailway<%=i%>" onchange="showDivisions2package(this.value,<%=i%>)" >
							<option value="none">--Select Zone --</option>
			<% 
			Statement stmt3=con.createStatement();
			  rs312 = stmt3.executeQuery("select distinct Zone_ID from xx_user_zone_mapping where piu_Id="+test3);
	while (rs312.next()) {
	String Zid = rs312.getString("Zone_ID");
		Statement stmt32=con.createStatement();
		 rs32 = stmt32.executeQuery("select * from xx_zones_master where Zone_Id="+Zid+" order by Zone_Name");
		while (rs32.next()) {
		String zname2 = rs32.getString("zone_name");
	%>
	<option value="<%=zname2%>"><%=zname2%></option>
	<%
		}
	}
	%>			</select> <br /> <br />
			

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Division of Railway:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<br>
        	<div style='display: inline;' id='state<%=i%>'>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
				</div>
			<div style='display: inline;' id = 'state2<%=i%>'></div><br>  <!--  division2 -->
				
							
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project Director:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				
			<input type="text" name="projectinCharge<%=i%>" id ="projectinCharge<%=i%>"  maxlength="50" style="width: 205px"> <br /><br />
			</div>
							
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			
			<%
			String piu =(String)pageContext.getAttribute("PIU",PageContext.SESSION_SCOPE);
			
			%>
			
			  			  
				  <select name='Department_RVNL<%=i %>' id='Department_RVNL<%=i%>' style="width: 205px" onchange='show1(<%=i%>);'>
						<option value="">Select Department</option>
						<%
						 dep_rs = stmt.executeQuery("select department_name from xx_departments_master where type ='RVNL' and Department_Name !='Headquarter' order by department_name");
						String dep_name = null;
						while (dep_rs.next()) {
						dep_name = dep_rs.getString("Department_Name");
					%>
					<option value="<%=dep_name%>"><%=dep_name%></option>
					<%
						}						
						%>						
			     	</select> 
				  <br /> <br />
							  
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Designation:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id ="DesgDiv_RVNL<%=i%>" style="display: inline;">
					<select name='designation_RVNL<%=i%>' id='designation_RVNL<%=i%>' style="width: 205px;margin:3px 0px 12px 0px;">
						<option value="">Select Designation</option>						  
				</select> <br /> <br /></div>
				
				
			
				<script type="text/javascript">
var $drops<%=i%> = $('.drop<%=i%>'),
    // store a set of options
    $options<%=i%> = $drops<%=i%>.eq(1).children().clone();

$drops<%=i%>.change(function(){
    var $other<%=i%> = $drops<%=i%>.not(this),
        otherVal<%=i%> = $other<%=i%>.val(),
        newVal<%=i%> = $(this).val(),
        $opts<%=i%> = $options<%=i%>.clone().filter(function(){
           return this.value !== newVal<%=i%>; 
        })
     $other<%=i%>.html($opts<%=i%>).val(otherVal<%=i%>);
    
})
</script>	
				</td>
				 <td width="35%"> 	<br><center> <h5 Style="color:gray;"><b>Details of Documents/ Drgs required for the Package</b></h5></center><br>
				 <table class="table table-hover table-bordered"  align="center" style="background-color: #F0FFFF; ">
				<tr>
				<th width="50px" >S. No.</th> <th > Document/ Drg Type </th> <th width="150px"> Nos. of Documents/ Drgs Required</th></tr>
				
<%
            int j3=0;
				 drg_rs7 = stmt.executeQuery("select * from xx_documentattributes_master order by Document_Type");
						String drgtyp = null, drgid =null, nosreqd=null;
					while (drg_rs7.next()) {
						drgtyp = drg_rs7.getString("Document_Type");
						drgid = drg_rs7.getString("Document_Type_Id");
						//nosreqd = drg_rs7.getString("Nos_Reqd");
					if (nosreqd==null) {nosreqd="";}	
				%>
				<tr><td><%=j3+1 %>.</td> <td><%=drgtyp %>:</td>
				<td> <center><input type="text" pattern="\d+"  oninput="this.value=this.value.replace(/[^0-9]/g,'');" name="no_drg<%=i%>_<%=j3 %>" id ="no_drg<%=i%>_<%=j3 %>"   style="width: 50px; "></center>
				<input type="hidden" name="drgid<%=i%>_<%=j3 %>"  value=<%=drgid %>></td></tr>	
			<%
			j3++;
		}	
				
	%>	
</table>
<INPUT TYPE="hidden" NAME="nosofDrg<%=i%>" ID="nosofDrg<%=i%>" value=<%=j3%>>		

				

			<%
			//i++; 
			//}
				
				
				//con.close();
				 }
						catch(Exception e){
						
						e.printStackTrace();
						} finally {
						    try { rs21.close(); } catch (Exception e) { /* ignored */ }
						    try { rs31.close(); } catch (Exception e) { /* ignored */ }
						    try { rs311.close(); } catch (Exception e) { /* ignored */ }
						    try { rs32.close(); } catch (Exception e) { /* ignored */ }
						    try { rs312.close(); } catch (Exception e) { /* ignored */ }
						    try { dep_rs.close(); } catch (Exception e) { /* ignored */ }
						    try { drg_rs7.close(); } catch (Exception e) { /* ignored */ }
						    try { con.close(); } catch (Exception e) { /* ignored */ }
						}
				
				
			
			 %>
			 </td>
				</tr>
				
				</table>
				<br><br>
				 <center> <button type="button" id="btnclick" class="btn btn-primary" onclick="javascript:packageupdate();" style="margin-left:100px">ADD</button> 
       
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-primary" value="Cancel" onClick="refreshAndClose()" style="margin-left:200px"/></center><br><br>
					
			
			 
			<div id="dialogid1" style="display: none"
								align="center">
								<br> Please Select Different Package Name<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="$('#dialogid1').dialog('close');">cancel</button>
							</div>
			
       
		<div id="dialogid" style="display: none"
								align="center">
								<br> Please Fill All Data<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');">cancel</button>
							</div>
							</c:if>
<c:if test="${param.Project_stage != null}">

<%

String Package0 = request.getParameter("Package0");
String start_Date = request.getParameter("pacstart_Date0");
 String projectid = request.getParameter("projectidmain");

String Railway0 = request.getParameter("Railway0");
String projectinCharge0 = request.getParameter("projectinCharge0");
String Department_RVNL0 = request.getParameter("Department_RVNL0");
String designation_RVNL0 = request.getParameter("designation_RVNL0");
String pacstart_Date0=null;
Date initDate = new SimpleDateFormat("dd/MM/yyyy").parse(start_Date);
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
pacstart_Date0 = formatter.format(initDate);

Connection conn = null;
ResultSet  rs2=null,rspiuuid11=null,rspiu1=null,rspiu=null,rspiuid=null,rspiuuid=null;

try{
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
 conn = ds.getConnection();
Statement seq_stmt = conn.createStatement();
//java.util.ArrayList<String> userlistal1 = new java.util.ArrayList<String>();
Set<String> userlistal1 = new TreeSet<String>(String.CASE_INSENSITIVE_ORDER);
String sqlpiuuid11="select DISTINCT(package_name) from xx_packages_project where project_id="+projectid;  
Statement stmtpiuuid11 = conn.createStatement();
	 rspiuuid11 = stmtpiuuid11.executeQuery(sqlpiuuid11);
	String package_name11=null;
while(rspiuuid11.next()){
	package_name11=rspiuuid11.getString("package_name");
	userlistal1.add(package_name11);
	}

//System.out.println("coming final---------"+!userlistal1.contains(Package0)+"second-----------"+userlistal1.contains(Package0));
if(userlistal1.contains(Package0)){
	
	
	%>	


	<div class="alert alert-danger"><br>
	 <strong>Alert!</strong> Packages Name should be different !
	 <br>
	 <br>
	 <input class='btn btn-primary' value='ok'  onClick="refreshAndClose()" type='button'/>
	 </div>


	<%
}else{
	//System.out.println("Coming here------insidne else");
%>
 <sql:update dataSource="jdbc/MySQLDB" var="rs">
	   INSERT INTO xx_packages_project (project_id,package_name,packageStartDate,department,designation,package_director) VALUES ('<%=projectid%>','<%=Package0%>','<%=pacstart_Date0%>','<%=Department_RVNL0%>','<%=designation_RVNL0%>','<%=projectinCharge0%>');
	</sql:update> 
<%


String sqlprojectid="select package_id from xx_packages_project where project_id='"+projectid+"' order by package_id desc limit 1";
Statement stmtpiu1 = conn.createStatement();
 rspiu1 = stmtpiu1.executeQuery(sqlprojectid);
String packageid11=null;
while(rspiu1.next()){
	packageid11=rspiu1.getString("package_id");

}
String sqlpiu="select PIU_of_RVNL from xx_projectattributes_master where Project_ID="+projectid;  
Statement stmtpiu = conn.createStatement();
	 rspiu = stmtpiu.executeQuery(sqlpiu);
	String piun=null;
while(rspiu.next()){
	piun=rspiu.getString(1);
	}
String sqlpiuid="select PIU_Id from xx_piu_master where PIU_Name='"+piun+"'";  
Statement stmtpiuid = conn.createStatement();
	 rspiuid = stmtpiuid.executeQuery(sqlpiuid);
	String piunid=null;
while(rspiuid.next()){
	piunid=rspiuid.getString(1);
	}
String sqlpiuuid="select distinct User_Id from xx_user_zone_mapping where piu_id="+piunid;  
Statement stmtpiuuid = conn.createStatement();
	 rspiuuid = stmtpiuuid.executeQuery(sqlpiuuid);
	String piuuid=null;
while(rspiuuid.next()){
	piuuid=rspiuuid.getString(1);
	}

String divisions="";
//String projectid="";
//String packageids=null;
String name="pacstart_Date0";
String deptRVNLid="Department_RVNL0";
String desgRVNLid="designation_RVNL0";
String packCoordinatorId="projectinCharge0";

String sdate=request.getParameter(name);
String deptRVNL=request.getParameter(deptRVNLid);
String desgRVNL=request.getParameter(desgRVNLid);
String packCoordinator=request.getParameter(packCoordinatorId);
		

Date date =new SimpleDateFormat("dd/MM/yyyy").parse(sdate);
java.sql.Date st = new java.sql.Date(date.getTime());
String package1id="";String package2id="";String package3id="";String package4id="";String package5id="";
	
	Set<String> zone_ids = new HashSet<String>();
	String[] divisioncheck ;
		for(int j=1;j<=2;j++){
				 name="divisions"+j+":"+i;	
				divisioncheck = request.getParameterValues(name);
				divisions=divisions+"::Zone"+j+":"+i;
				if (divisioncheck != null) 
				{
		 		  for (int k = 0; k < divisioncheck.length; k++) {
		 			
		 			// conn = ds.getConnection();
		 			  
		 			 Statement stmt = conn.createStatement();
						 rs2 = stmt.executeQuery("select ext_zone_id from xx_divisions_map where division_name = '"+divisioncheck[k]+"'");

						String z_id = null;

						while (rs2.next()) {
							z_id = rs2.getString(1); 
							zone_ids.add(z_id);
									
						}
		 			  
						%>
						<sql:update dataSource="jdbc/MySQLDB" var="rs">
						   INSERT INTO xx_project_division_map (package_id,division_name,zone_id) VALUES ('<%=packageid11%>','<%=divisioncheck[k]%>','<%=z_id%>');
						</sql:update>
						<%	
					
						
		 			 divisions=divisions+"~"+divisioncheck[k];
				
					}
		      }	
		}
	
/*	
	*/
	String nosdrg1=request.getParameter("nosofDrg"+i);
				int nosdrg =Integer.parseInt(nosdrg1);
		for(int j2=0;j2<nosdrg;j2++){				
			String drgid=request.getParameter("drgid"+i+"_"+j2);
			String nosreqd=request.getParameter("no_drg"+i+"_"+j2);
			
			%>
			<sql:update dataSource="jdbc/MySQLDB" >
			  insert into xx_project_docnos (Project_Id, Package_Id, Document_Type_Id, Nos_Reqd) VALUES (<%=projectid%>, <%=packageid11%>,<%=drgid%>,<%=nosreqd%>);
			</sql:update>
<% 
}	
	
	
	%>	
	
	
	<div class="alert alert-success" align="center" style="margin: 100px 100px 100px 100px" ><br>
	 <strong>Success!</strong> Package Added successfully.
	 <br>
	 <br>
	 <center><input class='btn btn-primary' value='ok'  onClick="refreshAndClose()" type='button'/></center>
	 </div>
	

<%
}
	



userlistal1.clear();
//conn.close();
} catch(Exception e) {
	e.printStackTrace();
} finally {
    try { rspiuuid11.close(); } catch (Exception e) { /* ignored */ }
    try { rspiu1.close(); } catch (Exception e) { /* ignored */ }
    try { rspiu.close(); } catch (Exception e) { /* ignored */ }
    try { rspiuid.close(); } catch (Exception e) { /* ignored */ }
    try { rspiuuid.close(); } catch (Exception e) { /* ignored */ }
    try { rs2.close(); } catch (Exception e) { /* ignored */ }
    try { conn.close(); } catch (Exception e) { /* ignored */ }
}

%>


</c:if>
</form>

										      

</body><br><br><br>
<%@include file="included/Newfooter.jsp" %>
 
</html>