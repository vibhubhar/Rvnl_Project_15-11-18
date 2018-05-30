<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page autoFlush="true" buffer="1094kb"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="java.awt.Color"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.net.URLEncoder"%>

<%@page import="org.joda.time.DateTime,org.joda.time.Days,org.joda.time.Hours,org.joda.time.Minutes,org.joda.time.Seconds" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>PDAMS - Report</title>
<style>
.dt-button.buttons-copy.buttons-html5 {
    display: none;
}
.dt-button.buttons-csv.buttons-html5 {
    display: none;
}
.dt-button.buttons-pdf.buttons-html5 {
    display: none;
}
#example_length {
    display: none;
}
#example {
    width: inherit;
}

table {
	mso-displayed-decimal-separator: "\.";
	mso-displayed-thousand-separator: "\,";
}

@page {
	margin: 1.0in .75in 1.0in .75in;
	mso-header-margin: .5in;
	mso-footer-margin: .5in;
	mso-page-orientation: landscape;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<!-- <title>PIU Level Report</title> -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/JS/validateSysAdmin230.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="http://www.allmyscripts.com/Table_Sort/beta/gs_sortable.js"></script>
<script type="text/javascript" language="javascript" 

src="js/data_table/jquery.dataTables.min.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<script src="resources/JS/Approval_wf230.js"></script>
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script type="text/javascript"
	src="resources/JS/datasort.js"></script>
	<link
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />
	
<link href="resources/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css">
<script src="resources/JS/jquery-1.12.4.js"></script>
<script src="resources/JS/jquery.dataTables.min.js"></script>
<script src="resources/JS/dataTables.buttons.min.js"></script>
<script src="resources/JS/buttons.flash.min.js"></script>
<script src="resources/JS/jszip.min.js"></script>
<!-- <script src="resources/JS/pdfmake.min.js"></script> -->
<script src="resources/JS/vfs_fonts.js"></script>
<script src="resources/JS/buttons.print.min.js"></script>
<script src="resources/JS/buttons.html5.min.js"></script>
<script>
function myFunction() {
    window.print();
}
</script>
<script type="text/javascript">
function closeMe()
{
var win = window.open("","_self"); 
win.close();
}
</script>
<script type="text/javascript">
function mywinClose() {
	var sessionTimeout1 = "<%= session.getMaxInactiveInterval() %>";
	setTimeout(function(){var parent1=window.open("","report_master"); parent1.close(); },(sessionTimeout1-10)*1000);
}
</script>

	<script>
	$(document).ready(function() {
		var nc1=4;
		var message1=document.getElementById("message1").value;
		
		var piu1=document.getElementById("piu1");
		if(piu1==null){
			piu1="";
		}
		else{
			piu1=document.getElementById("piu1").value;
			piu1="PIU :"+piu1; nc1--;
		}
		var projType1=document.getElementById("projType1");
		if(projType1==null){
			projType1="";
		}
		else{
			var projType1=document.getElementById("projType1").value;
			projType1="Project Type :"+projType1;
		}

		var project1=document.getElementById("project1");
		if(project1==null){
			project1="";
		}
		else{
			project1=document.getElementById("project1").value;
			project1="Project :"+project1; nc1--;
		}
		var docType1=document.getElementById("docType1");
		if(docType1==null){
			docType1="";
		}
		else{
			var docType1=document.getElementById("docType1").value;
			docType1="Document Name :"+docType1; nc1--;
		}
		
		
		var pkl1=piu1+"              "+projType1;
	    var pkl2=project1+"              "+docType1+"               ";

	
	    
	   		$('#example').DataTable( {
	   				"infoCallback": function( settings, start, end, max, total, pre ) {
					if (max==total) { return "Showing " + (end-start+1) + "  of " +total+" records"}
					else {return "Showing " + (end-start+1) + "  of " +total+" records (filtered from total " + max+" records)"}
				   	}, 
				 			   
		        dom: 'Bfrtip',
		        lengthMenu: [
		                     [ 10, 25, 50, -1 ],
		                     [ '10 rows', '25 rows', '50 rows', 'Show all' ]
		                 ],
		                 
		        buttons: [
	'pageLength',
		                  
	{exportOptions: {
		  
	//columns: [':visible :not(21)']
	},
	    extend: 'print',
	    header:true,
	    footer:true,
	    message: message1,
	    title: 'RVNL PROJECT DOCUMENT STATUS REPORT',
	    customize: function (win) {
  	        $(win.document.body).find('table').addClass('display').css('font-size', '9px');
	        $(win.document.body).find('tr:nth-child(odd) td').each(function(index){
	            $(this).css('background-color','#D0D0D0');
	        });
	        $(win.document.body).find('h1').css('text-align','center');
	        var footer = $('tfoot');
     	    if (footer.length > 0) {
     	        var exportFooter = $(win.document.body).find('tfoot:eq(0)');
     	        exportFooter.after(footer.clone());
     	        exportFooter.remove();
     	    }
     	 
  	    }
	},

		                  
	{exportOptions: {
	//   columns: [':visible :not(21)']
	}, 
		                  
			                  
			                  //'print',
			                  
			                 title: 'RVNL PROJECT DOCUMENT STATUS REPORT',
			                  extend: 'excel',
			                  footer:true,
			                 
			                  fixedHeader: {
			                      header: true,
			                      footer: true
			                  },
			                  
			               
			                  customize: function (xlsx) {
			                      var sheet = xlsx.xl.worksheets['sheet1.xml'];
			                      var numrows = 4;
			                      var clR = $('row', sheet);

			                      //update Row
			                      clR.each(function () {
			                          var attr = $(this).attr('r');
			                          var ind = parseInt(attr);
			                          ind = ind + numrows;
			                          $(this).attr("r",ind);
			                      });
			                      var message33=document.getElementById("message1").value;
			                      // Create row before data
			                      $('row c ', sheet).each(function () {
			                          var attr = $(this).attr('r');
			                          var pre = attr.substring(0, 1);
			                          var ind = parseInt(attr.substring(1, attr.length));
			                          ind = ind + numrows;
			                          $(this).attr("r", pre + ind);
			                      });
			                       function Addrow(index,data) {
			                          msg='<row r="'+index+'">'
			                          for(i=0;i<data.length;i++){
			                              var key=data[i].key;
			                              var value=data[i].value;
			                              msg += '<c t="inlineStr" r="' + key + index + '">';
			                              msg += '<is>';
			                              msg +=  '<t>'+value+'</t>';
			                              msg+=  '</is>';
			                              msg+='</c>';
			                          }
			                          msg += '</row>';
			                          return msg;
			                      }


			                      //insert
			                       var r1 = Addrow(1, [{ key: 'F', value:  'RVNL DOCUMENT PORTAL' }]);
			                      var r2 = Addrow(2, [{ key: 'A', value: pkl1 }]);
			                       var r3 = Addrow(3, [{ key: 'A', value: pkl2 }]);
			                     
			                      sheet.childNodes[0].childNodes[1].innerHTML = r1+r2+r3+ sheet.childNodes[0].childNodes[1].innerHTML;	
			                  }
			                  
						}    
	                ],
	                "footerCallback": function ( tfoot, data, start, end, display ) {
	  		            var api = this.api(), data;
			            // Remove the formatting to get integer data for summation
			            var intVal = function ( i ) {
			            	return typeof i === 'string' ?
			            				i.replace(/(<([^>]+)>)(\-?)/ig, '')*1 :
			                   typeof i === 'number' ?
			                        i : 0;
			            	
			            };
			  var nc=nc1+1;
			  var bc=nc1+1;
			  var pageTotal=[];
			  var total=[];
			 while (nc<bc+4) {		            
				 // Total over all pages
			            total[nc] = api
			                .column(nc)
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                    
			                }, 0 );
			 
			            // Total over this page
			            pageTotal[nc] = api
			                .column( nc, { page: 'current'} )
			                .data()
			                .reduce( function (a, b) {
			                	//console.log(a);
			                   return intVal(a) + intVal(b);
			                   
			                }, 0 );
			            $( api.column( nc ).footer() ).html('<center>'+
					              pageTotal[nc] +'<br> (Total '+ total[nc] +') </center>'
					            );  
			                nc++;
			        }
		   				   		
	   		}


	    } );
	    
	} );
</script>

</head>
<body onload="mywinClose();">
	<div style="text-align: center;font-size: 18px;"><b>RVNL Project Document Status Report  </b></div></br>
	<%
		String exportToExcel = request.getParameter("exportToExcel");
		/*if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "excel.xls");

		}*/
	%>
	<%
	String docType=null;
		String piu1 = request.getParameter("PIU_name");
		String projtype = request.getParameter("projtype");
		String project = request.getParameter("project");
		String docType2 = request.getParameter("doctype");
		if (docType2!=null) {
			 docType = URLEncoder.encode(docType2, "UTF-8");
			}
		String backurl = request.getParameter("backurl");
		session.setAttribute( "backurl", backurl );
			
		
		
	%>
	<!-- <div id="pagereport" style="text-align:center;fontsize=4px;">
	<b style="font-size:20px;text-decoration: underline;">PIU WISE REPORT  </b></br>
	
	 </p>
	
	</div> -->
	<table border=0 class="table table-hover table-bordered"
		style="background: bisque;">
		<tr class="">
		
		
		
	<%
	Date dateofsub;
	Date currentdate;
	Date pDate;
	Connection conn = null;
	Statement stmt = null, stmt1=null;
	ResultSet rs = null,rs1=null;
	String arguments=null;
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	conn = ds.getConnection();
	
	String Q3 = "select PIU_Of_RVNL from xx_projectattributes_master where project='"+ project+"'";
	stmt1 = conn.createStatement();
	rs1 = stmt1.executeQuery(Q3);
	if (rs1.next()) {
		piu1 = rs1.getString(1);

	}	
	
	int nc=4;
	String header=" ";
	String uri = request.getScheme() + "://" +   // "http" + "://
            request.getServerName() +       // "myhost"
            ":" +                           // ":"
            request.getServerPort() +       // "8080"
            request.getRequestURI() +       // "/people"
            "?" +                           // "?"
            request.getQueryString();  
	
	session.setAttribute( "BackUrl", uri );
	
		if (piu1 != "") {
			header=" "+header+"  "+"PIU Name :  " +piu1+ "  "+" <br>"; nc--;
	%>
	
	
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>&nbsp;&nbsp;&nbsp;&nbsp;PIU
					Name :<b> <%=piu1%></b>
					<INPUT Type="hidden" name="piu1" id="piu1" value="<%=piu1 %>" />
			</font>
			</th>
			<%
				}
		if (projtype != "") {
			header=" "+header+"  "+"Project Type :  "+projtype+" "+" ";;
	%>
	<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
			&nbsp;&nbsp;&nbsp;&nbsp;Project Type :<b> <%=projtype%></b>
			<INPUT Type="hidden" name="projType1" id="projType1" value="<%=projtype %>" />
	</font>
	</th>
<%
}
				if (project != "") {
					header=" "+header+" "+"Project :  "+project+" "+" "; nc--;
			%>
			<th width="450px" align="left" style="background-color: #ffff;"><font size=3px>
					&nbsp;&nbsp;&nbsp;&nbsp;Project :  <b> <%=project%></b>
					<INPUT Type="hidden" name="project1" id="project1" value="<%=project %>" />
			</font>
			</th>
			<%
				}
			
				if (docType != "") {
					header=" "+header+"  "+"Document Type :  "+docType2+" "+" "+" <br>";nc--;
			%>
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
					&nbsp;&nbsp;&nbsp;&nbsp;Document Type :<b> <%=docType2%></b>
					<INPUT Type="hidden" name="docType1" id="docType1" value="<%=docType2 %>" />
			</font>
			</th>
			<!-- <th style="background-color: #ffff;"></th> -->
			<!--<th style="background-color: #ffff;"></th> -->
		
	
	<%
		}
	%></tr></table>
	<INPUT Type="hidden" name="message1" id="message1" value="<%=header %>" />
	<br>
	<%
			
			
			
			String query1 = "select Q2.*,Q1.nprepared, Q1.nappd, Q1.npending, Q1.notforwd from (select  Piu_Of_RVNL, project, package_name, Project_Id, package_id, document_type, Document_Status, count(Document_Map_ID) as pcount, count(Document_Map_ID) as nprepared, count(if(Document_status='Finally approved',Document_Map_ID, null)) as nappd, count(if((Forwarded='yes' and Document_status='Pending'),Document_Map_ID, null)) as npending, count(if(((Forwarded='No' or isnull(Forwarded)=true) and Document_status='Pending'),Document_Map_ID, null)) as notforwd from (select docm.Document_Map_ID, projm.PIU_of_RVNL,projm.Project,pkgm.package_name,pkgm.package_id, projm.project_id, docm.Document_Type,docm.forwarded, docm.Document_Status  from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm where projm.project_id = docm.project_id  and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID  and docm.ShowInReport='y') as q1 group by q1.PIU_of_RVNL, q1.package_id, q1.project_id, q1.Document_Type) as Q1 right join (select a.PIU_of_RVNL, a.Project, b.package_name, b.package_id, a.project_id, d.Document_Type, c.nos_reqd from xx_projectattributes_master a, xx_packages_project b, xx_project_docnos c, xx_documentattributes_master d where b.package_id = c.package_id and a.project_id=c.project_id and c.document_type_id=d.document_Type_Id) as Q2 on Q1.package_id = Q2.package_id and Q1.project_id=Q2.project_id and Q1.document_type = Q2.document_Type";
			//select Q2.*,Q1.nprepared, Q1.nappd, Q1.npending from (select projm.PIU_of_RVNL,projm.Project,pkgm.package_name,pkgm.package_id, projm.project_id, docm.Document_Type,count(docm.Document_Map_ID) as nprepared, count(if(docm.Document_status='Finally Q1pproved',docm.Document_Map_ID, null)) as nappd, count(if((docm.Forwarded='yes' and docm.Document_status='Pending'),docm.Document_Map_ID, null)) as npending from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm where projm.project_id = docm.project_id  and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID  and docm.ShowInReport='y' group by docm.Zone,docm.Division, projm.PIU_of_RVNL,projm.Project,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type) as Q1 right join (select a.PIU_of_RVNL, a.Project, b.package_name, b.package_id, a.project_id, d.Document_Type, c.nos_reqd from xx_projectattributes_master a, xx_packages_project b, xx_project_docnos c, xx_documentattributes_master d where b.package_id = c.package_id and a.project_id=c.project_id and c.document_type_id=d.document_Type_Id) as Q2 on Q1.package_id = Q2.package_id and Q1.project_id=Q2.project_id and Q1.document_type = Q2.document_Type";
			String query=null;
		if (piu1 != "") {
			if (query==null) {
			query=" where Q2.PIU_of_RVNL='"+piu1+"'";
		} else {
			query=query+" and Q2.PIU_of_RVNL='"+piu1+"'";
		}
		}
			if (project != "") {
				if (query==null) {
				query=" where Q2.Project ='"+project+"'";
			} else {
				query=query+" and Q2.Project ='"+project+"'";
			}
			}
				if (docType != "") {
					if (query==null) {
					query=" where Q2.Document_Type='"+docType2+"'";
				} else {
					query=query+" and Q2.Document_Type='"+docType2+"'";
				}
				}
			//	System.out.println("qq"+query);
		query=query1+query;
		//System.out.println("qq"+query);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	
	%>
<table align="center" width="60%"><tr><td>
	<table border=1 class="table table-hover table-bordered"
		style="background-color: #F0FFFF" id="example" class="display nowrap" cellspacing="0" width="100%">
		<thead>
		<tr class="success">
			<th   style="padding: 5px 10px 10px 5px;">S.No.</th>
			<% int n=4;
				if (piu1 == "") {
			%>
			<th    style="padding: 10px 10px 10px 10px;">PIU</th>

			<%
				} else {n--;}
			
				if (project == "") {
			%>
			<th    width="250px"  style="padding:10px 10px 10px 10px;">Project</th>

			<%
				} else { n--;}
			%> 
			<th ><div id="m3" style="padding: 10px 10px 10px 10px;">Package</div></th>
			<%
			if (docType == "") {
				%>
				<th    width="250px"  style="padding:10px 10px 10px 10px;">Document Type</th>

				<%
					} else { n--;}
			%>
			
			<th width="90px" style="padding:10px 10px 10px 10px;">Nos. Required</th>
				<th width="90px" style="padding:10px 10px 10px 10px;">Nos. Prepared</th>
					<th width="90px" style="padding:10px 10px 10px 10px;">Nos. Approved</th>
						<th width="90px" style="padding:10px 10px 10px 10px;">Nos. Under Approval</th>
				</tr>
					</thead>
<tfoot>	
<% n++;
int c=1;
%>
<th colspan='<%=n %>'><center><b>Total</b></center></th>
<% while (c<5) {
%>
<th></th>
<%
//System.out.println("ccc"+c+"n"+n);
c++;
} %>
		</tfoot>
		<tbody>
		<% int i=1;
			   	while (rs.next()) {

				//String Zone_name = rs.getString(1);
				//String division1 = rs.getString(2);
				String piu = rs.getString(1);
				String proj = rs.getString(2);
				String packn = rs.getString(3);
				String doctyp3 = rs.getString(6);
				String doctyp = URLEncoder.encode(doctyp3, "UTF-8");
				String nreqd = rs.getString(7);
				String nprepared = rs.getString(8);
				String nappd = rs.getString(9);
				String npending = rs.getString(10);
			//System.out.println("appd="+nappd+"pend"+npending+"doct"+doctyp);		
				
			%>
		<tr class="active">
			<td><%=i%></td>
			<%
			if (piu1 != "") {
			%>
			<%
				} else {
			%>
			<td><%=piu%></td>
			<%
				}
			%>
			<%
				if (project != "") {
			%>
			<%
				} else {
			%>
			<td><%=proj%></td>
			<%
				}
			%>
			<td><%=packn%></td>
			<%
			if (docType != "") {
				%>
				<%
					} else {
				%>
				<td><%=doctyp3%></td>
				<%
					}
			String piu2 = URLEncoder.encode(piu, "UTF-8");
			String proj2 = URLEncoder.encode(proj, "UTF-8");
			String packn2 = URLEncoder.encode(packn, "UTF-8");
			
			String url21="ReportPIU_ProjStatus_details.jsp?PIU_name="+piu2+"&project="+proj2+"&packno="+packn2+"&docType="+doctyp+"&status=Finally Approved";
			String url31=url21.replace(" ","+");
			String url41="ReportPIU_ProjStatus_details.jsp?PIU_name="+piu2+"&project="+proj2+"&packno="+packn2+"&docType="+doctyp+"&status=Pending";
			String url51=url41.replace(" ","+");
			
			if (nreqd == null) {
				%>
					<td><center>-</center></td>
				<%	
				} else {
				%>
					<td><center><%=nreqd %></a></center></td>
					<% } 
			if (nprepared == null) {
				%>
					<td><center>-</center></td>
				<% } else {
				%>
					<td><center><%=nprepared %></a></center></td>
					<% } 
				if (nappd == null || nappd.equalsIgnoreCase("0")) {
			%>
				<td><center>-</center></td>
			<%	} else {
			%>
			<td><center><a href="<%=url31 %>"><%=nappd%></a></center></td>
			<% }
			if (npending == null || npending.equalsIgnoreCase("0")) {
				%>
					<td><center>-</center></td>
				<%	} else {
				%>
					<td><center><a href="<%=url51 %>"><%=npending %></a></center></td>
					<% } 
			
				%>			
			
			
		</tr>
		<%
			i++;
			}
		   
		rs.close();

		conn.close();
		
		%>
		  
		</tbody>
	</table></td></tr></table>
	<br>
		<input type="button" value="close" class="btn btn-primary" onclick="closeMe();" style="margin-left: 50%;"> 
	<br><br>
	
	<%
		if (exportToExcel == null) {
	
	
		}
	   try { conn.close(); } catch (Exception e) { /* ignored */ }
	%>
	<br>
	<!-- <a href="#" onclick="javascript:window.print();">Print this page</a> -->
<br>
</body>

</html>