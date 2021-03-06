<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %>
  <%@include file="included/NewHeader.jsp"%>
 <%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>

<link
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />

<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="resources/JS/Update230.js"></script>

	
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>	

<script src="resources/JS/jquery-1.12.4.js"></script>

<script>
function modifydisplay(zoneName,zoneId)

{
	 var i=0;
	 var pattern = new RegExp(/[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/); //unacceptable chars
			    if (pattern.test(zoneName)) {
			        i=1;
			        }
	 var zoneName1=encodeURIComponent(zoneName);
	var url="modifytoDb.jsp?type=zone&zoneName="+zoneName1+"&zId="+zoneId+"&contains="+i+"";
	window.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');

 }

function modifydisplay1(divisionName1,divisionId)
{  var i=0;
	 var pattern = new RegExp(/[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/); //unacceptable chars
			    if (pattern.test(divisionName1)) {
			        i=1;
			        }
	 var divisionName2=encodeURIComponent(divisionName1);
	var url="modifytoDb.jsp?type=division&divisionName="+divisionName2+"&divisionId="+divisionId+"&contains="+i+"";
	window.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');
//returnProjects(id);
}

function modifydisplay21(Org_Name,Org_ID)
{  		   
	var i=0;
	 var pattern = new RegExp(/[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/); //unacceptable chars
			    if (pattern.test(Org_Name)) {
			        i=1;
			        }
	 var Org_Name1=encodeURIComponent(Org_Name);
	var url="modifytoDb.jsp?type=Others&Org_Name="+Org_Name1+"&Org_ID="+Org_ID+"&contains="+i+"";
	window.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');
//returnProjects(id);
}
function modifydisplay2(PIU_Name,PIU_ID)
{  		   
	var i=0;
	 var pattern = new RegExp(/[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/); //unacceptable chars
			    if (pattern.test(PIU_Name)) {
			        i=1;
			        }
	 var PIU_Name1=encodeURIComponent(PIU_Name);
	var url="modifytoDb.jsp?type=piu&PIU_Name="+PIU_Name1+"&PIU_ID="+PIU_ID+"&contains="+i+"";
	window.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');
//returnProjects(id);
}
function modifydisplay3(Type,Department_Name,Department_Id)
{  		 var i=0;
var pattern = new RegExp(/[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/); //unacceptable chars
	    if (pattern.test(Department_Name)) {
	        i=1;
	        } 
var Department_Name1=encodeURIComponent(Department_Name);
	var url="modifytoDb.jsp?type=Departments&depType="+Type+"&depName="+Department_Name1+"&depId="+Department_Id+"&contains="+i+"";
	window.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');
//returnProjects(id);
}
function modifydisplay4(DesignationType,Designation_Name,Designation_Id,Departmentname)
{  	var i=0;
var pattern = new RegExp(/[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/); //unacceptable chars
	    if (pattern.test(Designation_Name)) {
	        i=1;
	        } 	  	
var Designation_Name1=encodeURIComponent(Designation_Name);
	var url="modifytoDb.jsp?type=Designations&desigType="+DesignationType+"&desigName="+Designation_Name1+"&desId="+Designation_Id+"&departmentold="+Departmentname+"&contains="+i+"";
	window.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');
//returnProjects(id);
}

function modifydisplay5(Document_Type,Document_Id,loctype)
{  		
	var i=0;
	var pattern = new RegExp(/[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/); //unacceptable chars
		    if (pattern.test(Document_Type)) {
		        i=1;
		        }
	var Document_Type1=encodeURIComponent(Document_Type);
	var url="modifytoDb.jsp?type=Documents&Document_Type="+Document_Type1+"&Document_Id="+Document_Id+"&Loc_Type="+loctype+"&contains="+i+"";
	window.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');
//returnProjects(id);
}

function modifydisplay6(Project_type,Project_type_id)
{  	
	var i=0;
	var pattern = new RegExp(/[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/); //unacceptable chars
		    if (pattern.test(Project_type)) {
		        i=1;
		        }
	var Project_type1=encodeURIComponent(Project_type);
	var url="modifytoDb.jsp?type=Projects&Project_type="+Project_type1+"&Project_type_id="+Project_type_id+"&contains="+i+"";
	window.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');
//returnProjects(id);
}
</script>
<style>

div.absolute {
   	position:absolute;
   	margin-top: 5px;
   	margin-left: 105px;
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
 <script type="text/javascript">
 
   $(document).ready(function(){
  		$('#example5').DataTable({
  			
   		  	"infoCallback": function( settings, start, end, max, total, pre ) {
			if (max==total) { return "Showing " + (end-start+1) + "  of " +total+" records"}
			else {return "Showing " + (end-start+1) + "  of " +total+" records (filtered from total " + max+" records)"}
		   	},
		   
		   	columnDefs: [
		   	          { type: 'date-uk', targets: p11 }, { type: 'date-uk', targets: p12 }
		   	        ],
        dom: 'Bfrtip',
        lengthMenu: [
                     [ 10, 25, 50, -1 ],
                     [ '10 rows', '25 rows', '50 rows', 'Show all' ]
                 ],
        buttons: [
'pageLength',

]
		   
		   });	
   });
 
 </script>
</head>
<body>
<%String user = (String)session.getAttribute("user_name");
//System.out.println("UZER:"+user);
%>
<%-- <div><h4 style='width: 300px; margin-left: 27px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Master List</h4></div>

<h4 align="left"  style='width: 300px; margin-left:27px'><font style="color:red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font color="#99CC00">:&nbsp;<%=(String)session.getAttribute("user_name") %></font></h4>
 --%>
 
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[Master List] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>
<div class="container" style="margin-top:60px;">
<form id="loginForm111" name="loginForm111" method="post">
<table class="table table-hover table-bordered" style="background-color: #F0FFFF" id="example5" class="display nowrap">
<tr class="active">
<tbody>
<td align="center"><p><font color="red"><h2>Master Data Operations</h2></font></p></td>
</tbody>

<tbody>
<tr>

<td style="background-color: #F0FFFF">

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select Options:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select name="tab" id="tab"  onchange="showList(this.value)">
                        <option selected="selected">-- Select Options --</option>
						<option value="zone">Zone</option>
						<option value="division">Division</option>
						<option value="Others">Other Organizations</option>
						<option value="piu">PIU of RVNL</option>
						<option value="Departments">Department</option>
						<option value="Designations">Designation</option>
						<option value="Documents">Document Type</option>
						<option value="Projects">Project Type</option>
						
				</select> <br> <br>  
			<div id="list"></div>	
</td></tr>
</tbody>
</table>

</form>
</div>
</body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br>											      <%@include file="included/footer.jsp" %>
</html>