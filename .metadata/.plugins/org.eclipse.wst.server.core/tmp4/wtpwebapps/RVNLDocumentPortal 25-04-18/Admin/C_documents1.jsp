<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="included/NewHeader.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page session="true"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RVNL Document Portal</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/blitzer/jquery-ui.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<script src="resources/jQuery/jquery-1.12.3.min.js"></script>
<script src="resources/jQuery/jquery-ui.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<!-- <script type="text/javascript">
window.onload = function() {
   window.open('c_document.jsp','google',' menubar=0, resizable=0,dependent=0,status=0,width=300,height=200,left=10,top=10')
}
</script> -->
<script type="text/javascript">
    function refreshAndClose() {
       // window.opener.location.reload(true);
        window.close();
    }
</script>
<script>

$(document).ready(function() {
	 $('input').on('keypress', function (event) {
		    //var regex = new RegExp("^[a-zA-Z0-9]+$");
		    var regex = new RegExp("['?!<\">\\\\&]+$");
		    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
		    if (regex.test(key)) {
		       event.preventDefault();
		       return false;
		    }
	  });
 /*
	$('#frmKm').blur(function(){
	    if ($('#exist1').value("true")) {$('#frmKm').focus();}
	 });
	$('#toKm').blur(function(){
	    if ($('#exist2').value("true")) {$('#toKm').focus(); }
	  	});
	*/
});     


	function stopRKey(evt) { 
	  var evt = (evt) ? evt : ((event) ? event : null); 
	  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
	  if ((evt.keyCode == 13) )  {return false;} 
	} 

	document.onkeypress = stopRKey; 

	$(function() {
		
		$("#Datefinalizedbyrvnl").datepicker({
			dateFormat : 'dd/mm/yy',
				maxDate:'0', changeYear: true
		}).val();
		//  $( "#Dateofsubmission" ).datepicker();
	});
</script>
<script type="text/javascript">

function frezesubdate(){
	//jQuery.noConflict();
	
	var finalizeddate = document.getElementById('Datefinalizedbyrvnl');
//alert(finalizeddate);
	if(finalizeddate.value == "" || finalizeddate.value == null){
		document.getElementById("err1").style.color="RED";
    	document.getElementById("err1").innerHTML="Please choose finalized date.";
	}else{
		
    	var fdate=finalizeddate.value;
    	//alert(fdate);
    	var from =fdate.split("/");
    	var f = new Date(from[2], from[1] - 1, from[0]);
    	$('#Dateofsubmission').datepicker({
    		dateFormat : 'dd/mm/yy',
    		minDate:f,
    		maxDate:'0'
    		
    		
    	}).datepicker("show").val();
    	//var today = new Date(); var dd = today.getDate(); 
    	
    	
    	return false;
	}
	
}
</script>

<script>
	function closeWindow1(doc_id) {
		window.close();
	}
</script>
<script>
function loadXMLDocname(element,er,project_id)
{
var xmlhttp;
var k1=document.getElementById(element).value;
k1=k1.replace( /\s\s+/g, ' ' );   
var k = encodeURIComponent(k1);
document.getElementById(element).value=k1;
var urls="Check_DocName.jsp?ver="+k+"&projid="+project_id;

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
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Modify Document] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>

	<form  style="width:550px;  margin-left:200px;" name="Edit_Document" id="Edit_Document" method="post" action="modifydata.jsp">
		<br> <br> <br> <INPUT TYPE="HIDDEN"
			NAME="identification"> <INPUT TYPE="HIDDEN"
			NAME="CheckedValue"> <INPUT TYPE="HIDDEN" NAME="XX_Doc_id">
		<INPUT TYPE="HIDDEN" NAME="selecteddivision"> <INPUT
			TYPE="HIDDEN" NAME="selectedzone"> <INPUT TYPE="HIDDEN"
			NAME="XX_HType" id="XX_HType">
						
		<%
		double frmkm=0;
		double tokm=0;
		double stnkm=0;
		String smajsecid = null;
		String majsecid = null;
		String stnid = null;
		String smajsec = null;
		String stn = null;
		String stnkm1 = null;
		String majsec = null;
		String frmkm1 = null;
		String tokm1 = null;
		
		
			//String projectid = request.getParameter("projectid");
			//String packageid = request.getParameter("packageid");
			String userid = request.getParameter("userid");
			String zString = request.getParameter("zoneString");
			String divString = request.getParameter("divisionString");
			String docids = request.getParameter("Document_Map_ID");
			String rdstatus = (String) session.getAttribute("RealdateStatus");
		%>

		<c:if test="${param.identification == null}">
					<input type="hidden" name="Document_Map_ID" id="Document_Map_ID"
						value="<%=docids%>">
						
									<%
												ResultSet rs3 = null;
												PreparedStatement ps3 = null;
												ResultSet rs1 = null, rs5 = null, rs2 = null, rs7=null, rs9=null;
												PreparedStatement ps1 = null, ps2 = null, ps7=null, ps9=null;
												Connection conn = null;
												Statement stmt = null;
												String doctype = null;
												String docno = null;
												String docname = null;
												String division = null;
												String finaldate = null;
												String subdate = null;
												String hier = null;
												String forwd1=null;
												String packageid=null;
												String loctype=null;
												String projectid=null;
												String parsedfinalDate=null,parsedfinalDate1=null;

												try {

													Context initCtx = new InitialContext();
													Context envCtx = (Context) initCtx.lookup("java:comp/env");
													DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

													conn = ds.getConnection();
													ps2 = conn.prepareStatement("select * from xx_document_mapping where Document_Map_ID="
																	+ docids);
													rs2 = ps2.executeQuery();
													while (rs2.next()) {
														doctype = rs2.getString("Document_Type");
														docno = rs2.getString("Document_Number");
														docname = rs2.getString("Document_Name");
														projectid=rs2.getString("Project_ID");
														packageid = rs2.getString("Package_ID");
														forwd1 = rs2.getString("Forwarded");
														if (forwd1!=null) {} else {forwd1="nm";}
														division = rs2.getString("Division");
														finaldate = rs2.getString("DateFinalize");
														subdate = rs2.getString("Date_of_Submission");
														Date initDate = new SimpleDateFormat("yyyy-MM-dd").parse(finaldate);
														SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
														 parsedfinalDate = formatter.format(initDate);
														 Date initDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(subdate);
															SimpleDateFormat formatter1 = new SimpleDateFormat("dd/MM/yyyy");
															 parsedfinalDate1 = formatter.format(initDate1);
														hier = rs2.getString("HierarchyType");
														
													}
						%>
						<INPUT TYPE="hidden" NAME="Proj_Id22" id="Proj_Id22" value='<%=projectid %>'>
					<br>
						<table class="table table-hover table-bordered" style="background-color: #F0FFFF">
							<tr>
								<td><b>General Details: </b><br><br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Document
									Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									<select name="DocumentType" id="DocumentType"
									style="width: 200px" onchange="ShowLocation(1,<%=projectid %>,this.value, null, null);" >
										<option value="none">-- Select document type --</option>
										<!--    select DOC.document_type from xx_documenttype_mapping DTM,xx_documentattributes_master DOC where DTM.Document_id = DOC.Document_Id 
 and department_id =(select department_id from xx_departments_master where department_name = (select department from xx_packages_project where package_id = < %=packageid%>)) -->

<%
													String sql3 = "select * from xx_documentattributes_master order by Document_Type";
													ps3 = conn.prepareStatement(sql3);
													rs3 = ps3.executeQuery();

													while (rs3.next()) {
														String dname = rs3.getString("Document_Type");
															if (doctype.equalsIgnoreCase(dname)) {
															loctype= rs3.getString("Location_Type");
													%>
										<option value="<%=dname%>" selected="selected"><%=dname%></option>

										<% 
											} else {
										%>
										<option value="<%=dname%>"><%=dname%></option>
										<%
											}
													}
													rs2.beforeFirst();
													 if (rs2.next()) {
																										
													if (loctype.equalsIgnoreCase("Station")) {
														smajsecid = rs2.getString("Majsec_Id");
														 stnid = rs2.getString("Stn_Id");
												ps7 = conn.prepareStatement("select * from xx_project_station where Project_Id="+projectid+" and Stn_Id="+stnid);
												rs7 = ps7.executeQuery();
												if (rs7.next()) {
													stn = rs7.getString("Station_Name");
													stnkm1 = rs7.getString("Station_Km");							
												    stnkm = Double.parseDouble(stnkm1);
												}
												ps9 = conn.prepareStatement("select * from xx_project_km where Project_Id="+projectid+" and Majsec_Id="+smajsecid);
												rs9 = ps9.executeQuery();
												if (rs9.next()) {
													smajsec = rs9.getString("Major_Section");
												}
													} else { 
														majsecid = rs2.getString("Majsec_Id");
														frmkm1 = rs2.getString("From_Km");
														 tokm1 = rs2.getString("To_Km");
														frmkm = Double.parseDouble(frmkm1);
														tokm = Double.parseDouble(tokm1);
													ps7 = conn.prepareStatement("select * from xx_project_km where Project_Id="+projectid+" and Majsec_Id="+majsecid);
													rs7 = ps7.executeQuery();
														if (rs7.next()) {
															majsec = rs7.getString("Major_Section");
														}	
							
														}
													 }
													System.out.println("Document_Map_ID:::" + docids+loctype+"LOC"+frmkm+frmkm1+"tok"+tokm+tokm1+"stnkm"+stnkm+stnkm1+majsec+smajsec+stn+"Id"+majsecid+smajsecid+stnid);
													System.out.println("station "+stn+" maj "+smajsec+" id "+smajsecid+"stn "+stnid);
												} catch (Exception e) {
													e.printStackTrace();
												} finally {
													
													 	try { rs1.close(); } catch (Exception e) { /* ignored */ }
													    try { rs2.close(); } catch (Exception e) { /* ignored */ }
													    try { rs3.close(); } catch (Exception e) { /* ignored */ }
													    try { rs7.close(); } catch (Exception e) { /* ignored */ }
													    try { rs9.close(); } catch (Exception e) { /* ignored */ }
													    try { ps9.close(); } catch (Exception e) { /* ignored */ }
													    try { ps1.close(); } catch (Exception e) { /* ignored */ }
													    try { ps2.close(); } catch (Exception e) { /* ignored */ }
													    try { ps3.close(); } catch (Exception e) { /* ignored */ }
													    try { ps7.close(); } catch (Exception e) { /* ignored */ }
													    try { conn.close(); } catch (Exception e) { /* ignored */ }
													}
										%>
											<c:set var="fwd2" scope="application" value="<%=forwd1%>"/>
								<sql:query var="rs" dataSource="jdbc/MySQLDB">         
           select * from xx_document_mapping where Document_Map_ID='"+docids+"';
             </sql:query>
										<c:forEach var="row" items="${rs.rows}">
											<option value="${row.document_type}">${row.document_type}</option>
										</c:forEach>
								</select> <br> <br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Document
									Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="DocumentNo" id="DocumentNo" maxlength="50"
									style="width: 205px" value="<%=docno%>"> <br> <br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Document
									Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="DocumentName" id="DocumentName" maxlength="100"
									onkeyup="loadXMLDocname('DocumentName','err',<%=projectid%>)"
									onCopy=return(false) onDrag=return(false) onDrop=return(false)
									onPaste=return(false) autocomplete=off style="width: 205px" value="<%=docname%>"> 
									<span id="err"> </span><br><br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Division
									of The Document :
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
									name="divisiontype" id="divisiontype"  <c:if test="${fwd2=='yes'}"> disabled style="width: 205px; background:RGB(235,235,228);"</c:if> <c:if test="${fwd2!='yes'}"> style="width: 205px;"</c:if>>
										<option value="none">-- Select division --</option>


										<%
											try {
												//System.out.println("....pack"+packageid);
													Context initCtx = new InitialContext();
													Context envCtx = (Context) initCtx.lookup("java:comp/env");
													DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
													conn = ds.getConnection();
													
													String sql1 = "select Distinct division_name from xx_project_division_map where package_id='"+ packageid + "' order by division_name";
															//" SELECT division_name FROM xx_divisions_master";
													ps1 = conn.prepareStatement(sql1);
													rs1 = ps1.executeQuery();

													while (rs1.next()) {
														String divi = rs1.getString("division_name");
														//System.out.println("...."+divi+"...div.."+division);
														if (division.equalsIgnoreCase(divi)) {
										%>
										<option value="<%=divi%>" selected="selected"><%=divi%></option>

										<%
											} else {
										%>
										<option value="<%=divi%>"><%=divi%></option>
										<%
											}
										%>

										<%
											}
										%>
								</select> <%
 	} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			try { rs1.close(); } catch (Exception e) { /* ignored */ }
 			try { ps1.close(); } catch (Exception e) { /* ignored */ }
 			try { conn.close(); } catch (Exception e) { /* ignored */ }
 		}
 %> <br> <br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date
									finalized by
									RVNL:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="Datefinalizedbyrvnl"
									id="Datefinalizedbyrvnl" style="width: 205px" 
									value="<%=parsedfinalDate%>" <c:if test="${fwd2=='yes'}"> disabled </c:if> > <br> <br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date
									of submission to Railways:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	<%
	SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	String rd = df.format(new Date());
	if (rdstatus.equalsIgnoreCase("0"))  {
	%>								
									<input type="text" name="Dateofsubmission" id="Dateofsubmission" style="width: 205px" value="<%=parsedfinalDate1%>" onClick="frezesubdate()"  <c:if test="${fwd2=='yes'}"> disabled </c:if>> <br>
	<%
	} else if (forwd1.equalsIgnoreCase("yes")) {
	%>	
			<input type="text" name="Dateofsubmission" id="Dateofsubmission" style="width: 205px" value="<%=parsedfinalDate1%>" onClick="frezesubdate()"  <c:if test="${fwd2=='yes'}"> disabled </c:if>> <br>
	<%
	} else {
	%>	
							<input type="text" name="Dateofsubmission" id="Dateofsubmission" style="width: 205px; background-color: lightgray;" value="<%=rd%>" readonly="true" > <br>
	<%
	}
	%>								
								
									<div id="err1" style="text-align: center; margin-left: 61px;" ></div>
									 <br> <br>
									<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hierarchy:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 <input type="radio" name="myRadios" id="Zone" value="Zone">
									Zone &nbsp;&nbsp; <input type="radio" name="myRadios"
									id="Division" value="Division"> Division &nbsp;&nbsp; <input
									type="radio" name="myRadios" id="Both" value="Both">
									Both <br> <br> -->
						</td></tr>
						<tr><td>			
									<b>Location Details:</b><br><br>
							<div id="LocationDiv" > 
							<INPUT TYPE="hidden" Name="loc_type" Id="loc_type" value='<%=loctype %>'>
							<c:set var="loctype1" value='<%=loctype %>' scope="request"/>
							<c:set var="smajsec2" value='<%=smajsec %>' scope="request"/>
							<c:set var="majsec2" value='<%=majsec %>' scope="request"/>
							<c:set var="stn2" value='<%=stn %>' scope="request"/>
							<c:if test="${loctype1 == 'Section'}">
							<div id="KmMajsecDiv"> &nbsp;&nbsp;Major Section:
							&nbsp;&nbsp;&nbsp; <select name="Majsec" id="Majsec" style="width:262px;" onchange='disablekm(this.value,1)'>
										<option value="none">-- Select Major Section--</option>
			<sql:query var="rs" dataSource="jdbc/MySQLDB">         
          select * from xx_project_km where Project_Id=<%=projectid %> order by Major_Section
             </sql:query>
           							<c:forEach var="row" items="${rs.rows}">
										
										<option value="${row.Major_Section}" <c:if test="${row.Major_Section == majsec2}"> selected='selected'</c:if>>${row.Major_Section}</option>
										</c:forEach>
								</select></div>
<div id='fkmDiv' style='display:inline;'>
								 <br> &nbsp;&nbsp;From Km:
									&nbsp;&nbsp;<input type="number" step="0.001" name="frmKm"
									id="frmKm"  style="width: 102px" value=<%=frmkm %> onchange='ShowLocation(2,"<%=projectid %>",$("#Majsec").val(), null, this.value);'>
									
									</div>
<div id='tkmDiv' style='display:inline;'>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To Km:&nbsp;&nbsp;
									<input type="number" step="0.001" name="toKm"
									id="toKm"  style="width: 102px" value=<%=tokm %> onchange='ShowLocation(3,"<%=projectid %>",$("#Majsec").val(), null, this.value);'> <br>
									<br>
										
								</div>
								<span id='err8'><INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value='null'> </span> <span id='err9'><INPUT TYPE='HIDDEN' NAME='exist2' ID='exist2' value='null'> </span>
								</c:if>
			<c:if test="${loctype1=='KM'}">
									<div id="KmMajsecDiv"> &nbsp;&nbsp;Major Section:
							&nbsp;&nbsp;&nbsp; <select name="Majsec" id="Majsec" style="width:262px;" onchange=' disablekm(this.value,2)'>
										<option value="none">-- Select Major Section--</option>
			<sql:query var="rs" dataSource="jdbc/MySQLDB">         
          select * from xx_project_km where Project_Id=<%=projectid %> order by Major_Section
             </sql:query>
           							<c:forEach var="row" items="${rs.rows}">
										
										<option value="${row.Major_Section}" <c:if test="${row.Major_Section == majsec2}"> selected='selected'</c:if>>${row.Major_Section}</option>
										</c:forEach>
								</select></div>
				<div id='fkmDiv' style='display:inline;'>
									 <br> &nbsp;&nbsp;From Km:
									&nbsp;&nbsp;<input type="number" step="0.001" name="frmKm"
									id="frmKm"  style="width: 102px" value=<%=frmkm %> onchange='ShowLocation(4,"<%=projectid %>",$("#Majsec").val(), null, this.value); document.getElementById("toKm").value=this.value;'>
				
				</div>
		
<div id='tkmDiv' style='display:none;'>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To Km:&nbsp;&nbsp;
									<input type="hidden"  name="toKm"
									id="toKm"  style="width: 102px" value=<%=tokm %> > <br>
									
									<br>
						</div>
						<span id='err8'><INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value='null'> </span> <span id='err9'><INPUT TYPE='HIDDEN' NAME='exist2' ID='exist2' value='null'> </span>
									</c:if>
									
									<c:if test='${loctype1=="Station"}'>
									
			<div id="StnMajsecDiv"> &nbsp;&nbsp;Major Section:
							&nbsp;&nbsp;&nbsp;
									<select name="sMajsec" id="sMajsec" style="width:262px;" onchange='disablekm(this.value,3); ShowLocation(5,"<%=projectid %>",this.value, null, null);'>
										<option value="none">-- Select Major Section--</option>
			<sql:query var="rs" dataSource="jdbc/MySQLDB">         
          select distinct Major_Section from xx_project_station where Project_Id=<%=projectid %> order by Major_Section, Station_Km
             </sql:query>
						 <%
           // System.out.println("...."+projectid+smajsec);
            %>
           
            				<c:forEach var="row" items="${rs.rows}">
            			
										<option value="${row.Major_Section}" <c:if test="${row.Major_Section == smajsec2}"> selected='selected' </c:if> >${row.Major_Section}</option>
										</c:forEach>
										</select>  </div>
										<div id='stnDiv' style='display:inline;'><br> &nbsp;&nbsp;Station Name:
									&nbsp;&nbsp;&nbsp;<select name="stn" id="stn" style="width:152px;" onchange='ShowLocation(6,"<%=projectid %>",$("#sMajsec").val(),this.value, null);'>
										<option value="none">-- Select Station Name--</option>
										<sql:query var="rs" dataSource="jdbc/MySQLDB">         
          select * from xx_project_station where Project_Id=<%=projectid %> and Major_Section='<%=smajsec %>' order by Major_Section, Station_Km
             </sql:query>
									<c:forEach var="row" items="${rs.rows}">
									
										<option value="${row.Station_Name}" <c:if test="${row.Station_Name==stn2}"> selected='selected'</c:if>>${row.Station_Name}</option>
										</c:forEach>
	
								</select></div>
								<div id='stnkmDiv' style='display:none;'> <br><br>
								&nbsp;&nbsp;Station Km:&nbsp;&nbsp;	&nbsp;&nbsp;
									<input type="number" step="0.001" name="stnKm"
									id="stnKm"  style="width: 102px" value=<%=stnkm %> > <br>
									<br>
								
					</div>
	
					</c:if>
					</div>
						<br>
						
						
						
					
									
								</td>

							</tr>
						</table></td>
			
					
						<center><button type="button" class="btn btn-primary" name="update"
								id="btnclick" onclick="validateDocument('edit');" value="updates">Update</button> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
				class="btn btn-primary" value="Cancel" onclick="refreshAndClose()" />
		</center>
		<div id="dialogid" style="display: none"
								align="center">
								<br> Please Fill All Data<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="var $j=jQuery.noConflict();$j('#dialogid').dialog('close');">cancel</button>
							</div>
			<div id="dialogid24" style="display: none"
								align="center">
								<br> Duplicate/incorrect entry.........<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="var $j=jQuery.noConflict(); $j('#dialogid24').dialog('close');">cancel</button>
							</div>
								</c:if>
	</form>


</body>
</html>
