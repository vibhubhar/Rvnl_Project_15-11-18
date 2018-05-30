<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@include file="included/NewHeader.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RVNL Document Portal</title>



<!-- <link href="resources/css/main.css" rel="stylesheet" type="text/css"> -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
<script src="resources/jQuery/jquery-1.12.3.min.js"></script>
<script src="resources/jQuery/jquery-ui.js"></script>
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
 <link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />
	<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<style>
textarea {
   resize: none;
}

</style>
<script type="text/javascript">
    function refreshAndClose() {
        window.opener.location.reload(true);
        window.close();
    }
</script>
<script type="text/javascript">
	window.onunload = refreshParent;
	function refreshParent() {
		window.opener.location.reload();
	}
</script>
<script type="text/javascript">
function loadXMLDoc()
{
var xmlhttp;
var k1=document.getElementById("Document_Type").value;
var k = encodeURIComponent(k1);
var urls="DocModify.jsp?ver="+k;

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
        document.getElementById("err").innerHTML=xmlhttp.responseText;

    }
  }
xmlhttp.open("GET",urls,true);
xmlhttp.send();
}
</script>
<script type="text/javascript">

function loadXMLDoczone(element,er)
{
var xmlhttp;
var k1=document.getElementById(element).value;
var k = encodeURIComponent(k1);
var urls="ZonePass.jsp?ver="+k;

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

function loadXMLDiv1(element,er)
{
var xmlhttp;
var k1=document.getElementById(element).value;
var k = encodeURIComponent(k1);
var urls="DivisionPass.jsp?ver="+k;

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


function loadXMLOrg(element,er)
{
var xmlhttp;
var k1=document.getElementById(element).value;
var k = encodeURIComponent(k1);
var urls="OrgPass.jsp?ver="+k;

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


function loadXMLPiu(element,er)
{
var xmlhttp;
var k1=document.getElementById(element).value;
var k = encodeURIComponent(k1);
var urls="PiuPass.jsp?ver="+k;

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


function loadXMLDoc1(element,er)
{
var xmlhttp;
var k1=document.getElementById(element).value;
var k = encodeURIComponent(k1);
var urls="doctype.jsp?ver="+k;

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


function loadXMLProj(element,er)
{
var xmlhttp;
var k1=document.getElementById(element).value;
var k = encodeURIComponent(k1);
var urls="ProjectPass.jsp?ver="+k;

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

function loadXMLDesig11(element,er,p,q)
{
	
var xmlhttp9;
var dep=document.getElementById("depnamenew");
if(dep!=null){
	 dep1=document.getElementById("depnamenew").value;
	 dep = encodeURIComponent(dep1);
}

else{
	dep=q;
}

var k1=document.getElementById(element).value;
var k = encodeURIComponent(k1);
var m1=document.getElementById("dTypes").value;
var m = encodeURIComponent(m1);
var urls="DesigPass.jsp?ver="+k+"&desigType="+p+"&department="+dep+"&newdesig="+m;

if (window.XMLHttpRequest)
  {
  xmlhttp9=new XMLHttpRequest();
  }
else
  {
  xmlhttp9=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp9.onreadystatechange=function()
  {
  if (xmlhttp9.readyState==4)
    {
        //document.getElementById("err").style.color="red";
        document.getElementById(er).innerHTML=xmlhttp9.responseText;
		var ex=document.getElementById("exist");
		if(ex!=null){
			document.getElementById("btnclick").disabled = true;
			
			
		}else{
			
			document.getElementById("btnclick").disabled = false;
			
		}

    }
  }
xmlhttp9.open("GET",urls,true);
xmlhttp9.send();
}



function loadXMLDept(element,er,p1)
{
	
var xmlhttp;
var k1=document.getElementById(element).value;
var k = encodeURIComponent(k1);
//var l=document.getElementById(p).value;
var p = encodeURIComponent(p1);
var urls="deptpass1.jsp?ver='"+k+"'&dtype="+p;
//alert(urls);
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
</head>
<body>


<%
String zoneName=null,Org_Name=null, PIU_Name=null,divisionName1=null,Document_Type=null,Loc_Type=null, Project_type_id=null,Project_type=null,desId=null,desigName=null,zon1=null;;
String dbType = request.getParameter("type");
String depType= request.getParameter("depType");
 zoneName= request.getParameter("zoneName");
String y=request.getParameter("contains");
//System.out.println("contains value====dbTypedbTypedbTypedbType===="+dbType);
String departments = request.getParameter("department");
String designations = request.getParameter("designations");
String depName = request.getParameter("depName");
String divisionName = request.getParameter("divisionName");
String  Org_ID = request.getParameter("Org_ID");
Org_Name = request.getParameter("Org_Name");
String  PIU_ID = request.getParameter("PIU_ID");
PIU_Name = request.getParameter("PIU_Name");
desigName = request.getParameter("desigName");
String desigType = request.getParameter("desigType");
String  Document_Id = request.getParameter("Document_Id");
 Document_Type = request.getParameter("Document_Type");
 Loc_Type = request.getParameter("Loc_Type");

Project_type_id = request.getParameter("Project_type_id");
Project_type = request.getParameter("Project_type");

String zone_name = request.getParameter("zone_name");
String desigName11 = request.getParameter("desigType");

String desigName1 = request.getParameter("desigName1");
String condition = request.getParameter("condition");
String zId= request.getParameter("zId");
String divisionId= request.getParameter("divisionId");
String depId= request.getParameter("depId");
desId = request.getParameter("desId");
  String depnamenew=null;
  String depnametest = request.getParameter("departmentold");
//int y = Integer.parseInt(flag);
 
 
//System.out.println("coming inside --------- depnametest   depnametest ---old ---"+depnametest); 

if(y!=null){
if(dbType.equalsIgnoreCase("zone"))
{
	
 
	
	if(!y.equalsIgnoreCase("0"))
	{
		zoneName=zoneName.replace("~"," " );	
			
	}
		
}
if(dbType.equalsIgnoreCase("division"))
{
 if(!y.equalsIgnoreCase("0"))
{
	 divisionName=divisionName.replace("~"," " );	
}
}
//System.out.println("below db type division----- "+divisionName);
	if(dbType.equalsIgnoreCase("Others"))
{
	 	
		if(!y.equalsIgnoreCase("0"))
	{
		 Org_Name=Org_Name.replace("~"," " );	
	}
	 
		
}

if(dbType.equalsIgnoreCase("piu"))
{

	 	
		if(!y.equalsIgnoreCase("0"))
	{
		 PIU_Name=PIU_Name.replace("~"," " );	
	}
	 
		
}

if(dbType.equalsIgnoreCase("Designations"))
{
	depnamenew=depnametest.replace("~"," " );
	
	 
   if(!y.equalsIgnoreCase("0"))
	{
		 desigName=desigName.replace("~"," " );
		 
		  

	}
}
if(dbType.equalsIgnoreCase("Documents"))
{
	
	
	if(!y.equalsIgnoreCase("0"))
	{
		Document_Type=Document_Type.replace("~"," " );
	}
	 
}
if(dbType.equalsIgnoreCase("Projects"))
{
	if(!y.equalsIgnoreCase("0"))
	{
		Project_type=Project_type.replace("~"," " );
	}
}

if(dbType.equalsIgnoreCase("Departments"))
{
	if(!y.equalsIgnoreCase("0"))
	{
		depName=depName.replace("~"," " );
	}
}
}
%>
<c:if test="${param.stage == null}">
<input type = "hidden" id = Item_Type value = <%=dbType%>>

<form action="" style ="margin-left:50px" id ="modification" name="modification">
<INPUT TYPE="HIDDEN" NAME="contents">
<INPUT TYPE="HIDDEN" NAME="stage">
<INPUT TYPE="HIDDEN" NAME="zonename" value="<%=zoneName%>">
<INPUT TYPE="HIDDEN" NAME="divisionname" value="<%=divisionName%>">
<INPUT TYPE="HIDDEN" NAME="orgname" value="<%=Org_Name%>">
<INPUT TYPE="HIDDEN" NAME="piuname" value="<%=PIU_Name%>">
<INPUT TYPE="HIDDEN" NAME="documentname" value="<%=Document_Type%>">
<INPUT TYPE="HIDDEN" NAME="departmentname" value="<%=depName%>">
<INPUT TYPE="HIDDEN" NAME="designame" value="<%=desigName%>">
<INPUT TYPE="HIDDEN" NAME="Project_typename" value="<%=Project_type%>">
<INPUT TYPE="HIDDEN" NAME="depold" value="<%=depnamenew%>">
<table class="mainClass" style="background-color: #F0FFFF" align="left">
<br><br>
<%if(dbType.equalsIgnoreCase("zone")){ %>
<tr>Zone Name :<input type="text" name="zoneName1" id= "zoneName1" value="<%=zoneName%>" onkeyup="loadXMLDoczone('zoneName1','err')" style="width: 225px;margin-left:50px"  onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off>
<input type="hidden" name="zId" value="<%=zId%>"></tr></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span id="err"> </span>
<%} else if(dbType.equalsIgnoreCase("division")){%>
<tr>Division Name:<input type="text" name="divisionName1" id ="divisionName1" value="<%=divisionName%>" onkeyup="loadXMLDiv1('divisionName1','err')" style="width: 225px;"  onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off></tr>
<input type="hidden" name="divisionId" value="<%=divisionId%>"></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="err"> </span>

<%} else if(dbType.equalsIgnoreCase("Others")){%>
<tr>Organization Name:<input type="text" name="Org_Name1" id ="Org_Name1" value="<%=Org_Name%>" onkeyup="loadXMLOrg('Org_Name1','err')" style="width: 225px;margin-left:50px"  onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off></tr>
<tr>
<input type="hidden" name="Org_ID" value="<%=Org_ID%>">
</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span id="err"> </span>


<%} else if(dbType.equalsIgnoreCase("piu")){%>
<tr>PIU Name:<input type="text" name="PIU_Name1" id ="PIU_Name1" value="<%=PIU_Name%>" onkeyup="loadXMLPiu('PIU_Name1','err')" style="width: 225px;margin-left:50px"  onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off></tr>
<tr>
<input type="hidden" name="PIU_ID" value="<%=PIU_ID%>">
</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span id="err"> </span>

<%} else if(dbType.equalsIgnoreCase("Documents")){%>
<tr><div id="temp">Document Type:</div><textarea rows="2" cols="30"name="Document_Type1" id ="Document_Type1" onkeyup="loadXMLDoc1('Document_Type1','err')" style="width: 285px;margin: -40px 0px -10px 115px;"  onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off><%=Document_Type%></textarea>
</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="err"> </span>
<br> Location Type:	<select name="loctype1" id="loctype1" style="width: 225px; margin-left: 20px;">
			<% if (Loc_Type.equalsIgnoreCase("Section")) { 
			//System.out.println("pks="+dbType+Loc_Type+Document_Type);
			 
			%>
			<option selected="selected" value="<%=Loc_Type%>"><%=Loc_Type%></option>
			<option value="KM">KM</option>
			<option value="Station">Station</option>
					<% } else if (Loc_Type.equalsIgnoreCase("KM")) { %>
			
			<option selected="selected" value="<%=Loc_Type%>"><%=Loc_Type%></option>
			<option value="Section">Section</option>
			<option value="Station">Station</option>
			<% 	} else if (Loc_Type.equalsIgnoreCase("Station")) { %>
			
			<option selected="selected" value="<%=Loc_Type%>"><%=Loc_Type%></option>
			<option value="KM">KM</option>
			<option value="Section">Section</option>
				<%} %>
					</select><br>
</tr>
<tr><input type="hidden" name="Document_Id" value="<%=Document_Id%>"></tr>
			
	

<%} else if(dbType.equalsIgnoreCase("Projects")){%>
<tr>Project Type:<input type="text" name="Project_type1" id ="Project_type1"  onkeyup="loadXMLProj('Project_type1','err')" value="<%=Project_type%>" style="width: 225px;margin-left:50px"  onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off></tr>
<tr><input type="hidden" name="Project_type_id" value="<%=Project_type_id%>"></tr></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span id="err"> </span>

<%}else if(dbType.equalsIgnoreCase("Departments")){%>
<tr>
Department Name : <input type="text" name="depName1" id="depName1" value="<%=depName%>" onkeyup="loadXMLDept('depName1','err','<%=depType%>')" style="width: 225px;margin-left:50px"  onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off><br/>
</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</tr>
<span id="err"> </span>
<input type="hidden" name="depId" value="<%=depId%>">


<%} else if(dbType.equalsIgnoreCase("Designations")){%>
<tr>
	Type :
				<select name="dTypes" id="dTypes"
					style="width: 225px; margin-left: 135px; background-color:lightgray;"
					onchange='getdept(this.value)'>
					
					<option selected="selected" value="<%=desigName11%>"><%=desigName11%></option>
					
					</select>
				<br />
			</tr>

			<div id='Desgdiv' style='display: inline;'>
			
			Department:
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=depnamenew id="depnamenew" 
					style="width: 225px;
margin: 25px 0px 0px 60px;">
						<option value="<%=depnamenew%>"><%=depnamenew%></option>
						<%
						Connection conn = null;
						Statement stmt = null;
						ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs12=null,rs13=null,rs14=null;
						PreparedStatement ps1 = null, ps3 = null,ps4=null,ps5=null,ps12=null,ps13=null,ps14=null;
						try {
							Context initCtx = new InitialContext();
							Context envCtx = (Context) initCtx.lookup("java:comp/env");
							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

							conn = ds.getConnection();

								String sql3 = "select Department_Name from xx_departments_master where Type='"+desigName11+"' order by Department_Name";
								ps3 = conn.prepareStatement(sql3);
								rs3 = ps3.executeQuery();

								while (rs3.next()) {
									String dname = rs3.getString("Department_Name");
						%>
						<option value="<%=dname%>"><%=dname%></option>
						<%
							}	
						}
						catch(Exception e){
							e.printStackTrace();
						}
						%>
				  </select> </div><br/> <br/>

</br>Designation Name :<input type="text" name=desigName1 id ="desigName1" value="<%=desigName%>" style="width: 225px;margin-left:50px" onkeyup="loadXMLDesig11('desigName1','err','<%=desigName11%>','<%=depnamenew %>')"  onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off><br/></tr>
</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span id="err"> </span>
<input type="hidden" name="desId" value="<%=desId%>">

<%}
%>
<input type="hidden" name="type" value=<%=dbType %>>
<input type="hidden" name="condition" value="go">
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-primary" id="btnclick" onclick="validateModification();" value="Submit" style="width: 5em;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-primary" type="reset" onClick="refreshAndClose();" value="Cancel">         
</table></c:if>
<br> <br>

<c:if test="${param.stage != null}">
			<%
			Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String zonenamefirst = request.getParameter("zonename");
String divisionnamefirst = request.getParameter("divisionname");
String piunamefirst = request.getParameter("piuname");
String dbType1 = request.getParameter("type");
String depType1= request.getParameter("depType");
String zoneName1 = request.getParameter("zoneName1");
String divisionName11= request.getParameter("divisionName1");
String Org_Name1 = request.getParameter("Org_Name1");
String PIU_Name1 = request.getParameter("PIU_Name1");
String Document_Type1 = request.getParameter("Document_Type1");
String Loc_Type1 = request.getParameter("loctype1");
String Project_type1 = request.getParameter("Project_type1");
String depName1 = request.getParameter("depName1");
String designame1 = request.getParameter("desigName1");
String designameinitial = request.getParameter("designame");
String documentnameinitial = request.getParameter("documentname");
String Project_typeinitial = request.getParameter("Project_typename");
String departmentnameinitial = request.getParameter("departmentname");
String departmenttest1 = request.getParameter("department");
String dTypes1 = request.getParameter("dTypes");
depnamenew = request.getParameter("depnamenew");
String depnameold = request.getParameter("depold");

try{
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
con = ds.getConnection();	
int queryUpdate =0;
String sqlQuery = null;

int id=0;
String query1 = "select * from xx_departments_master where Department_Name='"+departmenttest1+"' and Type='"+dTypes1+"'"; 
System.out.println("query="+query1);
PreparedStatement ps31 = con.prepareStatement(query1);
	ResultSet rs31 = ps31.executeQuery();
   if(rs31.next())
   {   
	  id=rs31.getInt("Department_Id"); 
   }
   
   
   int id1=0;
   String query11 = "select * from xx_departments_master where Department_Name='"+depnameold+"' and Type='"+dTypes1+"'"; 
   System.out.println("query="+query11);
   PreparedStatement ps311 = con.prepareStatement(query11);
   	ResultSet rs311 = ps311.executeQuery();
      if(rs311.next())
      {   
   	  id1=rs311.getInt("Department_Id"); 
      }



if(condition!=null){

if(dbType1.equalsIgnoreCase("zone")){

	
	//System.out.println("zone print for update query="+);
String name22=null;
String sqlm="select Zone_Name from xx_zones_master where Zone_Name='"+zoneName1+"'";

PreparedStatement ps1_1_1 = con.prepareStatement(sqlm);
ResultSet rs2 = ps1_1_1.executeQuery();


while(rs2.next())
{
	  name22=rs2.getString("Zone_Name");
	
	
}
if(zoneName1.equalsIgnoreCase("name22") || zoneName1.equals(name22))
{
	
}
else
{sqlQuery = "update xx_zones_master set Zone_Name='"+zoneName1+"' where Zone_Id ="+zId;
%>
<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_document_mapping set Zone ='<%=zoneName1%>' where Zone = '<%=zonenamefirst%>'
					</sql:update>
					<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_doc_zones_hierarchy set Zone =replace(Zone, '<%=zonenamefirst %>', '<%=zoneName1%>')
					</sql:update>




<%


}

}

else if(dbType1.equalsIgnoreCase("division")){
	if(divisionId.equalsIgnoreCase("70")){
		
		String name22=null;
		String sqlm="select division_name from xx_divisions_map where division_name='"+divisionName11+"'";
		
		PreparedStatement ps1_1_1 = con.prepareStatement(sqlm);
		ResultSet rs2 = ps1_1_1.executeQuery();

		
		while(rs2.next())
		{
			  name22=rs2.getString("division_name");
			
			
		}
		if(divisionName11.equalsIgnoreCase("name22") || divisionName11.equals(name22))
		{
			}
		else
		{
			sqlQuery = "update xx_divisions_map set division_name='"+divisionName11+"' where division_id >=70 and division_id<=86";
%>
			
			<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_document_mapping set Division ='<%=divisionName11%>' where Division = '<%=divisionnamefirst%>'
					</sql:update>
					<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_divisions_master set division_name ='<%=divisionName11%>' where division_name = '<%=divisionnamefirst%>'
					</sql:update>
					<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_doc_divisions_hierarchy set Division ='<%=divisionName11%>' where Division = '<%=divisionnamefirst%>'
					</sql:update>
					<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_doczonedivision_map set Division ='<%=divisionName11%>' where Division = '<%=divisionnamefirst%>'
					</sql:update>
			   <sql:update dataSource="jdbc/MySQLDB" >
					  update xx_project_division_map set division_name ='<%=divisionName11%>' where division_name = '<%=divisionnamefirst%>'
					</sql:update>
			
		<%
			
}
		
	}else{
		
		String name22=null;
		String sqlm="select division_name from xx_divisions_map where division_name='"+divisionName11+"'";
		
		PreparedStatement ps1_1_1 = con.prepareStatement(sqlm);
		ResultSet rs2 = ps1_1_1.executeQuery();

		
		while(rs2.next())
		{
			  name22=rs2.getString("division_name");
			
			
		}
		if(divisionName11.equalsIgnoreCase("name22") || divisionName11.equals(name22))
		{
			
		}
		else
		{

			
			sqlQuery = "update xx_divisions_map set division_name='"+divisionName11+"' where division_id ="+divisionId;
			
			
			%>
			
			<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_document_mapping set Division ='<%=divisionName11%>' where Division = '<%=divisionnamefirst%>'
					</sql:update>
					<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_divisions_master set division_name ='<%=divisionName11%>' where division_name = '<%=divisionnamefirst%>'
					</sql:update>
					<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_doc_divisions_hierarchy set Division ='<%=divisionName11%>' where Division = '<%=divisionnamefirst%>'
					</sql:update>
					<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_doczonedivision_map set Division ='<%=divisionName11%>' where Division = '<%=divisionnamefirst%>'
					</sql:update>
			   <sql:update dataSource="jdbc/MySQLDB" >
					  update xx_project_division_map set division_name ='<%=divisionName11%>' where division_name = '<%=divisionnamefirst%>'
					</sql:update>
			
		<%	}
		
		
		
	}
}
else if(dbType1.equalsIgnoreCase("Others")){
	String name221=null;
	String sqlm1="select Org_Name from xx_org_master where Org_Name='"+Org_Name1+"'";
	PreparedStatement ps1_1_11 = con.prepareStatement(sqlm1);
	ResultSet rs210 = ps1_1_11.executeQuery();

	
	while(rs210.next())
	{
		  name221=rs210.getString("Org_Name");
		
		
	}
	if(Org_Name1.equalsIgnoreCase("name221") || Org_Name1.equals(name221))
	{
		
	}
	else
	{
		sqlQuery = "update xx_org_master set Org_Name='"+Org_Name1+"' where Org_ID="+Org_ID;
		
	}
	
} else if(dbType1.equalsIgnoreCase("piu")){
	String name22=null;
	String sqlm="select PIU_Name from xx_piu_master where PIU_Name='"+PIU_Name1+"'";
	System.out.println("sqlm sqlm sqlm -----piu-------"+sqlm);
	//Statement stmt2 = con.createStatement();
	//ResultSet rs2 = stmt2.executeQuery(sqlm);
	PreparedStatement ps1_1_1 = con.prepareStatement(sqlm);
	ResultSet rs2 = ps1_1_1.executeQuery();

	
	while(rs2.next())
	{
		  name22=rs2.getString("PIU_Name");
		
		
	}
	if(PIU_Name1.equalsIgnoreCase("name22") || PIU_Name1.equals(name22))
	{
		
	}
	else
	{
		sqlQuery = "update xx_piu_master set PIU_Name='"+PIU_Name1+"' where PIU_ID="+PIU_ID;
		%>
		
		<sql:update dataSource="jdbc/MySQLDB" >
				  update xx_projectattributes_master set PIU_of_RVNL ='<%=PIU_Name1%>' where PIU_of_RVNL = '<%=piunamefirst%>'
				</sql:update>
					
	<%	
		
		}
	
}else if(dbType1.equalsIgnoreCase("Documents")){

	String name22=null;
	String sqlm3="select Document_Type from xx_documentattributes_master where Document_Type='"+Document_Type+"'";
	//System.out.println("sqlm3 sqlm3 sqlm3 ------------"+sqlm3);
	//Statement stmt2 = con.createStatement();
	//ResultSet rs2 = stmt2.executeQuery(sqlm);
	PreparedStatement ps1_1_1 = con.prepareStatement(sqlm3);
	ResultSet rs2 = ps1_1_1.executeQuery();

	
	while(rs2.next())
	{
		  name22=rs2.getString("Document_Type");
		
		
	}
	if(Document_Type1.equalsIgnoreCase("name22") || Document_Type1.equals(name22))
	{
		//System.out.println("inside ifffffffffffffffffffffffffff"+name22);
		//System.out.println("desigName1 desigName1 desigName1 ------------"+desigName1);
	}
	else
	{
		sqlQuery = "update xx_documentattributes_master set Document_Type='"+Document_Type1+"', Location_Type='"+Loc_Type1+"' where Document_Type_Id="+Document_Id;
		%>
		
		<sql:update dataSource="jdbc/MySQLDB" >
				  update xx_document_mapping set Document_Type ='<%=Document_Type1%>' where Document_Type = '<%=documentnameinitial%>'
				</sql:update>
				<sql:update dataSource="jdbc/MySQLDB" >
				  update xx_doc_divisions_hierarchy set Document_type ='<%=Document_Type1%>' where Document_type = '<%=documentnameinitial%>'
				</sql:update>
				<sql:update dataSource="jdbc/MySQLDB" >
				  update xx_doc_zones_hierarchy set Document_type ='<%=Document_Type1%>' where Document_type = '<%=documentnameinitial%>'
				</sql:update>
				<sql:update dataSource="jdbc/MySQLDB" >
				  update xx_projectdocument_map set Document_Type ='<%=Document_Type1%>' where Document_Type = '<%=documentnameinitial%>'
				</sql:update>
		   
		
	<%	
		
		
		}
	
	
}else if(dbType1.equalsIgnoreCase("Projects")){
	

	String name22=null;
	String sqlm2="select Project_type from xx_projecttypes_master where Project_type='"+Project_type+"'";
	//System.out.println("sqlm2 sqlm2 sqlm2 ------------"+sqlm2);
	//Statement stmt2 = con.createStatement();
	//ResultSet rs2 = stmt2.executeQuery(sqlm);
	PreparedStatement ps1_1_1 = con.prepareStatement(sqlm2);
	ResultSet rs2 = ps1_1_1.executeQuery();

	
	while(rs2.next())
	{
		  name22=rs2.getString("Project_type");
		
		
	}
	if(Project_type1.equalsIgnoreCase("name22") || Project_type1.equals(name22))
	{
		//System.out.println("inside ifffffffffffffffffffffffffff"+name22);
		//System.out.println("desigName1 desigName1 desigName1 ------------"+desigName1);
	}
	else
	{
		sqlQuery = "update xx_projecttypes_master set Project_type='"+Project_type1+"' where Project_type_id="+Project_type_id;
		
%>
		
		<sql:update dataSource="jdbc/MySQLDB" >
				  update xx_projectattributes_master set Project_Type ='<%=Project_type1%>' where Project_Type = '<%=Project_typeinitial%>'
				</sql:update>
					
	<%	
		
		}
	
	
	
}
else if(dbType1.equalsIgnoreCase("Departments")){

System.out.println("ccccccccccccccccccccccccccccccccccc"+dbType1+"xxxxxxxxxxxxxxxxxxxx"+depType1);	

	String name=null;
	String sqlm1="select Department_Name from xx_departments_master where Department_Name='"+depName1+"' and Type='"+depType1+"'";
	PreparedStatement ps1_1_1 = con.prepareStatement(sqlm1);
	ResultSet rs2 = ps1_1_1.executeQuery();

	
	while(rs2.next())
	{
		 name=rs2.getString("Department_Name");
		//System.out.println("comming upto here ------------"+name);
		//System.out.println("desigName1 desigName1 desigName1 ------------"+desigName1);
		
	}
	if(depName1.equalsIgnoreCase("name") || depName1.equals(name))
	{
	
	}
	else
	{
		sqlQuery = "update xx_departments_master set Department_Name='"+depName1+"' where Department_Id="+depId;
			
		%>
		
		<sql:update dataSource="jdbc/MySQLDB" >
				  update xx_projectattributes_master set CoordinatingDepartment ='<%=depName1%>' where CoordinatingDepartment = '<%=departmentnameinitial%>'
				</sql:update>
				<sql:update dataSource="jdbc/MySQLDB" >
				  update xx_packages_project set department ='<%=depName1%>' where department = '<%=departmentnameinitial%>'
				</sql:update>
				<sql:update dataSource="jdbc/MySQLDB" >
				  update xx_create_project_department set Department_Name ='<%=depName1%>' where Department_Name = '<%=departmentnameinitial%>'
				</sql:update>
				<sql:update dataSource="jdbc/MySQLDB" >
				  update xx_doc_divisions_hierarchy set Department ='<%=depName1%>' where Department = '<%=departmentnameinitial%>'
				</sql:update>
		   <sql:update dataSource="jdbc/MySQLDB" >
				  update xx_doc_zones_hierarchy set Department ='<%=depName1%>' where Department = '<%=departmentnameinitial%>'
				</sql:update>
		
	<%	
		
		}
	
	
}
else if(dbType1.equalsIgnoreCase("Designations")){
	String name=null;
	
	String sqlm41="select Department_Id from xx_departments_master where Department_Name='"+depnamenew+"'";
	//System.out.println("printing 11 january -test ++++++++--------"+sqlm41);
	PreparedStatement ps1_1_11 = con.prepareStatement(sqlm41);
	ResultSet rs21 = ps1_1_11.executeQuery();
int depid1=0;
	
	while(rs21.next())
	{
		depid1=rs21.getInt("Department_Id");
		
	}
	
	
	String sqlm4="select Designation_name from xx_designation_mapping where Designation_name='"+desigName1+"' and Department_id="+depid1;
	//System.out.println("printing 11 janu ---------"+sqlm4);
	PreparedStatement ps1_1_1 = con.prepareStatement(sqlm4);
	ResultSet rs2 = ps1_1_1.executeQuery();

	
	while(rs2.next())
	{
		 name=rs2.getString("Designation_name");
		
	}
	if(desigName1.equalsIgnoreCase("name") || desigName1.equals(name))
	{
	
	}
	else
	{
		
		
		 sqlQuery  = "update xx_designation_mapping set Designation_name='"+designame1+"' , Type='"+dTypes1+"',Department_id="+depid1+"  where designation_id='"+desId+"' and Department_Id="+id1+" and Type='"+dTypes1+"'";
		 
		 %>
			<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_designation_master set Designation_Name ='<%=designame1%>' where Designation_Id = <%=desId%>
					</sql:update>
					<% 
					if (dTypes1.equalsIgnoreCase("RVNL")) {
						%>
					<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_packages_project set designation ='<%=designame1%>',department ='<%=depnamenew%>' where designation = '<%=designameinitial%>' and department ='<%=depnameold%>'
					</sql:update>
					<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_projectattributes_master set Designation ='<%=designame1%>', CoordinatingDepartment ='<%=depnamenew%>' where Designation = '<%=designameinitial%>' and CoordinatingDepartment ='<%=depnameold%>'
					</sql:update>
					
		<%	
					}
		}
	//
	
	
}
System.out.println("final sqlQuery:::"+sqlQuery);

if(sqlQuery==null)
{
	%><div class="alert alert-success"><br>
	 <strong>Warning!</strong> Data Already exist ! Data can't be saved.
	 <br>
	 <br>
	 <input class='btn btn-primary' value='ok'  onClick="refreshAndClose()" type='button'/>
	 </div><%
//response.sendRedirect("/RVNLDocumentPortal/Admin/Update.jsp");
}
//System.out.println("printingg my query---"+sqlQuery);
stmt = con.createStatement();
queryUpdate = stmt.executeUpdate(sqlQuery);
//System.out.println("queryUpdate queryUpdate queryUpdate queryUpdate--------"+queryUpdate);
}

if(queryUpdate==1 || queryUpdate!=0){
	%><div class="alert alert-success"><br>
	 <strong>Success!</strong> Data has been updated successfully.
	 <br>
	 <br>
	 <input class='btn btn-primary' value='ok'  onClick="refreshAndClose()" type='button'/>
	 </div>
	
	
	
	<script>
	
	//window.opener.location.reload(true);
    //window.close();
//	var url="Updatechange.jsp?zone="+zone;
//	window.open(url,this.target, 
//		       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
//	
	</script>
	<%
	queryUpdate=0;
	//response.sendRedirect("/RVNLDocumentPortal/Admin/Update.jsp");
	
}
else{
		
}
}catch(Exception e){
e.printStackTrace();
}finally{	
	try {

		if (con != null)
			con.close();
	} catch (Exception e) {
	}
	try {
		if (stmt != null)
			stmt.close();
		} catch (Exception e) {
		}
	try {
		if (rs != null)
			rs.close();
		} catch (Exception e) {
		}	
		}%>
		
		
	</c:if>
	</form>

											      <%@include file="included/Newfooter.jsp" %>
<div id="dialogid" style="display: none"
		align="center">
		<br> Please Fill All Data !<br>
		<br>
		<button id="cancle" class="btn btn-primary"
			onclick="$('#dialogid').dialog('close');">Ok</button>
	</div>
</body>

</html>