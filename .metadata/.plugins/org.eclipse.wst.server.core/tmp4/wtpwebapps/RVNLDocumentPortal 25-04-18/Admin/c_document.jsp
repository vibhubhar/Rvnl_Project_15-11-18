<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="included/NewHeader.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page session="true"%>
<%@include file="sessionCheck.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>

.ui-datepicker-year {
   background-color: #cc0000;
 padding-left:20px;
}
#example_length {
    display: none;
}
#example {
    width: inherit;
}
    
</style>

<script src="resources/JS/validateSysAdmin230.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="http://www.allmyscripts.com/Table_Sort/beta/gs_sortable.js"></script>

<script src="resources/JS/Approval_wf230.js"></script>

<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Documents </title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/blitzer/jquery-ui.css">
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.min.css"/>
<link rel="stylesheet" href="/Application/Admin/resources/bootstrap-3.3.7-dist/css1/bootstrap.css"/>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<script type="text/javascript"
	src="resources/JS/datasort.js"></script>
	<link
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />
<script src="resources/JS/PIU_depend230.js"></script>
<script type="text/javascript">

   function stopRKey(evt) { 
	  var evt = (evt) ? evt : ((event) ? event : null); 
	  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
	  if ((evt.keyCode == 13) )  {return false;} 
	} 

	document.onkeypress = stopRKey; 

	var people, asc1 = 1, asc2 = 1, asc3 = 1, asc4 = 1, asc5 = 1, asc6 = 1, asc7 = 1, asc8 = 1;
	window.onload = function() {
		people = document.getElementById("people");
	}

	function sort_table(tbody, col, asc) {
		var rows = tbody.rows, rlen = rows.length, arr = new Array(), i, j, cells, clen;
		// fill the array with values from the table
		for (i = 0; i < rlen; i++) {
			cells = rows[i].cells;
			clen = cells.length;
			arr[i] = new Array();
			for (j = 0; j < clen; j++) {
				arr[i][j] = cells[j].innerHTML;
			}
		}
		// sort the array by the specified column number (col) and order (asc)
		arr.sort(function(a, b) {
			return (a[col] == b[col]) ? 0
					: ((a[col] > b[col]) ? asc : -1 * asc);
		});
		// replace existing rows with new rows created from the sorted array
		for (i = 0; i < rlen; i++) {
			rows[i].innerHTML = "<td>" + arr[i].join("</td><td>") + "</td>";
		}
	}
	
	
	
	
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
		 
		 jQuery.extend( jQuery.fn.dataTableExt.oSort, {
			    "date-uk-pre": function ( a ) {
			        if (a == null || a == "") {
			            return 0;
			        }
			        var ukDatea = a.split('-');
			        return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
			    },
			 
			    "date-uk-asc": function ( a, b ) {
			        return ((a < b) ? -1 : ((a > b) ? 1 : 0));
			    },
			 
			    "date-uk-desc": function ( a, b ) {
			        return ((a < b) ? 1 : ((a > b) ? -1 : 0));
			    }
			} );
			
			
		var mywindow="c_document";
		window.name=mywindow;
	    $('#example').DataTable( {
	        columnDefs: [{  type: 'date-uk', targets: [4]}, {
	            targets: [ 0 ],
	            orderData: [ 0, 1 ]
	        }, {
	            targets: [ 1 ],
	            orderData: [ 1, 0 ]
	        }, {
	            targets: [ 4 ],
	            orderData: [ 4, 0 ]
	        } ],
  			"infoCallback": function( settings, start, end, max, total, pre ) {
				if (max==total) { return "Showing " + (end-start+1) + "  of " +total+" records"}
				else {return "Showing " + (end-start+1) + "  of " +total+" records (filtered from total " + max+" records)"}
			   	}
	    } );
	} );
</script>


<script type="text/javascript">
    window.onunload = refreshParent;
    function refreshParent() {
        window.opener.location.reload();
    }
</script>
	

<script type="text/javascript">

function deletedocument(document_map_id){
	
	var url="deletedocument.jsp?document_id="+document_map_id;
	window.open(url,this.target, 'width=500,height=500,scrollbars=1,top=400px,left=500px');
}



function editlist(document_map_id,hierarchytype,Division1,Document_Type1) {
	var Division = encodeURIComponent(Division1);
	var Document_Type = encodeURIComponent(Document_Type1);
	var url="forwardingUser.jsp?document_id="+document_map_id+"&HierType="+hierarchytype+"&Division_String="+Division+"&DType="+Document_Type+"&initatedfrm=recreate";
	window.open(url);
//returnProjects(id);
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
<script type="text/javascript">

//var $j = jQuery.noConflict();
 $(function() {
	  $('#Datefinalizedbyrvnl' ).datepicker({ dateFormat: 'dd/mm/yy',maxDate:'0', changeYear: true}).change (function() {
	  $('#Dateofsubmission').datepicker('option', 'minDate', $(this).datepicker('getDate'),{ dateFormat: 'dd/mm/yy',maxDate:'0', changeYear: true});
	  $('#Dateofsubmission').attr('disabled',false);
	  });
	  $('#Dateofsubmission').datepicker({ dateFormat: 'dd/mm/yy',maxDate:'0', changeYear: true});
	   });
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
	<%-- <div><h4 style='width: 300px; margin-left: 14px'>Add-Modify Documents</h4></div>

<h4 align="left"  style='width: 300px; margin-left:12px'><font style="color:red">Welcome&nbsp;</font><font color="#99CC00">:&nbsp;<%=(String)session.getAttribute("user_name") %></font></h4>
 --%>
 
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Add-Modify Documents] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div><br>
 
	<form name="Create_Document" id="Create_Document" method="post" target="_blank">
		<br> <br> <br> <INPUT TYPE="HIDDEN"
			NAME="identification"> <INPUT TYPE="HIDDEN"
			NAME="CheckedValue"> <INPUT TYPE="HIDDEN" NAME="XX_Doc_id">
		<INPUT TYPE="HIDDEN" NAME="selecteddivision"> <INPUT
			TYPE="HIDDEN" NAME="selectedzone"> <INPUT TYPE="HIDDEN"
			NAME="XX_HType" id="XX_HType"> 
		<%
			String projectid = request.getParameter("projectid");
			String packageid = request.getParameter("packageid");
			String userid = request.getParameter("userid");
			String zString = request.getParameter("zoneString");
			String zStr = zString.substring(1);
			String divString = request.getParameter("divisionString");
			String dStr = divString.substring(1);
			pageContext
					.setAttribute("ZoneSTR", zStr, PageContext.SESSION_SCOPE);
			pageContext.setAttribute("DivisionSTR", dStr,
					PageContext.SESSION_SCOPE);
			String rdstatus = (String) session.getAttribute("RealdateStatus");
			
		%>

		<c:if test="${param.identification == null}">
			<table >
				<tr style="width:50%">
					<td ><br> <br>
					
						<table class="table table-hover table-bordered" 
				style="background-color: #F0FFFF;margin: -44px 0px 0px 0px;" style="position:absolute;" valign="top">
							<tr>
								<td><b>General Details: </b><br><br>
								&nbsp;&nbsp;Document
									Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

									<select name="DocumentType" id="DocumentType" style="width:225px;" onchange="ShowLocation(1,<%=projectid %>,this.value, null, null);">
										<option value="none">-- Select Document Type --</option>
										
										<%
										String project_name=null,package_name1=null;
											Connection conn = null;
												Statement stmt = null;
												ResultSet rs = null, rs1 = null, rs2 = null, rs23 = null, rs3 = null, rs5 = null, rs12 = null, rs13 = null, rs14 = null,rs9=null,rs19=null;
												PreparedStatement ps1 = null, ps3 = null, ps2 = null, ps23 = null, ps5 = null, ps12 = null, ps13 = null, ps14 = null,ps9=null,ps19=null;
												SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
												String rd = df.format(new Date());
							                    //String packageid =null;
												String divisions = null;
												String doctype1=null;
												try {
													Context initCtx = new InitialContext();
													Context envCtx = (Context) initCtx.lookup("java:comp/env");
													DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

													conn = ds.getConnection();

													
													String sql23 = "select * from xx_documentattributes_master order by Document_Type";
													ps23 = conn.prepareStatement(sql23);
													rs23 = ps23.executeQuery();
												while (rs23.next()) {
														doctype1 = rs23.getString("Document_Type");
										
												%>
										<option value='<%=doctype1%>'><%=doctype1%></option>
									<%
									   }
									%>
										</select> <br> <br> &nbsp;&nbsp;Document
									Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="DocumentNo" id="DocumentNo" maxlength="50"
									style="width: 225px"> <br> <br>
									&nbsp;&nbsp;Document
									Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" name="DocumentName" id="DocumentName" maxlength="100"
									onkeyup="loadXMLDocname('DocumentName','err',<%=projectid%>)"
									onCopy=return(false) onDrag=return(false) onDrop=return(false)
									onPaste=return(false) autocomplete=off style="width: 225px">
									<span id="err"> </span> <br> <br>
									&nbsp;&nbsp;Pertaining To Division :
									&nbsp;&nbsp;&nbsp;
									<select name="divisiontype" id="divisiontype"
									style="width: 162px">
										<option value="none">-- Select division --</option>

										<%
													String sql2 = "select Distinct division_name from xx_project_division_map where package_id='"+ packageid + "' order by division_name";
													ps2 = conn.prepareStatement(sql2);
													rs2 = ps2.executeQuery();
													while (rs2.next()) {
														divisions = rs2.getString("division_name");
														
										%>
										<option value='<%=divisions%>'><%=divisions%></option>
										<%
											}
													
													String sql="select * from xx_projectattributes_master where project_id='"+projectid+"' order by Project";
													ps9 = conn.prepareStatement(sql);
													rs9 = ps9.executeQuery();
													
													while (rs9.next()) {
														project_name = rs9.getString("Project");
																								
											}
													String sql16="select * from xx_packages_project where package_id='"+packageid+"' order by package_name";
													
													
													ps19 = conn.prepareStatement(sql16);
													rs19 = ps19.executeQuery();
													
													while (rs19.next()) {
														package_name1 = rs19.getString("package_name");
																								
											} 
													
													//conn.close();
												} catch (Exception e) {
													e.printStackTrace();
												} finally {
					    						    try { conn.close(); } catch (Exception e) { /* ignored */ }
					    						}
												
											
										%>
								</select> <br> <br> &nbsp;&nbsp;Date finalized by
									RVNL:&nbsp;&nbsp;&nbsp;
									<input type="text" name="Datefinalizedbyrvnl"
									id="Datefinalizedbyrvnl" readonly="true"  style="width: 162px"> <br>
									<br> &nbsp;Date of submission to
									Railways: 
<%
	//System.out.print("Real Date Status"+rdstatus+rd);
if (rdstatus.equalsIgnoreCase("0")) { 
%>			
						
									<input type="text"
									name="Dateofsubmission" id="Dateofsubmission" readonly="true"  style="width: 132px">
<%
} else {
%>
<input type="text" name="Dateofsubmission" id="Dateofsubmission" readonly="true"  style="width: 132px; background-color: lightgray;" value=<%=rd %>>
<%
}
%>									
									 <br>
									<div id="err1" style="text-align: center; margin-left: 61px;"></div>
									 <br><div id="test" style="display:none;"> &nbsp;Document To Be
									Forwarded:&nbsp; <input type="radio"
									name="myRadios" id="Zone" value="Zone"> Zone
									&nbsp; <input type="radio" name="myRadios" id="Division"
									value="Division"> Division <input type="radio"
									name="myRadios" id="Both" value="Both" checked="checked"> Both <br></div>
									<br> 
								</td>
							</tr>
							<tr> <td><b>Location Details:</b><br><br>
							<div id="LocationDiv"> <INPUT
			TYPE="HIDDEN" Name="loc_type" Id="loc_type">
						
					</div> 
									</td></tr> 
						</table>
						 
									</td>
												
						
					<td style="background-color: #FFFAF0;display:inherit;"  valign="top">
					<b style="font-size: 16px;  color:blue">&nbsp;&nbsp;Project Name:</b>&nbsp;&nbsp;<%=project_name %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b style="font-size: 16px;color:blue">&nbsp;&nbsp;Package Name:</b>&nbsp;&nbsp;<%=package_name1 %>
						<h2 style="text-align: center;
font-size: 14px; margin: 10px 0px 0px 0px;">
					
							<font color="grey"><b>List of Documents (other than Finally Approved)</b></font>
						</h2> <sql:query var="rs" dataSource="jdbc/MySQLDB">
                select a.*, c.assigned_to from xx_document_mapping a left join (select b.* from xx_approval_workflow b where b.level='1') c on a.Document_Map_ID = c.Document_id where a.Project_ID = '<%=projectid%>' and a.package_id = '<%=packageid%>' and a.submitted_by = '<%=userid%>' and a.Document_Status='Pending' order by a.date_of_submission desc, a.document_name asc
                            </sql:query> <%
 	
 %>
						<div class='scrollit' style='overflow-x: scroll;width: 100%; position:relative;'>
							<table class="table table-hover table-bordered" id="example"  class="display">
							<thead>
								<tr class="success" >
								<th style="padding: 0px 14px 24px 0px;"><b>SNo</b></th>
									<th><b>Document Number</b></th>
									<th><b>Document Name</b></th>
									<th><b>Document Type</b></th>
									<th><b>Date of Submission</b></th>
									<th><b>Zone</b></th>
									<th><b>Division</b></th>
									<th><b>Submitted To</b></th>
									<th><b>Assignee List</b></th>
									<th><b>Document</b></th>
									<th><b>Action</b></th>

								</tr></thead>
								<tbody id="people">
								<c:forEach var="row" items="${rs.rows}" varStatus="loopCounter">
									
									<c:choose>
									<c:when  test="${(row.Forwarded =='yes')}">
									<tr class="active">
									<td class="ListOfTables"><font color="black"><c:out value="${loopCounter.count}"/></font></td>
										<td class="ListOfTables"><font color="black"><c:out
													value="${row.document_number}" /></font></td>
										<td class="ListOfTables"><font color="black"><c:out
													value="${row.document_name}" /></font></td>
										<td class="ListOfTables"><font color="black"><c:out
													value="${row.document_type}" /></font></td>
										<td class="ListOfTables"><font color="black"><fmt:formatDate value="${row.date_of_submission}" pattern="dd-MM-yyyy" />
													 </font></td>
													<td class="ListOfTables"><font color="black"><c:out
													value="${row.zone}" /></font></td>
									     <td class="ListOfTables"><font color="black"><c:out
													value="${row.division}" /></font></td>
										<td class="ListOfTables"><font color="black"><c:out 
													value="${row.Assigned_To}" /></font></td>
													<td class="ListOfTables"><font color="black">
										<input class='btn btn-primary' value='modify'  onClick="editlist('${row.document_map_id}','Both','${row.Division}','${row.Document_Type}')" type='button'/>
										</font></td>
										<td><font color="black"><INPUT TYPE="button" NAME="Edit" value="Modify" class="btn btn-primary"
											onClick="modifydoc('${row.document_map_id}')"> <c:out
												value="${row.modify}" /></font></td>
												<td><font color="black"><INPUT TYPE="button" NAME="delete" value="Delete" class="btn btn-primary"
											onClick="deletedocument('${row.document_map_id}')" disabled="true"> <c:out
												value="${row.modify}" /></font></td>
												</tr>
													</c:when>	
														
													<c:otherwise>
													<tr style="background-color:pink;">
									<td class="ListOfTables"><font ><c:out value="${loopCounter.count}"/></font></td>
										<td class="ListOfTables"><c:out
													value="${row.document_number}" /></td>
										<td class="ListOfTables"><c:out
													value="${row.document_name}" /></td>
										<td class="ListOfTables"><c:out
													value="${row.document_type}" /></td>
										<td class="ListOfTables"><fmt:formatDate value="${row.date_of_submission}" pattern="dd-MM-yyyy" />
													 </td>
													<td class="ListOfTables"><c:out
													value="${row.zone}" /></td>
									     <td class="ListOfTables"><c:out
													value="${row.division}" /></td>
										<td class="ListOfTables"><c:out 
													value="${row.Assigned_To}" /></td>
																			
										<td class="ListOfTables"><font color="black">
										<input class='btn btn-primary' value='modify'  onClick="editlist('${row.document_map_id}','Both','${row.Division}','${row.Document_Type}')" type='button'/>
										</font></td>
										<td><font color="black"><INPUT TYPE="button" NAME="Edit" value="Modify" class="btn btn-primary"
											onClick="modifydoc('${row.document_map_id}')"> <c:out
												value="${row.modify}" /></font></td>
												
												<td><font color="black"><INPUT TYPE="button" NAME="delete" value="Delete" class="btn btn-primary"
											onClick="deletedocument('${row.document_map_id}')"> <c:out
												value="${row.modify}" /></font></td>
												</tr></c:otherwise></c:choose>

								</c:forEach>

							</table>
						</div>
					</td>
				</tr>
				
			</table>
			<br />
			<br />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- <button type="button" class="btn btn-primary" id="btnclick"
				onclick="javascript:validateDocument(document.getElementById('loc_type'));">Submit</button>
 -->		

		<button type="button" class="btn btn-primary" id="btnclick"
				onclick="validateDocument('create');" >Submit</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
				class="btn btn-primary" value="Cancel" onclick="location.reload()" />
				
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
		
		<c:if test="${param.identification != null}">
			<%
			//,'${row.Package_ID}'
				System.out.println("pk is here=");
				String dateSubmitted = null;
			String smajsecid=null, majsecid=null, stnid=null, smajsec=null, majsec=null, stn=null;
			double frmkm=0.000;
			double tokm=0.000;
			double stnkm=0.000;
			
					String division1 = request.getParameter("selecteddivision");
					if (request.getParameter("identification").equalsIgnoreCase(
							"first")) {

						String docType = request.getParameter("DocumentType");
						String docNum = request.getParameter("DocumentNo");
						String docName = request.getParameter("DocumentName");
						dateSubmitted = request.getParameter("Dateofsubmission");
						String hierarchy = request.getParameter("CheckedValue");
						pageContext.setAttribute("HierarchyType", hierarchy,
								PageContext.SESSION_SCOPE);
						pageContext.setAttribute("DocumentType", docType,
								PageContext.SESSION_SCOPE);
						String finalizeDate = request
								.getParameter("Datefinalizedbyrvnl");
						String division = request.getParameter("divisiontype");
						String Loctype2 = request.getParameter("loc_type");
						//System.out.println(".....pk =" + Loctype2);
						if (Loctype2.equalsIgnoreCase("Station") ) {
							smajsec = request.getParameter("sMajsec");
							 stn = request.getParameter("stn");
							String stnkm1 = request.getParameter("stnKm");
							//System.out.println(".....pk 22 =" + smajsec+stn+stnkm+ Loctype2);
							 stnkm=Double.parseDouble(stnkm1);
							 
						} else {
							majsec = request.getParameter("Majsec");
							String frmkm1 = request.getParameter("frmKm");
							String tokm1 = request.getParameter("toKm");
							// System.out.println(".....pk 33 =" + majsec+frmkm1+ Loctype2 +tokm1);

							 frmkm=Double.parseDouble(frmkm1);
							 tokm=Double.parseDouble(tokm1);	
							// System.out.println(".....pk 22 =" + smajsec+stn+stnkm+Loctype2);
						}
						
						//System.out.println("22 pk is here=");
						Connection conn = null;
						try {

							Date date = new SimpleDateFormat("dd/MM/yyyy")
									.parse(dateSubmitted);
							java.sql.Date subDate = new java.sql.Date(
									date.getTime());
							Date date1 = new SimpleDateFormat("dd/MM/yyyy")
									.parse(finalizeDate);
							java.sql.Date finalizeDate1 = new java.sql.Date(
									date1.getTime());
							
							Statement selectStmt = null, selectStmt2 = null,selectStmt3 = null, selectStmt4 = null, selectStmt5 = null;
							
							String select = null, select2 = null,Zonename=null,zoneq=null, select4=null, select5=null;
							ResultSet rs = null, rs2 = null,rs3=null, rs4=null, rs5=null;
				
							Context initCtx = new InitialContext();
							Context envCtx = (Context) initCtx
									.lookup("java:comp/env");
							DataSource ds = (DataSource) envCtx
									.lookup("jdbc/MySQLDB");
							conn = ds.getConnection();
				// read majsec_id and Stn_id	
				System.out.println("33 pk is here=");
				if (Loctype2.equalsIgnoreCase("Station") ) {							
						selectStmt4 = (Statement) conn.createStatement();
						select4 = "select * from xx_project_station where Project_Id="+projectid+" and Major_Section='"+smajsec+"' and Station_Name='"+stn+"'";
						rs4 = selectStmt4.executeQuery(select4);
						String majsec2=null;
						if (rs4.next()) {
						stnid = rs4.getString("Stn_Id");
						majsec2=rs4.getString("Major_Section");
							}
						selectStmt5 = (Statement) conn.createStatement();
						select5 = "select * from xx_project_km where Project_Id="+projectid+" and Major_Section='"+majsec2+"'";
						rs5 = selectStmt5.executeQuery(select5);
						if (rs5.next()) {
							smajsecid = rs5.getString("Majsec_Id");
						}
					} else {
							selectStmt = (Statement) conn.createStatement();
							select = "select * from xx_project_km where Project_Id="+projectid+" and Major_Section='"+majsec+"'";
							rs = selectStmt.executeQuery(select);
							if (rs.next()) {
								majsecid = rs.getString("Majsec_Id");
							}
						}
				//System.out.println(".....pk 329 =" +Loctype2+ smajsecid+stnid);
// read other..							
							selectStmt = (Statement) conn.createStatement();
							select = "select * from xx_doc_zones_hierarchy where document_type = '"
									+ docType + "'";
							rs = selectStmt.executeQuery(select);
							String Z_hierarchy_id = null;
							while (rs.next()) {
								Z_hierarchy_id = rs.getString("hierarchy_id");
							}
							zoneq="select * from xx_zones_master where xx_zones_master.Zone_Id=(select Ext_Zone_ID from xx_divisions_map where Division_Name='"+division+"')";
							selectStmt3 = (Statement) conn.createStatement();
							rs3=selectStmt3.executeQuery(zoneq);
							while (rs3.next()) {
								Zonename = rs3.getString("Zone_Name");
							}
							System.out.println(".....pk 330 =" +Loctype2+ smajsecid+stnid);
							synchronized (this) {
								selectStmt2 = (Statement) conn.createStatement();
								select2 = "select * from xx_doc_divisions_hierarchy where document_type = '"
										+ docType + "'";
								rs2 = selectStmt.executeQuery(select2);
								String D_hierarchy_id = null;
								while (rs2.next()) {
									D_hierarchy_id = rs2.getString("hierarchy_id");
								}
								System.out.println("44 pk is here=");
								Statement MaxStmt = (Statement) conn
										.createStatement();
								String maxSelect = "select max(document_map_id) from xx_document_mapping";
								ResultSet maxRS = MaxStmt.executeQuery(maxSelect);
								String doc_id = "0";
								int doc_id1 = 0;
								while (maxRS.next()) {
									if (maxRS.getString(1)!=null){
									doc_id = maxRS.getString(1);
									doc_id1 = Integer.parseInt(doc_id);
									doc_id1 = doc_id1 + 1;
									doc_id = String.valueOf(doc_id1);
									}
								}
								pageContext.setAttribute("Document_ID", doc_id,
										PageContext.SESSION_SCOPE);
								System.out.println("doc-id=" + doc_id);
								/*
								if (hierarchy.equalsIgnoreCase("Zone")) {

									Statement insertStmt = (Statement) conn
											.createStatement();
									String insertStg = "INSERT INTO xx_document_mapping (document_map_id,document_number,document_name,document_type,date_of_submission,submitted_by,project_id,package_id,document_status,DateFinalize,Division,Zone) VALUES ('"
											+ doc_id
											+ "','"
											+ docNum
											+ "','"
											+ docName
											+ "','"
											+ docType
											+ "','"
											+ subDate
											+ "','"
											+ userid
											+ "','"
											+ projectid
											+ "','"
											+ packageid
											+ "','Pending','"
											+ finalizeDate1
											+ "','" + division + "','"+Zonename+"')";
									insertStmt.executeUpdate(insertStg);
								} else if (hierarchy.equalsIgnoreCase("Division")) {
									Statement insertStmt = (Statement) conn
											.createStatement();
									String insertStg = "INSERT INTO xx_document_mapping (document_map_id,document_number,document_name,document_type,date_of_submission,submitted_by,project_id,package_id,document_status,DateFinalize,Division,Zone) VALUES ('"
											+ doc_id
											+ "','"
											+ docNum
											+ "','"
											+ docName
											+ "','"
											+ docType
											+ "','"
											+ subDate
											+ "','"
											+ userid
											+ "','"
											+ projectid
											+ "','"
											+ packageid
											+ "','Pending','"
											+ finalizeDate1
											+ "','" + division + "','"+Zonename+"')";
									insertStmt.executeUpdate(insertStg);
								} else {
									*/
									if (Loctype2.equalsIgnoreCase("Station")) {
									Statement insertStmt = (Statement) conn
											.createStatement();
									String insertStg = "INSERT INTO xx_document_mapping (document_map_id,document_number,document_name,document_type,date_of_submission,submitted_by,project_id,package_id,document_status,DateFinalize,Division,Zone,Majsec_Id,Stn_Id, Doc_create_date) VALUES ('"
											+ doc_id
											+ "','"
											+ docNum
											+ "','"
											+ docName
											+ "','"
											+ docType
											+ "','"
											+ subDate
											+ "','"
											+ userid
											+ "','"
											+ projectid
											+ "','"
											+ packageid
											+ "','Pending','"
											+ finalizeDate1
											+ "','" + division + "','"+Zonename+"',"+smajsecid+","+stnid+", now())";
									insertStmt.executeUpdate(insertStg);
									} else {
										Statement insertStmt = (Statement) conn
												.createStatement();
										String insertStg = "INSERT INTO xx_document_mapping (document_map_id,document_number,document_name,document_type,date_of_submission,submitted_by,project_id,package_id,document_status,DateFinalize,Division,Zone,Majsec_Id,From_Km,To_Km, Doc_create_date) VALUES ('"
												+ doc_id
												+ "','"
												+ docNum
												+ "','"
												+ docName
												+ "','"
												+ docType
												+ "','"
												+ subDate
												+ "','"
												+ userid
												+ "','"
												+ projectid
												+ "','"
												+ packageid
												+ "','Pending','"
												+ finalizeDate1
												+ "','" + division + "','"+Zonename+"',"+majsecid+","+frmkm+","+tokm+", now())";
										insertStmt.executeUpdate(insertStg);
									}
								//}
							}
						
							//conn.close();
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
						    try { conn.close(); } catch (Exception e) { /* ignored */ }
						}

					} else if (request.getParameter("identification")
							.equalsIgnoreCase("updateHierarchy")) {

						String document_id = request.getParameter("XX_Doc_id");
						String hierType = request.getParameter("XX_HType");
						

						Context initCtx = new InitialContext();
						Context envCtx = (Context) initCtx.lookup("java:comp/env");
						DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
						Connection conn = ds.getConnection();
						
						if (hierType.equalsIgnoreCase("Zone")) {

							
			%>
			
		       <table class="table table-hover table-bordered">
				<tr class="success">
					<td width="20%"><b>Zone</b></td>
					<td width="20%"><b>Document Type</b></td>
					<td width="20%"><b>Department</b></td>
					<td width="20%"><b>Designation</b></td>
					<td width="20%"><b>Level</b></td>
				</tr>
</tbody>
				<%
					Statement selectStmt = (Statement) conn
										.createStatement();
								String select = "select * from xx_doc_zones_hierarchy where document_id ='"
										+ document_id + "'";
								ResultSet rs = selectStmt.executeQuery(select);
								String xx_zone = null, xx_docType = null, xx_dept = null, xx_desg = null, xx_level = null;

								while (rs.next()) {
									xx_zone = rs.getString("zone");
									xx_docType = rs.getString("document_type");
									xx_dept = rs.getString("department");
									xx_desg = rs.getString("designation");
									xx_level = rs.getString("level");
				%>
				<tr class="active">
					<td width="20%"><%=xx_zone%></td>
					<td width="20%"><%=xx_docType%></td>
					<td width="20%"><input type="text" name="u_dept"
						value="<%=xx_dept%>"></td>
					<td width="20%"><input type="text" name="u_dept"
						value="<%=xx_dept%>"></td>
					<td width="20%"><%=xx_level%></td>
				</tr>

				<%
					}
								
				%>
			</table>
			
			<%
				} else if (hierType.equals("Division")) {
			%>
			
			<%
				} else {

						}
						conn.close();
					}

					String doc_id = (String) pageContext.getAttribute(
							"Document_ID", PageContext.SESSION_SCOPE);
					String hierType = (String) pageContext.getAttribute(
							"HierarchyType", PageContext.SESSION_SCOPE);
					String z_str = (String) pageContext.getAttribute("ZoneSTR",
							PageContext.SESSION_SCOPE);
					String division12 = (String) pageContext.getAttribute(
							"selecteddivision", PageContext.SESSION_SCOPE);
					String d_type = (String) pageContext.getAttribute(
							"DocumentType", PageContext.SESSION_SCOPE);
					//System.out.println("my code sumit=" + division1);
					if (hierType.equalsIgnoreCase("both")) {
					
			%>

			<c:redirect url="forwardingUser.jsp">
				<c:param name="document_id" value="<%=doc_id%>"></c:param>
				<c:param name="HierType" value="<%=hierType%>"></c:param>
				<c:param name="Zone_String" value="<%=z_str%>"></c:param>
				<c:param name="Division_String" value="<%=division1%>"></c:param>
				<c:param name="DType" value="<%=d_type%>"></c:param>
				<c:param name="both" value="true"></c:param>
				<c:param name="initatedfrm" value="create"></c:param>
				<c:param name="submitiondate" value="<%=dateSubmitted%>"></c:param>
			</c:redirect>
			<%
				} else {
			%>

			<c:redirect url="forwardingUser.jsp">
				<c:param name="document_id" value="<%=doc_id%>"></c:param>
				<c:param name="HierType" value="<%=hierType%>"></c:param>
				<c:param name="Zone_String" value="<%=z_str%>"></c:param>
				<c:param name="Division_String" value="<%=division1%>"></c:param>
				<c:param name="DType" value="<%=d_type%>"></c:param>
				<c:param name="initatedfrm" value="create"></c:param>
				<c:param name="submitiondate" value="<%=dateSubmitted%>"></c:param>
			</c:redirect>
			<%
				}
			%>



		</c:if>

	</form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@include file="included/footer.jsp"%>

</body>
</html>

