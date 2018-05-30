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
		var zone1=document.getElementById("zone1");
		
		if(zone1==null){
			zone1="";
		}else{
			var zone1=document.getElementById("zone1").value;
			zone1="Zone :"+zone1; nc1--;
		}
		
		var status1=document.getElementById("status1");
		if(status1==null){
			status1="";
		}else{
			var status1=document.getElementById("status1").value;
			status1="Status:"+status1;
		}
		var division1=document.getElementById("division1");
		if(division1==null){
			division1="";
		}else{
			var division1=document.getElementById("division1").value;
			division1="Division :"+division1; nc1--;
		}
		piu1=document.getElementById("piu1");
		if(piu1==null){
			piu1="";
		}
		else{
			piu1=document.getElementById("piu1").value;
			piu1="PIU :"+piu1;
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
			project1="Project :"+project1;
		}
		var docType1=document.getElementById("docType1");
		if(docType1==null){
			docType1="";
		}
		else{
			var docType1=document.getElementById("docType1").value;
			docType1="Document Name :"+docType1;
		}
		var eDate1=document.getElementById("eDate1");
		if(eDate1==null){
			eDate1="";
		}
		else{
			var eDate1=document.getElementById("eDate1").value;
			eDate1="Submitted Before :"+eDate1;
		}
		var sDate1=document.getElementById("sDate1");
		if(sDate1==null){
			sDate1="";
		}
		else{
			var sDate1=document.getElementById("sDate1").value;
			sDate1="Submitted After :"+sDate1;
		}
		var majsec1=document.getElementById("majsec1");
		if(majsec1==null){
			majsec1="";
		}
		else{
			var majsec1=document.getElementById("majsec1").value;
			majsec1="Major Section :"+majsec1;
		}
		var smajsec1=document.getElementById("smajsec1");
		if(smajsec1==null){
			smajsec1="";
		}
		else{
			var smajsec1=document.getElementById("smajsec1").value;
			smajsec1="Major Section :"+smajsec1;
		}
		var frmkm1=document.getElementById("frmkm1");
		if(frmkm1==null){
			frmkm1="";
		}
		else{
			var frmkm1=document.getElementById("frmkm1").value;
			frmkm1="From Km :"+frmkm1;
		}
		var tokm1=document.getElementById("tokm1");
		if(tokm1==null){
			tokm1="";
		}
		else{
			var tokm1=document.getElementById("tokm1").value;
			tokm1="To Km :"+tokm1;
		}
		var frmstn1=document.getElementById("frmstn1");
		if(frmstn1==null){
			frmstn1="";
		}
		else{
			var frmstn1=document.getElementById("frmstn1").value;
			var frmstnkm1=document.getElementById("frmstnkm1").value;
			frmstn1="From Station (Km) :"+frmstn1+" ("+frmstnkm1+")";
		}
		var tostn1=document.getElementById("tostn1");
		if(tostn1==null){
			tostn1="";
		}
		else{
			var tostn1=document.getElementById("tostn1").value;
			var tostnkm1=document.getElementById("tostnkm1").value;
			tostn1="To Station (Km) :"+tostn1+" ("+tostnkm1+")";
		}
		var org1=document.getElementById("org1");
		if(org1==null){
			org1="";
		}
		else{
			var org1=document.getElementById("org1").value;
			org1="Pending with Organization :"+org1;
		}
		
		var pkl1=zone1+"               "+division1+"               "+piu1+"              "+projType1+"              "+project1;
	    var pkl2=status1+"              "+docType1+"               "+eDate1+"               "+sDate1;
	    var pkl3=majsec1+"               "+smajsec1;
	    var pkl4=frmkm1+"               "+tokm1+"               "+frmstn1+"               "+tostn1+"               "+org1;
	    
	   
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
	                 "columnDefs": [
	                     {
	                         "targets": [-1 ],
	                         "visible": false
	                     }
	                 ],
	                // columns: [':visible :not(:last-child)'],
	        buttons: [
'pageLength',

	                  
{exportOptions: {
	  
	// columns: [':visible :not(9)']
},
    extend: 'print',
    footer: true,
    message: message1,
    title: 'RVNL DOCUMENT DEPARTMENT WISE SUMMARY REPORT',
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
   // columns: [':visible :not(9)']
}, 
	                  
		                  
		                  //'print',
		                  
		                 title: 'RVNL DOCUMENT DEPARTMENT WISE SUMMARY REPORT',
		                  extend: 'excel',
		                  footer: true,
		                 
		                  fixedHeader: {
		                      header: true,
		                      footer: true
		                  },
		                  
		                  
		                  customize: function (xlsx) {
		                      var sheet = xlsx.xl.worksheets['sheet1.xml'];
		                      var numrows = 6;
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
		                      var r1 = Addrow(1, [{ key: 'F', value:  'RVNL DOCUMENT DEPARTMENT WISE SUMMARY REPORT' }]);
		                      var r2 = Addrow(2, [{ key: 'A', value: pkl1 }]);
		                       var r3 = Addrow(3, [{ key: 'A', value: pkl2 }]);
		                      var r4 = Addrow(4, [{ key: 'A', value: pkl3}]);
		                      var r5 = Addrow(5, [{ key: 'A', value: pkl4}]);
		                      
		                      sheet.childNodes[0].childNodes[1].innerHTML = r1+r2+r3+r4+r5+ sheet.childNodes[0].childNodes[1].innerHTML;	
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
			  var nc=0;
			  var bc=nc1+1;
			  var pageTotal=[];
			  var total=[];
			 while (nc<bc+5) {		            
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
			                nc++;
			        }
		   		
		   		nc=bc-1;
		   		while (nc<bc+5) {

		            // Update footer
		 	  if (nc!=bc) {   $( api.column( nc ).footer() ).html('<center>'+
		              pageTotal[nc] +'<br> (Total '+ total[nc] +') </center>'
		            ); } else  {
		           
			$( api.column( bc ).footer() ).html('<center>'+
		            (pageTotal[bc+4]/pageTotal[bc-1]).toFixed(2) +'<br> (Total '+ (total[bc+4]/total[bc-1]).toFixed(2) +') </center>'
		           );
		   			}
	                  nc++;
	                  }
	   		}
	    } );
	    
	} );
</script>

</head>
<body onload="mywinClose();">
	<div style="text-align: center;font-size: 18px;"><b>RVNL Document Department wise Summary Report  </b></div></br>
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
		String status = request.getParameter("status");
		String project = request.getParameter("project");
		String docType2 = request.getParameter("doctype");
		if (docType2!=null) {
			 docType = URLEncoder.encode(docType2, "UTF-8");
			}
		//String sDate = request.getParameter("sDate");
		//String eDate = request.getParameter("eDate");
		String projtype = request.getParameter("projtype");
		String  majsec = request.getParameter("majsec");	
		String  smajsec = request.getParameter("smajsec");	
		String  frmkm = request.getParameter("frmkm");	
		String  tokm = request.getParameter("tokm");
		String  frmstn = request.getParameter("frmstn");	
		String  tostn = request.getParameter("tostn");	
		String  frmstnkm = request.getParameter("frmstnkm");	
		String  tostnkm = request.getParameter("tostnkm");	
		String  org = request.getParameter("orgName");	
		String sDate = request.getParameter("DateStart");
		String eDate = request.getParameter("DateEnd");
		String zone=request.getParameter("zone");
		String division=request.getParameter("division");
		String Date_of_Submission ="";
		String backurl = request.getParameter("backurl");
		session.setAttribute( "backurl", backurl );
		String t11=request.getParameter("t1");
		String t12=request.getParameter("t2");
		int t1=Integer.parseInt(t11);
		int t2=Integer.parseInt(t12);
		if ( division.equalsIgnoreCase("none") ){
			division="";
		}
			
		if(division.equalsIgnoreCase("-1")){
			division="";
		}
		
		//String ds1 = "2016/06/29";30/09/2012
		// for start Date format
		
		
		
		
	%>
	<!-- <div id="pagereport" style="text-align:center;fontsize=4px;">
	<b style="font-size:20px;text-decoration: underline;">PIU WISE REPORT  </b></br>
	
	 </p>
	
	</div> -->
	<table border=0 class="table table-hover table-bordered"
		style="background: bisque;">
		<tr class="">
		
		
		
	<%
	String header=" ";
	String uri = request.getScheme() + "://" +   // "http" + "://
            request.getServerName() +       // "myhost"
            ":" +                           // ":"
            request.getServerPort() +       // "8080"
            request.getRequestURI() +       // "/people"
            "?" +                           // "?"
            request.getQueryString();  
	
	session.setAttribute( "BackUrl", uri );
	if (status != "") {
		header="   "+header+ "Status : " +status+ "    "+" ";
		%>
		<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
				&nbsp;&nbsp;&nbsp;&nbsp;Status :<b> <%=status%></b>
				<INPUT Type="hidden" name="status1" id="status1" value="<%=status %>" />
		</font>
		</th>
		<%
			}
	
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
			header=" "+header+"  "+"PIU Name :  " +piu1+ "  "+" <br>";
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
					header=" "+header+" "+"Project :  "+project+" "+" ";
			%>
			<th width="450px" align="left" style="background-color: #ffff;"><font size=3px>
					&nbsp;&nbsp;&nbsp;&nbsp;Project :  <b> <%=project%></b>
					<INPUT Type="hidden" name="project1" id="project1" value="<%=project %>" />
			</font>
			</th>
			<%
				}
			
				if (docType != "") {
					header=" "+header+"  "+"Document Type :  "+docType2+" "+" "+" <br>";;
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
			
				if(sDate!=""){
					header=" "+header+"  "+"Submitted After :  "+sDate+" ";
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							&nbsp;&nbsp;&nbsp;&nbsp;Submitted After :<b> <%=sDate%></b>
							<INPUT Type="hidden" name="sDate1" id="sDate1" value="<%=sDate %>" />
					</font></th>
					<%
					}
						
						if(eDate!=""){
							header=header+"  "+"Submitted Before :  "+eDate+" ";
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							&nbsp;&nbsp;&nbsp;&nbsp;Submitted Before :  <b> <%=eDate%></b>
							<INPUT Type="hidden" name="eDate1" id="eDate1" value="<%=eDate %>" />
					</font></th>
					<%
					}
						if(smajsec!=""){
							header=header+"<br> "+"  "+"Major Section :  "+smajsec+" ";
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							&nbsp;&nbsp;&nbsp;&nbsp;Major Section :  <b> <%=smajsec%></b>
							<INPUT Type="hidden" name="smajsec1" id="smajsec1" value="<%=smajsec %>" />
					</font></th>
					<%
					}
						if(majsec!=""){
							header=header+"  "+"Major Section :  "+majsec+" ";
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							&nbsp;&nbsp;&nbsp;&nbsp;Major Section :  <b> <%=majsec%></b>
							<INPUT Type="hidden" name="majsec1" id="majsec1" value="<%=majsec %>" />
					</font></th>
					<%
						}
						if(frmkm!=""){
							header=header+"  "+"From Km :  "+frmkm+" ";
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							&nbsp;&nbsp;&nbsp;&nbsp;From Km :  <b> <%=frmkm%></b>
							<INPUT Type="hidden" name="frmkm1" id="frmkm1" value="<%=frmkm %>" />
					</font></th>
					<%
					}
						if(tokm!=""){
							header=header+"  "+"To Km :  "+tokm+" ";
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							&nbsp;&nbsp;&nbsp;&nbsp;To Km :  <b> <%=tokm%></b>
							<INPUT Type="hidden" name="tokm1" id="tokm1" value="<%=tokm %>" />
					</font></th>
					<%
					}
						if(frmstn!=""){
							header=header+"  "+"From Station :  "+frmstn+" (Km "+frmstnkm+")  ";
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							&nbsp;&nbsp;&nbsp;&nbsp;From Station :  <b> <%=frmstn%> &nbsp;(Km &nbsp;<%=frmstnkm%>)</b> 
							<INPUT Type="hidden" name="frmstn1" id="frmstn1" value="<%=frmstn %>" />
							<INPUT Type="hidden" name="frmstnkm1" id="frmstnkm1" value="<%=frmstnkm %>" />
					</font></th>
					<%
					}
						if(tostn!=""){
							header=header+"  "+"To Station :  "+tostn+" (Km "+tostnkm+")  "+"<br> ";
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							&nbsp;&nbsp;&nbsp;&nbsp;To Station :  <b> <%=tostn%> &nbsp;(Km &nbsp; <%=tostnkm%>)</b>
							<INPUT Type="hidden" name="tostn1" id="tostn1" value="<%=tostn %>" />
							<INPUT Type="hidden" name="tostnkm1" id="tostnkm1" value="<%=tostnkm %>" />
					</font></th>
					<%
					}			
						if(org!=""){
							header=header+"  "+"Pending with Organization :  "+org+" ";
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							&nbsp;&nbsp;&nbsp;&nbsp;Pending with Organization :  <b> <%=org%></b>
							<INPUT Type="hidden" name="org1" id="org1" value="<%=org %>" />
					</font></th>
					<%
					}
				
	%></tr></table>
	<INPUT Type="hidden" name="message1" id="message1" value="<%=header %>" />
	<br>
	<%
	String url2=null;
	
		Date dateofsub;
		Date currentdate;
		Date pDate;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null,rs11=null;
		String arguments=null;
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

		conn = ds.getConnection();
	
		String query = "select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,docm.Document_status,ram.CurrentDate,ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.Department, DATEDIFF(ifnull(ram.ActionedOn,now()),ifnull(ram.CurrentDate,docm.date_of_submission)) as pendingsince, BMR.ActionPerformed, BMR.tot_aging, docm.Zone,BMR.division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, projm.Project_Type from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select division,  department, ActionPerformed, document_id, sum(BMR_aging) as tot_aging  from (select if(b.type<>'MOR', if(c.division_hierarchyId <>null,c.division, 'Headquarters'), e.division_name) as division, if(b.type='RVNL','RVNL',if(b.Type='Others', om.Org_Name,d.Department_Name)) as Department, a.ActionPerformed, a.Document_id, DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)) as BMR_Aging from xx_record_actions a left join xx_user_master b on a.ActionPerformedBy=b.User_name left join xx_document_mapping c on a.Document_id=c.Document_Map_ID left join xx_departments_master d on b.Department_id=d.Department_id left join xx_divisions_map e on b.Division_ID=e.division_id left join xx_org_master om on b.Org_ID = om.Org_Id ) as BMR1  group by division,  Department, ActionPerformed, document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y'";
				
		
		if (piu1 != "") {
			query=query+" and projm.PIU_of_RVNL='"+piu1+"'";
			url2="ReportPIU.jsp?PIU_name="+URLEncoder.encode(piu1, "UTF-8");

		}
		if (projtype != "") {
			query=query+"  and projm.Project_Type='"+projtype+"'";
			if (url2!=null) {
				url2=url2+"&projtype="+projtype;
			} else { url2="ReportPIU.jsp?projtype="+projtype;
			}
		}

		if (project != "") {
			query=query+" and projm.Project='"+project+"'";
			if (url2!=null) {
				url2=url2+"&project="+project;
			} else { url2="ReportPIU.jsp?project="+URLEncoder.encode(project, "UTF-8");
			}
		}
		if (docType != "") {
			query=query+"  and docm.Document_Type='"+docType2+"'";
			if (url2!=null) {
				url2=url2+"&docType="+docType;
			} else { url2="ReportPIU.jsp?docType="+docType;
			}	
		}
		if (status != "") {
			query=query+" and docm.Document_Status='"+status+"'";
			if (url2!=null) {
				url2=url2+"&status="+status;
			} else { url2="ReportPIU.jsp?status="+status;
			}
		}
		if(sDate!="" && eDate!=""){
			


	Date sDate1 = new SimpleDateFormat("dd/MM/yyyy").parse(sDate);
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String sDatefin = formatter.format(sDate1);


	Date eDate1 = new SimpleDateFormat("dd/MM/yyyy").parse(eDate);
	SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	String eDatefin = formatter1.format(eDate1);

			query=query+" and docm.Date_of_Submission  >= '"+sDatefin+"' and docm.Date_of_Submission <= '"+eDatefin+"' ";
			if (url2!=null) {
				url2=url2+"&DateStart="+sDate+"&DateEnd="+eDate;
			} else { url2="ReportPIU.jsp?DateStart="+sDate+"&DateEnd="+eDate;
			}
		} 
		if((!zone.equalsIgnoreCase("")) || (zone.equalsIgnoreCase("none"))){
			
			if(!division.equalsIgnoreCase("") ){
				  
				query=query+"  and docm.Zone='"+zone+"'";
				 query=query+"  and BMR.Division='"+division+"'";
				 if (url2!=null) {
						url2=url2+"&zone="+zone+"&division="+division;
					} else { url2="ReportPIU.jsp?zone="+zone+"&division="+division;
					}
				
			}else{
			
			   
			   
			query=query+"  and docm.Zone='"+zone+"'";
			   
			 if (url2!=null) {
					url2=url2+"&zone="+zone;
				} else { url2="ReportPIU.jsp?zone="+zone;
				}
			
			   
			}
		}
		
		if (majsec != "") {
			query=query+" and loc1.Major_Section='"+majsec+"'";
		}
		if (smajsec != "") {
			query=query+" and loc1.Major_Section='"+smajsec+"'";
		}
		String bigkm=null, smallkm=null;
		if (tokm != ""  && frmkm != "") {
		if (Double.parseDouble(tokm) > Double.parseDouble(frmkm)) {
			 bigkm=tokm;
			 smallkm=frmkm;
		} else {
			 bigkm=frmkm;
			 smallkm=tokm;
		}
		}
		 
		if (frmkm != "") {
			if (tokm != "") {
		query=query+" and ((docm.From_Km>="+smallkm+ " and docm.From_Km<="+bigkm+") or (docm.To_Km>="+smallkm+ " and docm.To_Km<="+bigkm+") or (loc1.Station_Km>="+smallkm+" and loc1.Station_Km<="+bigkm+"))";
			} else {query=query+" and (docm.From_Km>="+frmkm+ " or docm.To_Km>="+frmkm+" or loc1.Station_km>="+frmkm+")";}
		} else {
			if (tokm != "") {
					query=query+" and (docm.From_Km<="+tokm+ " or docm.To_Km<="+tokm+" or loc1.Station_km<="+tokm+")";}
		}

		String bigkm1=null, smallkm1=null;
		if (tostnkm != ""  && frmstnkm != "") {
		if (Double.parseDouble(tostnkm) > Double.parseDouble(frmstnkm)) {
			 bigkm1=tostnkm;
			 smallkm1=frmstnkm;
		} else {
			 bigkm1=frmstnkm;
			 smallkm1=tostnkm;
		}
		}
	System.out.println("from stn km"+frmstnkm+"to km"+tostnkm);
		if (frmstnkm != "") {
			if (tostnkm != "") {
		  query=query+" and ((docm.From_Km>="+smallkm1+ " and docm.From_Km<="+bigkm1+") or (docm.To_Km>="+smallkm1+ " and docm.To_Km<="+bigkm1+") or (loc1.Station_Km>="+smallkm1+" and loc1.Station_Km<="+bigkm1+"))";
		 } else {query=query+" and (docm.From_Km>="+frmstnkm+ " or docm.To_Km>="+frmstnkm+" or loc1.Station_km>="+frmstnkm+")";}
		} else {
			if (tostnkm != "") {query=query+" and (docm.From_Km<="+tostnkm+ " or docm.To_Km<="+tostnkm+" or loc1.Station_km<="+tostnkm+")";}
		}
		if (org != "") {
			query=query+" and BMR.Department='"+org+"'";
		}
		String query1="select zone, division,  Department,  Round(avg(if (ActionPerformed='Finally Approved'  or ActionPerformed='Forward With Approval' or ActionPerformed='Returned to RVNL with approval' ,tot_Aging,null)),2) AS Sum_mor,  Count(if (ActionPerformed='Finally Approved'  or ActionPerformed='Forward With Approval' or ActionPerformed='Returned to RVNL with approval' ,1, null)) AS Fin_doc,  Count(if (document_status='Pending' and ActionPerformed='pending' and cast(pendingsince as signed integer)<="+t1+",1,null)) AS Pending_doc1, Count(if (document_status='Pending' and ActionPerformed='pending' and cast(pendingsince as signed integer) between "+ (t1+1) + " and " +t2+",1,null)) AS Pending_doc2, Count(if (document_status='Pending' and ActionPerformed='pending' and cast(pendingsince as signed integer)>"+t2+",1,null)) AS Pending_doc3, pendingsince, sum(if (ActionPerformed='Finally Approved'  or ActionPerformed='Forward With Approval' or ActionPerformed='Returned to RVNL with approval' ,tot_Aging,null)) AS Sum_mor_sum from (" + query+ ") as pkqry group by  zone, division, department";
		
				//"select zone, division,  Department,  Round(avg(if (document_status='Finally Approved' and ActionPerformed='Finally Approved',tot_Aging,null)),2) AS Sum_mor,  Count(if (document_status='Finally Approved' and ActionPerformed='Finally Approved',1, null)) AS Fin_doc,  Count(if (document_status='Pending' and ActionPerformed='pending' and cast(pendingsince as signed integer)<="+t1+",1,null)) AS Pending_doc1, Count(if (document_status='Pending' and ActionPerformed='pending' and cast(pendingsince as signed integer) between "+ (t1+1) + " and " +t2+",1,null)) AS Pending_doc2, Count(if (document_status='Pending' and ActionPerformed='pending' and cast(pendingsince as signed integer)>"+t2+",1,null)) AS Pending_doc3, pendingsince from (" + query+ ") as pkqry group by  zone, division, department";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query1);
		
			
	%>

	<table border=1 class="table table-hover table-bordered"
		style="background-color: #F0FFFF" id="example" class="display nowrap" cellspacing="0" width="100%">
		<thead>
		<tr class="success">
			<th width="50px" style="padding: 0px 14px 24px 0px;">S.No.</th>
			<% int n=3;
				if (zone == "") {
			%>
			<th width="120px" style="padding: 0px 88px 27px 54px;">Zone</th>
			<%
				} else {n--; }
			%>
			<%
				if (division == "") {
			%>
			<th width="150px"  style="padding: 0px 0px 26px 19px;">Division</th>
			<%
				} else {n--; }
			%>
			
			<th width="120px">Department</th>
			<th width="90px">Nos. Cleared</th>
			<th width="90px">Avg time taken for approval (days)</th>
			<th width="120px">Nos. pending with Current User (upto <%=t1 %> days)</th>
			<th width="120px">Nos. pending with Current User (<%=t1+1 %> to <%=t2 %> days)</th>
			<th width="120px">Nos. pending with Current User (more than <%=t2 %> days)</th>
			<th width="120px">Time taken for approval (days)</th>
		</tr></thead>
		<tfoot>	
<% n++;
int c=1;
%>
<th colspan='<%=n %>'><center><b>Total</b></center></th>
<% while (c<7) {
%>
<th></th>
<%
System.out.println("ccc"+c+"n"+n);
c++;
} %>
		</tfoot>
		
		<tbody>
		<% int i=1;
		   	while (rs.next()) {

				String Zone_name = rs.getString(1);
				String division1 = rs.getString(2);
				//String piu = rs.getString(3);
				String dept = rs.getString(3);
				//String proj = rs.getString(4);
				//String packn = rs.getString(5);
				String appd = rs.getString(5);
				String sum_mor = rs.getString(4);
				String sum_mor_sum= rs.getString(10);
				String pending1 = rs.getString(6);
				String pending2 = rs.getString(7);
				String pending3 = rs.getString(8);
				 
							
			%>
		<tr class="active">
			<td><%=i%></td>
			<%
				if (zone != "") {
			%>
			<%
				} else {
			%>		
			<td><%=Zone_name%></td>
			<%
			Zone_name = URLEncoder.encode(Zone_name, "UTF-8");
				}
			%>
			<%
				if (division != "") {
			%>
			<%
				} else {
			%>		
			<td><%=division1%></td>
			<%
			System.out.println("000"+division1);
			division1 = URLEncoder.encode(division1, "UTF-8");
				}
			%>
			<td><%=dept%></td>
			<%
			//System.out.println("111"+project+"22"+piu1);
			String project2 = URLEncoder.encode(project, "UTF-8");
			String piu2 = URLEncoder.encode(piu1, "UTF-8");
			String dept2 = URLEncoder.encode(dept, "UTF-8");
			String majsec2 = URLEncoder.encode(majsec, "UTF-8");
			String smajsec2 = URLEncoder.encode(smajsec, "UTF-8");
			String org2 = URLEncoder.encode(org, "UTF-8");
			//System.out.println("111"+project2+"22"+piu2);
			String url21="ReportPIU_Spl_details.jsp?zone="+Zone_name+"&division="+division1+"&dept="+dept+"&PIU_name="+piu2+"&project="+project2+"&status="+status+"&docType="+docType+"&DateStart="+sDate+"&DateEnd="+eDate+"&t1=0&t2=0&majsec="+majsec2+"&smajsec="+smajsec2+"&frmkm="+frmkm+"&tokm="+tokm+"&frmstn="+frmstn+"&tostn="+tostn+"&frmstnkm="+frmstnkm+"&tostnkm="+tostnkm+"&orgName="+org2;
			String url31=url21.replace(" ","+");
			String url41="ReportPIU_Spl_details.jsp?zone="+Zone_name+"&division="+division1+"&dept="+dept+"&PIU_name="+piu2+"&project="+project2+"&status="+status+"&docType="+docType+"&DateStart="+sDate+"&DateEnd="+eDate+"&t1="+t1+"&t2="+t2+"&majsec="+majsec2+"&smajsec="+smajsec2+"&frmkm="+frmkm+"&tokm="+tokm+"&frmstn="+frmstn+"&tostn="+tostn+"&frmstnkm="+frmstnkm+"&tostnkm="+tostnkm+"&orgName="+org2;
			String url51=url41.replace(" ","+");
			if (appd.equalsIgnoreCase("0")) {
			%>
				<td><center>-</center></td>
			<%	} else {
			%>
			<td><center><a href="<%=url31 %>&tcode=5"><%=appd%></a></center></td>
			<% } 
			if (sum_mor==null) {
			%>
			<td><center>-</center></td>
			<%	} else {
			%>
			<td><center><%=sum_mor%></center></td>
			<%}
			if (pending1.equalsIgnoreCase("0")) {
				%>
					<td><center>-</center></td>
				<%	} else {
				%>
					<td><center><a href="<%=url51 %>&tcode=1"><%=pending1 %></a></center></td>
					<% } 
				
			if (pending2.equalsIgnoreCase("0")) {
			%>
				<td><center>-</center></td>
			<%	} else {
			%>
				<td><center><a href="<%=url51 %>&tcode=2"><%=pending2 %></a></center></td>
				<% } 
			
		if (pending3.equalsIgnoreCase("0")) {
			%>
				<td><center>-</center></td>
			<%	} else {
			%>
				<td><center><a href="<%=url51 %>&tcode=3"><%=pending3 %></a></center></td>
				<% } 
		if (sum_mor_sum==null) {
			%>
			<td><center>-</center></td>
			<%	} else {
			%>
			<td><center><%=sum_mor_sum%></center></td>
			<%}
			%>			
			
			
		</tr>
		<%
		i++;
			}
		%>
		</tbody>
	</table>
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

</body>

</html>