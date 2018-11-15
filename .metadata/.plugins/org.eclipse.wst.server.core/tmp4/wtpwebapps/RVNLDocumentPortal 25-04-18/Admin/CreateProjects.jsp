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

<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>
<%@include file="included/NewHeader.jsp"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>

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
  <script type = "text/javascript" >
   function majseccheck(id) {
	 var majsec0=document.getElementById("Majsec"+id).value;
		var ans="No";
		$("#frmKm"+id).val(null);
		$("#toKm"+id).val(null);
		var j=document.getElementById("No_Majsec").value;
		for(var i=1;i<=j;i++){
			if (i!=id) { 
			var majsec=document.getElementById("Majsec"+i);
			if (majsec!="" && majsec!=null) {
				majsec=document.getElementById("Majsec"+i).value;
				if (majsec0==majsec) {
					ans="yes"; i=j+1;
				}
				}
			}
		}
		if (ans=="yes"){
			var dialogid="#kmdialogid"+id;
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title:"Invalid Entry",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
				$("#Majsec"+id).val("");
				
	          return false;
	 		}
  }

  function stnnamecheck(id) {
  
		 var stn0=document.getElementById("stn"+id).value;
			var ans="No";
			var j=document.getElementById("No_Stn").value;
			var smajsec0=document.getElementById("sMajsec"+id).value;
			
			for(var i=1;i<=j;i++){
				 // alert("hello"+j+"nnn"+i);
				if (i!=id) { 
				var stn=document.getElementById("stn"+i);
				var smajsec=document.getElementById("sMajsec"+i).value;
				if (stn!="" && stn!=null) {
					stn=document.getElementById("stn"+i).value;
					//alert("11.."+smajsec0+stn0+smajsec+stn);
					if (stn0==stn && smajsec==smajsec0) {
						ans="yes"; i=j+1;
					  }
					}
				}
			}
			if (ans=="yes"){
				var dialogid="#stnnamedialogid"+id;
				 $(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title:"Invalid Entry",
			        width: 400,
			        height: 200
			    });
				 
				  $(dialogid).dialog('open');
					$("#stn"+id).val("");
					
		          return false;
		 		}
	  }
  function stnkmcheck(id) {
			// Km repetition check  
			var smajsec0=document.getElementById("sMajsec"+id).value;
			var stnKm1=document.getElementById("stnKm"+id).value;
			var stnKm0=parseFloat(stnKm1);
			var ans="No";
			var j=document.getElementById("No_Stn").value;
			for(var i=1;i<=j;i++){
				//  alert("hello"+j+"nnn"+i);
				if (i!=id) { 
				var stnKm=document.getElementById("stnKm"+i);
				if (stnKm!="" && stnKm!=null) {
					stnKm=document.getElementById("stnKm"+i).value;
					var smajsec=document.getElementById("sMajsec"+i).value;
					if (stnKm0==stnKm && smajsec0==smajsec) {
						ans="yes"; i=j+1;
					}
					}
				}
			}
			
			if (ans=="yes"){
				var dialogid="#stnkmdialogid"+id;
				 $(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title:"Invalid Entry",
			        width: 400,
			        height: 200
			    });
				 
				  $(dialogid).dialog('open');
					$("#stnKm"+id).val("");
	 		}
			// Km limit check 
			
			//var smajsec0=document.getElementById("sMajsec"+id).value;
			 var ans1="No";
			 var j1=document.getElementById("No_Majsec").value;
				for(var i=1;i<=j1;i++){
			
			var majsec=document.getElementById("Majsec"+i);
			if (majsec!="" && majsec!=null) {
				majsec=document.getElementById("Majsec"+i).value;
				if (smajsec0==majsec) {
				var frmKm1=document.getElementById("frmKm"+i).value;
				var toKm1=document.getElementById("toKm"+i).value;
				var frmKm=parseFloat(frmKm1);
				var toKm=parseFloat(toKm1);
				if (stnKm0!="" && stnKm0!=null) {
					if (toKm>frmKm) { 
						if ((stnKm0 < frmKm) || (stnKm0 > toKm)) {
							//alert("111stnkm<frmkm or >tokm");
							ans1="yes"; i=j1+1;
						} 
						} else {
							if ((stnKm0 < toKm) || (stnKm0 > frmKm)) {
								ans1="yes"; i=j1+1;
							//	alert("22stnkm<tokm or >frmkm");
							} }
						}
						}
					}
				}
				
				if (ans1=="yes"){
					var dialogid="#stnkm1dialogid"+id;
					 $(dialogid).dialog({
				        modal: true,
				        autoOpen: false,
				        title:"Invalid Entry",
				        width: 400,
				        height: 200
				    });
					 
					  $(dialogid).dialog('open');
						$("#stnKm"+id).val("");
						
						
			          return false;
			 		}
				
  }
				
  function stnmajseccheck(id) {
	  var smajsec=document.getElementById("sMajsec"+id).value;
		var ans="No";
		$("#stn"+id).val(null);
		$("#stnKm"+id).val(null);
		var j=document.getElementById("No_Majsec").value;
		for(var i=1;i<=j;i++){
			var majsec=document.getElementById("Majsec"+i);
			if (majsec!="" && majsec!=null) {
				majsec=document.getElementById("Majsec"+i).value;
				var majdel1=document.getElementById("majdel"+i).value;
				//alert(majsec+","+smajsec+","+majdel1+","+ans);
				if ((smajsec==majsec) && (majdel1=="Delete")) {
					ans="yes";
				}
				}
			}
		if (ans=="No"){
			//.............................fill up here
			var dialogid="#stndialogid"+id;
			 //alert("c.."+id+",,,"+dialogid+"..."+ans)
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title:"Invalid Entry",
		        width: 400,
		        height: 200
		      });
			 
			  $(dialogid).dialog('open');
				$("#sMajsec"+id).val("");
				
	          return false;
	 		}
  }
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>

  
  <script>
  function deletemajsec(id,str){
		 if (str=="Delete") {
			 $("#majdelBtn"+id).val("Undelete");
			 $("#majdel"+id).val("Undelete");
			 var maj2= document.getElementById("Majsec"+id).value;
			 var nstn= document.getElementById("No_Stn").value;
			 $("#Majsec"+id).prop("disabled", true);   
			 $("#frmKm"+id).prop("disabled", true);   
			 $("#toKm"+id).prop("disabled", true);  
			// alert("maj"+maj2);
			 for (var i = 1; i <= nstn; i++) {
				if ($("#sMajsec"+i).val()==maj2){
					$("#sMajsec"+i).prop("disabled", true);   
					 $("#stn"+i).prop("disabled", true);   
					 $("#stnKm"+i).prop("disabled", true); 
					 $("#sdelBtn"+i).val("Undelete");
					 $("#sdelBtn"+i).prop("disabled", true); 
					 $("#sdel"+i).val("Undelete");
				}
			 }
		 } else if (str=="Undelete") {
			 $("#majdelBtn"+id).val("Delete");
			 $("#majdel"+id).val("Delete");
			 var maj2= document.getElementById("Majsec"+id).value;
			 var nstn= document.getElementById("No_Stn").value;
			 $("#Majsec"+id).prop("disabled", false); 
			 $("#frmKm"+id).prop("disabled", false);   
			 $("#toKm"+id).prop("disabled", false);  
			 for (var i = 1; i <= nstn; i++) {
					if ($("#sMajsec"+i).val()==maj2){
						$("#sMajsec"+i).prop("disabled", false);   
						 $("#stn"+i).prop("disabled", false);   
						 $("#stnKm"+i).prop("disabled", false); 
						 $("#sdelBtn"+i).val("Delete");
						 $("#sdelBtn"+i).prop("disabled", false); 
						 $("#sdel"+i).val("Delete");
					}
				 }
		 }
	}
	   	
		 function deletestn(id, str){
			 if (str=="Delete") {
				 $("#sdelBtn"+id).val("Undelete");
				 $("#sdel"+id).val("Undelete");
				 $("#sMajsec"+id).prop("disabled", true);   
				 $("#stn"+id).prop("disabled", true);   
				 $("#stnKm"+id).prop("disabled", true);   
				// alert("delid="+id);
			 } else if (str=="Undelete") {
				 $("#sdelBtn"+id).val("Delete");
				 $("#sdel"+id).val("Delete");
				 $("#sMajsec"+id).prop("disabled", false); 
				 $("#stn"+id).prop("disabled", false);   
				 $("#stnKm"+id).prop("disabled", false);  
			 }
	}
	   
/*		 
  function deletemajsec(id){
   		
  		 var dialogid="#kdialogid"+id;
  		 
  		 $(dialogid).dialog({
  	        modal: true,
  	        autoOpen: false,
  	        title: "Alert",
  	        width: 400,
  	        height: 200
  	    });
  		 
  		  $(dialogid).dialog('open');
  	  			
  	}
       
  	function majsecdelete(id){
  		var dialogid="#kdialogid"+id;
  		var maj2= document.getElementById("Majsec"+id).value;
		 var nstn= document.getElementById("No_Stn").value;
  		$("#Majsec"+id).val(null);
  		$("#frmKm"+id).val(null);
  		$("#toKm"+id).val(null);
  		$("#Majorsec"+id).hide();
  		 for (var i = 1; i <= nstn; i++) {
				if ($("#sMajsec"+i).val()==maj2){
					$("#sMajsec"+id).val(null);
			  		$("#stn"+id).val(null);
			  		$("#stnKm"+id).val(null);
					$("#sMajorsec"+i).hide();   
					}
			 }
  		$(dialogid).dialog('close');
  	}
  	
  	 function deletestn(id){
    		
  		 var dialogid="#sdialogid"+id;
  		 
  		 $(dialogid).dialog({
  	        modal: true,
  	        autoOpen: false,
  	        title: "Alert",
  	        width: 400,
  	        height: 200
  	    });
  		 
  		  $(dialogid).dialog('open');
  	  			
  	}
       
  	function stndelete(id){
  		var dialogid="#sdialogid"+id;
  		$("#sMajsec"+id).val(null);
  		$("#stn"+id).val(null);
  		$("#stnKm"+id).val(null);
  		
  		$("#sMajorsec"+id).hide();
  		$(dialogid).dialog('close');
  	}
  */	
  	$(document).ready(function() {
 
   	 // $('#projectinCharge').on('keypress', function (event) {
   		  $('input').on('keypress', function (event) {
  		    //var regex = new RegExp("^[a-zA-Z0-9]+$");
  		    var regex = new RegExp("['?!<\">\\\\&]+$");
  		    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
  		    if (regex.test(key)) {
  		       event.preventDefault();
  		       return false;
  		    }
  
   	  });
    
   		
  	  $('#Project').on('keypress', function (event) {
  		   // var regex = new RegExp("^[a-zA-Z0-9]+$");
  		  var regex = new RegExp("['?!<\">\\\\&]+$");
  		    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
  		    if (regex.test(key)) {
  		       event.preventDefault();
  		       return false;
  		    }
  		});


  		$('#CreateProject').submit(function() {
  		  var txt = $('#Project_Stage');
  		  txt.val("ninth" + txt.val());
  		});
	    $("#addmajor1").click(function(e){
        	e.preventDefault();
        	var j=document.getElementById("No_Majsec").value;
        	//int jc=Integer.parseInt(j);
    		var max=11;
    		var cv=1;
    		j++;
    	//alert("mmm..mmmm..");
    		//alert("mmm.."+j+"mmmm.."+max);
    		if (j<max) {
    		$("#Majorsec"+j).show();
    		document.getElementById("No_Majsec").value=j;
    		} else { 
    			
    			for(var i=1;i<max;i++){
    			if ($("#Majorsec"+i).is(":hidden")) {
    			$("#Majorsec"+i).show(); cv=2; i=max;
    			}} 
    			//alert("mm"+cv);
    			if (cv==1) {
    			var dialogid="#kdialogid222";
    			$(dialogid).dialog({
    	        modal: true,
    	        autoOpen: false,
    	        title: "Alert",
    	        width: 400,
    	        height: 200
    	    });
    		 
    		  $(dialogid).dialog('open');
    	  	
    			}}
    		
        	});
	    
	    $("#addstn1").click(function(e){
        	e.preventDefault();
        	var j=document.getElementById("No_Stn").value;
        	//int jc=Integer.parseInt(j);
    		var max=101;
    		var scv=1;
    		j++;
    	//alert("mmm..mmmm..");
    		//alert("mmm.."+j+"mmmm.."+max);
    		if (j<max) {
    		$("#sMajorsec"+j).show();
    		document.getElementById("No_Stn").value=j;
    		} else { 
    			
    			for(var i=1;i<max;i++){
    			if ($("#sMajorsec"+i).is(":hidden")) {
    			$("#sMajorsec"+i).show(); scv=2; i=max;
    			}} 
    			//alert("mm"+cv);
    			if (scv==1) {
    			var dialogid="#sdialogid222";
    			$(dialogid).dialog({
    	        modal: true,
    	        autoOpen: false,
    	        title: "Alert",
    	        width: 400,
    	        height: 200
    	    });
    		 
    		  $(dialogid).dialog('open');
    	  	
    			}}
    		
        	});
        });
	
function stopRKey(evt) { 
	  var evt = (evt) ? evt : ((event) ? event : null); 
	  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
	  if ((evt.keyCode == 13) )  {return false;} 
	} 

	document.onkeypress = stopRKey; 

 
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
function stateChanges2package() {
	var divid="state2"+index2;

	if (xmlHttp3.readyState == 4 || xmlHttp3.readyState == "complete") {
		document.getElementById(divid).innerHTML = xmlHttp3.responseText
	}
}

function myFunction() {
    location.reload();
}

</script>
<script type="text/javascript">
var $j = jQuery.noConflict();
$j(function() {
	
		$j("#start_Date").datepicker({
			dateFormat : 'dd/mm/yy',
				maxDate:'0', changeYear: true
		}).val();
	});
</script>
   <script type="text/javascript">
	function frezedate(id, startDate) {
		 
		var $j = jQuery.noConflict();

		var idof = id;
		//alert(startDate+"id"+id);
		var chunks = startDate.split('-');
		var formattedDate = [ chunks[2], chunks[1], chunks[0] ].join("/");
		//alert(formattedDate);
		$j("#" + idof).datepicker({

			dateFormat : 'dd/mm/yy',
			minDate : formattedDate,
			maxDate : '0', changeYear: true

		}).datepicker("show").val();
		
		//var today = new Date(); var dd = today.getDate(); 

	}
</script>
<script type="text/javascript">
function loadXMLDoc(element,er)
{
var xmlhttp;
var k1=document.getElementById(element).value;
k1=k1.replace( /\s\s+/g, ' ' );   
var k = encodeURIComponent(k1);
document.getElementById(element).value=k1;
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

function refreshAndClose() {
	location.href=("CreateProjects.jsp");
    //window.opener.location.reload(true);
    window.close();
}
</script>
</head>
<body>
<%String user = (String)session.getAttribute("user_name");
String role1=(String)session.getAttribute("role");
%>
<script type="text/javascript"
src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/blitzer/jquery-ui.css">
<%

response.setHeader("Cache-control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", -1);
//System.out.println("UZER:"+user);
%>
<%-- <div><h5 style='width: 300px; margin-left: 27px'>&nbsp;&nbsp;&nbsp;Create Project</h5></div>

<h5 align="left"  style='width: 300px; margin-left:27px'><font style="color:red">&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font color="#99CC00">:&nbsp;<%=(String)session.getAttribute("user_name") %></font></h5>
 --%>
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[Create Project] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>
<form name="CreateProject" id="CreateProject" method="post" style="margin-left:40px;margin-top:45px;" >

<INPUT TYPE="HIDDEN" NAME="count">
<INPUT TYPE="HIDDEN" NAME="buttonName">
<INPUT TYPE="HIDDEN" NAME="ProjectID">
<INPUT TYPE="HIDDEN" Id="Project_stage" NAME="Project_stage">
<INPUT TYPE="HIDDEN" NAME="document_type">
<INPUT TYPE="HIDDEN" NAME="designation">
<INPUT TYPE="HIDDEN" NAME="Department_RVNL">
<c:if test="${param.Project_stage == null}">
  <table>
<tr><td>

<table style="background-color: #F0FFFF;width:35%" class="table table-hover table-bordered">
			<tr class="success"><td><h3 style="text-align:center;"><font color="grey">Create Project</font></h3></td></tr>
			<tr>

				<td style="width:40%">
				 <h5><b>General Details:</b></h5>
			<br>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PIU of RVNL:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=PIU_name id="PIU_name" style="width: 245px" onchange ="javascript:returnProjects(this.value);">
						<option value="none">-- Select PIU --</option>
						<%

						ResultSet rs3 = null, rs31=null;
						PreparedStatement  ps3 = null, ps31=null;
						ResultSet rs1=null,rs5=null;PreparedStatement ps1 =null;Connection conn=null;
						Statement stmt = null;
						
						try {
							
							Context initCtx = new InitialContext();
							Context envCtx = (Context) initCtx.lookup("java:comp/env");
							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

							 conn = ds.getConnection();
							 System.out.println(user+"role"+role1);
							 if (role1.equalsIgnoreCase("System Administrator")) {
												 
							 
								String sql3 = "select DISTINCT PIU_Name from xx_piu_master where PIU_Id !='27' order by PIU_Name";
								ps3 = conn.prepareStatement(sql3);
								rs3 = ps3.executeQuery();

								while (rs3.next()) {
									String dname = rs3.getString("PIU_Name");
						%>
						<option value="<%=dname%>"><%=dname%></option>

						<%
							}
							 } else {
								 int piuid1=0;
								 String sql = "select PIU_ID from xx_user_master where User_name='"+user+"'";
									ps3 = conn.prepareStatement(sql);
									rs3 = ps3.executeQuery();
									if (rs3.next()) {
										 piuid1 = rs3.getInt("PIU_ID");
																			 
									}
									System.out.println("piu"+piuid1);
										String sql31 = "select * from xx_piu_master where piu_Id="+piuid1;
										ps31 = conn.prepareStatement(sql31);
										rs31 = ps31.executeQuery();

										while (rs31.next()) {
											String dname11 = rs31.getString("PIU_Name");
								%>
								<option value="<%=dname11%>"><%=dname11%></option>

								<%
									}
							 }
								
												
								
								//conn.close();
						}catch(Exception e){
							e.printStackTrace();
						} finally {
							try {
								if (rs3 != null)
									rs3.close();
							} catch (Exception e) {
							}	
							try {
						    	if (ps3 != null)
								ps3.close();
							} catch (Exception e) {
							}
							finally {
							    try { conn.close(); } catch (Exception e) { /* ignored */ }
							}
							}
						%>
				  </select> <br /> <br />	
				  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project Type:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					 <select name=Project_Type id="Project_Type" style="width: 245px" onchange ="javascript:returnProjectsType(this.value);">
					 <option value="none">-- Select Type --</option>
			<%
			
			
			

				try {
					Context initCtx = new InitialContext();
					Context envCtx = (Context) initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

					 conn = ds.getConnection();

					String sql1 = "SELECT project_type FROM xx_projecttypes_master order by project_type";
					 ps1 = conn.prepareStatement(sql1);
					 rs1 = ps1.executeQuery();

					while (rs1.next()) {
						String ptype = rs1.getString("project_type");
			%>
			<option value="<%=ptype%>"><%=ptype%></option>
			<%
				}
					
			%>
		</select><br />
				<br />
			<%
			
 				%>	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div id="p1" style="margin: 0px 0px -40px 50px;">Project Name: </div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					
 <textarea type="text"  rows="2" cols="20" maxlength="200" name="Project" id ="Project" style="width:  245px" onkeyup="loadXMLDoc('Project','err')"></textarea>
  <span id="err"> </span> <br>
  <br />
		
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project Start Date:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="text" name="start_Date" id ="start_Date" readonly="true"  style="width: 245px"> <br /><br>
 

 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name Of Project In-charge:
				<input type="text" name="projectinCharge" id ="projectinCharge" maxlength="50" style="width:245px; margin-left:12px">
				</div><br /> <br />
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Coordinating Department :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name='Department_RVNL1' id ="Department_RVNL1" style="width: 245px" onchange='show(1);'>
						<option value="none">-- Select Department --</option>
						<%
							
								stmt = conn.createStatement();
								rs5 = stmt.executeQuery("select department_name from xx_departments_master where type ='RVNL' and Department_Name !='Headquarter' order by department_name");
								String department = null;// request.getParameter("Zone_name");

								while (rs5.next()) {
									department = rs5.getString("Department_Name");
						%>
						<option value="<%=department%>"><%=department%></option>
						<%
							}
								//conn.close();
				}catch(Exception e){
					e.printStackTrace();
				}finally {
						    try { rs1.close(); } catch (Exception e) { /* ignored */ }
						    try { ps1.close(); } catch (Exception e) { /* ignored */ }
						    try { rs5.close(); } catch (Exception e) { /* ignored */ }
						    try { conn.close(); } catch (Exception e) { /* ignored */ }
					}
								
						%>
				</select> <br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Designation:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id ="DesgDiv_RVNL1" style="display: inline;">
					<select name='designation_RVNL' id='designation_RVNL' style="width: 245px;margin:3px 0px 12px 0px;">
						<option value="none">-- Select Designation --</option>						  
				</select> </div>
<br>
</td>	 		
</tr>

<tr>
<td>
 <table class="table table-hover table-bordered"   style="background-color: #F0FFFF"; width:600px; margin:0px;">
 <h5><b>Jurisdiction Details:</b></h5>
 <tr><td> <h5><b><font color="gray">Major Section wise Kilometer Details:</font></b></h5>
 <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Major Section &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; From Km &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To Km </b>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
 <br>
<% int ct=1;
int nmaj =1;
String sn=null;
while (ct<11) {
	if (ct<10 ) {sn="&nbsp;&nbsp;"+ct+".&nbsp;";} else {sn=ct+".&nbsp;";}
if (ct==1) {
	
%>
<div id="Majorsec<%=ct %>" style="display: inline"><%=sn%>
<input type="text" name="Majsec<%=ct%>" id ="Majsec<%=ct%>"  maxlength="150" style="width:205px; margin-left:10px; margin-top: 15px;" onchange="majseccheck(<%=ct %>);">
&nbsp;
<input type="number" Step="0.001" name="frmKm<%=ct%>" id ="frmKm<%=ct%>"  style="width:80px; margin-left:10px;margin-top: 15px;" >
&nbsp;
<input type="number" Step="0.001" name="toKm<%=ct%>" id ="toKm<%=ct%>"  style="width:80px; margin-left:10px;margin-top: 15px;" >
&nbsp;&nbsp;&nbsp; <input type="button" class="btn btn-primary" id="majdelBtn<%=ct %>" value="Delete" onClick="deletemajsec('<%=ct %>',this.value)" />
<INPUT TYPE="HIDDEN" ID="majdel<%=ct %>" NAME="majdel<%=ct %>" value="Delete"> 
</div>
<% } else { %>

<div id="Majorsec<%=ct %>" style="display: none"><%=sn%>
<input type="text" name="Majsec<%=ct%>" id ="Majsec<%=ct%>" maxlength="150" style="width:205px; margin-left:10px;margin-top: 15px;" onchange="majseccheck(<%=ct %>);" >
&nbsp;
<input type="number" Step="0.001" name="frmKm<%=ct%>" id ="frmKm<%=ct%>"  style="width:80px; margin-left:10px;margin-top: 15px;" >
&nbsp;
<input type="number" Step="0.001" name="toKm<%=ct%>" id ="toKm<%=ct%>"  style="width:80px; margin-left:10px;margin-top: 15px;" >
&nbsp;&nbsp;&nbsp; <input type="button" class="btn btn-primary" id="majdelBtn<%=ct %>" value="Delete" onClick="deletemajsec('<%=ct %>',this.value)" />
<INPUT TYPE="HIDDEN" ID="majdel<%=ct %>" NAME="majdel<%=ct %>" value="Delete"> 
</div>
						
	
<% } %>
<div id="kdialogid<%=ct%>" style="display: none"
								align="center">
								<br> Are You Sure You Want To Delete Major Section entry<br>
								<br>
								<button id="ok<%=ct %>" class="btn btn-primary"	onclick="majsecdelete('<%=ct%>');">OK</button>
								<button id="cancel<%=ct %>" class="btn btn-primary"
									onclick="$('#kdialogid<%=ct%>').dialog('close');">cancel</button>
			</div>
									
		<div id="kmdialogid<%=ct %>" style="display: none"
								align="center">
								<br> Duplicate 'Major Section' entry......<br>
								<br>
								<button id="canclez<%=ct %>" class="btn btn-primary"
									onclick="$('#kmdialogid<%=ct %>').dialog('close');$('#Majsec<%=ct %>').focus(); $('#Majsec<%=ct %>')[0].setSelectionRange(0,1);">cancel</button>
				</div>						
	<%
	
	ct++;
	}%>
	
	
	<INPUT TYPE="hidden" NAME="No_Majsec"  Id="No_Majsec" value=<%=nmaj%>>
		
	
	<div id="addmajor2" >
   <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" id="addmajor1" value="<%=nmaj %>" >Add Major Section</button>
   </div><br><div style="display: inline; color:brown; font-size:12px;" ><i> Note: You can not add a Major Section which has been added once even after its deletion. To add a deleted Major Section, undelete that Major Section.</i></div>		
	<div id="kdialogid222" style="display: none"
								align="center">
								<br> You can add up to  10 Major Sections only....<br>
								<br>
								<button id="kcancle222" class="btn btn-primary"
									onclick="$('#kdialogid222').dialog('close');">cancel</button>
							</div>
	
</td></tr>
<tr> <td><br>
 <h5><b><font color="gray">Major Section wise Station Details:</font></b></h5>
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Major Section &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Station Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Station Km </b>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <br>
<% int ctn=1;
int nstn =1;
String snn=null;
while (ctn<101) {
if (ctn<10 ) {snn="&nbsp;&nbsp;"+ctn+".&nbsp;";} else {snn=ctn+".&nbsp;";}
if (ctn==1) {
%>
<div id="sMajorsec<%=ctn %>" style="display: inline"><%=snn%>
<input type="text" name="sMajsec<%=ctn%>" id ="sMajsec<%=ctn%>"  maxlength="150" style="width:205px; margin-left:10px; margin-top: 15px;" onchange="stnmajseccheck(<%=ctn %>);">
&nbsp;
<input type="text" name="stn<%=ctn%>" id ="stn<%=ctn%>" maxlength="75" style="width:100px; margin-left:10px;margin-top: 15px;" onchange="stnnamecheck(<%=ctn %>);" >
&nbsp;
<input type="number" Step="0.001" name="stnKm<%=ctn%>" id ="stnKm<%=ctn%>"  style="width:80px; margin-left:10px;margin-top: 15px;" onchange="stnkmcheck(<%=ctn %>);">
&nbsp;&nbsp;&nbsp; <input type="button" class="btn btn-primary"  id="sdelBtn<%=ctn %>" value="Delete" onClick="deletestn('<%=ctn %>',this.value)" />
<INPUT TYPE="HIDDEN" NAME="sdel<%=ctn %>" ID="sdel<%=ctn %>" value="Delete"> 
</div>

	
<% } else {
%>
<div id="sMajorsec<%=ctn %>" style="display: none"><%=snn%>
<input type="text" name="sMajsec<%=ctn%>" id ="sMajsec<%=ctn%>"  maxlength="150" style="width:205px; margin-left:10px;margin-top: 15px;" onchange="stnmajseccheck(<%=ctn %>);">
&nbsp;
<input type="text" name="stn<%=ctn%>" id ="stn<%=ctn%>"  maxlength="75" style="width:100px; margin-left:10px;margin-top: 15px;" onchange="stnnamecheck(<%=ctn %>);">
&nbsp;
<input type="number" Step="0.001" name="stnKm<%=ctn%>" id ="stnKm<%=ctn%>"  style="width:80px; margin-left:10px;margin-top: 15px;"  onchange="stnkmcheck(<%=ctn %>);">
&nbsp;&nbsp;&nbsp; <input type="button" class="btn btn-primary"  id="sdelBtn<%=ctn %>" value="Delete" onClick="deletestn('<%=ctn %>',this.value)" />
<INPUT TYPE="HIDDEN" NAME="sdel<%=ctn %>" ID="sdel<%=ctn %>" value="Delete"> 
</div>

<% } %>
		<div id="sdialogid<%=ctn%>" style="display: none"
								align="center">
								<br> Are You Sure You Want To Delete this Station entry<br>
								<br>
								<button id="oka<%=ctn %>" class="btn btn-primary"	onclick="stndelete('<%=ctn%>');">OK</button>
								<button id="cancelc<%=ctn %>" class="btn btn-primary"
									onclick="$('#sdialogid<%=ctn%>').dialog('close');">cancel</button>
							</div>
			<div id="stndialogid<%=ctn %>" style="display: none"
								align="center">
								<br> Not a Valid entry. Major Section should be one of the mentioned above in km wise details.....<br>
								<br>
								<button id="canclea<%=ctn %>" class="btn btn-primary"
									onclick="$('#stndialogid<%=ctn %>').dialog('close');$('#sMajsec<%=ctn %>').focus(); $('#sMajsec<%=ctn %>')[0].setSelectionRange(0,1);">cancel</button>
				</div>		
	<div id="stnnamedialogid<%=ctn %>" style="display: none"
								align="center">
								<br> Duplicate 'Station Name' entry..........<br>
								<br>
								<button id="canclee<%=ctn %>" class="btn btn-primary"
									onclick="$('#stnnamedialogid<%=ctn %>').dialog('close');$('#stn<%=ctn %>').focus(); $('#stn<%=ctn %>')[0].setSelectionRange(0,1);">cancel</button>
				</div>	
	<div id="stnkmdialogid<%=ctn %>" style="display: none"
								align="center">
								<br> Duplicate 'Station Km' entry..........<br>
								<br>
								<button id="canclef<%=ctn %>" class="btn btn-primary"
									onclick="$('#stnkmdialogid<%=ctn %>').dialog('close');$('#stnKm<%=ctn %>').focus(); $('#stnKm<%=ctn %>')[0].setSelectionRange(0,1);">cancel</button>
				</div>	
		<div id="stnkm1dialogid<%=ctn %>" style="display: none"
								align="center">
								<br> 'Station Km' entered is not within the km limits of the major section given above.........<br>
								<br>
								<button id="canclef<%=ctn %>" class="btn btn-primary"
									onclick="$('#stnkm1dialogid<%=ctn %>').dialog('close');$('#stnKm<%=ctn %>').focus(); $('#stnKm<%=ctn %>')[0].setSelectionRange(0,1);">cancel</button>
				</div>		
				
	<%
	ctn++;
	}
	System.out.println("....kk"+nstn);
	%>
	
	
	<INPUT TYPE="hidden" NAME="No_Stn"  Id="No_Stn" value=<%=nstn%>>
		

	<div id="addstn2" >
   <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-primary" id="addstn1" value="<%=nstn %>" >Add Station</button>
   </div><br><div style="display: inline; color:brown; font-size:12px;" > <i> Note: You can not add a Station Name/Km in a particular Major Section which has been added once even after its deletion. To add a deleted Station Name/Km in a particular Major Section, undelete the Station Name/Km.</i></div>		
	<div id="sdialogid222" style="display: none"
								align="center">
								<br> You can add up to  100 Stations only....<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="$('#sdialogid222').dialog('close');">cancel</button>
	</div>
							
	
</td></tr>

</table>
<tr>

<td>
 <table style="width:600px;">
  <h5><b>Package Details:</b></h5>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div id="temp" style="margin: -10px 0px -20px 55px;">No of Packages:</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name='packagesofproject' id='packagesofproject' style="width: 245px;margin-left:60px" onchange="javascript:packageval(this.value);">
						<option value="0">Select no of packages </option>
						<c:forEach var="i" begin="1" end="15">
   						<option value="${i}">${i}</option>
  						</c:forEach>
						</select>
					<br/>	
					<div id='packagediv'>				
					</div>	    
	
</td>
</tr>
</table>

<br/>			
					<br/>				
 				</tr>
 				</table>
 
 			  	</td>
 				<td style="width:65%;" valign="top" >
 				
 				<div id ="ProjectList" > 				
 				</div>	
 						
 				</td></tr>
 				</table>
 				
 				
	   	 <br>
	   	 
	   	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<button type="button" class="btn btn-primary" id="btnclick" style="margin-left:50px;"onclick="javascript:validate();">Next</button>  
		<div id="dialogid1" style="display: none"
								align="center">
								<br> Please Select Different Package Name<br>
								<br>
								<button id="cancel" class="btn btn-primary"
									onclick="$('#dialogid1').dialog('close');">cancel</button>
							</div>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-primary"
			value="Cancel" style="margin-left:50px;" onclick="myFunction()" />
		<div id="dialogid" style="display: none"
								align="center">
								<br> Please Fill Complete/Correct Data<br>
								<br>
								<button id="cancel" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');">cancel</button>
							</div>
	
</c:if>

<c:if test="${param.Project_stage != null}">


<%
String parsedDate=null;
		String Outprojectid="";		
		
		if (request.getParameter("buttonName") != null) { 
		String str=request.getParameter("buttonName");
		String str1=request.getParameter("Project_stage");
		System.out.println("-button name--"+ str+ "--prject stage="+str1);
		if(str.equalsIgnoreCase("saveprojectdetails") && request.getParameter("Project_stage").equalsIgnoreCase("first")){
	
			String Projectname=request.getParameter("Project");
			String PIU_of_RVNL = request.getParameter("PIU_name");
			pageContext.setAttribute("PIU",PIU_of_RVNL,PageContext.SESSION_SCOPE);
			String Project_Type = request.getParameter("Project_Type");
			pageContext.setAttribute("PROJECTS",Project_Type,PageContext.SESSION_SCOPE);

			String start_Date=	request.getParameter("start_Date");


Date initDate = new SimpleDateFormat("dd/MM/yyyy").parse(start_Date);
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
 parsedDate = formatter.format(initDate);



		//	String CooDepartment=	request.getParameter("Coordinating_Department");
		    String Dept_of_RVNL = request.getParameter("Department_RVNL");
		    //String Designation_RVNL = request.getParameter("Designation_RVNL");
			String Designation_RVNL = request.getParameter("designation");
		    String Coordinator_name= request.getParameter("projectinCharge");
		    String No_Majsec = request.getParameter("No_Majsec");
		    String No_Stn = request.getParameter("No_Stn");
			
			String packagesofproject = request.getParameter("packagesofproject");
			//System.out.println("11111 project name="+Projectname+" "+PIU_of_RVNL+" "+Project_Type+" "+start_Date+" "+" "+" "+Coordinator_name+" "+packagesofproject);
			//System.out.println("xxD:"+Dept_of_RVNL+Designation_RVNL);
			Connection conn = null;
			try{				
Date date =new SimpleDateFormat("dd/MM/yyyy").parse(start_Date);
java.sql.Date st = new java.sql.Date(date.getTime());
//System.out.println("ssst"+st);

			%>
			<INPUT TYPE="HIDDEN" NAME="noOfPackages" id ="noOfPackages" value ='<%=packagesofproject%>'>
			
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
	   INSERT INTO xx_projectattributes_master (Project,Project_Coordinator,PIU_of_RVNL,Project_Type,StartDate,PackageOfProject,CoordinatingDepartment,designation,Proj_create_date) VALUES ('<%=Projectname%>','<%=Coordinator_name%>','<%=PIU_of_RVNL%>','<%=Project_Type%>','<%=st%>','<%=packagesofproject%>','<%=Dept_of_RVNL%>','<%=Designation_RVNL%>',now());
	</sql:update>

			<%
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
			conn = ds.getConnection();
			Statement seq_stmt = conn.createStatement();
			ResultSet seq_rs = seq_stmt.executeQuery("SELECT MAX(project_id)  from xx_projectattributes_master");
			String project_id =null;
			while (seq_rs.next()) {
				project_id = seq_rs.getString(1);
			}
			pageContext.setAttribute("ProjectID",project_id,PageContext.SESSION_SCOPE);
			/*
			java.util.ArrayList<String> kmajal=new java.util.ArrayList<String>();
			java.util.ArrayList<String> kfkal=new java.util.ArrayList<String>();
			java.util.ArrayList<String> ktkal=new java.util.ArrayList<String>();
			java.util.ArrayList<String> smajal=new java.util.ArrayList<String>();
			java.util.ArrayList<String> stnal=new java.util.ArrayList<String>();
			java.util.ArrayList<String> skmal=new java.util.ArrayList<String>();
			*/
			for (int i = 1; i <= Integer.parseInt(No_Majsec); i++) {
				String Majsec_name = request.getParameter("Majsec"+i);
				String majdel5 = request.getParameter("majdel"+i);
				//System.out.println(Majsec_name+"majdel"+majdel5+(Majsec_name != "")+(Majsec_name != null)+(majdel5=="Delete"));
				if (Majsec_name != "" && Majsec_name != null && majdel5.equalsIgnoreCase("Delete")) { 
					//System.out.println("inside inn"+Majsec_name+"majdel"+majdel5);
					
					String  frmKm1 = request.getParameter("frmKm"+i);
					double frmKm=Double.parseDouble(frmKm1);
					
					String toKm1 = request.getParameter("toKm"+i);
					double toKm=Double.parseDouble(toKm1);
					
					%>
					<sql:update dataSource="jdbc/MySQLDB" var="rs">
					   INSERT INTO xx_project_km (Project_Id, Major_Section, From_Km, To_Km) VALUES ('<%=project_id%>','<%=Majsec_name%>','<%=frmKm%>','<%=toKm%>');
					</sql:update>
					<%
				} }
								
				for (int i = 1; i <= Integer.parseInt(No_Stn); i++) {
					String sMajsec_name = request.getParameter("sMajsec"+i);
					String sdel5 = request.getParameter("sdel"+i);
					if (sMajsec_name != "" && sMajsec_name != null && sdel5.equalsIgnoreCase("Delete")) { 
						String  stn = request.getParameter("stn"+i);
						String stnKm1 = request.getParameter("stnKm"+i);
						double stnKm=Double.parseDouble(stnKm1);
											
						%>
						<sql:update dataSource="jdbc/MySQLDB" var="rs">
						   INSERT INTO xx_project_station (Project_Id, Major_Section, Station_Name, Station_Km) VALUES ('<%=project_id%>','<%=sMajsec_name%>','<%=stn%>','<%=stnKm%>');
						</sql:update>
						<%
					} }
				
			
			java.util.ArrayList<String> packal=new java.util.ArrayList<String>();
			java.util.ArrayList<String> packidal=new java.util.ArrayList<String>();
			for (int i = 0; i < Integer.parseInt(packagesofproject); i++) {
				String packname = request.getParameter("Package"+i);
				packal.add(packname);
			}
				 Iterator<String> packitr=packal.iterator();
				 String packname1=null;
				 String	packageid1=null;
				  while(packitr.hasNext()){
					packname1=packitr.next();
					
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
				   INSERT INTO xx_packages_project (project_id,package_name) VALUES ('<%=project_id%>','<%=packname1%>');
				</sql:update>
				<%				
				Statement package1st = conn.createStatement();
				ResultSet package1rs = package1st.executeQuery("SELECT MAX(package_id)  from xx_packages_project");
				while (package1rs.next()) {
				packageid1 = package1rs.getString(1);
				packidal.add(packageid1);
				}
			}
				  Iterator<String> packiditr=packidal.iterator();
				  int j=0;
				  String packname2=null;
				  String packageids="";
				  while(packiditr.hasNext()){
						packname2=packiditr.next();
						j=j+1;
						if (j==1) {
							packageids=packname2;	
						} else {
							 packageids=packageids+"~"+packname2;		
						}

			
			%>
			<INPUT TYPE="hidden" NAME="packageid"+<%=j%> value=<%=packname2%>>
			<% 
			//String packageids=package1id+"~"+package2id+"~"+package3id+"~"+package4id+"~"+package5id;
			}
			 pageContext.setAttribute("packageids",packageids,PageContext.SESSION_SCOPE);
			 		
			//String [] pakages={package1,package2,package3,package4,package5};
			%>
			
				<br><br>
			
			<table class="table table-hover table-bordered" style="background-color: #F0FFFF">
			
			<%		
			//for(int i=0;i<Integer.parseInt(packagesofproject);i++){
				Iterator<String> pack1itr=packal.iterator();
			 String packname3="";
			 int i=0;
			 while(pack1itr.hasNext()){
					packname3=pack1itr.next();
			
				%>
				<tr>
					<td width="64%">
	&nbsp;&nbsp;&nbsp;&nbsp;<b>Package name : </b><%= packname3%>
						<br><br>
						
						
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Package Start Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				<input type="text" name="pacstart_Date<%=i%>" id ="pacstart_Date<%=i%>" onclick="frezedate('pacstart_Date<%=i%>','<%=parsedDate%>')"  style="width:204px" readonly="true"> <br />
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Railway:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<select name='Railway<%=i%>'  class="drop<%=i%>" style="width:205px;" id ="Railway<%=i%>" onchange="showDivisionspackage(this.value,<%=i%>)">
							<option value="none">--Select Zone --</option>
			<%
			String piu11 =(String)pageContext.getAttribute("PIU",PageContext.SESSION_SCOPE);
			System.out.println("piu is xx "+piu11);
			Statement stmt1 = conn.createStatement();
			ResultSet rs21 = stmt1.executeQuery("select PIU_Id from xx_piu_master where PIU_Name='"+piu11+"'");
			int test3=0;
			while (rs21.next()) {
				test3 = rs21.getInt("PIU_Id");
			
			}
				
					Statement stmt = conn.createStatement();
					ResultSet rs311 = stmt.executeQuery("select distinct Zone_ID from xx_user_zone_mapping where piu_Id="+test3);

					while (rs311.next()) {
					String Zid = rs311.getString("Zone_ID");
					
					String sql31 = "select * from xx_zones_master where Zone_Id="+Zid+" order by Zone_Name";
					PreparedStatement ps31 = conn.prepareStatement(sql31);
					ResultSet rs31 = ps31.executeQuery();
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
			Statement stmt3=conn.createStatement();
					 ResultSet rs312 = stmt3.executeQuery("select distinct Zone_ID from xx_user_zone_mapping where piu_Id="+test3);
			while (rs312.next()) {
			String Zid = rs312.getString("Zone_ID");
				Statement stmt32=conn.createStatement();
				ResultSet rs32 = stmt32.executeQuery("select * from xx_zones_master where Zone_Id="+Zid+" order by Zone_Name");
				while (rs32.next()) {
				String zname2 = rs32.getString("zone_name");
			%>
			<option value="<%=zname2%>"><%=zname2%></option>
			<%
				}
			}
			%>	
			</select> <br /> <br />
			

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Division of Railway:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
        	<div style='display: inline;' id='state<%=i%>'>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
				</div>
			<div style='display: inline;' id = 'state2<%=i%>'></div><br>  <!--  division2 -->
				
							
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project Director:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				
			<input type="text" name="projectinCharge<%=i%>" id ="projectinCharge<%=i%>" maxlength="50"  style="width: 205px"> <br /><br />
			</div>
							
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			
			<%
			String piu =(String)pageContext.getAttribute("PIU",PageContext.SESSION_SCOPE);
			
			%>
			
			  			  
				  <select name='Department_RVNL<%=i %>' id='Department_RVNL<%=i%>' style="width: 205px" onchange='show1(<%=i%>);'>
						<option value="none">-- Select Department --</option>
						<%
						ResultSet dep_rs = stmt.executeQuery("select department_name from xx_departments_master where type ='RVNL' and Department_Name !='Headquarter' order by department_name");
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
						<option value="none">-- Select Designation --</option>						  
				</select> <br /> <br /></div>
				</td>
				 <td width="35%"> 	<br><center> <h5 Style="color:gray;"><b>Details of Documents/ Drgs required for the Package</b></h5></center><br>
				 
				 <table class="table table-hover table-bordered"  align="center" style="background-color: #F0FFFF; ">
				<tr>
				<th width="50px" >S. No.</th> <th > Document/ Drg Type </th> <th width="150px"> Nos. of Documents/ Drgs Required</th></tr>
				
				<%			
				int j2=0;
				ResultSet drg_rs7 = stmt.executeQuery("select Document_Type, Document_Type_Id from xx_documentattributes_master order by Document_Type");
						String drgtyp = null, drgid =null;
					while (drg_rs7.next()) {
						drgtyp = drg_rs7.getString("Document_Type");
						drgid = drg_rs7.getString("Document_Type_Id");
				%>
				<tr><td><%=j2+1 %>.</td> <td><%=drgtyp %>:</td>
				<td> <center><input type="number"  name="no_drg<%=i%>_<%=j2 %>" id ="no_drg<%=i%>_<%=j2 %>"  style="width: 50px; "></center>
				<input type="hidden" name="drgid<%=i%>_<%=j2 %>"  value=<%=drgid %>></td></tr>	
			<%
			j2++;
		}					
	%>		
</table>
<INPUT TYPE="hidden" NAME="nosofDrg<%=i%>" ID="nosofDrg<%=i%>" value=<%=j2%>>		

				  <br /> <br />
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
				
				
				<%
				i=i+1;
			}
			 		
			 %>
			 </td>
				</tr>
				</table>
	
	<center> <button type="button" class="btn btn-primary" onclick="javascript:getvalue11();" style="margin-left:100px">Submit</button> 
       
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" style="margin-left: 200px;" class="btn btn-primary" value="Cancel" onclick="refreshAndClose()"/></center><br><br>
				
				
			 
			<%			
			//conn.close();
			}catch(Exception e){
				
				e.printStackTrace();
			} finally {
			   
			    try { conn.close(); } catch (Exception e) { /* ignored */ }
			}
			
			
		} else if(str.equalsIgnoreCase("savedocumentdetails") && request.getParameter("Project_stage").equalsIgnoreCase("second")){
			String divisions="";
			int count=0;
			String[] divisioncheck ;
			String packageids=(String)pageContext.getAttribute("packageids",PageContext.SESSION_SCOPE);
			String [] pacids=packageids.split("~");
			String projectid="";
			for(int i=0;i<pacids.length;i++){
				String name="pacstart_Date"+i;
				String deptRVNLid="Department_RVNL"+i;
				String desgRVNLid="designation_RVNL"+i;
				
				String packCoordinatorId="projectinCharge"+i;
				
				String sdate=request.getParameter(name);
				String deptRVNL=request.getParameter(deptRVNLid);
				String desgRVNL=request.getParameter(desgRVNLid);
				String packCoordinator=request.getParameter(packCoordinatorId);
				System.out.println("packageid="+pacids[i]+"Sdate="+sdate);
						
				
				Date date =new SimpleDateFormat("dd/MM/yyyy").parse(sdate);
				java.sql.Date st = new java.sql.Date(date.getTime());
				System.out.println("ssst"+st);
							%>
					<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_packages_project set packageStartDate ='<%=st%>',department = '<%=deptRVNL%>' , designation ='<%=desgRVNL%>',package_director='<%=packCoordinator%>' where package_id = '<%=pacids[i]%>'
					</sql:update>
					
					<%
					String sqlprojectid="select project_id from xx_packages_project where package_id='"+pacids[i]+"'";
					Connection conn = null;
					ResultSet rs=null;
					
					try {
						Context initCtx = new InitialContext();
						Context envCtx = (Context) initCtx.lookup("java:comp/env");
						DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

						conn = ds.getConnection();
						Statement statemen=conn.createStatement();
						rs=statemen.executeQuery(sqlprojectid);
						rs.next();
						projectid=rs.getString(1);
						Outprojectid=projectid;
						//conn.close();
					}catch(Exception e){
						e.printStackTrace();
						
					} finally {
					    try { rs.close(); } catch (Exception e) { /* ignored */ }
					    try { conn.close(); } catch (Exception e) { /* ignored */ }
					}
					
					%>
					
					<sql:update dataSource="jdbc/MySQLDB" >
					  update xx_projectattributes_master set completed ='y', Pack_add_edit_date=now() where project_id = '<%=projectid%>'
					</sql:update>
							<%
			String nosdrg1=request.getParameter("nosofDrg"+i);
				int nosdrg =Integer.parseInt(nosdrg1);
		for(int j2=0;j2<nosdrg;j2++){				
			String drgid=request.getParameter("drgid"+i+"_"+j2);
			String nosreqd=request.getParameter("no_drg"+i+"_"+j2);
			%>
			<sql:update dataSource="jdbc/MySQLDB" >
			  insert into xx_project_docnos (Project_Id, Package_Id, Document_Type_Id, Nos_Reqd) VALUES (<%=projectid%>, <%=pacids[i] %>,<%=drgid%>,<%=nosreqd%>);
			</sql:update>
			<%
		}
	}	
			Context initCtx = new InitialContext();
 			Context envCtx = (Context) initCtx.lookup("java:comp/env");
 			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
			
			Connection conn = ds.getConnection();
			String sqlpiu="select PIU_of_RVNL from xx_projectattributes_master where Project_ID="+projectid;  
			 Statement stmtpiu = conn.createStatement();
				ResultSet rspiu = stmtpiu.executeQuery(sqlpiu);
				String piun=null;
			while(rspiu.next()){
				piun=rspiu.getString("PIU_of_RVNL");
				}
			String sqlpiuid="select PIU_Id from xx_piu_master where PIU_Name='"+piun+"'";  
			 Statement stmtpiuid = conn.createStatement();
				ResultSet rspiuid = stmtpiuid.executeQuery(sqlpiuid);
				String piunid=null;
			while(rspiuid.next()){
				piunid=rspiuid.getString("PIU_Id");
				}
			String sqlpiuuid="select distinct User_Id from xx_user_zone_mapping where piu_id="+piunid;  
			 Statement stmtpiuuid = conn.createStatement();
				ResultSet rspiuuid = stmtpiuuid.executeQuery(sqlpiuuid);
				String piuuid=null;
			while(rspiuuid.next()){
				piuuid=rspiuuid.getString("User_Id");
				}
				
			Set<String> zone_ids = new HashSet<String>();
			for(int i=0;i<pacids.length;i++){
				String packageid="";
				if(count<pacids.length){
					packageid=pacids[count];
				}
				for(int j=1;j<=2;j++){
						String name="divisions"+j+":"+i;	
						divisioncheck = request.getParameterValues(name);
						divisions=divisions+"::Zone"+j+":"+i;
						if (divisioncheck != null) 
						{
				 		  for (int k = 0; k < divisioncheck.length; k++) {
				 			
				 			 conn = ds.getConnection();
				 			  
				 			 Statement stmt = conn.createStatement();
								ResultSet rs2 = stmt.executeQuery("select ext_zone_id from xx_divisions_map where division_name = '"+divisioncheck[k]+"'");

								String z_id = null;

								while (rs2.next()) {
									z_id = rs2.getString(1); 
									zone_ids.add(z_id);
											System.out.println("my comments on set="+z_id);
								}
				 			  
								%>
								<sql:update dataSource="jdbc/MySQLDB" var="rs">
								   INSERT INTO xx_project_division_map (package_id,division_name,zone_id) VALUES ('<%=packageid%>','<%=divisioncheck[k]%>','<%=z_id%>');
								</sql:update>
								<%	
							
								
				 			 divisions=divisions+"~"+divisioncheck[k];
				 		  }
						}
				}	
				count++;
			}
		
			Statement stpro=conn.createStatement();
			String sql8 = "select Project from xx_projectattributes_master where Project_ID='"+Outprojectid+"'";
			ResultSet rs2 = stpro.executeQuery("select Project from xx_projectattributes_master where Project_ID='"+Outprojectid+"'");
			String projectname="";
			while (rs2.next()) {
				projectname=rs2.getString("Project");
			}
			
			conn.close();
			
			%>
			<table class="mainClass" style="background-color: #F0FFFF">
			<tr>
			<td>
			<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Project Created successfully with Project ID: <%= Outprojectid%> & Name: <%=projectname %></b>
			<br><br><br>
			
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-primary" value="OK" onClick="refreshAndClose()" />
			
			</td>
			</tr>
			</table>
		<%		
			System.out.println("expected in sumit code");
		}else if(str.equalsIgnoreCase("") && request.getParameter("Project_stage").equalsIgnoreCase("third")){
           	 
 			
 			
 			
 		}
		}
		 %> 
       
		<div id="dialogid" style="display: none"
								align="center">
								<br> Please Fill All Data<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');">cancel</button>
							</div>
</c:if>
</form><br><br><br>

										     

</body>
<br><br><br>

										      <%@include file="included/footer.jsp" %>
 
</html>