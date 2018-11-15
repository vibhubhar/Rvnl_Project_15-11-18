<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="included/NewHeader.jsp"%>

<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RVNL Document Portal</title>

<link href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.css"/>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<!--   <link 
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" /> -->
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>

<script type="text/javascript">
	window.onunload = refreshParent;
	function refreshParent() {
		window.opener.location.reload();
	}
</script>
<script type="text/javascript">

function loadXMLDoczone(element,er)
{
var xmlhttp;
var k=document.getElementById(element).value;
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
var k=document.getElementById(element).value;
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
var k=document.getElementById(element).value;
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
var k=document.getElementById(element).value;
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
var k=document.getElementById(element).value;
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
var k=document.getElementById(element).value;
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

function loadXMLDesig11(element,er)
{
var xmlhttp;
var dep1=document.getElementById("department").value;
var dep = encodeURIComponent(dep1);
var m1=document.getElementById("dTypes").value;
var m = encodeURIComponent(m1);
var k1=document.getElementById(element).value;
var k = encodeURIComponent(k1);
var urls="DesigPass.jsp?ver="+k+"&department="+dep+"&newdesig="+m;
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



function loadXMLDept(element,er,p)
{
var xmlhttp;
var k1=document.getElementById(element).value;
var k = encodeURIComponent(k1);
var l1=document.getElementById(p).value;
var l = encodeURIComponent(l1);
var urls="DeptPass.jsp?ver='"+k+"&param5="+l;
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
	<sql:query var="rs" dataSource="jdbc/MySQLDB">
               SELECT * FROM xx_zones_master where Zone_Id !='18' order by Zone_Name
             </sql:query>
	<%
		String dbType = request.getParameter("type");
		
		String zoneName = request.getParameter("zoneName");
		String divisionName = request.getParameter("divisionName");
		String Org = request.getParameter("Org");
		String piu = request.getParameter("piu");
		String documents = request.getParameter("Documents");
		String loctype = request.getParameter("loctype1");
		String projects = request.getParameter("Projects");
		String departments = request.getParameter("department");
		String dType = request.getParameter("dType");
		String designations = request.getParameter("designations");
		String dTypes = request.getParameter("dTypes");
		
		String condition = request.getParameter("condition");
		String dzone = request.getParameter("D_Zone");
		System.out.println("add to db:"+Org+piu+zoneName+dbType);
	%>
	<input type="hidden" id=ItemType value=<%=dbType%>>
	<%
		Connection con = null;
		Statement stmt = null;
		PreparedStatement d_stmt = null, pss4=null;
		ResultSet rs = null, d_rs = null, rss4=null;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
			con = ds.getConnection();
			java.util.ArrayList<String> projal=new java.util.ArrayList<String>();		
			java.util.ArrayList<String> packal=new java.util.ArrayList<String>();
			int queryUpdate = 0;
			int var_doctype=0;
			String sqlQuery = null;

			String d_sql = "SELECT zone_id FROM xx_zones_master where zone_name ='"
					+ dzone + "'";
			d_stmt = con.prepareStatement(d_sql);
			d_rs = d_stmt.executeQuery();
			String z_id = null;
			while (d_rs.next()) {
				z_id = d_rs.getString("zone_id");
			}

			if (condition != null) {
				if (dbType.equalsIgnoreCase("zone")) {
					ResultSet rss3 = null;
					PreparedStatement pss3 = null;

					String query = "select * from xx_zones_master where Zone_Name='"
							+ zoneName + "'";

					pss3 = con.prepareStatement(query);
					rss3 = pss3.executeQuery();
					if (rss3.next()) {
	response.sendRedirect("Update.jsp");
		} else {
						sqlQuery = "insert into xx_zones_master (Zone_Name) values('"
								+ zoneName + "')";
					}
					rss3.close();
					pss3.close();

				} else if (dbType.equalsIgnoreCase("division")) {
					ResultSet rss3 = null, rss30 = null;
					PreparedStatement pss3 = null, pss30 = null;

					String query = "select * from xx_divisions_map where division_name='"
							+ divisionName
							+ "' and ext_zone_id = '"
							+ z_id
							+ "'";

					pss3 = con.prepareStatement(query);
					rss3 = pss3.executeQuery();
					if (rss3.next()) {
						String query1 = "select zone_name from xx_zones_master where zone_id ='"+ z_id + "'";

						pss30 = con.prepareStatement(query1);
						rss30 = pss30.executeQuery();
						if (rss30.next()) {
	
	
	response.sendRedirect("Update.jsp");
	
		}
					} else {
						sqlQuery = "Insert into xx_divisions_map(ext_zone_id,division_name) value('"
								+ z_id + "','" + divisionName + "')";
					}
					rss3.close();
					pss3.close();

				} else if (dbType.equalsIgnoreCase("Others")) {
					ResultSet rss3 = null;
					PreparedStatement pss3 = null;

					String query = "select * from xx_org_master where Org_Name='"
							+ Org + "'";

					pss3 = con.prepareStatement(query);
					rss3 = pss3.executeQuery();
					if (rss3.next()) {
	
	response.sendRedirect("Update.jsp");
		} else {
						sqlQuery = "Insert into xx_org_master(Org_Name) value('"
								+ Org + "')";
					}
					rss3.close();
					pss3.close();

				} else if (dbType.equalsIgnoreCase("piu")) {
					ResultSet rss3 = null;
					PreparedStatement pss3 = null;

					String query = "select * from xx_piu_master where PIU_Name='"
							+ piu + "'";

					pss3 = con.prepareStatement(query);
					rss3 = pss3.executeQuery();
					if (rss3.next()) {
	
	response.sendRedirect("Update.jsp");
		} else {
						sqlQuery = "Insert into xx_piu_master(PIU_Name) value('"
								+ piu + "')";
					}
					rss3.close();
					pss3.close();

				} else if (dbType.equalsIgnoreCase("Projects")) {
					ResultSet rss3 = null;
					PreparedStatement pss3 = null;

					String query = "select * from xx_projecttypes_master where Project_type='"
							+ projects + "'";

					pss3 = con.prepareStatement(query);
					rss3 = pss3.executeQuery();
					if (rss3.next()) {
	
	response.sendRedirect("Update.jsp");
	
		} else {
						sqlQuery = "Insert into xx_projecttypes_master(Project_type) value('"
								+ projects + "')";
					}
					rss3.close();
					pss3.close();

				} else if (dbType.equalsIgnoreCase("Documents")) {
					ResultSet rss3 = null;
					PreparedStatement pss3 = null;

					String query = "select * from xx_documentattributes_master where Document_Type='"
							+ documents + "'";

					pss3 = con.prepareStatement(query);
					rss3 = pss3.executeQuery();
					if (rss3.next()) {
	
	response.sendRedirect("Update.jsp");
		} else {
						sqlQuery = "Insert into xx_documentattributes_master(Document_Type, Location_Type) values('"
								+ documents + "', '"+loctype+"')";
					
					String query4 = "select a.Project_Id, a.Package_Id from  xx_project_docnos a group by a.Project_Id,a.Package_Id";
					pss4 = con.prepareStatement(query4);
					rss4 = pss4.executeQuery();
					String projid1=null, packid1=null;
					
					while (rss4.next()) {
						projid1 = rss4.getString("Project_Id");
						packid1 = rss4.getString("Package_Id");
						projal.add(projid1);
						packal.add(packid1);
					}
					var_doctype=1;
						//var_doctypename=documents;
						rss4.close();
						pss4.close();
		}
					rss3.close();
					pss3.close();
					
				} else if (dbType.equalsIgnoreCase("Departments")) {
					ResultSet rss3 = null;
					PreparedStatement pss3 = null;

					String query = "select * from xx_departments_master where Department_Name='"
							+ departments + "' and Type='" + dType + "'";

					pss3 = con.prepareStatement(query);
					rss3 = pss3.executeQuery();
					if (rss3.next()) {
	
	response.sendRedirect("Update.jsp");			
		} else {
						sqlQuery = "Insert into xx_departments_master(Department_Name,Type) values('"
								+ departments + "','" + dType + "')";
					}
					rss3.close();
					pss3.close();
					
				} else if (dbType.equalsIgnoreCase("Designations")) {
					
					sqlQuery="";
					String desgid = "m";
					String sqldeptid = "select department_id from xx_departments_master where Department_Name='"
							+ departments + "' and Type='" + dTypes + "'";
					
					Statement stmtdept = con.createStatement();
					ResultSet rsdeptid = stmtdept.executeQuery(sqldeptid);
					
					rsdeptid.next();
					String deptid = rsdeptid.getString("department_id");
					String sqldesgid = "select designation_id from xx_designation_mapping where Designation_Name='"
							+ designations + "' and Type='" + dTypes + "' and Department_id="+deptid;
					Statement stmtdesgid = con.createStatement();
					ResultSet rsdesgid = stmtdesgid.executeQuery(sqldesgid);
					

					if (rsdesgid.next()) {
						desgid = rsdesgid.getString("designation_id");

						
						sqlQuery="already";
					}
					int flg = 0;
					if(sqlQuery.equalsIgnoreCase("already")){
						flg = 2;
					}
					String newd=null;
					if (desgid == "m") {
						
						String sqlmaster = "Insert into xx_designation_master(Designation_Name,Type,level) values('"
								+ designations + "','" + dTypes + "','1')";
						Statement stmtmstr = con.createStatement();
						int upd = stmtmstr.executeUpdate(sqlmaster);
						flg = 1;
						
					
						
						
						
						
						String sqldesgid1 = "SELECT Designation_Id FROM xx_designation_master ORDER BY Designation_Id DESC LIMIT 1";
						Statement stmtdesgid1 = con.createStatement();
						ResultSet rsdesgid1 = stmtdesgid1.executeQuery(sqldesgid1);
						
						if (rsdesgid1.next()) {
							newd = rsdesgid1.getString("Designation_Id");

							
							
						}
						
						
					}
					
					if (flg == 0) {
						sqlQuery = "Insert into xx_designation_mapping(Designation_Name,department_id,designation_id,Type) values('"
								+ designations
								+ "','"
								+ deptid
								+ "','"
								+ newd + "','" + dTypes + "')";
						
					} else if(flg == 1) {
						
						String sqldesgid1 = "select designation_id from xx_designation_master where Designation_Name='"
								+ designations
								+ "' and Type='"
								+ dTypes
								+ "'";
						
						Statement stmtdesgid1 = con.createStatement();
						ResultSet rsdesgid1 = stmtdesgid1
								.executeQuery(sqldesgid1);
						rsdesgid1.next();
						String desgid1 = rsdesgid1.getString("designation_id");
						sqlQuery = "Insert into xx_designation_mapping(Designation_Name,department_id,designation_id,Type) values('"
								+ designations
								+ "','"
								+ deptid
								+ "','"
								+ newd + "',"+"'"+dTypes+ "')";
						
						
					}
					else{
						
						
					}

				}
				
				if (sqlQuery.equalsIgnoreCase("") ) {
					stmt = con.createStatement();
					queryUpdate = stmt.executeUpdate(sqlQuery);
				}else if(sqlQuery.equalsIgnoreCase("already")){
					queryUpdate=2;
					
					
				}else{
					stmt = con.createStatement();
					queryUpdate = stmt.executeUpdate(sqlQuery);
				
					if (var_doctype==1) {
						String sql3 = "Select Document_Type_Id FROM xx_documentattributes_master where Document_Type='"+documents+"'";
						Statement stmt3 = con.createStatement();
						ResultSet rs3 = stmt3.executeQuery(sql3);
						String doctypeid=null;
						if (rs3.next()) {
							doctypeid = rs3.getString("Document_Type_Id");
						}

						Iterator<String> projitr=projal.iterator();
						Iterator<String> packitr=packal.iterator();
						String projid2=null, packid2=null;
					while(projitr.hasNext()){
						projid2=projitr.next();
						packid2=packitr.next();
						%>
						<sql:update dataSource="jdbc/MySQLDB" >
						  insert into xx_project_docnos (Project_Id, Package_Id, Document_Type_Id, Nos_Reqd) VALUES (<%=projid2%>, <%=packid2%>,<%=doctypeid%>,0);
						</sql:update>
			<% 
							}
				}
			}
			}
			if (queryUpdate == 1) {
		queryUpdate = 0;
	response.sendRedirect("Update.jsp");
			} else if(queryUpdate == 2) {
				
				
				response.sendRedirect("Update.jsp");
			}
			else{
				
			}
	%>
	<form action="" style="margin-left: 50px" id="insertion">
		<table class="mainClass" style="background-color: #F0FFFF"
			align="left">
			<br>
			<br>
			<%
				if (dbType.equalsIgnoreCase("zone")) {
			%>
			<tr>
				Zone Name :
				<input type="text" name="zoneName" id="zoneName"
					style="width: 205px; border:groove;margin-left: 50px" onkeyup="loadXMLDoczone('zoneName','err')" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off>
			</tr></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="err"> </span>
			<%
				} else if (dbType.equalsIgnoreCase("division")) {
			%>
			<tr>
				Zone:
				<select name="D_Zone" id="D_Zone"
					style="width: 205px; margin-left: 70px">
					<option value="none">-- Select Zone --</option>
					<c:forEach var="row" items="${rs.rows}">
						<option value="${row.zone_name}">${row.zone_name}</option>
					</c:forEach>
				</select>
				<br>
				<br>Division :
				<input type="text" name="divisionName" id="divisionName"
					style="width: 205px; margin-left: 50px" onkeyup="loadXMLDiv1('divisionName','err')" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off>
			</tr><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span id="err"> </span>

			<%
				} else if (dbType.equalsIgnoreCase("Others")) {
			%>
			<tr>
				Organization (other than Railways & RVNL) :
				<input type="text" name="Org" id="Org"
					style="width: 205px; margin-left: 50px" onkeyup="loadXMLOrg('Org','err')" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off>
			</tr></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span id="err"> </span>
			<%
				} else if (dbType.equalsIgnoreCase("piu")) {
					%>
					<tr>
						PIU Of RVNL :
						<input type="text" name="piu" id="piu"
							style="width: 205px; margin-left: 50px" onkeyup="loadXMLPiu('piu','err')" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off>
					</tr></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<span id="err"> </span>
					<%

				} else if (dbType.equalsIgnoreCase("Documents")) {
			%>
			<tr>
				Document Type :
				<input type="text" name="Documents" id="Documents"
					style="width: 205px; margin-left: 50px" onkeyup="loadXMLDoc1('Documents','err')" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off>
					</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
				<span id="err"> </span>
		<br><br> Location Type:	<select name="loctype1" id="loctype1" style="width: 205px; margin-left: 65px;">
			<option selected="selected" value="">-- Select Location Type --</option>
			<option value="KM">KM</option>
			<option value="Section">Section</option>
			<option value="Station">Station</option>
			</select><br>
			</tr>



			<%
				} else if (dbType.equalsIgnoreCase("Projects")) {
			%>
			<tr>
				Project Type :
				<input type="text" name="Projects" id="Projects"
					style="width: 205px; margin-left: 50px" onkeyup="loadXMLProj('Projects','err')" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off>
			</tr></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span id="err"> </span>

			<%
				} else if (dbType.equalsIgnoreCase("Departments")) {
			%>

			<tr>
				Type :
				<select name="dType" id="dType"
					style="width: 205px; margin-left: 133px">
					<option selected="selected">-- Select Type --</option>
					<option value="MOR">MOR</option>
					<option value="RVNL">RVNL</option>
					
				</select>
				<br />
				<br> Department Name :
				<input type="text" name="department" id="department"
					style="width: 205px; margin-left: 50px" onkeyup="loadXMLDept('department','err','dType')" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off>
				</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			</tr>
			<span id="err"> </span>

			<%
				} else if (dbType.equalsIgnoreCase("Designations")) {
			%>
			<tr>
				Type :
				<select name="dTypes" id="dTypes"
					style="width: 205px; margin-left: 135px"
					onchange='getdept(this.value)'>
					<option selected="selected" value="">-- Select Type --</option>
					<option value="MOR">MOR</option>
					<option value="RVNL">RVNL</option>
					
				</select>
				<br />
			</tr>

			<div id='Desgdiv' style='display: inline;'></div>
			</br> Designation Name :
			<input type="text" name="designations" id="designations"
				style="width: 205px; margin-left: 50px" onkeyup="loadXMLDesig11('designations','err')" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off>
			</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<span id="err"> </span>
			
			
			

			<%
				} else {

					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
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
						if (d_stmt != null)
							d_stmt.close();
					} catch (Exception e) {
					}
					try {
						if (rs != null)
							rs.close();
					} catch (Exception e) {
					}
					try {
						if (d_rs != null)
							d_rs.close();
					} catch (Exception e) {
					}
				}
			%>
			
			<input type="hidden" name="type" value=<%=dbType%>>
			<input type="hidden" name="condition" value="go">
			<br>
			<br>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-primary" id="btnclick" onclick="validateInsertion();" target="_blank"
				value="Submit" style="width: 5em;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-primary" type="reset" value="Cancel"
				onclick="window.location.href='Update.jsp'">        

		</table>
		<br> <br>
	</form>
	
	<%@include file="included/footer.jsp"%>

</body>
<div id="dialogid" style="display: none"
		align="center">
		<br> Please Fill All Data !<br>
		<br>
		<button id="cancle" class="btn btn-primary"
			onclick="$('#dialogid').dialog('close');">Ok</button>
	</div>
</html>