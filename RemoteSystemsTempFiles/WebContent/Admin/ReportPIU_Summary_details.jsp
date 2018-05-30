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
		
		var message1=document.getElementById("message1").value;
		var zone1=document.getElementById("zone1");
	
		if(zone1==null){
			zone1="";
		}else{
			var zone1=document.getElementById("zone1").value;
			zone1="Zone :"+zone1;
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
			division1="Division :"+division1;
		}
		var piu1=document.getElementById("piu1");
		if(piu1==null){
			piu1="";
		}
		else{
			piu1=document.getElementById("piu1").value;
			piu1="PIU :"+piu1;
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
			docType1=document.getElementById("docType1").value;
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
		var suser1=document.getElementById("suser1");
		if(suser1==null){
			suser1="";
		}
		else{
			var suser1=document.getElementById("suser1").value;
			suser1="Currently With :"+suser1;
		}
		var packn1=document.getElementById("packn1");
		if(packn1==null){
			packn1="";
		}
		else{
			var packn1=document.getElementById("packn1").value;
			packn1="Package :"+packn1;
		}
	
		var t3_1=document.getElementById("t3_1");
		if(t3_1==null){
			t3_1="";
		}
		else{
			var t3_1=document.getElementById("t3_1").value;
			t3_1="Under Approval for more than (days) :"+t3_1;
		}
		
		var tc1=document.getElementById("tc1");
		if(tc1==null){
			tc1="";
		}
		else{
			var tc1=document.getElementById("tc1").value;
			tc1="Under Approval of MOR for last :"+tc1+" days";
		}
		
		var tc210=document.getElementById("tc21");
		var tc220=document.getElementById("tc22");
		
		if(tc210==null && tc220==null){
		var	tc2="";
		}
		else{
			var tc210=document.getElementById("tc21").value;
			var tc220=document.getElementById("tc22").value;
			var	tc2="Under Approval of MOR for > :"+tc210+ " days & <= :"+tc220+" days";
		}
		
		var tc3=document.getElementById("tc3");
		if(tc3==null){
			tc3="";
		}
		else{
			var tc3=document.getElementById("tc3").value;
			tc3="Under Approval of MOR for  more than :"+tc3+" days";
		}
		var tc11=document.getElementById("tc11");
		if(tc11==null){
			tc11="";
		}
		else{
			var tc11=document.getElementById("tc11").value;
			tc11="Under Approval of Other Orgn for last :"+tc11+" days";
		}
		
		var tc211=document.getElementById("tc211");
		var tc212=document.getElementById("tc212");
		
		if(tc211==null && tc212==null){
		var	tc21="";
		}
		else{
			var tc211=document.getElementById("tc211").value;
			var tc212=document.getElementById("tc212").value;
			var	tc21="Under Approval of Other Orgn for > :"+tc211+ " days & <= :"+tc212+" days";
		}
		
		var tc31=document.getElementById("tc31");
		if(tc31==null){
			tc31="";
		}
		else{
			var tc31=document.getElementById("tc31").value;
			tc31="Under Approval of Other Orgn for  more than :"+tc31+" days";
		}
		var tc12=document.getElementById("tc12");
		if(tc12==null){
			tc12="";
		}
		else{
			var tc12=document.getElementById("tc12").value;
			tc12="Pending with RVNL for Complinace for last :"+tc12+" days";
		}
		
		var tc221=document.getElementById("tc221");
		var tc222=document.getElementById("tc222");
		
		if(tc221==null && tc222==null){
		var	tc22="";
		}
		else{
			var tc221=document.getElementById("tc221").value;
			var tc222=document.getElementById("tc222").value;
			var	tc22="Pending with RVNL for Complinace for > :"+tc221+ " days & <= :"+tc222+" days";
		}
		
		var tc32=document.getElementById("tc32");
		if(tc32==null){
			tc32="";
		}
		else{
			var tc32=document.getElementById("tc32").value;
			tc32="Pending with RVNL for Complinace for  more than :"+tc32+" days";
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
		
		var pkl1=zone1+"               "+division1+"               "+piu1+"              "+project1+"              "+packn1;
	    var pkl2=status1+"              "+docType1+"               "+eDate1+"               "+sDate1;
	    var pkl3=suser1+"      "+t3_1+"      "+tc1+"     "+tc2+"      "+tc3+"               "+majsec1+"               "+smajsec1;
	    var pkl4=frmkm1+"               "+tokm1+"               "+frmstn1+"               "+tostn1+"               "+org1;
	   	
		
	   //alert("lko.."+pkl1+"zone"+zone1);
	   		$('#example').DataTable( {
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



	                  
{exportOptions: {
	  
	 columns: [':visible :not(:last-child)']
},
    extend: 'print',
    message: message1,
    title: 'RVNL DOCUMENT REPORT',
    customize: function (win) {
        $(win.document.body).find('table').addClass('display').css('font-size', '9px');
        $(win.document.body).find('tr:nth-child(odd) td').each(function(index){
            $(this).css('background-color','#D0D0D0');
        });
        $(win.document.body).find('h1').css('text-align','center');
    }
},
	                  
{exportOptions: {
    columns: [':visible :not(:last-child)']
}, 
	                  
		                  
		                  //'print',
		                  
		                 title: 'RVNL DOCUMENT REPORT',
		                  extend: 'excel',
		                  
		                 
		                  fixedHeader: {
		                      header: true,
		                      footer: true
		                  },
		                  
		                  
		                  customize: function (xlsx) {
		                      var sheet = xlsx.xl.worksheets['sheet1.xml'];
		                      var numrows = 7;
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
		                      var r4 = Addrow(4, [{ key: 'A', value: pkl3}]);
		                      var r5 = Addrow(5, [{ key: 'A', value: pkl4}]);
		                      
		                      sheet.childNodes[0].childNodes[1].innerHTML = r1+r2+r3+r4+r5+ sheet.childNodes[0].childNodes[1].innerHTML;	
		                  }
		                  
		                  
		                  
		                  }
	                  
	                  ]
	    } );
	    
	} );
</script>

</head>
<body onload="mywinClose();">
	<div style="text-align: center;font-size: 18px;"><b>RVNL Document Report  </b></div></br>
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

		String user99 = (String)session.getAttribute("user_name");
	String docType=null;
		String piu1 = request.getParameter("PIU_name");
		String status = request.getParameter("status");
		String project = request.getParameter("project");
		String packn = request.getParameter("packno");
		String docType2 = request.getParameter("docType");
		if (docType2!=null) {
			 docType = URLEncoder.encode(docType2, "UTF-8");
			}
		String t3="", suser="";
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
		String t11=request.getParameter("t1");
		String t12=request.getParameter("t2");
		int t1=Integer.parseInt(t11);
		int t2=Integer.parseInt(t12);
		String tcode = request.getParameter("tcode");
		String ActionPerformed=request.getParameter("ActionPerformed");
		String Date_of_Submission ="";
		String backurl = request.getParameter("backurl");
		System.out.println("rrr.."+zone+"rrr.."+division+"kkk"+sDate+eDate+tcode);
		session.setAttribute( "backurl", backurl );
		
	
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
		header="   "+header+"  "+"Zone :"+zone+ " "+"    ";
		%>
		<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
		Zone :<b> <%=zone%></b>
		<INPUT Type="hidden" name="zone1" id="zone1" value="<%=zone %>" />
</font>
</th>
					<%
		
	}if(division !=""){
		header=" "+header+"  "+"Division :"+division+" "+" ";
		%>
		<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
		Division :<b> <%=division%></b>
		<INPUT Type="hidden" name="division1" id="division1" value="<%=division %>" />
</font>
</th>
		<%
		
	}
		if (piu1 != "") {
			header=" "+header+"  "+"PIU Name :  " +piu1+ "  "+" <br>";
	%>
	
	
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>PIU
					Name :<b> <%=piu1%></b>
					<INPUT Type="hidden" name="piu1" id="piu1" value="<%=piu1 %>" />
			</font>
			</th>
			<%
				}
				if (project != "") {
					header=" "+header+" "+"Project :  "+project+" "+" ";
			%>
			<th width="450px" align="left" style="background-color: #ffff;"><font size=3px>
					Project :  <b> <%=project%></b>
					<INPUT Type="hidden" name="project1" id="project1" value="<%=project %>" />
			</font>
			</th>
			<%
				}
			
				if (docType != "") {
					header=" "+header+"            "+"Document Type :  "+docType2+" "+" "+" <br>";;
			%>
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
					Document Type :<b> <%=docType2%></b>
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
							Submitted After :<b> <%=sDate%></b>
							<INPUT Type="hidden" name="sDate1" id="sDate1" value="<%=sDate %>" />
					</font></th>
					<%
					}
						
						if(eDate!=""){
							header=header+"  "+"Submitted Before :  "+eDate+" ";
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							Submitted Before :  <b> <%=eDate%></b>
							<INPUT Type="hidden" name="eDate1" id="eDate1" value="<%=eDate %>" />
					</font></th>
					<%
					}
				 		
				   if(packn!=""){
							header=header+"  "+"Package :  "+packn+" ";
						
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							Package :  <b> <%=packn%></b>
							<INPUT Type="hidden" name="packn1" id="packn1" value="<%=packn %>" />
					</font></th>
					<%
					}
						if(suser!=""){
							header=header+"  "+"Railway User :  "+suser+" ";
					%>
					<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
							Currently With :  <b> <%=suser%></b>
							<INPUT Type="hidden" name="suser1" id="suser1" value="<%=suser %>" />
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
				
				if(t3!="" && t3=="0" && t3!="null"){
					
								header=header+"  "+"Under Approval for more than (days):  "+t3+" ";
						%>
						<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
								&nbsp;&nbsp;&nbsp;&nbsp;Under Approval for more than (days):  <b> <%=t3%></b>
								<INPUT Type="hidden" name="t3_1" id="t3_1" value="<%=t3 %>" />
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
				if(tcode.equalsIgnoreCase("1")){
					header=header+"  "+"Under Approval of Rly for last :"+t1+" days";
			%>
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
					Under Approval of Rly for last:  <b> <%=t1%></b>&nbsp; days
					<INPUT Type="hidden" name="tc1" id="tc1" value="<%=t1 %>" />
				</font></th>
			<%
			}
				if(tcode.equalsIgnoreCase("2")){
					header=header+"  "+"Under Approval of Rly for > :"+t1+" days & <= :" +t2+" days";
			%>
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
					Under Approval of Rly for > :  <b> <%=t1%></b> &nbsp; days  & <= :  <b> <%=t2%>&nbsp;days</b>
			<INPUT Type="hidden" name="tc210" id="tc210" value="<%=t1 %>" />	
			<INPUT Type="hidden" name="tc220" id="tc220" value="<%=t2 %>" />	
			</font></th>
			<%
			}
				if(tcode.equalsIgnoreCase("3")){
					header=header+"  "+"Under Approval of Rly for more than :  "+t2+" days";
			%>
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
					Under Approval of Rly for more than:  <b> <%=t2%></b>&nbsp; days
					<INPUT Type="hidden" name="tc3" id="tc3" value="<%=t2 %>" />
				</font></th>
			<%
			}
				if(tcode.equalsIgnoreCase("11")){
					header=header+"  "+"Under Approval of Other Orgn for last :"+t1+" days";
			%>
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
					Under Approval of Other Orgn for last:  <b> <%=t1%></b>&nbsp; days
					<INPUT Type="hidden" name="tc11" id="tc11" value="<%=t1 %>" />
				</font></th>
			<%
			}
				if(tcode.equalsIgnoreCase("21")){
					header=header+"  "+"Under Approval of Other Orgn for > :"+t1+" days & <= :" +t2+" days";
			%>
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
					Under Approval of Other Orgn for > :  <b> <%=t1%></b> &nbsp; days  & <= :  <b> <%=t2%>&nbsp;days</b>
			<INPUT Type="hidden" name="tc211" id="tc211" value="<%=t1 %>" />	
			<INPUT Type="hidden" name="tc212" id="tc212" value="<%=t2 %>" />	
			</font></th>
			<%
			}
				if(tcode.equalsIgnoreCase("31")){
					header=header+"  "+"Under Approval of Other Orgn for more than :  "+t2+" days";
			%>
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
					Under Approval of Other Orgn for more than :  <b> <%=t2%></b>&nbsp; days
					<INPUT Type="hidden" name="tc31" id="tc31" value="<%=t2 %>" />
				</font></th>
			<%
			}
				if(tcode.equalsIgnoreCase("12")){
					header=header+"  "+"Pending with RVNL for Compliance for last :"+t1+" days";
			%>
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
					Pending with RVNL for Compliance for last:  <b> <%=t1%></b>&nbsp; days
					<INPUT Type="hidden" name="tc12" id="tc12" value="<%=t1 %>" />
				</font></th>
			<%
			}
				if(tcode.equalsIgnoreCase("22")){
					header=header+"  "+"Pending with RVNL for Compliance for > :"+t1+" days & <= :" +t2+" days";
			%>
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
					Pending with RVNL for Compliance for > :  <b> <%=t1%></b> &nbsp; days  & <= :  <b> <%=t2%>&nbsp;days</b>
			<INPUT Type="hidden" name="tc221" id="tc221" value="<%=t1 %>" />	
			<INPUT Type="hidden" name="tc222" id="tc222" value="<%=t2 %>" />	
			</font></th>
			<%
			}
				if(tcode.equalsIgnoreCase("32")){
					header=header+"  "+"Pending with RVNL for Compliance for more than :  "+t2+" days";
			%>
			<th width="250px" align="left" style="background-color: #ffff;"><font size=3px>
					Pending with RVNL for Compliance for more than:  <b> <%=t2%></b>&nbsp; days
					<INPUT Type="hidden" name="tc32" id="tc32" value="<%=t2 %>" />
				</font></th>
			<%
			}
	%></tr></table>
	<INPUT Type="hidden" name="message1" id="message1" value="<%=header %>" />
	<br>
	<%
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
		String query = "select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,docm.Document_status,ram.CurrentDate,ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy";
		
		if (piu1 != "") {
			query=query+" and projm.PIU_of_RVNL='"+piu1+"'";
		}
		if (project != "") {
			query=query+" and projm.Project='"+project+"'";
		}
		if (docType != "") {
			query=query+"  and docm.Document_Type='"+docType2+"'";
		}
		if (status != "") {
			query=query+" and docm.Document_Status='"+status+"'";
		}
		if (packn != "") {
			query=query+" and pkgm.package_name ='"+packn+"'";
		}
		if(sDate!="" && eDate!=""){
			


	Date sDate1 = new SimpleDateFormat("dd/MM/yyyy").parse(sDate);
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String sDatefin = formatter.format(sDate1);


	Date eDate1 = new SimpleDateFormat("dd/MM/yyyy").parse(eDate);
	SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	String eDatefin = formatter1.format(eDate1);

			query=query+" and docm.Date_of_Submission  >= '"+sDatefin+"' and docm.Date_of_Submission <= '"+eDatefin+"' ";
		}
		if((!zone.equalsIgnoreCase("")) || (zone.equalsIgnoreCase("none"))){
			
			if(!division.equalsIgnoreCase("") ){
				  
				query=query+"  and docm.Zone='"+zone+"'";
				query=query+"  and docm.Division='"+division+"'";
				
				
			}else{
			
			   
			   
			query=query+"  and docm.Zone='"+zone+"'";
			   
			   
			   
			}
		}
	if (suser != "") {
			query=query+" and ram.ActionPerformedBy='"+suser+"'";
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
//System.out.println("from stn km"+frmstnkm+"to km"+tostnkm);
	if (frmstnkm != "") {
		if (tostnkm != "") {
	  query=query+" and ((docm.From_Km>="+smallkm1+ " and docm.From_Km<="+bigkm1+") or (docm.To_Km>="+smallkm1+ " and docm.To_Km<="+bigkm1+") or (loc1.Station_Km>="+smallkm1+" and loc1.Station_Km<="+bigkm1+"))";
	 } else {query=query+" and (docm.From_Km>="+frmstnkm+ " or docm.To_Km>="+frmstnkm+" or loc1.Station_km>="+frmstnkm+")";}
	} else {
		if (tostnkm != "") {query=query+" and (docm.From_Km<="+tostnkm+ " or docm.To_Km<="+tostnkm+" or loc1.Station_km<="+tostnkm+")";}
	}
	if (org != "") {
		query=query+" and org1.Org_Name='"+org+"'";
	}
	if (t3 == "" || t3 =="0" || t3==null) { } else {
		query=query+" and DATEDIFF(CURDATE(),docm.Date_of_Submission)>="+ Integer.parseInt(t3)+" ";
	}
	if (tcode.equalsIgnoreCase("1")) {
		query=query+" and org1.Type='MOR' and DATEDIFF(CURDATE(),docm.Date_of_Submission) <="+ t1+" ";
	} 
	if (tcode.equalsIgnoreCase("2")) {
		query=query+" and org1.Type='MOR' and (DATEDIFF(CURDATE(),docm.Date_of_Submission) >"+ t1+" and DATEDIFF(CURDATE(),docm.Date_of_Submission) <="+t2+")";
	} 
	if (tcode.equalsIgnoreCase("3")) {
		query=query+" and org1.Type='MOR' and DATEDIFF(CURDATE(),docm.Date_of_Submission) >"+ t2+" ";
	} 
	if (tcode.equalsIgnoreCase("11")) {
		query=query+" and org1.Type='Others' and DATEDIFF(CURDATE(),docm.Date_of_Submission) <="+ t1+" ";
	} 
	if (tcode.equalsIgnoreCase("21")) {
		query=query+" and  org1.Type='Others' and (DATEDIFF(CURDATE(),docm.Date_of_Submission) >"+ t1+" and DATEDIFF(CURDATE(),docm.Date_of_Submission) <="+t2+")";
	} 
	if (tcode.equalsIgnoreCase("31")) {
		query=query+" and org1.Type='Others' and DATEDIFF(CURDATE(),docm.Date_of_Submission) >"+ t2+" ";
	}
	if (tcode.equalsIgnoreCase("12")) {
		query=query+" and org1.Type='RVNL' and DATEDIFF(CURDATE(),docm.Date_of_Submission) <="+ t1+" ";
	} 
	if (tcode.equalsIgnoreCase("22")) {
		query=query+" and org1.Type='RVNL' and (DATEDIFF(CURDATE(),docm.Date_of_Submission) >"+ t1+" and DATEDIFF(CURDATE(),docm.Date_of_Submission) <="+t2+")";
	} 
	if (tcode.equalsIgnoreCase("32")) {
		query=query+" and org1.Type='RVNL' and DATEDIFF(CURDATE(),docm.Date_of_Submission) >"+ t2+" ";
	}
	/* if (ActionPerformed!="") {
		query=query+" and BMR.ActionPerformed='"+ ActionPerformed+"' ";
	} */
//System.out.println("tcode"+tcode+"query:"+query);
	int p1=0;
	int p2=0;
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
	%>

	<table border=1 class="table table-hover table-bordered"
		style="background-color: #F0FFFF" id="example" class="display nowrap" cellspacing="0" width="100%">
		<thead>
		<tr class="success">
			<th style="padding: 0px 14px 24px 0px;">S.No.</th>
			<%
				if (zone == "") {
					p1++;
			%>
			<th width="150px">Zone</th>
			<%
				} else { }
			%>
			<%
				if (division == "") {
					p1++;
			%>
			<th style="padding: 0px 0px 26px 19px;">Division</th>
			<%
				} else { }
			%>
			<%
				if (piu1 == "") {
					p1++;
			%>
			<th style="padding: 0px 0px 24px 13px;">PIU</th>

			<%
				} else {}
			%>
			<%
				if (project == "") {
					p1++;
			%>
			<th style="padding:0px 81px 25px 38px;">Project</th>

			<%
				} else {
			%>
			<%
				}
			if (packn == "") {
				p1++;
				%>
				<th><div id="m3" style="margin: 0px 0px 13px 0px;">Package</div></th>

				<%
					} else {
				%>
				<%
					}
			
				if (docType == "") {
					p1++;
			%>
			<th style="padding: 0px 77px 9px 50px;">Document Type</th>
			<%
				} else {
			%>
			<%
				}
			%>
			<th width="140px">Document Number</th>
			<th width="140px">Document Name</th>
			
			<th width="160px">Date Of Submission</th>
			<%
				if (status == "") {
					p2++;
			%>
			<th width="160px">Current Status</th>

			<%
				} else {
			%>
			<%
				}
			if (suser == "") {
				p2++;
				%>
				<th width="90px">Currently With</th>

				<%
					} else {
				%>
				<%
					}

			%>
		
			<th width="150px">From_Date</th>
			
		<th width="120px">Days Since Submission</th>
		<% 		if (user99!=null) {%>
			
			<th width="120px">Document Log</th>
<%} %>
		</tr></thead>
		<tbody>
		<%
		String SD=null,Penfrm=null, fdate=null,fdate1=null,SD1=null,Zone_name=null, doctype=null;
		 java.util.Date d1 = null;java.util.Date fdate222=null;
		 int diffDay=0;
	     java.util.Date d2 = null;
			int i = 1;
			while (rs.next()) {

				String doc = rs.getString(1);
				String piu = rs.getString(2);
				String pro = rs.getString(3);
				String proc = rs.getString(4);
				String packn1 = rs.getString(5);
				String cdept = rs.getString(6);
				String desig = rs.getString(7);
				String doctype3 = rs.getString(8);
				if (doctype3!=null) {
					 doctype = URLEncoder.encode(doctype3, "UTF-8");
					}
				String docnum = rs.getString(9);
				String docname = rs.getString(10);
				String docname1 = URLEncoder.encode(docname, "UTF-8");
				dateofsub = rs.getDate(11);
				String action = rs.getString(12);
				pDate=rs.getDate(13);
				//String doc_id = rs.getString(14);
				String assigned_to = rs.getString(14);
				//currentdate = rs.getDate(14);
				String aging = rs.getString(15);
				 Zone_name = rs.getString(17);
				String division1 = rs.getString(18);
				//	String date1 = rs.getString(17);
				 SD = new SimpleDateFormat("dd-MM-yyyy").format(dateofsub);
				 Penfrm = new SimpleDateFormat("dd-MM-yyyy").format(pDate);
				 
				if(action.equalsIgnoreCase("Finally Approved")){
					
					String fapprovedq="select ActionedOn from xx_record_actions where Document_id='"+doc+"' order by Rownum";
					stmt = conn.createStatement();
					rs11 = stmt.executeQuery(fapprovedq);
					while(rs11.next())
					{
						
						 fdate222=rs11.getDate("ActionedOn");
						 	}
					if(fdate222 ==null)
					{
						
						
					}
					else
					{
					  fdate1=new SimpleDateFormat("MM-dd-yyyy").format(fdate222);
					  SD1=new SimpleDateFormat("MM-dd-yyyy").format(dateofsub);
					 fdate1=fdate1+" 00:00:00";
					 SD1=SD1+" 00:00:00";
						SimpleDateFormat format = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");

						 d1 = format.parse(SD1);

				         d2 = format.parse(fdate1);



				         DateTime dt1 = new DateTime(d1);

				         DateTime dt2 = new DateTime(d2);



				         diffDay=Days.daysBetween(dt1, dt2).getDays();		 
				          aging=diffDay+"";
				          
					}	}
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
				}
			%>
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
			<td><%=pro%></td>
			<%
				}
			if (packn != "") {
				%>
				<%
					} else {
				%>
				<td><%=packn1%></td>
				<%
					}

				if (docType != "") {
			%>
			<%
				} else {
			%>
			<td><%=doctype3%></td>
			<%
				}
			%>
			<td><%=docnum%></td>
			<td><%=docname%></td>
			
			<td><%=SD %></td>
			<%
				if (status != "") {
			%>
			<%
				} else {
			%>
			<td><%=action%></td>
			<%
				}
			
			if (suser != "") {
				%>
				<%
					} else {
				%>
				<td><%=assigned_to%></td>
				<%
					}
			%>
			
			<td><%=Penfrm %></td>
			<td><%=aging%></td>
			<%	if (user99!=null) {%>
			
			<td><a
				href="recordReport.jsp?Document_Type=<%=doctype%>&doc_id=<%=doc%>&doc_name=<%=docname1%>" class="btn btn-primary">
					Details </a>
			</td>
<%} %>
		</tr>
		<%
			i++;
			}
		%>
		</tbody>
	</table>
	<br>
		<input type="button" value="close" class="btn btn-primary" onclick="closeMe();" style="margin-left: 50%;"> 
	<script>
	var p11=<%=p1%>+3
	var p12=p11+<%=p2%>+1
	</script>
	
	<%
		if (exportToExcel == null) {
	
	
		}
	   try { conn.close(); } catch (Exception e) { /* ignored */ }
	%>
	<br>
	<!-- <a href="#" onclick="javascript:window.print();">Print this page</a> -->

</body>

</html>
