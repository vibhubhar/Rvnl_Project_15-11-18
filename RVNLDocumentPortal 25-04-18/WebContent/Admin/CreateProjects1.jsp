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
<%@include file="included/NewHeader.jsp"%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>
 <%@ page buffer="32kb" autoFlush="true" %>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Document Approval Monitoring Portal </title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">    
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script src="resources/jQuery/jquery-1.12.3.min.js"></script> 
<script src="resources/jQuery/jquery-ui.js"></script>
  <script src="resources/jQuery/CSS/jquery-ui.css"></script> -->
 <!--  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>-->
  <script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<script src="resources/JS/Approval_wf230.js"></script>
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<style>
.ui-datepicker-year {
   background-color: #cc0000;
 padding-left:20px;
}
textarea {
   resize: none;
}
* { font-family:Arial; }
h2 { padding:0 0 5px 5px; }
h2 a { color: #224f99; }
a { color:#999; text-decoration: none; }
a:hover { color:#802727; }
p { padding:0 0 5px 0; }

.disabled {pointer-events: none; cursor: not-allowed; border: 1px solid #999; color: #333; opacity: 0.5;}
.disabled option {color: #000; opacity: 1;}
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


   <script>

 //input { padding:5px; border:1px solid #999; border-radius:4px; -moz-border-radius:4px; -web-kit-border-radius:4px; -khtml-border-radius:4px; }
function stopRKey(evt) { 
	  var evt = (evt) ? evt : ((event) ? event : null); 
	  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
	  if ((evt.keyCode == 13))  {return false;} 
	} 

	document.onkeypress = stopRKey; 

   $(function() {
		
		$("#start_Date").datepicker({
			dateFormat : 'dd/mm/yy',
				maxDate:'0', changeYear: true
		}).val();
		//  $( "#Dateofsubmission" ).datepicker();
	});
</script>
   <script type="text/javascript">
	function frezedate(id, startDate) {
		var $j = jQuery.noConflict();

		var idof = id;
		//alert(startDate);
		//var chunks = startDate.split('-');
		
		var formattedDate = startDate;
		//alert(formattedDate);
		$j("#" + idof).datepicker({

			dateFormat : 'dd/mm/yy',
			minDate : formattedDate,
			maxDate : '0', changeYear: true

		}).datepicker("show").val();
		//var today = new Date(); var dd = today.getDate(); 

	}
	
	function majseccheck(id) {
		 var majsec0=document.getElementById("Majsec"+id).value;
			$("#frmKm"+id).val(null);
			$("#toKm"+id).val(null);
			var ans="No";
			//var j=document.getElementById("No_Majsec").value;
			for(var i=1;i<id;i++){
			//	if (i!=id) { 
				var majsec=document.getElementById("Majsec"+i);
				if (majsec!="" && majsec!=null) {
					majsec=document.getElementById("Majsec"+i).value;
					if (majsec0==majsec) {
						ans="yes"; i=id+1;
					}
					}
			//	}
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
		  	var smajsec0=document.getElementById("sMajsec"+id).value;
			 var stn0=document.getElementById("stn"+id).value;
				var ans="No";
				//var j=document.getElementById("No_Stn").value;
				
				for(var i=1;i<id;i++){
					 // alert("hello"+j+"nnn"+i);
					//if (i!=id) { 
					var stn=document.getElementById("stn"+i);
					if (stn!="" && stn!=null) {
						var smajsec=document.getElementById("sMajsec"+i).value;
						stn=document.getElementById("stn"+i).value;
						//alert("hello"+smajsec0+stn0+"nnn"+smajsec+stn+"cond"+(stn0==stn && smajsec0==smajsec));
						if (stn0==stn && smajsec0==smajsec) {
							ans="yes"; i=id+1;
						  }
						}
				//	}
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
					if (smajsec==majsec && majdel1=="Delete") {
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

</script>
<script type="text/javascript">
    function refreshAndClose() {
        window.opener.location.reload(true);
        window.close();
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
</script>

<script>



function showDivisionspackage(str,index) {
	showDivisionspackagesub1(str,index);
//	showDivisionspackagesub2(str,index);
	
}

function showDivisionspackagesub1(str1,index){
	var str = encodeURIComponent(str1);
	//alert("zone1:....."+str+"index"+index);
	index1=index;
	var test="test"+index1;
	var a="#"+test;
	var div = document.getElementById(test);
	 //if (div.style.display !== "none") {
   //     div.style.display = "none";
    //    $("a").val(null); 
   // }
   	div.innerHTML=""; 
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp3 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp3 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp3 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "modifycheck.jsp";
	var z="Zone 1";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=1";
	//alert("zone1:"+url);
	xmlHttp3.onreadystatechange = stateChangespackage;
	xmlHttp3.open("GET", url, true);
	xmlHttp3.send(null);
	
}
/*
function showDivisionspackagesub2(str,index){
	var test="test"+index;
	var a="#"+test;
	var div = document.getElementById(test);
   // if (div.style.display !== "none") {
    //    div.style.display = "none";
     //   $("a").val(null); 
   // }
    div.innerHTML=""; 
	
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
	var url = "modifycheck.jsp";
	var z="Zone 1";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=1";
	xmlHttp2.onreadystatechange = stateChangespackage;  // need to be changed for another dropdown
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
	
}
*/

function stateChangespackage() {
	var divid="test"+index1;

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
	var url = "modifycheck.jsp";
	var z="Zone 2";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=2";
	xmlHttp3.onreadystatechange = stateChanges2package;
	xmlHttp3.open("GET", url, true);
	xmlHttp3.send(null);
}
function stateChanges2package() {
	var divid="test"+index2+index2;

	if (xmlHttp3.readyState == 4 || xmlHttp3.readyState == "complete") {
		document.getElementById(divid).innerHTML = xmlHttp3.responseText
	}
}


</script>

<script type="text/javascript">

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
	    
	   		
	  	$('#Project').on('keypress', function (event) {
	  		   // var regex = new RegExp("^[a-zA-Z0-9]+$");
	  		  var regex = new RegExp("['?!<\">\\\\&]+$");
	  		    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	  		    if (regex.test(key)) {
	  		       event.preventDefault();
	  		       return false;
	  		    }
	  		});

	    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
	    var add_button      = $(".add_field_button"); //Add button ID 
	    
	    //alert(basis1);
	    var x = 1; //initlal text box count
	    var sx=1;
	    var mx=1;
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        var j=document.getElementById("counttest").value;
		var max=17;
		var max_fields=max-j;
		//var max_fields      = diff; //maximum input boxes allowed
	    var basis1 			= document.getElementById("pack").value;
	    var dateofproject 	= document.getElementById("dateofproject").value;
	    var piuname			= document.getElementById("PIU_name").value; 
        var packal3="";
		for (var i=0; i<(j-1); i++) {
			var pacname3=document.getElementById("Package"+i).value; 
		if (i==0) {
			packal3=pacname3;
			} else {
				packal3=packal3+"~"+pacname3;	
			}
		}
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            /* /* $(wrapper).append('<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Package Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="mytext[]" style="width: 240px;"/><a href="#" class="remove_field">Remove</a></div>'); */ //add input box
             var url="addmorepackage.jsp?type=package&dateofproject="+dateofproject+"&projectid="+basis1+"&packal3="+packal3+"&PIU="+piuname;
        	window.open(url,this.target );
        }
    });
    //'width=800,height=900,scrollbars=1,top=0px,left=300px'
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    });
  /*  
    
   */ 
    $('#addmajor1').click(function(e){ //on add input button click
        e.preventDefault();
        var jk=document.getElementById("No_Majsec").value;
		var max=10;
		if(jk < max){ //max input box allowed
            var j1= parseInt(jk)+1;
            var maj4="#Majorsec"+jk;
           // var majsecid2=document.getElementById("Stnid22"+j1).value;
           var majsecid2=null;
           // alert("maj4"+maj4+"j="+j1+"jk"+jk);
            if (j1==10) {var marg="margin-left: 15px;"} else {var marg="margin-left: 22px;"}
             $("<br><div id='Majorsec"+j1+"' style='display: inline'>"+j1+"<INPUT TYPE='HIDDEN' NAME='Majsecid22"+j1+"'>&nbsp;<input type='text' name='Majsec"+j1+"' id ='Majsec"+j1+"'  maxlength='150' style='width:205px;"+  marg+"  margin-top: 15px;' onchange='majseccheck("+j1+");'> &nbsp;"+
             "&nbsp;<input type='number' Step='0.001' name='frmKm"+j1+"' id ='frmKm"+j1+"'  style='width:80px; margin-left:10px;margin-top: 15px;' >"+
             "&nbsp;&nbsp;&nbsp;<input type='number' Step='0.001' name='toKm"+j1+"' id ='toKm"+j1+"'  style='width:80px; margin-left:10px;margin-top: 15px;'>"+
             "&nbsp;&nbsp;&nbsp;&nbsp; <input  type='button' class='btn btn-warning' id='majdelBtn"+j1+"' value='Delete' onClick='deletemajsec(\""+j1+"\", this.value)' /> <INPUT TYPE='HIDDEN' ID='majdel"+j1+"' NAME='majdel"+j1+"' value='Delete'> "+
             "<div id='kdialogid"+j1+"' style='display: none' align='center'><br> Are You Sure You Want To Delete Major Section entry<br> <br>"+
             "<button id='ok"+j1+"' class='btn btn-primary' onclick='majsecdelete(\""+majsecid2+"\",\""+j1+"\");'>OK</button> <button id='cancel"+j1+"' class='btn btn-primary' "+
             " onclick='$(\"#kdialogid"+j1+"\").dialog(\"close\");'>cancel</button> </div> " +
             "<div id='kmdialogid"+j1+"' style='display: none' align='center'><br> Duplicate 'Major Section' entry......<br><br>"+
      		"<button id='canclez"+j1+"' class='btn btn-primary' onclick='$(\"#kmdialogid"+j1+"\").dialog(\"close\");$(\"#Majsec"+j1+"\").focus(); $(\"#Majsec"+j1+"\")[0].setSelectionRange(0,1);'>cancel</button></div></div>").insertAfter(maj4);
             								               		

             // mx++; //text box increment
             document.getElementById("No_Majsec").value=j1; 
           } else {	var dialogid="#kdialogid22";
    			$(dialogid).dialog({
    	        modal: true,
    	        autoOpen: false,
    	        title: "Alert",
    	        width: 400,
    	        height: 200
    	    });
    		 
    		  $(dialogid).dialog('open');
    	  	}
		 $('input').on('keypress', function (event) {
	  		    //var regex = new RegExp("^[a-zA-Z0-9]+$");
	  		    var regex = new RegExp("['?!<\">\\\\&]+$");
	  		    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	  		    if (regex.test(key)) {
	  		       event.preventDefault();
	  		       return false;
	  		    }
	   	  });
	    
    
    });
  
    $('#addstn1').click(function(e){ //on add input button click
        e.preventDefault();
        var j=document.getElementById("No_Stn").value;
		var max=100;
		if(j < max) { //max input box allowed
            var j1= parseInt(j)+1;
            var maj4="#sMajorsec"+j;
            //var stnid2=document.getElementById("Stnid22"+j1).value;
            var stnid2=null;
                        //alert("maj4"+maj4+j1);
             if (j1==10) {var marg="margin-left: 15px;"} else {var marg="margin-left: 25px;"}
             $("<br><div id='sMajorsec"+j1+"' style='display: inline'>"+j1+"<INPUT TYPE='HIDDEN' NAME='Stnid22"+j1+"'><input type='text' name='sMajsec"+j1+"' id ='sMajsec"+j1+"' maxlength='150' style='width:205px; "+ marg+" margin-top: 15px;' onchange='stnmajseccheck("+j1+");'>"+
             "&nbsp;&nbsp;&nbsp;<input type='text' name='stn"+j1+"' id ='stn"+j1+"' maxlength='75' style='width:100px; margin-left:10px;margin-top: 15px;' onchange='stnnamecheck("+j1+");' >"+
             "&nbsp; &nbsp; <input type='number' Step='0.001' name='stnKm"+j1+"' id ='stnKm"+j1+"'  style='width:80px; margin-left:10px;margin-top: 15px;' onchange='stnkmcheck("+j1+");'>"+
             "&nbsp;&nbsp;&nbsp; <input  type='button' class='btn btn-warning' id='sdelBtn"+j1+"' value='Delete' onClick='deletestn(\""+j1+"\", this.value)' /> <INPUT TYPE='HIDDEN' ID='sdel"+j1+"' NAME='sdel"+j1+"' value='Delete'>  "+
             "<div id='sdialogid"+j1+"' style='display: none' align='center'><br> Are You Sure You Want To Delete this Station entry<br><br><button id='oka"+j1+"' class='btn btn-primary' "+
             " onclick='stndelete(\""+stnid2+"\",\""+j1+"\");'>OK</button><button id='cancelc"+j1+"' class='btn btn-primary' onclick='$(\"#sdialogid"+j1+"\").dialog(\"close\");' >cancel</button></div> <div id='stndialogid"+j1+"' style='display: none' align='center'><br>"+
             "Not a Valid entry. Major Section should be one of the mentioned above in km wise details.....<br><br> <button id='canclea"+j1+"' class='btn btn-primary' onclick='$(\"#stndialogid"+j1+"\").dialog(\"close\");"+
             " $(\"#sMajsec"+j1+"\").focus(); $(\"#sMajsec"+j1+"\")[0].setSelectionRange(0,1); '>cancel</button></div><div id='stnnamedialogid"+j1+"' style='display: none' align='center'> <br> Duplicate 'Station Name' entry..........<br><br>"+
             " <button id='canclee"+j1+"' class='btn btn-primary' onclick='$(\"#stnnamedialogid"+j1+"\").dialog(\"close\");$(\"#stn"+j1+"\").focus(); $(\"#stn"+j1+"\")[0].setSelectionRange(0,1);'>cancel</button></div> <div id='stnkmdialogid"+j1+"' style='display: none'"+
             " align='center'><br> Duplicate 'Station Km' entry..........<br><br><button id='canclef"+j1+"' class='btn btn-primary' onclick='$(\"#stnkmdialogid"+j1+"\").dialog(\"close\");$(\"#stnKm"+j1+"\").focus();'>cancel</button></div>"+
             " <div id='stnkm1dialogid"+j1+"' style='display: none' align='center'> <br> 'Station Km' entered is not within the km limits of the major section given above.........<br><br> <button id='canclef"+j1+"' class='btn btn-primary' onclick='$(\"#stnkm1dialogid"+j1+"\").dialog(\"close\");"+
             " $(\"#stnKm"+j1+"\").focus();'>cancel</button> </div></div>" ).insertAfter(maj4);
           
            // sx++; //text box increment
             document.getElementById("No_Stn").value=j1; 
             
           } else { 	var dialogid="#sdialogid222";
    			$(dialogid).dialog({
    	        modal: true,
    	        autoOpen: false,
    	        title: "Alert",
    	        width: 400,
    	        height: 200
    	    });
    		 
    		  $(dialogid).dialog('open');
    	  	}
		 $('input').on('keypress', function (event) {
	  		    //var regex = new RegExp("^[a-zA-Z0-9]+$");
	  		    var regex = new RegExp("['?!<\">\\\\&]+$");
	  		    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	  		    if (regex.test(key)) {
	  		       event.preventDefault();
	  		       return false;
	  		    }
	   	  });
	    
});
    });
 
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
   
	

 function deletepackage1(id){
		 var dialogid="#dialogid"+id;
		 $(dialogid).dialog({
	        modal: true,
	        autoOpen: false,
	        title: "Alert",
	        width: 400,
	        height: 200
	    });
		 
		  $(dialogid).dialog('open');
	}
 
	function packagedelete1(id){
		document.CreateProject.doc_id.value=id;
		document.CreateProject.deletepackage.value="delete";
		document.getElementById("CreateProject").submit();
	}
 
 </script>
</head>
<body>
<%String user = (String)session.getAttribute("user_name");
//System.out.println("UZER:"+user);
String Id =request.getParameter("ID");
int count1=0;
%>
<input type="hidden" name="project_Id" id="project_Id" value="<%=Id%>">
<div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;[Modify Project] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8>
</div>
<form name="CreateProject" id="CreateProject" method="post" style="margin-left:40px; margin-top:45px;" >

<INPUT TYPE="HIDDEN" NAME="count">
<INPUT TYPE="HIDDEN" NAME="buttonName">
<INPUT TYPE="HIDDEN" NAME="ProjectID">
<INPUT TYPE="HIDDEN" NAME="doc_id">
<INPUT TYPE="HIDDEN" NAME="Project_stage">
<INPUT TYPE="HIDDEN" NAME="Project_stage1">
<INPUT TYPE="HIDDEN" NAME="final_project">
<INPUT TYPE="HIDDEN" NAME="deletepackage">
<INPUT TYPE="HIDDEN" NAME="document_type">
<INPUT TYPE="HIDDEN" NAME="designation">
<INPUT TYPE="HIDDEN" NAME="documentid">
<INPUT TYPE="HIDDEN" NAME="Department_RVNL">
<c:if test="${param.Project_stage == null}">
  <table class="table "  >
  <tr class="success"><td colspan="3"><h3 style="text-align:center;"><font color="grey">Create Project</font></h3></td></tr>
<tr><td width="30%">

<table style="background-color: #F0FFFF; "  class="table table-hover table-bordered">
	<h5><b>General Details:</b></h5>
			<tr>

				<td >
				
				<br><br>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PIU of RVNL:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=PIU_name id="PIU_name" style="width: 245px" onchange ="javascript:returnProjects(this.value);"  class="disabled">
						<option value="none">-- Select PIU --</option>
			<%
			java.util.Set<String> userlistal = new java.util.HashSet<String>();
			java.util.ArrayList<String> userlistal1 = new java.util.ArrayList<String>();
			java.util.ArrayList<String> userlistal111 = new java.util.ArrayList<String>();
			ResultSet rs3 = null;
			PreparedStatement  ps3 = null;
			ResultSet rs1=null,rs5=null,rs2=null;PreparedStatement ps1 =null,ps2=null;Connection conn=null;
			Statement stmt = null;
            String piuname = null;
            String prtype = null;
            String prname = null;
            String prstartdate = null;
            String princharge = null;
            String cdepartment = null;
            String designation = null;
            String pkgno = null; 
    		String pakages=null;
    		String dname=null;
			try {
				
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");
				DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

				 conn = ds.getConnection();
				 ps2 = conn.prepareStatement("select * from xx_projectattributes_master where Project_ID="+Id);
				 rs2 = ps2.executeQuery();
				 while(rs2.next()){
					 piuname = rs2.getString("PIU_of_RVNL");
					 prtype =  rs2.getString("Project_Type");
					 prname =  rs2.getString("Project");
					 
					 String prstartdate1 =  rs2.getString("StartDate");
					 SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
					  Date result = formater.parse(prstartdate1);
					  SimpleDateFormat AppDateFormat = new SimpleDateFormat("dd/MM/yyyy");
					  prstartdate=AppDateFormat.format(result);
					 princharge =  rs2.getString("Project_Coordinator");
					 cdepartment =  rs2.getString("CoordinatingDepartment");
					 designation =  rs2.getString("Designation");
					 pkgno =  rs2.getString("PackageOfProject");
				 }
					String sql3 = "select * from xx_piu_master";
					ps3 = conn.prepareStatement(sql3);
					rs3 = ps3.executeQuery();
                   
					while (rs3.next()) {
						 dname = rs3.getString("PIU_Name");
				if(piuname.equalsIgnoreCase(dname)){		
			%>
			<option value="<%=dname%>" selected="selected"><%=dname%></option>

			<%
				}else{
					%>
					<option value="<%=dname%>"><%=dname%></option>
					<%
				}
				}
			}catch(Exception e){
				e.printStackTrace();
			} finally {
				try {
					if (rs3 != null)
						rs3.close();
					if (rs2 != null)
						rs2.close();
					if (ps2 != null)
						ps2.close();
				} catch (Exception e) {
				}	
				try {
			    	if (ps3 != null)
					ps3.close();
				} catch (Exception e) {
				}
				try { conn.close(); } catch (Exception e) { /* ignored */ }
				}
			%>
			<INPUT TYPE="HIDDEN" NAME="piunamemain" value=<%=dname%>>
	  </select> <br /> <br />
				  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project Type:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <select name=Project_Type id="Project_Type" style="width: 245px">
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
			if(prtype.equalsIgnoreCase(ptype)){		
				%>
				<option value="<%=ptype%>" selected="selected"><%=ptype%></option>

				<%
					}else{
						%>
						<option value="<%=ptype%>"><%=ptype%></option>
						<%
					}
		}
		
%>
</select><br />
	<br />
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally {
		try {
			if (rs1 != null)
				rs1.close();
		} catch (Exception e) {
		}
		try {
			if (ps1 != null)
				ps1.close();
			} catch (Exception e) {
			}
		//try { conn.close(); } catch (Exception e) { /* ignored */ }
		}
		%>	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div id="p1" style="margin: 0px 0px -40px 50px;">Project Name: </div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					
 <textarea type="text"  rows="2" cols="20" name="Project" id ="Project" maxlength="200" style="width:  245px" onkeyup="loadXMLDoc('Project','err')"><%=prname%></textarea>
  <span id="err"> </span> <br>
  <br />
		
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project Start Date:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="text" name="start_Date" id ="start_Date"  style="width: 245px" value="<%=prstartdate%>" class="disabled"> <br /><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name Of Project In-charge:
				&nbsp;<input type="text" name="projectinCharge" id ="projectinCharge" maxlength="50" style="width:245px; margin-left:15px" value="<%=princharge%>">
				</div><br /> <br />
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Coordinating Department :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name='Department_RVNL1' id ="Department_RVNL1" style="width: 245px" onchange='show(1);'>
						<option value="<%=cdepartment%>"><%=cdepartment%></option>
						<%
							
								stmt = conn.createStatement();
								rs5 = stmt.executeQuery("select department_name from xx_departments_master where type ='RVNL' and Department_Name!='"+cdepartment+"' and Department_Name !='Headquarter' order by department_name");
								String department = null;// request.getParameter("Zone_name");

								while (rs5.next()) {
									department = rs5.getString("Department_Name");
						%>
						<option value="<%=department%>"><%=department%></option>
						<%
							}
																
						%>
				</select> 
				<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Designation:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id ="DesgDiv_RVNL1" style="display: inline;">
					<select name='designation_RVNL' id='designation_RVNL' style="width: 245px;margin:3px 0px 12px 0px;">
						<option value="<%=designation%>"><%=designation%></option>
						<%
						 String depts="Select DISTINCT Department_Id from xx_departments_master where Department_Name='"+cdepartment+"' and TYPE='RVNL'";
						 
PreparedStatement ps4 = conn.prepareStatement(depts);
  // ps3.setString(1, piu);
   ResultSet rsl = ps4.executeQuery(); 
 while(rsl.next()){
 String depatment_id=rsl.getString(1);

 String sql = "select DISTINCT Designation_name from xx_designation_mapping where Department_id='"+depatment_id+"' and designation_name!='"+designation+"'";
 
 PreparedStatement ps31 = conn.prepareStatement(sql);
   ResultSet rs = ps31.executeQuery(); 
 while(rs.next()){
	
	 String designation_name = rs.getString("designation_name");	
	
	 %>
				<option value="<%=designation_name%>"><%=designation_name%></option>	
								
			<%
				}
			}
			%>	
					</select></div>				  
	
</td></tr> </table>	
<td width="30%" rowspan="2">
<table class="table table-hover table-bordered"   style="background-color: #F0FFFF;">
 <h5><b>Jurisdiction Details:</b></h5>
 <tr><td> <h5><b><font color="gray">Major Section wise Kilometer Details:</font></b></h5>
 <b>SN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Major Section &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; From Km &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To Km </b>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>  
 <div id="Majorsec0" style="display: inline"></div>
<% 
try {
	
	String sql1 = "SELECT * FROM xx_project_km where Project_Id="+Id+" order by Major_Section";
	 ps1 = conn.prepareStatement(sql1);
	 rs1 = ps1.executeQuery();
	 int ct=1;
	 //int nmaj =1;
	while (rs1.next()) {
		String majsecid = rs1.getString("Majsec_Id");
		String majsec = rs1.getString("Major_Section");
		String frmkm = rs1.getString("From_Km");
		String tokm = rs1.getString("To_Km");
%>
<div id="Majorsec<%=ct %>" style="display: inline"> <%=ct %> 
<INPUT TYPE="HIDDEN" NAME="Majsecid22<%=ct %>" value=<%=majsecid%>> &nbsp;
<input type="text" name="Majsec<%=ct%>" id ="Majsec<%=ct%>"  maxlength="150" style="width:205px; margin-left:15px;margin-top: 15px;" onchange="majseccheck(<%=ct %>);" value="<%=majsec%>">
&nbsp;
<input type="number" Step="0.001" name="frmKm<%=ct%>" id ="frmKm<%=ct%>"  style="width:80px; margin-left:10px;margin-top: 15px;" value="<%=frmkm%>" >
&nbsp;
<input type="number" Step="0.001" name="toKm<%=ct%>" id ="toKm<%=ct%>"  style="width:80px; margin-left:10px;margin-top: 15px;" value="<%=tokm%>" >
<%		
//String sql16="select count(*) from xx_document_mapping where Major_Section='"+majsec+"' and Project_Id="+Id;
	String sql16="select count(*) from xx_document_mapping where Majsec_Id="+majsecid+" and Project_Id="+Id;
int document=0;	
	PreparedStatement ps19 = conn.prepareStatement(sql16);
	ResultSet rs19 = ps19.executeQuery();
if(rs19.next()){
document = rs19.getInt(1);
if(document==0){
%>
&nbsp;&nbsp;&nbsp; <input  type="button" class="btn btn-warning" id="majdelBtn<%=ct %>" value="Delete" onClick="deletemajsec('<%=ct%>', this.value)" />
<INPUT TYPE="HIDDEN" ID="majdel<%=ct %>" NAME="majdel<%=ct %>" value="Delete"> 
<%}else{%>
&nbsp;&nbsp;&nbsp; <input  type="button" class="btn btn-warning" value="Delete"  disabled />
<INPUT TYPE="HIDDEN" ID="majdel<%=ct %>" NAME="majdel<%=ct %>" value="Delete"> 
<%
   }
}
%>
							
		<div id="kmdialogid<%=ct %>" style="display: none"
								align="center">
								<br> Duplicate 'Major Section' entry......<br>
								<br>
								<button id="canclez<%=ct %>" class="btn btn-primary"
									onclick="$('#kmdialogid<%=ct %>').dialog('close');$('#Majsec<%=ct %>').focus(); $('#Majsec<%=ct %>')[0].setSelectionRange(0,1);">cancel</button>
				</div>	
				</div><br>						
	<%
	
	ct++;
	}%>
	
	<INPUT TYPE="hidden" NAME="No_Majsec"  Id="No_Majsec" value=<%=(ct-1)%>>
		<INPUT TYPE="hidden" NAME="No_Majsec_old"  Id="No_Majsec_old" value=<%=(ct-1)%>>
	
	<div id="addmajor2" >
   <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-success" id="addmajor1" value="<%=(ct-1)%>" >Add Major Section</button>
   </div>		
	<div id="kdialogid22" style="display: none"
								align="center">
								<br> You can add up to  10 Major Sections only....<br>
								<br>
								<button id="kcancle22" class="btn btn-primary"
									onclick="$('#kdialogid22').dialog('close');">cancel</button>
							</div>
	<%
}catch(Exception e){
	e.printStackTrace();
}finally {
	try {
		if (rs1 != null)
			rs1.close();
	} catch (Exception e) {
	}
	try {
		if (ps1 != null)
			ps1.close();
		} catch (Exception e) {
		}
	}
	%>	
</td></tr>
<tr> <td><br>
 <h5><b><font color="gray">Major Section wise Station Details:</font></b></h5>
<b>SN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Major Section &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Station Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Station Km </b>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
 <div id="sMajorsec0" style="display: inline"></div>
<% 
try {
	
	String sql1 = "SELECT * FROM xx_project_station where Project_Id="+Id+" order by Major_Section";
	 ps1 = conn.prepareStatement(sql1);
	 rs1 = ps1.executeQuery();
	 int ctn=1;
	 int nstn =1;
	while (rs1.next()) {
		String stnid = rs1.getString("Stn_Id");
		String smajsec = rs1.getString("Major_Section");
		String stn = rs1.getString("Station_Name");
		String stnkm = rs1.getString("Station_Km");
%>
<div id="sMajorsec<%=ctn %>" style="display: inline"> <%=ctn %>
<INPUT TYPE="HIDDEN" NAME="Stnid22<%=ctn %>" value=<%=stnid%>>  &nbsp;
<input type="text" name="sMajsec<%=ctn%>" id ="sMajsec<%=ctn%>"  maxlength="150" style="width:205px; margin-left:15px;margin-top: 15px;" onchange="stnmajseccheck(<%=ctn %>);" value="<%=smajsec %>">
&nbsp;
<input type="text" name="stn<%=ctn%>" id ="stn<%=ctn%>" maxlength="75" style="width:100px; margin-left:10px;margin-top: 15px;" onchange="stnnamecheck(<%=ctn %>);" value="<%=stn %>" >
&nbsp;
<input type="number" Step="0.001" name="stnKm<%=ctn%>" id ="stnKm<%=ctn%>"  style="width:80px; margin-left:10px;margin-top: 15px;" onchange="stnkmcheck(<%=ctn %>);" value="<%=stnkm %>">
<%
//String sql16="select count(*) from xx_document_mapping where Major_Section='"+smajsec+"' and Station_Name='"+stn+"' and Project_Id="+Id;
String sql16="select count(*) from xx_document_mapping where Stn_Id="+stnid+" and Project_Id="+Id;
int document=0;	
	PreparedStatement ps19 = conn.prepareStatement(sql16);
	ResultSet rs19 = ps19.executeQuery();
if(rs19.next()){
document = rs19.getInt(1);
if(document==0){
%>
&nbsp;&nbsp;&nbsp; <input  type="button" class="btn btn-warning"  id="sdelBtn<%=ctn %>" value="Delete" onClick="deletestn('<%=ctn %>', this.value)" />
<INPUT TYPE="HIDDEN" NAME="sdel<%=ctn %>" ID="sdel<%=ctn %>" value="Delete"> 
<%}else{%>
&nbsp;&nbsp;&nbsp; <input  type="button" class="btn btn-warning" value="Delete"  disabled />
<INPUT TYPE="HIDDEN" NAME="sdel<%=ctn %>" ID="sdel<%=ctn %>" value="Delete"> 
<%
   }
}
%>
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
									onclick="$('#stnkmdialogid<%=ctn %>').dialog('close');$('#stnKm<%=ctn %>').focus();">cancel</button>
				</div>	
		<div id="stnkm1dialogid<%=ctn %>" style="display: none"
								align="center">
								<br> 'Station Km' entered is not within the km limits of the major section given above.........<br>
								<br>
								<button id="canclef<%=ctn %>" class="btn btn-primary"
									onclick="$('#stnkm1dialogid<%=ctn %>').dialog('close');$('#stnKm<%=ctn %>').focus();">cancel</button>
				</div>		
				</div><br>
  <% 
    ctn++;
  }
	//System.out.println("....kk"+nstn);
  %>
	
	<INPUT TYPE="hidden" NAME="No_Stn"  Id="No_Stn" value=<%=(ctn-1)%>>
	<INPUT TYPE="hidden" NAME="No_Stn_old"  Id="No_Stn_old" value=<%=(ctn-1)%>>	

	<div id="addstn2" >
   <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-success" id="addstn1" value="<%=nstn %>" >Add Station</button>
   </div>		
	<div id="sdialogid222" style="display: none"
								align="center">
								<br> You can add up to  100 Stations only....<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="$('#sdialogid222').dialog('close');">cancel</button>
	</div>
							
		<%
}catch(Exception e){
	e.printStackTrace();
}finally {
	try {
		if (rs1 != null)
			rs1.close();
	} catch (Exception e) {
	}
	try {
		if (ps1 != null)
			ps1.close();
		} catch (Exception e) {
		}
	try { conn.close(); } catch (Exception e) { /* ignored */ }
	} 
	%>	
</td></tr>

</table> 			
 				
 				
 				</td>
</tr><tr>
<td width="35%">
 <table  class="table table-hover table-bordered"   style="background-color: #F0FFFF;" >
		 <h5><b>Package Details:</b></h5>		 
<%

			ResultSet rs20 = null;
			PreparedStatement  ps20 = null;
			ResultSet rs21=null,rs22=null,rs23=null;PreparedStatement ps21 =null,ps22=null;
			Connection conn1=null;
			Statement stmt1 = null;
            String packname = null,packageid=null;
            String zonename = null;
            String divname = null,startdate=null;
            
			try {
				int k=1;
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");
				DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

				 conn1 = ds.getConnection();
	 
				// java.util.Set test=new java.util.HashSet();
				 
				 ps20 = conn1.prepareStatement("select * from xx_packages_project where project_id="+Id);
				 rs20 = ps20.executeQuery();
				 
				 while(rs20.next()){
					 packname= rs20.getString("package_name");
					 packageid= rs20.getString("package_id");
					 startdate= rs20.getString("packageStartDate");
					 String piet= rs20.getString("project_id");
					 String sql16="select count(*) from xx_document_mapping where Package_ID='"+packageid+"' ";
					int document=0;	
						PreparedStatement ps19 = conn1.prepareStatement(sql16);
						ResultSet rs19 = ps19.executeQuery();
					 %>
					 <tr>
					 <td>
					
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Package name <%=(count1+1) %> : 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<input type="text" name="Package<%=count1 %>" id ="Package<%=count1 %>" maxlength="50" style="width:245px; margin-left:15px;margin-top: 15px;"  value="<%=packname%>">
		<%
		if(rs19.next()){
			document = rs19.getInt(1);
			
			if(document==0){
				
			%>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-warning" value="Delete" onClick="deletepackage1('<%=packageid %>')" />
		<%}else{%>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-warning" value="Delete"  disabled/>
		<%}
		}
		%>
		
		
		
		<INPUT TYPE="HIDDEN" NAME="Package<%=count1 %>" value=<%=packname%>>
		<INPUT TYPE="HIDDEN" NAME="pack<%=count1%>">

		<INPUT TYPE="HIDDEN" NAME="Packageid22<%=count1 %>" value=<%=packageid%>>
		<div id="dialogid<%=packageid%>" style="display: none"
								align="center">
								
								<br> Are You Sure You Want To Delete Package<br>
								<br>
								<button id="ok" class="btn btn-primary"	onclick="packagedelete1('<%=packageid%>')">ok</button>
								<button id="cancle" class="btn btn-primary"
									onclick="$('#dialogid<%=packageid%>').dialog('close');">cancel</button>
							</div>
		
	<%
	
	count1++;
	}%>
	
			
	<select name='packagesofproject' id='packagesofproject' style="width: 245px;margin-left:60px;display:none;" value="<%=count1 %>" onchange="javascript:packageval(this.value);">
						
					</select>
				 
				 			<%	 
				 			
			}
			catch(Exception e){
				e.printStackTrace();
			} finally {
			    try { conn1.close(); } catch (Exception e) { /* ignored */ }
			}
				 %>
				
				 <INPUT TYPE="hidden" value="<%=(count1+1)%>" NAME="counttest" id="counttest">
				 
			
				<div class="input_fields_wrap">
   <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="add_field_button btn btn-success" id="pack" value="<%=Id%>">Add More Packages</button>
    <INPUT TYPE="HIDDEN" NAME="dateofproject" id ="dateofproject" value ='<%=prstartdate%>'>
    <!-- <div><input type="text" name="mytext[]"></div> -->
</div>
</td>
</tr>

</table>

<br/>			
									
 				</tr>
 				
 				
 				
 				</table>
 
 			  	</td>
 				 
 </td></tr></table>				
	  
	   	 
	   
<button type="button" style="margin-left:300px; width:150px; height:45px; font-size:18px;" class="btn btn-primary" id="btnclick" onclick="javascript:validatetest();">Next</button>  
		<div id="dialogid1" style="display: none;"
								align="center">
								<br> Please Select Different Package Name<br>
								<br>
								<button id="cancle" class="btn btn-primary" 
									onclick="$('#dialogid1').dialog('close');">cancel</button>
							</div>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="btn btn-primary" style="margin-left:200px; width:150px; height:45px;font-size:18px;"
			value="Cancel" onClick="refreshAndClose()" /> 
		<div id="dialogid" style="display: none"
								align="center">
								<br> Please Fill Complete/Correct Data<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');">cancel</button>
							</div>
	
</c:if>


<c:if test="${param.Project_stage != null}">


<%
String parsedDate=null,packagedata=null, majsecdata=null, stndata=null; 
String package1=null,package2=null,package3=null,package4=null,package5=null;
		String Outprojectid="";		
		String project_id1=request.getParameter("ID");
		if (request.getParameter("buttonName") != null) { 
		String str=request.getParameter("buttonName");
		String str1=request.getParameter("Project_stage");
		
		if(str.equalsIgnoreCase("saveprojectdetails") && request.getParameter("Project_stage").equalsIgnoreCase("first")){
			
			String Projectname=request.getParameter("Project");
			String Dept_of_RVNL = request.getParameter("Department_RVNL1");
		    //String Designation_RVNL = request.getParameter("Designation_RVNL");
			String Designation_RVNL = request.getParameter("designation");
		    String Coordinator_name= request.getParameter("projectinCharge");
			String PIU_of_RVNL = request.getParameter("PIU_name");
			String start_Date=	request.getParameter("start_Date");

//System.out.println("start_date:"+start_Date);
			Date initDate = new SimpleDateFormat("dd/MM/yyyy").parse(start_Date);
			 SimpleDateFormat AppDateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
			  parsedDate=AppDateFormat1.format(initDate);  
			 
			pageContext.setAttribute("PIU",PIU_of_RVNL,PageContext.SESSION_SCOPE);
			String Project_Type = request.getParameter("Project_Type");
			pageContext.setAttribute("PROJECTS",Project_Type,PageContext.SESSION_SCOPE);

// code to update major section details.................................
			String  test = request.getParameter("No_Majsec_old");
		int j=Integer.parseInt(test);
		//int j=k-1;
		 //majsecdata = Integer.toString(j);
		  			String majdel5=null, majsecid5=null, majsec5=null, frmkm5=null, tokm5=null;
// Updating existing records
					for (int i = 1; i <= j; i++) {
						majdel5 = request.getParameter("majdel"+i);
						majsecid5 = request.getParameter("Majsecid22"+i);
				if ( majdel5.equalsIgnoreCase("Undelete")) {
				%>
		<sql:update dataSource="jdbc/MySQLDB" var="rs">
				DELETE FROM xx_project_km where Project_Id=<%=project_id1 %> and Majsec_Id=<%=majsecid5 %>		   
			</sql:update>
				<%		
				} else {				
					majsec5 = request.getParameter("Majsec"+i);
					frmkm5 = request.getParameter("frmKm"+i);
					tokm5 = request.getParameter("toKm"+i);
%>
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
							UPDATE xx_project_km SET Major_Section='<%=majsec5 %>', From_Km=<%=frmkm5 %>, To_Km=<%=tokm5 %> where Project_Id=<%=project_id1 %> and Majsec_Id=<%=majsecid5 %>		   
									</sql:update>
		<%
		}
	}				
// Inserting new records
					String  testn = request.getParameter("No_Majsec");
				int k=Integer.parseInt(testn);
				//int j=k-1;
				// majsecdata = Integer.toString(j);
				int j1=j+1;
							for (int i = j1; i <= k; i++) {
							//majsecid5 = request.getParameter("Majsecid"+i);
							majdel5 = request.getParameter("majdel"+i);
				if ( !majdel5.equalsIgnoreCase("Undelete")) {
					
							majsec5 = request.getParameter("Majsec"+i);
							frmkm5 = request.getParameter("frmKm"+i);
							tokm5 = request.getParameter("toKm"+i);
				%>
					<sql:update dataSource="jdbc/MySQLDB" var="rs">
					  INSERT INTO xx_project_km (Project_Id, Major_Section, From_Km, To_Km) VALUES (<%=project_id1%>,'<%=majsec5%>',<%=frmkm5%>,<%=tokm5%>);
											</sql:update>
				<%
				}
		}
// code to update station details..................
							  test = request.getParameter("No_Stn_old");
						      j=Integer.parseInt(test);
						//int j=k-1;
						 //majsecdata = Integer.toString(j);
						  			String sdel5=null, stnid5=null, smajsec5=null, stn5=null, stnkm5=null;
				// Updating existing records
									for (int i = 1; i <= j; i++) {
										sdel5 = request.getParameter("sdel"+i);
										stnid5 = request.getParameter("Stnid22"+i);
									//	System.out.println("smajid="+stnid5+"stn="+sdel5);
								if ( sdel5.equalsIgnoreCase("Undelete")) {
								%>
						<sql:update dataSource="jdbc/MySQLDB" var="rs">
								DELETE FROM xx_project_station where Project_Id=<%=project_id1 %> and Stn_Id=<%=stnid5 %>		   
							</sql:update>
								<%		
								} else {			
									smajsec5 = request.getParameter("sMajsec"+i);
									stn5 = request.getParameter("stn"+i);
									stnkm5 = request.getParameter("stnKm"+i);
								//	System.out.println("smaj="+smajsec5+"stn="+stn5+stnkm5);
					%>
							<sql:update dataSource="jdbc/MySQLDB" var="rs">
								 UPDATE xx_project_station SET Major_Section='<%=smajsec5 %>', Station_Name='<%=stn5 %>', Station_Km=<%=stnkm5 %> where Project_Id=<%=project_id1 %> and Stn_Id=<%=stnid5 %>					   
													</sql:update>
						<%
						}
				}
										
				// Inserting new records
									testn = request.getParameter("No_Stn");
								k=Integer.parseInt(testn);
								int j2=j+1;
								 
								// majsecdata = Integer.toString(j);
											for (int i = j2; i <= k; i++) {
											//majsecid5 = request.getParameter("Majsecid"+i);
											sdel5 = request.getParameter("sdel"+i);
				                 if ( !sdel5.equalsIgnoreCase("Undelete")) {
											smajsec5 = request.getParameter("sMajsec"+i);
											stn5 = request.getParameter("stn"+i);
											stnkm5 = request.getParameter("stnKm"+i);
											
								%>
									<sql:update dataSource="jdbc/MySQLDB" var="rs">
									  INSERT INTO xx_project_station (Project_Id, Major_Section, Station_Name, Station_Km) VALUES (<%=project_id1%>,'<%=smajsec5%>','<%=stn5%>',<%=stnkm5%>);
															</sql:update>
		<%
			}
		}								
// code to update package details........................											
// code to find package id---------- from hidden paramter
  test = request.getParameter("counttest");
 k=Integer.parseInt(test);
 j=k-1;
 packagedata = Integer.toString(j);
  			String packname5=null;
			 String	packid5=null;
			for (int i = 0; i < j; i++) {
			packid5 = request.getParameter("Packageid22"+i);
%>
<INPUT TYPE="hidden" value="<%=packid5 %>" NAME="packold<%=i%>" id="packold<%=i%>">

<%

	packname5 = request.getParameter("Package"+i);
	%>
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
							   UPDATE xx_packages_project SET package_name='<%=packname5 %>' where package_id='<%=packid5 %>'
							</sql:update>
<%
}
			Connection conn = null;
	
			try{				
//Date date =new SimpleDateFormat("dd/MM/yyyy").parse(start_Date);
//java.sql.Date st = new java.sql.Date(date.getTime());


		
			%>
			<INPUT TYPE="HIDDEN" NAME="noOfPackages" id ="noOfPackages" value ='<%=packagedata%>'>
	

			<sql:update dataSource="jdbc/MySQLDB" var="rs">
	   UPDATE  xx_projectattributes_master SET Project='<%=Projectname%>',Project_Coordinator='<%=Coordinator_name%>',Project_Type='<%=Project_Type%>',PackageOfProject='<%=packagedata%>',CoordinatingDepartment='<%=Dept_of_RVNL%>',designation='<%=Designation_RVNL%>', Proj_create_date=now() where Project_ID='<%=project_id1 %>'
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
		/*	 package1 = request.getParameter("Package1");
			 package2 = request.getParameter("Package2");
			package3 = request.getParameter("Package3");
			package4 = request.getParameter("Package4");
			 package5 = request.getParameter("Package5");
			*/

			%>
				<br><br>
			
			<table class="table table-hover table-bordered" style="background-color: #F0FFFF">
						
			<%		String first=null;
			String second=null;
				PreparedStatement ps21=null;
				try {
					int i=0;
					int k1=1;
					 Context initCtx1 = new InitialContext();
					Context envCtx1 = (Context) initCtx1.lookup("java:comp/env");
					DataSource ds1 = (DataSource) envCtx1.lookup("jdbc/MySQLDB");

					Connection con = ds1.getConnection();
					java.util.ArrayList<String> userlistal1 = new java.util.ArrayList<String>();
				String desig=null,dep=null,pack_director=null,packname1=null,packageid1=null,startdate1=null,div_name=null,zone_id=null;
				
				//Adding all zones inside arraylist
				
				String sql0="select * from xx_packages_project where project_id="+Id+" order by package_id";
				 
				PreparedStatement ps310 = con.prepareStatement(sql0);
				ResultSet rs2210 = ps310.executeQuery();
				
				 String zone_idmain=null;
				 while(rs2210.next()){
					 zone_idmain= rs2210.getString("package_id");
					 //getting zone id from package id
					 
					 
					 
					 String sql000="select * from xx_project_division_map where package_id="+zone_idmain;
						 
						PreparedStatement ps31000 = con.prepareStatement(sql000);
						ResultSet rs221000 = ps31000.executeQuery();
						
						 String zone_namemainid=null;
						 while(rs221000.next()){
							 zone_namemainid= rs221000.getString("zone_id");
					 
					 
				//getting data from zoneid to zone name	 
					 String sql00="select * from xx_zones_master where Zone_Id="+zone_namemainid;
						 
						PreparedStatement ps3100 = con.prepareStatement(sql00);
						ResultSet rs22100 = ps3100.executeQuery();
						
						 String zone_namemain=null;
						 while(rs22100.next()){
							 zone_namemain= rs22100.getString("Zone_Name");
					 
							 userlistal1.add(zone_namemain); 				 
					 
				 }
						 }
				 }
				
				// closing all zone details inside 
				String sql="select * from xx_packages_project where project_id="+Id+" order by package_id";
			 
				PreparedStatement ps31 = con.prepareStatement(sql);
				ResultSet rs221 = ps31.executeQuery();
				
				 
				 while(rs221.next()){
					 packname1= rs221.getString("package_name");
					  packageid1= rs221.getString("package_id");
					 startdate1= rs221.getString("packageStartDate");
					 dep= rs221.getString("department");
					 desig= rs221.getString("designation");
					 pack_director= rs221.getString("package_director");
					 if (startdate1!=null){
					 SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
					  Date result = formater.parse(startdate1);
					  SimpleDateFormat AppDateFormat = new SimpleDateFormat("dd/MM/yyyy");
					  startdate1=AppDateFormat.format(result);  
					   
					  } 
					 if (dep!=null){}else{dep="";}
					 if (desig!=null){}else{desig="";}
					 if (pack_director!=null){}else{pack_director="";}
					  
						
				%>
				<tr>
					<td width="65%">
	&nbsp;&nbsp;&nbsp;&nbsp;<b>Package name : </b><%= packname1%>
	<input type="hidden" name="packagenames<%=i %>" id="packagenames<%=i %>" value="<%=packname1 %>">
	<input type="hidden" name="packageid<%=i%>" id="packageid<%=i %>" value="<%=packageid1 %>">
						<br><br>
				<% if (startdate1!=null){
					
					%>		
										
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Package Start Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				<input type="text" name="pacstart_Date<%=i%>" id ="pacstart_Date<%=i%>" onclick="frezedate('pacstart_Date<%=i%>','<%=parsedDate%>')" value="<%=startdate1 %>"  style="width:204px" readonly="true"> <br />
						<br>
						<%
				} else {
					%>
											
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Package Start Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				<input type="text" name="pacstart_Date<%=i%>" id ="pacstart_Date<%=i%>" onclick="frezedate('pacstart_Date<%=i%>','<%=parsedDate%>')"  style="width:204px" readonly="true"> <br />
						<br>
						<%
				}
				  
						String sql1="select DISTINCT(zone_id) from xx_project_division_map where package_id="+packageid1;
						
						PreparedStatement ps311 = con.prepareStatement(sql1);
						ResultSet rs211 = ps311.executeQuery();
						String [] zones=new String[2];

						 int count=0;
						 String name=null;
						 while(rs211.next()){
							 //div_name= rs211.getString("division_name");
							 zone_id= rs211.getString("zone_id");
							 String sql12="select * from xx_zones_master where Zone_Id="+zone_id;
								
								PreparedStatement ps3111 = con.prepareStatement(sql12);
								ResultSet rs2121 = ps3111.executeQuery();
								
								 
								 if(rs2121.next()){
									  zones[count]=rs2121.getString("Zone_Name");
					 
					 count++;
					 
								
						 }
						
						
						 }
						 first=zones[0];
						 second=zones[1];
						 if(first==null){
							 first="--Select--";
						 }
						 if(second==null){
							 second="--Select--";
						 }
						 java.util.ArrayList<String> zonenamesent = new java.util.ArrayList<String>();
						 String divisionselected=null;
						 String zname = null,zname2= null;// request.getParameter("Zone_name");
							Statement stmt = conn.createStatement();
						 String sql161="select Zone from xx_document_mapping where Package_ID='"+packageid1+"' group by Zone";
							
								PreparedStatement ps191 = conn.prepareStatement(sql161);
								ResultSet rs191 = ps191.executeQuery();
													
								String znamesent =null;
								while (rs191.next()){
					 znamesent = rs191.getString("Zone");
					 zonenamesent.add(znamesent);
						}
				%>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Railway:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%
				String zname3=null;
				java.util.ArrayList<String> zonalpk = new java.util.ArrayList<String>();
				String piu11 =(String)pageContext.getAttribute("PIU",PageContext.SESSION_SCOPE);
				
				Statement stmt1 = conn.createStatement();
				ResultSet rs21 = stmt1.executeQuery("select PIU_Id from xx_piu_master where PIU_Name='"+piu11+"'");
				int test3=0;
				while (rs21.next()) {
					test3 = rs21.getInt("PIU_Id");
				
				}
						Statement stmt4 = conn.createStatement();
						ResultSet rs311 = stmt4.executeQuery("select distinct Zone_ID from xx_user_zone_mapping where piu_Id="+test3);

						while (rs311.next()) {
						String Zid = rs311.getString("Zone_ID");
						
						String sql31 = "select * from xx_zones_master where Zone_Id="+Zid+" order by Zone_Name";
						PreparedStatement ps313 = conn.prepareStatement(sql31);
						ResultSet rs313 = ps313.executeQuery();
						while (rs313.next()) {
							String zname1=rs313.getString("Zone_Name");
							zonalpk.add(zname1);
						}
						}
						zonalpk.add("--Select--");
						Collections.sort(zonalpk);
					//System.out.println("zonalpk="+zonalpk+"first"+first+"second"+second);
			if(zonenamesent.contains(first) &&  zonenamesent.contains(second)){
			%>
				<select name='Railway<%=i%>'  class="drop<%=i%> disabled" style="width:205px;" id ="Railway<%=i%>" onchange="showDivisionspackage(this.value,<%=i%>)" >
									<%
			 for (int c = 0; c < zonalpk.size(); c++) {
	            	zname3 = zonalpk.get(c);
	       		if (!zname3.equalsIgnoreCase(second)) {
	       			if (zname3.equalsIgnoreCase(first)) {
			%>
			<option value="<%=first %>" selected><%=first %></option>
	<%
	       			} else {
	       %>
			<option value="<%=zname3%>"><%=zname3%></option>
			<%
						}
				}
			 }
			%>
			</select> 
					
				<select name='secondRailway<%=i%>' class="drop<%=i%> disabled" style="width: 205px; margin-left:50px" id ="secondRailway<%=i%>" onchange="showDivisions2package(this.value,<%=i%>)">
				<%
						for (int c = 0; c < zonalpk.size(); c++) {
			            	zname3 = zonalpk.get(c);
			       		if (!zname3.equalsIgnoreCase(first)) {
			       			if (zname3.equalsIgnoreCase(second)) {
					%>
					<option value="<%=second %>" selected><%=second %></option>
			<%
			       			} else {
			       %>
					<option value="<%=zname3%>"><%=zname3%></option>
					<%
								}
						}
					 }
					%>
			</select> <br /> <br />
				
				
				<%}else{
					
				if(zonenamesent.contains(first) || zonenamesent.contains(second)){
					
					
					 if(zonenamesent.contains(first)){
							%>
						

			<select name='Railway<%=i%>'  class="drop<%=i%> disabled" style="width:205px" id ="Railway<%=i%>" onchange="showDivisionspackage(this.value,<%=i%>)" >
						<%
						for (int c = 0; c < zonalpk.size(); c++) {
			            	zname3 = zonalpk.get(c);
			       		if (!zname3.equalsIgnoreCase(second)) {
			       			if (zname3.equalsIgnoreCase(first)) {
					%>
					<option value="<%=first %>" selected><%=first %></option>
			<%
			       			} else {
			       %>
					<option value="<%=zname3%>"><%=zname3%></option>
					<%
								}
						}
					 }
					%>
											</select> 
							<select name='secondRailway<%=i%>' class="drop<%=i%>" style="width: 205px; margin-left:50px" id ="secondRailway<%=i%>" onchange="showDivisions2package(this.value,<%=i%>)" style="background:#A9A9A9;" >
						<%
						for (int c = 0; c < zonalpk.size(); c++) {
			            	zname3 = zonalpk.get(c);
			       		if (!zname3.equalsIgnoreCase(first)) {
			       			if (zname3.equalsIgnoreCase(second)) {
					%>
					<option value="<%=second %>" selected><%=second %></option>
			<%
			       			} else {
			       %>
					<option value="<%=zname3%>"><%=zname3%></option>
					<%
								}
						}
					 }
					%>
						</select> <br /> <br />
						<%
						} else if(zonenamesent.contains(second)){
						 
						 
				%>
			


<select name='Railway<%=i%>'  class="drop<%=i%>" style="width:205px" id ="Railway<%=i%>" onchange="showDivisionspackage(this.value,<%=i%>)" >
					<%
						for (int c = 0; c < zonalpk.size(); c++) {
			            	zname3 = zonalpk.get(c);
			       		if (!zname3.equalsIgnoreCase(second)) {
			       			if (zname3.equalsIgnoreCase(first)) {
					%>
					<option value="<%=first %>" selected><%=first %></option>
			<%
			       			} else {
			       %>
					<option value="<%=zname3%>"><%=zname3%></option>
					<%
								}
						}
					 }
					%>
				
		</select> 
				
				<select name='secondRailway<%=i%>' class="drop<%=i%> disabled" style="width: 205px; margin-left:50px" id ="secondRailway<%=i%>" onchange="showDivisions2package(this.value,<%=i%>)" >
					<%
						for (int c = 0; c < zonalpk.size(); c++) {
			            	zname3 = zonalpk.get(c);
			       		if (!zname3.equalsIgnoreCase(first)) {
			       			if (zname3.equalsIgnoreCase(second)) {
					%>
					<option value="<%=second %>" selected><%=second %></option>
			<%
			       			} else {
			       %>
					<option value="<%=zname3%>"><%=zname3%></option>
					<%
								}
						}
					 }
					%>
				
			</select> <br /> <br />
				<%}
								
				}else{
				//	System.out.println("Printing inside else part------------");
					%>	<select name='Railway<%=i%>'  class="drop<%=i%>" style="width:205px" id ="Railway<%=i%>" onchange="showDivisionspackage(this.value,<%=i%>)"  >
			<%
			 for (int c = 0; c < zonalpk.size(); c++) {
	            	zname3 = zonalpk.get(c);
	       		  if (zname3.equalsIgnoreCase(first)) {
			%>
			<option value="<%=first %>" selected><%=first %></option>
	<%
	       			} else if (!zname3.equalsIgnoreCase(second) || zname3.equalsIgnoreCase("--Select--")) {
	       			// || zname3.equalsIgnoreCase("--Select--")
	       %>
			<option value="<%=zname3%>"><%=zname3%></option>
			<%
						}
				}
			%>
						</select> 
					<select name='secondRailway<%=i%>' class="drop<%=i%>" style="width: 205px; margin-left:50px" id ="secondRailway<%=i%>" onchange="showDivisions2package(this.value,<%=i%>)"  >
				<% 
				 for (int c = 0; c < zonalpk.size(); c++) {
		            	zname3 = zonalpk.get(c);
		       	
		       			if (zname3.equalsIgnoreCase(second)) {
				%>
				<option value="<%=second %>" selected><%=second %></option>
		<%
		       			} else 	if (!zname3.equalsIgnoreCase(first)) {
		       %>
				<option value="<%=zname3%>"><%=zname3%></option>
				<%
							}
					}
				%>
			
				</select> <br /> <br />
					<%	
					
								
				}
				
				}
		
				%>
						 
						
				
		<%-- <script>
		var nam='<%=first%>';
		showDivisionspackage('<%=first%>',<%=i%>);
		</script> --%>
		
		
			<%-- <script>
			var name1=<%=second%>;
		showDivisions2package('<%=second%>',<%=i%>);
		</script> --%>
			<script type="text/javascript">
			
			var $drops<%=i%> = $('[class^="drop<%=i%>"]');
			$drops<%=i%>.change(function(){
				   //alert("opt");
			   
			    	var $other<%=i%> = $drops<%=i%>.not(this),
			        otherVal<%=i%> = $other<%=i%>.val(),
			         newVal<%=i%> = $(this).val();
			         if ($(this).attr('id')=="Railway<%=i%>") {
			        	var $options<%=i%> = $drops<%=i%>.eq(0).children().clone();
			       	} else {
			        	var $options<%=i%> = $drops<%=i%>.eq(1).children().clone();
			         }
			       var $opts<%=i%> = $options<%=i%>.clone().filter(function(){
			        	
			    	   return this.value !== newVal<%=i%>;
			    	   
			        	     })
			    
			       $other<%=i%>.html($opts<%=i%>).val();
			       $other<%=i%>.append("<option value='"+otherVal<%=i%>+"' selected>"+otherVal<%=i%>+"</option>");
			       var sel = $other<%=i%>;
			       var selected1 = sel.val(); // cache selected value, before reordering
			       var opts_list = sel.find('option');
			       opts_list.sort(function(a, b) { return $(a).text() > $(b).text() ? 1 : -1; });
			       sel.html('').append(opts_list);
			       sel.val(selected1); // set cached selected value
			    
			});
			      
</script>	

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Division of Railway:<Br>
<div id="test<%=i%>" style="display:inline;"> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zone 1 :
					
					
			<%
			//java.util.Set<String> div1main=new java.util.HashSet<String>();
			//java.util.Set<String> div2main=new java.util.HashSet<String>();
			java.util.ArrayList<String> div1main = new java.util.ArrayList<String>();
			java.util.ArrayList<String> div2main = new java.util.ArrayList<String>();
			java.util.Set<String> div1mainsel=new java.util.HashSet<String>();
			java.util.Set<String> div2mainsel=new java.util.HashSet<String>();
			java.util.Set<String> divdocsent=new java.util.HashSet<String>();
			//first zone name value-------------------------------------------	
			String sqlzonename1="select * from xx_zones_master where Zone_Name='"+first+"'";
			
String zoneid1=null,zoneid2=null;

PreparedStatement ps31zone1 = con.prepareStatement(sqlzonename1);
ResultSet rs221zone = ps31zone1.executeQuery();

 
 while(rs221zone.next()){
	 zoneid1= rs221zone.getString("Zone_Id");
 }
 
 
 // Sdeoncd zone name value--------------------------------------
 
 
                    String sqlzonename2="select Zone_Id from xx_zones_master where Zone_Name='"+second+"'";
                    PreparedStatement ps31zone2 = con.prepareStatement(sqlzonename2);
                    ResultSet rs221zone2 = ps31zone2.executeQuery();

                     
                     while(rs221zone2.next()){
                    	 zoneid2= rs221zone2.getString("Zone_Id");
                     }
                     
                     
                     
                     
					// display data for first zone -----------------------------------------------------------
					String packnamezone2iddiv=null;
                     String sqlzonenamefirstdiv="select division_name from xx_project_division_map where zone_id='"+zoneid1+"' and package_id='"+packageid1+"' and division_name != 'Headquarters'";
                    
                     PreparedStatement ps31zone2div = con.prepareStatement(sqlzonenamefirstdiv);
                     ResultSet rs221zone2div = ps31zone2div.executeQuery();

                      
                      while(rs221zone2div.next()){
                     	 packnamezone2iddiv= rs221zone2div.getString("division_name");// store division what we have selected initially
                     	div1mainsel.add(packnamezone2iddiv);
                      }
                     
           // query to select first all division lying in particular zone
           
                      String divall=null;
                      String sqldivall="select Division_Name from xx_divisions_map where Ext_Zone_Id='"+zoneid1+"' and Division_Name != 'Headquarters' order by Division_Name";
                      
                      PreparedStatement sqldiv = con.prepareStatement(sqldivall);
                      ResultSet rsdiv = sqldiv.executeQuery();

                       
                       while(rsdiv.next()){
                      	 divall= rsdiv.getString("Division_Name");
                      	 div1main.add(divall);// store all division without select of particular zone first
                       }
                      	// query to store / select all divisions lying in second zone
			
                       String divall2=null;
                       String sqldivall2="select Division_Name from xx_divisions_map where Ext_Zone_Id='"+zoneid2+"' and Division_Name != 'Headquarters' order by Division_Name";
                       
                       PreparedStatement sqldiv2 = con.prepareStatement(sqldivall2);
                       ResultSet rsdiv2 = sqldiv2.executeQuery();

                        
                        while(rsdiv2.next()){
                       	 divall2= rsdiv2.getString("Division_Name");
                       	div2main.add(divall2);  // store all division without select of particular zone second---------------------------------------
                        }
                     	//display data for second zone-----------------------------------------------------------------
                      
					
					String packnamezone2iddiv1=null;
                      String divsecond="select division_name from xx_project_division_map where zone_id='"+zoneid2+"' and package_id='"+packageid1+"' and division_name != 'Headquarters' order by Division_Name";
                     
                      PreparedStatement ps31zone2div11 = con.prepareStatement(divsecond);
                      ResultSet rs221zone2div111 = ps31zone2div11.executeQuery();

                       
                       while(rs221zone2div111.next()){
                      	 packnamezone2iddiv1= rs221zone2div111.getString("division_name");//store division initilay selected from second zone
                      	div2mainsel.add(packnamezone2iddiv1);
                       }
                      
         // checking whether any document of this package is sent to any division of this zone..
                       	String sql162="select Division from xx_document_mapping where Package_ID='"+packageid1+"' group by Division";
						PreparedStatement ps192 = conn.prepareStatement(sql162);
							ResultSet rs192 = ps192.executeQuery();
												
							String divnamesent =null;
							while (rs192.next()){
				 divnamesent = rs192.getString("Division");
				 divdocsent.add(divnamesent);
					}
        // Printing my first division names
                       Iterator<String> divitr=div1main.iterator();
						String username=null;
					while(divitr.hasNext()){
						username=divitr.next();	
						
					if(div1mainsel.contains(username)){
					if(divdocsent.contains(username)){
					%>
					
					 <input type ='checkbox' name='divisions<%=1%>:<%=i %>' class='divisions<%=1%>:<%=i %> disabled' id='divisions<%=1%>:<%=i %>' style="margin-left:45px;display:inline" value="<%=username%>" checked > <%=username%>
					
					<%
					} else {
					%>	
					 <input type ='checkbox' name='divisions<%=1%>:<%=i %>' class='divisions<%=1%>:<%=i %>' id='divisions<%=1%>:<%=i %>' style="margin-left:45px;display:inline" value="<%=username%>" checked > <%=username%>
					
					<%

				}
					}
				else{
					%>
					 
					 <input type ='checkbox' name='divisions<%=1%>:<%=i %>' class='divisions<%=1%>:<%=i %>' id='divisions<%=1%>:<%=i %>' style="margin-left:45px;display:inline" value="<%=username%>" > <%=username%>
					
					<%
					
				
				}
					
					}
					div1mainsel.clear();
					div1main.clear();
					
					
					%></div>
				<br>
				<div id="test<%=i%><%=i %>" style="display:inline;">  
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zone 2 :
					<%
					 
                    Iterator<String> divitr11=div2main.iterator();
						String username1=null;
					while(divitr11.hasNext()){
						username1=divitr11.next();	
						
					if(div2mainsel.contains(username1)){
					if(divdocsent.contains(username1)){
					%>
					
					 <input type ='checkbox' name='divisions<%=2%>:<%=i %>' class='divisions<%=2%>:<%=i %> disabled' id='divisions<%=2%>:<%=i %>' style="margin-left:45px;display:inline" value="<%=username1%>" checked > <%=username1%>
					
					<%
					} else {
						 
					%>
					 <input type ='checkbox' name='divisions<%=2%>:<%=i %>' class='divisions<%=2%>:<%=i %>' id='divisions<%=2%>:<%=i %>' style="margin-left:45px;display:inline" value="<%=username1%>" checked > <%=username1%>
					
					<%
		
				}
					}
				else{
					
					
					%>
					 
					 <input type ='checkbox' name='divisions<%=2%>:<%=i %>' class='divisions<%=2%>:<%=i %>' id='divisions<%=2%>:<%=i %>' style="margin-left:45px;display:inline" value="<%=username1%>" > <%=username1%>
					
					<%
					
				
				}
					
					}
					div2main.clear();
					div2mainsel.clear();  
                       divdocsent.clear();
					%></div>
					
												<script type="text/javascript">
$(document).ready(function() {
    $(".useriddiv<%=i%>").click(function() {
       if ($(this).is(":checked")) { 
          $("#secondRailway<%=i%>").prop("disabled", true);
       } else {
          $("#secondRailway<%=i%>").prop("disabled", false);  
       }
    });
});

$(document).ready(function() {
    $(".useriddiv<%=i%>").click(function() {
       if ($(this).is(":checked")) { 
          $("#Railway<%=i%>").prop("disabled", true);
       } else {
          $("#Railway<%=i%>").prop("disabled", false);  
       }
    });
});

</script>	
<br> <br>

						
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project Director:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				
			<input type="text" name="projectinCharge<%=i%>" id ="projectinCharge<%=i%>" maxlength="50" value="<%=pack_director %>" style="width: 205px"> <br /><br />
			</div>
							
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			
			<%
			String piu =(String)pageContext.getAttribute("PIU",PageContext.SESSION_SCOPE);
			//System.out.println("piu is xx "+piu);
			%>
			
			  			  
				  <select name='Department_RVNL<%=i %>' id='Department_RVNL<%=i%>' style="width: 205px" onchange='show1(<%=i%>);'>
						<option value="<%=dep%>"><%=dep%></option>
						<%
						ResultSet dep_rs = stmt.executeQuery("select department_name from xx_departments_master where type ='RVNL' and Department_Name !='Headquarter' order by department_name");
						String dep_name = null;
						while (dep_rs.next()) {
						dep_name = dep_rs.getString("Department_Name");
						 if (dep_name!=null){}else{dep_name="";}
								
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
						<option value="<%=desig%>"><%=desig%></option>						  
				</select> <br /> <br /></div>
				</td>
				 <td width="35%"> 	<br><center> <h5 Style="color:gray;"><b>Details of Documents/ Drgs required for the Package</b></h5></center><br>
				 <table class="table table-hover table-bordered"  align="center" style="background-color: #F0FFFF; ">
				<tr>
				<th width="50px" >S. No.</th> <th > Document/ Drg Type </th> <th width="150px"> Nos. of Documents/ Drgs Required</th></tr>
				
<%
             int j3=0;
				ResultSet drg_rs7 = stmt.executeQuery("select b.Document_Type_Id, b.Document_Type,  a.Nos_Reqd from xx_documentattributes_master b left join (select * from xx_project_docnos where Project_Id="+project_id1+" and Package_Id="+packageid1+") a on  b.Document_Type_Id = a.Document_Type_Id  order by b.Document_Type");
						String drgtyp = null, drgid =null, nosreqd=null;
					while (drg_rs7.next()) {
						drgtyp = drg_rs7.getString("Document_Type");
						drgid = drg_rs7.getString("Document_Type_Id");
						nosreqd = drg_rs7.getString("Nos_Reqd");
					if (nosreqd==null) {nosreqd="";}	
				%>
				<tr><td><%=j3+1 %>.</td> <td><%=drgtyp %>:</td>
				<td> <center><input type="number"  name="no_drg<%=i%>_<%=j3 %>" id ="no_drg<%=i%>_<%=j3 %>"  value='<%=nosreqd %>' style="width: 50px; "></center>
				<input type="hidden" name="drgid<%=i%>_<%=j3 %>"  value=<%=drgid %>></td></tr>	
			<%
			j3++;
		}	
				
	%>	
</table>
<INPUT TYPE="hidden" NAME="nosofDrg<%=i%>" ID="nosofDrg<%=i%>" value=<%=j3%>>		

				  <br /> <br />

			<%
			i++; 
			}
				 
				}
				catch(Exception e){
					
					e.printStackTrace();
				} 
			 
				
			
			 %>
	</td>
			</tr>
				</table> <br> <br>
				<center><button type="button" class="btn btn-primary" onclick="javascript:getvalue111(<%=packagedata %>);" style="margin-left:100px">Submit</button> 
       
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-primary" style="margin-left: 200px;" value="Cancel" onclick="refreshAndClose()" /></center><br><br>
				
				
			 
			<%	
			}
			catch(Exception e)
			{
				e.printStackTrace();
				
			} finally {
			    try { conn.close(); } catch (Exception e) { /* ignored */ }
			}
			//conn.close();
			
			
			
			
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

<c:if test="${ (param.final_project !=null) && (param.Project_stage1 !=null) }">
<c:if test="${ (param.final_project !='') && (param.Project_stage1 !='') }">
<%
// all package start dates
String packagedata = request.getParameter("noOfPackages");
//java.util.ArrayList<String> packal=new java.util.ArrayList<String>();
//java.util.ArrayList<String> packidal=new java.util.ArrayList<String>();
String packagenames1=null;
 String	Packageid11=null;
 String pacstart_Date1=null;
 String packageid1old=null;
 String projectinCharge1=null;
 String Department_RVNL1=null;
 String designation_RVNL1=null;
 String package1id="";
 String packageids=null;
 String project_id = Id;
 Connection  conn = null;
 try {
		
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

		  conn = ds.getConnection();
 
 
for (int i = 0; i < Integer.parseInt(packagedata); i++) {
 Packageid11 = request.getParameter("packold"+i);
	//packidal.add(packname5);
	System.out.println("package Id---------------"+Packageid11);
	/* Iterator<String> packitr=packal.iterator();
	 
	  while(packitr.hasNext()){
		packname1=packitr.next();
*/


pacstart_Date1 = request.getParameter("pacstart_Date"+i);
if(pacstart_Date1!=null){
Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(pacstart_Date1);
pacstart_Date1 = new SimpleDateFormat("yyyy-MM-dd").format(date1);
}
else{
	pacstart_Date1="";
//	System.out.println("coming inside else first date---------------------");
}
// all packagesend dates here---
if(packagedata==null){
	packagedata="0";	
}
//Old packageid starts from 

packageid1old = request.getParameter("packageid"+i);
if(packageid1old==null){
	packageid1old="";	
}
//project encharge values ends here

// old package id ends here

projectinCharge1 = request.getParameter("projectinCharge"+i);
//project encharge values ends here

// Department encharge values starts here 

Department_RVNL1 = request.getParameter("Department_RVNL"+i);
//department values ends here

//designation values starts here
designation_RVNL1 = request.getParameter("designation_RVNL"+i);
// designation values ends here

//package names values starts here
packagenames1 = request.getParameter("packagenames"+i);
// designation values ends here
//String package1id="";String package2id="";String package3id="";String package4id="";String package5id="";
	
%>
	 <sql:update dataSource="jdbc/MySQLDB" var="rs">
	  UPDATE xx_packages_project SET package_name='<%=packagenames1%>',packageStartDate='<%=pacstart_Date1%>',package_director='<%=projectinCharge1%>',department='<%=Department_RVNL1%>',designation='<%=designation_RVNL1%>' where package_id='<%=Packageid11 %>'
	</sql:update> 
	<%		
		
	Statement package1st = conn.createStatement();
	ResultSet package1rs = package1st.executeQuery("SELECT MAX(package_id)  from xx_packages_project");
	while (package1rs.next()) {
		package1id = package1rs.getString(1);
	}
%>
			<INPUT TYPE="HIDDEN" NAME="packageid<%=i %>" value=<%=package1id%>>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
				   DELETE FROM xx_project_division_map where package_id='<%=Packageid11%>';
				</sql:update>
					
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
				   DELETE FROM xx_project_docnos where package_id='<%=Packageid11%>';
				</sql:update>
		<%
				String nosdrg1=request.getParameter("nosofDrg"+i);
				int nosdrg =Integer.parseInt(nosdrg1);
		for(int j2=0;j2<nosdrg;j2++){				
			String drgid=request.getParameter("drgid"+i+"_"+j2);
			String nosreqd=request.getParameter("no_drg"+i+"_"+j2);
			%>
			<sql:update dataSource="jdbc/MySQLDB" >
			  insert into xx_project_docnos (Project_Id, Package_Id, Document_Type_Id, Nos_Reqd) VALUES (<%=Id%>, <%=Packageid11%>,<%=drgid%>,<%=nosreqd%>);
			</sql:update>
<% 
}	
		
if (i==0) { 
		packageids=Packageid11;
	} else {
		packageids=packageids+"~"+Packageid11;	
	}
}	  //for loop ends here
System.out.println("package ids==="+packageids);
pageContext.setAttribute("packageids",packageids,PageContext.SESSION_SCOPE);
String Outprojectid=null;
String str=request.getParameter("buttonName");
//String [] pakages={packagenames1,packagenames2,packagenames3,packagenames4,packagenames5};
	
	 
			String divisions="";
			int count=0;
			String[] divisioncheck ;
			 packageids=(String)pageContext.getAttribute("packageids",PageContext.SESSION_SCOPE);
			String [] pacids=packageids.split("~");
			String a[]=null;
			
					%>
					
					 <sql:update dataSource="jdbc/MySQLDB" >
					  update xx_projectattributes_master set completed ='y', Pack_add_edit_date=now() where project_id = '<%=project_id%>'
					</sql:update> 
							<%
				
			
			String sqlpiu="select PIU_of_RVNL from xx_projectattributes_master where Project_ID="+project_id;  
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
			for(int i=0; i < Integer.parseInt(packagedata);i++){
				String packageid="";
				if(count<pacids.length){
					packageid=pacids[count];
				}
									
			}
				//System.out.println("last print before--------------------"+packageid);
				int p1=0;
				for(int k1=0;k1<pacids.length;k1++){
				
				
				for(int j=1;j<=2;j++){
						String name="divisions"+j+":"+p1;	
						
						divisioncheck = request.getParameterValues(name);
						
						
						if (divisioncheck != null) 
						{
				 		  for (int k = 0; k < divisioncheck.length; k++) {
				 			
				 			String divisionid=null;  
				 			  
				 			 				 			 				 			  
				 			 conn = ds.getConnection();
				 			  
				 			 Statement stmt = conn.createStatement();
								ResultSet rs2 = stmt.executeQuery("select ext_zone_id from xx_divisions_map where division_name = '"+divisioncheck[k]+"'");

								String z_id = null; 

								while (rs2.next()) {
									z_id = rs2.getString(1); 
									zone_ids.add(z_id);
											
								}
				 			  
								%>
								<sql:update dataSource="jdbc/MySQLDB" var="rs">
								   INSERT INTO xx_project_division_map (package_id,division_name,zone_id) VALUES ('<%=pacids[k1]%>','<%=divisioncheck[k]%>','<%=z_id%>');
								</sql:update>
								<%	
							
								
				 			 divisions=divisions+"~"+divisioncheck[k];
				 		  }
						}
				}	
				count++;
			p1++;	
			}
			
			
			System.out.println("PPP:"+Outprojectid);
		
			Statement stpro=conn.createStatement();
			String sql8 = "select Project from xx_projectattributes_master where Project_ID='"+project_id+"'";
			ResultSet rs2 = stpro.executeQuery("select Project from xx_projectattributes_master where Project_ID='"+project_id+"'");
			String projectname="";
			while (rs2.next()) {
				projectname=rs2.getString("Project");
			}
			
			//conn.close();
			
			%>
			<table class="mainClass" style="background-color: #F0FFFF">
			<tr>
			<td>
			<b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Project Updated successfully with Project ID: <%= project_id%> & Name: <%=projectname %></b>
			<br><br><br>
			
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-primary" value="OK" onClick="refreshAndClose()" />
			</td>
			</tr>
			
			</table>
		<%		
			
		
}catch(Exception e){
e.printStackTrace();
} finally {
    try { conn.close(); } catch (Exception e) { /* ignored */ }
}

%>
</c:if>
</c:if>


<c:if test="${param.deletepackage != null}">
<%


String uri = request.getScheme() + "://" +   // "http" + "://
        request.getServerName() +       // "myhost"
        ":" +                           // ":"
        request.getServerPort() +       // "8080"
        request.getRequestURI() +       // "/people"
        "?" +                           // "?"
        request.getQueryString();  

String projid=null;
int packagedetails=0;
Connection conn = null;
try {
	
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

	  conn = ds.getConnection();
	String delcode =	request.getParameter("deletepackage");
if (delcode.equalsIgnoreCase("delete")) {
String packageid=request.getParameter("doc_id");
String sql112="select * from xx_packages_project where package_id='"+packageid+"'";

PreparedStatement psdat1 = conn.prepareStatement(sql112);
ResultSet rsdat1 = psdat1.executeQuery();
while(rsdat1.next()){
	
	projid=rsdat1.getString("project_id");										
}
String sql1121="select * from xx_projectattributes_master where Project_ID='"+projid+"'";

PreparedStatement psdat11 = conn.prepareStatement(sql1121);
ResultSet rsdat11 = psdat11.executeQuery();
while(rsdat11.next()){
	
	 packagedetails=rsdat11.getInt("PackageOfProject");	
	packagedetails=packagedetails-1;
}

%>
 <sql:update dataSource="jdbc/MySQLDB" var="rs">
  Delete from xx_project_user_mapping where Package_Id='<%=packageid %>'
  </sql:update> 
  <sql:update dataSource="jdbc/MySQLDB" var="rs">
  Delete from xx_packages_project where package_id='<%=packageid %>'
  </sql:update> 
  <sql:update dataSource="jdbc/MySQLDB" var="rs">
  Delete from xx_project_division_map where package_id='<%=packageid %>'
  </sql:update>
   <sql:update dataSource="jdbc/MySQLDB" var="rs">
	   UPDATE  xx_projectattributes_master SET PackageOfProject='<%=packagedetails%>' where Project_ID='<%=projid %>'
	</sql:update>
<% 
} 	
//System.out.println("uri"+uri+"delcode"+delcode);
if(request.getParameter("deletepackage").equalsIgnoreCase("delete")){
	response.sendRedirect(uri);	
 }

}
catch(Exception e){
	e.printStackTrace();
 } finally {
	    try { conn.close(); } catch (Exception e) { /* ignored */ }
	}
%>	
</c:if>
</form>
<br><br><br><br><br><br>
										     

</body><br><br>
 <%@include file="included/Newfooter.jsp" %>
 
</html>