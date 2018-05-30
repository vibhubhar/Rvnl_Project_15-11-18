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
		var nc1=0;
		var message1=document.getElementById("message1").value;
var zone1=document.getElementById("zone1");
		
		if(zone1==null){
			zone1="";
		}else{
			var zone1=document.getElementById("zone1").value;
			zone1="Zone :"+zone1; nc1--;
		}
		
		var division1=document.getElementById("division1");
		if(division1==null){
			division1="";
		}else{
			var division1=document.getElementById("division1").value;
			division1="Division :"+division1; nc1--;
		}
		
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
		
		var pkl1=zone1+"               "+division1+"               "+piu1;
	    var pkl2=projType1+"              "+project1+"              "+docType1+"               ";

	
	    
	   		$('#example').DataTable( {
	   				"infoCallback": function( settings, start, end, max, total, pre ) {
					if (max==total) { return "Showing " + (end-start+1) + "  of " +total+" records"}
					else {return "Showing " + (end-start+1) + "  of " +total+" records (filtered from total " + max+" records)"}
				   	}, 
				 			   
		        dom: 'Bfrtip',
		        lengthMenu: [
		                     [ -1 ],
		                     [ 'Show all' ]
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
	    title: 'RVNL PROJECT DOCUMENT MONTHWISE REPORT',
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
			                  
			                 title: 'RVNL PROJECT DOCUMENT MONTHWISE REPORT',
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
			  var nc=2; //nc1+1;
			  var bc=2; //nc1+1;
			  var pageTotal=[];
			  var total=[];
			 while (nc<4) {		            
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
	<div style="text-align: center;font-size: 18px;"><b>RVNL Project Document Monthwise Report  </b></div></br>
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
	String zone=request.getParameter("zone");
	String division=request.getParameter("division");
		String piu1 = request.getParameter("PIU_name");
		String projtype = request.getParameter("projtype");
		String project = request.getParameter("project");
		String docType2 = request.getParameter("doctype");
		String docType = URLEncoder.encode(docType2, "UTF-8");
		String backurl = request.getParameter("backurl");
		session.setAttribute( "backurl", backurl );
		if ( division.equalsIgnoreCase("none") ){
			division="";
		}
			
		if(division.equalsIgnoreCase("-1")){
			division="";
		}
		
		
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
	
	int nc=0;
	String header=" ";
	String uri = request.getScheme() + "://" +   // "http" + "://
            request.getServerName() +       // "myhost"
            ":" +                           // ":"
            request.getServerPort() +       // "8080"
            request.getRequestURI() +       // "/people"
            "?" +                           // "?"
            request.getQueryString();  
	
	session.setAttribute( "BackUrl", uri );
	
	if(zone !=""){
		header="   "+header+"  "+"Zone :"+zone+ " "+"<br> ";
		%>
		<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
		&nbsp;&nbsp;&nbsp;&nbsp;Zone :<b> <%=zone%></b>
		<INPUT Type="hidden" name="zone1" id="zone1" value="<%=zone %>" />
</font>
</th>
					<%
		
	}if(division !=""){
		header=" "+header+"  "+"Division :"+division+" "+" ";
		%>
		<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
		&nbsp;&nbsp;&nbsp;&nbsp;Division :<b> <%=division%></b>
		<INPUT Type="hidden" name="division1" id="division1" value="<%=division %>" />
</font>
</th>
		<%
		
	}
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
			
	// year month string ......
	 Calendar cal = Calendar.getInstance();  //Get current date/month i.e 19 Nov, 2017
	 cal.add(Calendar.MONTH, -12);   //Go to date, 11 months ago 19 Dec, 2016
	 //cal.set(Calendar.DAY_OF_MONTH, 1); //set date, to make it 1 Dec, 2016
	 SimpleDateFormat monthDate = new SimpleDateFormat("MMM-yy");
	 int month1=0;
	 int year1=0;
	 int day1=0;
	 String month_name1=null;
	 String aa1="(SELECT ";
	 String sdate1=null;
	 String edate1=null;
	 int yrmm=0;
	 for (int i = 1; i < 13; i++) {
	    // Calendar calendar1 = Calendar.getInstance();
	     cal.add(Calendar.MONTH, 1);
	     month_name1 = monthDate.format(cal.getTime());
	     month1=cal.get(Calendar.MONTH)+1;
	     year1=cal.get(Calendar.YEAR);
	     day1=cal.get(Calendar.DAY_OF_MONTH);
	     yrmm=year1*100+month1;
	      if (i==1) {
	    	  aa1=aa1+ yrmm+ " as MM, '"+ month_name1+"' as MM2 ";
	    	  sdate1=year1+"-"+month1+"-"+"01";
	        } else {
	    	  aa1=aa1+" UNION ALL SELECT "+ yrmm+ ", '"+ month_name1+"' ";  
	    	  edate1=year1+"-"+month1+"-"+day1; 
	      }
	  }
	 aa1=aa1+") as aa ";
	 //System.out.println(aa1);
	 
	 //SimpleDateFormat monthDate1 = new SimpleDateFormat("yyyy");

	 
	 String nrly1=null, nrvnl1=null, nothers1=null, ndivn1=null;
	 String query22="select aa.mm2, if(pks.mc!='',pks.mc,0) as Doc_submit, if(pks2.ma!='',pks2.ma,0) as Doc_appd  from " + aa1+" left join (select sno, month_submit, count(month_submit) as mc  from (select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,concat(year(docm.Date_of_Submission)*100+month(docm.Date_of_Submission)) as sno, concat(SUBSTRING(monthname(docm.Date_of_Submission),1,3),'-',substring(year(docm.date_of_Submission),3,2)) as month_submit, docm.Document_status,ram.CurrentDate,concat(SUBSTRING(monthname(ram.CurrentDate),1,3),'-',substring(year(ram.CurrentDate),3,2)) as month_action, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id, projm.Project_Type from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy and Date(Date_of_Submission) between '"+sdate1+"' and '" + edate1+"' " ;
		String query23=") as pks1 group by month_submit) as pks on aa.MM=pks.sno left join (select sno1, month_action, count(month_action) as ma  from (select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,(year(docm.Date_of_Submission)*100+month(docm.Date_of_Submission)) as sno, concat(SUBSTRING(monthname(docm.Date_of_Submission),1,3),'-',substring(year(docm.date_of_Submission),3,2)) as month_submit, docm.Document_status,ram.CurrentDate,(year(ram.CurrentDate)*100+month(ram.CurrentDate)) as sno1, concat(SUBSTRING(monthname(ram.CurrentDate),1,3),'-',substring(year(ram.CurrentDate),3,2)) as month_action, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id, projm.Project_Type from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy and Date(Date_of_Submission) between '"+sdate1+"' and '"+edate1+"' and docm.Document_Status='Finally Approved' ";
		String query24=") as pks11 group by month_action) as pks2 on aa.MM=pks2.sno1 order by aa.MM";
		
			
		//	String query1 = "select Q2.*,Q1.nprepared, Q1.nappd, Q1.npending, Q1.notforwd from (select  Piu_Of_RVNL, project, package_name, Project_Id, package_id, document_type, Document_Status, count(Document_Map_ID) as pcount, count(Document_Map_ID) as nprepared, count(if(Document_status='Finally approved',Document_Map_ID, null)) as nappd, count(if((Forwarded='yes' and Document_status='Pending'),Document_Map_ID, null)) as npending, count(if(((Forwarded='No' or isnull(Forwarded)=true) and Document_status='Pending'),Document_Map_ID, null)) as notforwd from (select docm.Document_Map_ID, projm.PIU_of_RVNL,projm.Project,pkgm.package_name,pkgm.package_id, projm.project_id, docm.Document_Type,docm.forwarded, docm.Document_Status  from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm where projm.project_id = docm.project_id  and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID  and docm.ShowInReport='y') as q1 group by q1.PIU_of_RVNL, q1.package_id, q1.project_id, q1.Document_Type) as Q1 right join (select a.PIU_of_RVNL, a.Project, b.package_name, b.package_id, a.project_id, d.Document_Type, c.nos_reqd from xx_projectattributes_master a, xx_packages_project b, xx_project_docnos c, xx_documentattributes_master d where b.package_id = c.package_id and a.project_id=c.project_id and c.document_type_id=d.document_Type_Id) as Q2 on Q1.package_id = Q2.package_id and Q1.project_id=Q2.project_id and Q1.document_type = Q2.document_Type";
			//select Q2.*,Q1.nprepared, Q1.nappd, Q1.npending from (select projm.PIU_of_RVNL,projm.Project,pkgm.package_name,pkgm.package_id, projm.project_id, docm.Document_Type,count(docm.Document_Map_ID) as nprepared, count(if(docm.Document_status='Finally Q1pproved',docm.Document_Map_ID, null)) as nappd, count(if((docm.Forwarded='yes' and docm.Document_status='Pending'),docm.Document_Map_ID, null)) as npending from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm where projm.project_id = docm.project_id  and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID  and docm.ShowInReport='y' group by docm.Zone,docm.Division, projm.PIU_of_RVNL,projm.Project,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type) as Q1 right join (select a.PIU_of_RVNL, a.Project, b.package_name, b.package_id, a.project_id, d.Document_Type, c.nos_reqd from xx_projectattributes_master a, xx_packages_project b, xx_project_docnos c, xx_documentattributes_master d where b.package_id = c.package_id and a.project_id=c.project_id and c.document_type_id=d.document_Type_Id) as Q2 on Q1.package_id = Q2.package_id and Q1.project_id=Q2.project_id and Q1.document_type = Q2.document_Type";
			String query=null;
		if (piu1 != "") {
			if (query==null) {
			query=" PIU_of_RVNL='"+piu1+"'";
		} else {
			query=query+" and PIU_of_RVNL='"+piu1+"'";
		}
		}
		if (projtype != "") {
			if (query==null) {
				query=" Project_Type='"+projtype+"'";
			} else {
				query=query+" and Project_Type='"+projtype+"'";
			}
		}

			if (project != "") {
				if (query==null) {
				query=" Project ='"+project+"'";
			} else {
				query=query+" and Project ='"+project+"'";
			}
			}
				if (docType != "") {
					if (query==null) {
					query=" Document_Type='"+docType2+"'";
				} else {
					query=query+" and Document_Type='"+docType2+"'";
				}
				}
				if((!zone.equalsIgnoreCase("")) || (zone.equalsIgnoreCase("none"))){
					
					if(!division.equalsIgnoreCase("") ){
						  
						query=query+"  and docm.Zone='"+zone+"'";
						 query=query+"  and docm.Division='"+division+"'";
												
					}else{
									   
					query=query+"  and docm.Zone='"+zone+"'";
					
					}
				}

				
			//	System.out.println("qq"+query);
			if (query!=null) {
		query22=query22+" and "+query;
		query23=query23+" and "+query;
			}
		String query25=query22+query23+query24;
		//System.out.println("qq"+query25);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query25);
	
	%>
<table align="center" width="40%"><tr><td>
	<table border=1 class="table table-hover table-bordered"
		style="background-color: #F0FFFF" id="example" class="display nowrap" cellspacing="0" width="100%">
		<thead>
		<tr class="success">
			<th   style="padding: 5px 10px 10px 5px;">S.No.</th>
			<% int n=0;
					%>
			
			<th width="90px" style="padding:10px 10px 10px 10px;">Month & Year</th>
				<th width="90px" style="padding:10px 10px 10px 10px;">Nos. Submitted</th>
					<th width="90px" style="padding:10px 10px 10px 10px;">Nos. Approved</th>
				</tr>
					</thead>
<tfoot>	
<th colspan="2" ><center><b>Total</b></center></th><th></th><th></th>
		</tfoot>
		<tbody>
		<% int i=1;
			   	while (rs.next()) {

				//String Zone_name = rs.getString(1);
				//String division1 = rs.getString(2);
				//String piu = rs.getString(1);
				//String proj = rs.getString(2);
				//String packn = rs.getString(3);
				//String doctyp = rs.getString(6);
				String yymm1 = rs.getString(1);
				String nsub = rs.getString(2);
				String nappd = rs.getString(3);
				//String npending = rs.getString(10);
			//System.out.println("appd="+nappd+"pend"+npending+"doct"+doctyp);		
				
			%>
		<tr class="active">
			<td><%=i%></td>
			<%
			if (yymm1 == null) {
				%>
					<td><center>-</center></td>
				<%	
				} else {
				%>
					<td><center><%=yymm1 %></center></td>
					<% } 
			if (nsub == null) {
				%>
					<td><center>-</center></td>
				<% } else {
				%>
					<td><center><%=nsub %></center></td>
					<% } 
				if (nappd == null || nappd.equalsIgnoreCase("0")) {
			%>
				<td><center>-</center></td>
			<%	} else {
			%>
			<td><center><%=nappd%></center></td>
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
	</table></td></tr>
	</table>
	<br>
		<input type="button" value="close" class="btn btn-primary" onclick="closeMe();" style="margin-left: 50%;"> 
	
	<%
		if (exportToExcel == null) {
	
	
		}
	%>
	<br>
	<!-- <a href="#" onclick="javascript:window.print();">Print this page</a> -->
<br>
</body>

</html>