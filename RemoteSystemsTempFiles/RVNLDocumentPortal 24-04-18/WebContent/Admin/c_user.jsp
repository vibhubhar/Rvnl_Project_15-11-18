<%@page import="java.net.HttpURLConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="included/NewHeader.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%-- <jsp:include page="Divisions.jsp" flush="true" /> --%>
<%@ page autoFlush="true" buffer="1094kb"%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>
 <%@page import="java.sql.*"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Create User</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="resources/JS/Approval_wf230.js"></script>
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
<script type="text/javascript"
	src="resources/JS/datasort.js"></script>
	<link
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script src="resources/JS/Headquarter.js"></script>
<script src="resources/JS/Reports230.js"></script>

<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>

<%@ page import="java.net.URL.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder.*" %>
<%@ page import="java.net.URLConnection.*"%>
<%@ page import="java.io.InputStreamReader.*" %>
<%@ page import="java.io.OutputStreamWriter.*" %>

<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.*"%>

<style>
.ui-datepicker-year {
   background-color: #cc0000;
 padding-left:20px;
}
.scrollit{
height:703px;}
</style>
<script language="JavaScript1.2">
function stopRKey(evt) { 
	  var evt = (evt) ? evt : ((event) ? event : null); 
	  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
	  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
	} 

	document.onkeypress = stopRKey; 


    var testresults
    function checkemail1(){
        var str = document.getElementById("Email").value;
        var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
        if (filter.test(str))
        	{
        	//document.getElementById("error4").style.color="green";
        	document.getElementById("error4").innerHTML="";
        	document.getElementById("btnclick").disabled = false;
        	
        	 testresults = true
        	}
           
        else {
        	document.getElementById("error4").style.color="RED";
        	document.getElementById("error4").innerHTML="Please Enter a Valid Email Address";
        	document.getElementById("btnclick").disabled = true;
            testresults = false
        }
        return (testresults)
    }
</script>

<script language="JavaScript1.2">
    var testresults
    function checkemail(){
        var str = document.getElementById("email_id").value;
        var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
        if (filter.test(str))
        	{
        	//document.getElementById("error3").style.color="green";
        	document.getElementById("error3").innerHTML="";
        	document.getElementById("btnclick").disabled = false;
        	
        	 testresults = true
        	}
           
        else {
        	document.getElementById("error3").style.color="RED";
        	document.getElementById("error3").innerHTML="Please Enter a Valid Email Address";
        	document.getElementById("btnclick").disabled = true;
            testresults = false
        }
        return (testresults)
    }
</script>
<script type="text/javascript">

    function ValidateNo1() {
        var phoneNo = document.getElementById('Phone_Number');
        if (phoneNo.value == "" || phoneNo.value == null) {
    	document.getElementById("error5").style.color="RED";
    	document.getElementById("error5").innerHTML="Please Enter Your Mobile Number";
            return false;
        } else{
       
        var phoneno = /^\d{10}$/;  
        if(phoneNo.value.match(phoneno))  
        {  //document.getElementById("error5").style.color="green";
        	document.getElementById("error5").innerHTML="";
        	document.getElementById("btnclick").disabled = false;
            return true;  
        }  
        else  
        {  document.getElementById("error5").style.color="red";
        	document.getElementById("error5").innerHTML="Not a Valid Mobile Number";
        	document.getElementById("btnclick").disabled = true;
           return false;  
        }  
        }

        alert("Success ");
        return true;
        }
</script>
<script type="text/javascript">

    function ValidateNo() {
        var phoneNo = document.getElementById('contact_no');
        if (phoneNo.value == "" || phoneNo.value == null) {
    	document.getElementById("error0").style.color="RED";
    	document.getElementById("error0").innerHTML="Please Enter Your Mobile Number";
            return false;
        } else{
       
        var phoneno = /^\d{10}$/;  
        if(phoneNo.value.match(phoneno))  
        {  //document.getElementById("error0").style.color="green";
        	document.getElementById("error0").innerHTML="";
        	document.getElementById("btnclick").disabled = false;
            return true;  
        }  
        else  
        {  document.getElementById("error0").style.color="red";
        	document.getElementById("error0").innerHTML="Not a Valid Mobile Number";
        	document.getElementById("btnclick").disabled = true;
           return false;  
        }  
        }

        alert("Success ");
        return true;
        }
   
    function disableNewOrg(str) {
    	alert(str);
    	if (str != "none") {
    		document.getElementById("newOrg").value="";
    		document.getElementById("newOrg").disabled=true;
    	document.getElementById("btn1").disabled=true;
    	document.getElementById('err25').innerHTML='';
    	} else {
    		document.getElementById("newOrg").value="";
    		document.getElementById("newOrg").disabled=false;
        	document.getElementById('err25').innerHTML='';
    	}
    }
    
    function enableAddBtn() {
    	var neworg1=document.getElementById("newOrg")
    	if (neworg1!= null) {
    		document.getElementById("btn1").disabled=false;
    	} else {
    		document.getElementById("btn1").disabled=true;
    		}
    }
    
    function add_Org_Check() {
    	var xmlhttp;
    	var k1=document.getElementById("newOrg").value;
    	var k = encodeURIComponent(k1);
    	var urls="addOrgCheck.jsp?ver="+k;

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
    	        document.getElementById("err25").innerHTML=xmlhttp.responseText;
    			var ex=document.getElementById("exist");
    			if(ex!=null){
    				//document.getElementById("btnclick").disabled = true;
    				
    				
    			}else{
    				add_Org();
    				//document.getElementById("btnclick").disabled = false;
    				
    			}

    	    }
    	  }
    	xmlhttp.open("GET",urls,true);
    	xmlhttp.send();

    }
    
    function add_Org() {
    	var xmlhttp;
    	//var k=document.getElementById("addorg1").value;
    	var urls="addOrg.jsp";

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
    	        document.getElementById("Org1").innerHTML=xmlhttp.responseText;
    	 document.getElementById("Org_name").focus();
   	    }
    	  }
    	xmlhttp.open("GET",urls,true);
    	xmlhttp.send();

    }

</script>
<script type="text/javascript">
$(document).ready(function(){
	 $('input').on('keypress', function (event) {
		    //var regex = new RegExp("^[a-zA-Z0-9]+$");
		    var regex = new RegExp("['?!<\">\\\\]+$");
		    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
		    if (regex.test(key)) {
		       event.preventDefault();
		       return false;
		    }
	  });
 
	
	
	
    $('#Type').on('change', function() {
      if ( this.value == 'RVNL')
      //............................
      {
    	  $("#pk_details").show();
        $("#business_RVNL").show();
        $("#business_MOR").hide();
        $("#business_Others").hide();
        
      } else if ( this.value == 'MOR') {
	$("#pk_details").show();    
	$("#business_MOR").show();
	$("#business_RVNL").hide();
    $("#business_Others").hide();
      } else if ( this.value == 'Others') {
    		$("#pk_details").hide();    
    		$("#business_MOR").hide();
    		$("#business_RVNL").hide();
    	    $("#business_Others").show();
    	      }
     });
    $("input[name$='myRadios']").click(function() {
        var test = $(this).val();
        $("div.desc").hide();
        $("#User_" + test).show();
    });
});
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#chkShowPassword").bind("click", function () {
            var password = $("#password");
            if ($(this).is(":checked")) {
                password.after('<input onchange = "passwordChanged(this);" id = "txt_' + password.attr("id") + '" type = "text" value = "' + password.val() + '" style="width:205px"/>');
                password.hide();
            } else {
                password.val(password.next().val());
                password.next().remove();
                password.show();
            }
        });
    });
    function PasswordChanged(txt) {
        $(txt).prev().val($(txt).val());
    }
</script>
<script type="text/javascript">
    $(function () {
        $("#chkShowPassword1").bind("click", function () {
            var password1 = $("#Password");
            if ($(this).is(":checked")) {
            	password1.after('<input onchange = "passwordChanged1(this);" id = "txt_' + password1.attr("id") + '" type = "text" value = "' + password1.val() + '" style="width:205px"/>');
            	password1.hide();
            } else {
            	password1.val(password1.next().val());
            	password1.next().remove();
            	password1.show();
            }
        });
    });
    function passwordChanged1(txt) {
        $(txt).prev().val($(txt).val());
    }
</script>
<script type="text/javascript">
function passwordChange1(passval) {
   //` $('input[type="password"]').prop('disabled', true);

        if(passval.length >= 5) {
        	document.getElementById("btnclick").disabled = false;
        	//document.getElementById("error6").style.color="GREEN";
        	document.getElementById("error6").innerHTML="";
        } else {
        	document.getElementById("btnclick").disabled = true;
        	document.getElementById("error6").style.color="RED";
        	document.getElementById("error6").innerHTML="Please Provide password of atleast 5 chars.";
           
           //alert("Please Provide password of atleast 5 chars.");
        }
    
}
</script>
<script type="text/javascript">
function passwordChange(passval) {
   //` $('input[type="password"]').prop('disabled', true);

        if(passval.length >= 5) {
        	document.getElementById("btnclick").disabled = false;
        	//document.getElementById("error1").style.color="GREEN";
        	document.getElementById("error1").innerHTML="";
        } else {
        	document.getElementById("btnclick").disabled = true;
        	document.getElementById("error1").style.color="RED";
        	document.getElementById("error1").innerHTML="Please Provide password of atleast 5 chars.";
           
           //alert("Please Provide password of atleast 5 chars.");
        }
    
}
</script>

<script type="text/javascript">
function loadXMLDoc(element,er)
{
var xmlhttp;
var k1=document.getElementById(element).value;
var k = encodeURIComponent(k1);
var urls="pass.jsp?ver="+k;

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

<div id="mainDiv" class="">
</div>
<%String user = (String)session.getAttribute("user_name");

%>
<%!
private static String algorithm = "DESede";
        private static Key key = null;
        private static Cipher cipher = null;
 private static byte[] encrypt(String input)throws Exception {
            cipher.init(Cipher.ENCRYPT_MODE, key);
            byte[] inputBytes = input.getBytes();
            return cipher.doFinal(inputBytes);
        }
%>
<%!
        private static String decrypt(byte[] encryptionBytes)throws Exception {
            cipher.init(Cipher.DECRYPT_MODE, key);
            byte[] recoveredBytes =  cipher.doFinal(encryptionBytes);
            String recovered =  new String(recoveredBytes);
            return recovered;
          }
          %>
<%--  <div><h4 style='width: 390px; margin-left: 27px'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Create User / Create Local Admin</h4></div>
 
<h4 align="left"  style='width: 300px; margin-left:27px'><font style="color:red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font color="#99CC00">:&nbsp;<%=(String)session.getAttribute("user_name") %></font></h4>
 --%>
 
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Create User / Local Admin] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8><br>
</div>
 
<div class="container" style="margin-top:30px; padding: 20px; width:1600px;">
	<form id="loginForm11" name="loginForm11" method="post">
	<INPUT TYPE="HIDDEN" NAME="Depatment">
	<INPUT TYPE="HIDDEN" NAME="cbResults">
	<INPUT TYPE="HIDDEN" NAME="Project_stage">		
	<c:if test="${param.Project_stage == null}">	
		<table class="table table-hover table-bordered" style="margin: 0px 0px 0px 0px;" >
			<tr class="success"><td style="width: 33%;"><h4 style="text-align:center;"><font color="grey">Create User</font></h4></td><td><h4 style="text-align:center;">
			<font color="grey">List of Users</font></h4></td></tr>
			<td><input type = "radio" name="myRadios" id="User" value ="1" style='margin-left:80px' checked="checked"><b>Create User</b> &nbsp;&nbsp;
					<input type = "radio" name="myRadios" id="User1" value ="2"><b>Create Local Admin</b>
				</td>
			
		
					</table>
						
					
					
				<div id ="User_1" class="desc" width ="33%" style="margin: 20px 0px 0px 0px;">
				<table style="border:0px solid black;margin:-20px 0px 0px 0px;" ><tr class="success"><td style="background-color: aliceblue;width:33%;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="red">*</font>Required Field<br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Type :
					<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="Type" id="Type" style="width: 205px;height: 27px;">
											<option selected="selected">-- Select Type --</option>
						<option value="MOR">Railways</option>
						<option value="RVNL">RVNL</option>
							<option value="Others">Others</option>
				</select><br> <br>
				   
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User Id:
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="user_name" id ="user_name" type="text" class="textfield" maxlength="50" onkeyup="loadXMLDoc('user_name','err')" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off
					 width="200" style="width: 205px;margin-left: 16px;"> <span id="err"> </span> <br>
					
					<font color="#99CC00">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   User ID should be complete  Designation along with place of posting &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; without any space in between (For example- <b>SrDEN/E/WAT</b>)
				   </font><br><br>
					<div style="display:none;" id="pk_details" > 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password:
					<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="password" id="password" type="password" class="textfield" maxlength="50"
					 width="200" style="width: 200px" onkeyup="passwordChange(this.value);"><div id="error1" style="text-align: center;
margin-left: 61px;"></div> 	


					 <label for="chkShowPassword">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="chkShowPassword" />
                Show password</label>		
				<br><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Officer Name :
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="officer_name" id="officer_name" type="text" class="textfield" maxlength="50"
					 width="200" style="width: 200px"> <br> <br>
					 
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email Id :
					 <font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="email_id" id="email_id" type="text" class="textfield" maxlength="50" onkeyup="checkemail()" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off
					 width="200" style="width: 	200px"><div id="error3" style="text-align: center;
margin-left: 61px;"></div> <br> <br>
					 
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact No:
					 <font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="contact_no" id="contact_no" type="text" onkeyup="ValidateNo()" class="textfield" maxlength="10" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off
					 width="200" style="width: 200px"> <div id="error0" style="text-align: center;
margin-left: 61px;"></div><br> <br> </div>
						<div style='display:none;' id='business_Others'> <div id="role1" style='display:none;'> &nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Role:
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					  <select name="Role2" id="Role2" style="width: 205px;" >
					  <option value="Supervisor" selected="selected">User</option>
				</select> </div><br> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Organization:
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="Org1" style='display:inline;' ><select name="Org_name" id="Org_name"  onchange="disableNewOrg(this.value);"
					style="width: 205px; margin-top:6px;">
						<option value="none">-- Select Organization --</option>
						<%
						Connection conn = null;
						Statement stmt = null;
						ResultSet rs = null, rs1 = null, rs3 = null,rs4=null,rs5=null,rs12=null,rs13=null,rs14=null, rs25=null;
						PreparedStatement ps1 = null, ps3 = null,ps4=null,ps5=null,ps12=null,ps13=null,ps14=null, ps25=null;
						try {
							Context initCtx = new InitialContext();
							Context envCtx = (Context) initCtx.lookup("java:comp/env");
							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

							conn = ds.getConnection();

								String sql3 = "select * from xx_org_master order by Org_Name";
								ps25 = conn.prepareStatement(sql3);
								rs25 = ps25.executeQuery();

								while (rs25.next()) {
									String orgname = rs25.getString("Org_Name");
						%>
						<option value="<%=orgname%>"><%=orgname%></option>
						<%
							}	
						%>
				  </select></div><br>
				  <div id="addorg1" style="display:inline;" >&nbsp;&nbsp;&nbsp;&nbsp;
				  	&nbsp;&nbsp;&nbsp;&nbsp;<input name="newOrg" id="newOrg" type="text" class="textfield" maxlength="50"
					 width="205" style="width: 200px; margin-left:105px; margin-top:7px;" onchange="enableAddBtn();">  
					&nbsp;&nbsp;&nbsp; <button type='button' id='btn1' class='btn btn-primary' onclick="add_Org_Check();" disabled='disabled'>Click to add</button><br>
					 <font color="#99CC00"> &nbsp;&nbsp;Fill up blank field above and press tab to add a new Organisation in the list</font> <br>
					 <span id="err25"> </span>
				
				  </div>
				  
				  <br/> <br/><br/> <br/><br/> <br/><br/> <br/><br/> <br/><br/><br/><br/><br/><br/>
				  					
	</div>
						
						
				<div style='display:none;' id='business_RVNL'>&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Role:
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					  <select name="Role" id="Role" style="width: 205px" onchange="">
					  <option selected="selected">-- Select Role --</option>
						<option value="System Administrator">System Administrator</option>
						<option value="Supervisor">User</option>
						
					<!--  	<option value="Coordinator">Coordinator</option>  -->
						
				</select> <br> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PIU Of RVNL:
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=PIU_name id="PIU_name" 
					style="width: 205px">
						<option value="none">-- Select PIU --</option>
						<%
					
								String sql5 = "select * from xx_piu_master order by PIU_Name";
								ps3 = conn.prepareStatement(sql5);
								rs3 = ps3.executeQuery();

								while (rs3.next()) {
									String dname = rs3.getString("PIU_Name");
						%>
						<option value="<%=dname%>"><%=dname%></option>
						<%
							}	
						%>
				  </select> <br/> <br/>
				  
				  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department:
				  <font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<select name=Department_RVNL2 id="Department_RVNL2" onchange='showDesgin_cUser(2)'
					style="width: 205px">
						<option value="none">-- Select Department --</option>
						<%
						String dep_sql = "select department_name from xx_departments_master where type ='RVNL' order by department_name";
						PreparedStatement depPS = conn.prepareStatement(dep_sql);
						
						
						ResultSet depRS = depPS.executeQuery();
						String ed_dept_id =null;
						while (depRS.next()) {						
						%>
						<option value ="<%=depRS.getString("department_name") %>"><%=depRS.getString("department_name") %></option>
						
						<% 
						}	
						%>
				  </select> <br /> <br />
                

                   
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Designation:
					<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id ="DesgDiv_RVNL2" style='display: inline;'><select name='designation_RVNL2' id='designation_RVNL2' style="width: 205px;margin:3px 0px 12px 0px;">
						<option value="none">-- Select Designation --</option>						  
				</select> </div>
				  <br /> <br />
					
	</div>
	
				<div style='display:none;' id='business_MOR'>
				<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Role:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    <select name="Role" id="Role" style="width: 205px" onchange="showDiv(this)">
					  <option selected="selected">-- Select Role --</option>
						<option value="Supervisor">User</option>
						
					 	<option value="Coordinator">Coordinator</option>  
						
				</select> <br> <br>-->
	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zone :
					<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name='Zone' id ="Zone" style="width: 205px"
					onchange="showDivision22(this.value)">
						<option value="none">-- Select Zone --</option>
						<%
							
								stmt = conn.createStatement();
								rs = stmt.executeQuery("Select * from xx_zones_master Order by Zone_name");
								String zname = null;// request.getParameter("Zone_name");

								while (rs.next()) {
									zname = rs.getString("zone_name");
						%>
						<option value="<%=zname%>"><%=zname%></option>
						<%
							}
														
						%>
				</select> <br /> <br />

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Division :
					<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   <div id ='DivisionsDiv' style='display: inline;' >
					<select name='division' id='division1' style="width: 205px">
						<option value="none">-- Select Division --</option>						
			     	</select> 
				   </div><br /> <br />
				   
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<select name=Department_RVNL1 id="Department_RVNL1" onchange='showDesgin_cUser(1)'
					style="width: 205px">
						<option value="none">-- Select Department --</option>
						<%
						String dep_sql1 = "select department_name from xx_departments_master where type ='MOR' order by department_name";
						PreparedStatement depPS1 = conn.prepareStatement(dep_sql1);
						
						
						ResultSet depRS1 = depPS1.executeQuery();
						String ed_dept_id1 =null;
						while (depRS1.next()) {						
						%>
						<option value ="<%=depRS1.getString("department_name") %>"><%=depRS1.getString("department_name") %></option>
						
						<% 
						}	
						%>
				  </select> <br /> <br />
                

                   
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Designation:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div id ="DesgDiv_RVNL1" style="display: inline;"><select name='designation_RVNL1' id='designation_RVNL1' style="width: 205px;margin:3px 0px 12px 0px;">
						<option value="none">-- Select Designation --</option>						  
				</select> </div>
				<br /> <br />
				</div>
				
				</td>
				<td valign="top">
				
				<table style="margin: -30px 0px 0px 00px;" ><tr><td>
						&nbsp;&nbsp;&nbsp;<strong>Zone:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name='Zone' id ="Zoneunderlist" data-plugin="selectpicker" data-live-search="true" style="width: 205px"
					onchange="showDivisionunderlist(this.value)">
						<option value="" selected="selected">-- Select Zone --</option>
						<%
							
								stmt = conn.createStatement();
								rs = stmt.executeQuery("Select * from xx_zones_master order by zone_name");
								String zname1 = null;// request.getParameter("Zone_name");

								while (rs.next()) {
									zname1 = rs.getString("zone_name");
						%>
						<option value="<%=zname1%>"><%=zname1%></option>
						<%
							}
								
						%>
				</select> 
					
				
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>PIU Of RVNL:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=PIU_name id="PIUunderList" data-plugin="selectpicker" data-live-search="true" onchange="showDeptUnderList(this.value)"
					style="width: 205px">
						<option value="" selected="selected">-- Select PIU --</option>
						<%
						
								String sql31 = "select * from xx_piu_master order by PIU_Name";
								ps3 = conn.prepareStatement(sql31);
								rs3 = ps3.executeQuery();

								while (rs3.next()) {
									String dname = rs3.getString("PIU_Name");
						%>
						<option value="<%=dname%>"><%=dname%></option>
						<%
							}
								
						%>
				  </select> 
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Others :</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=OrgUnderlist id="OrgUnderlist" data-plugin="selectpicker" data-live-search="true" onchange="showOrgUnderList(this.value)"
					style="width: 205px">
						<option value="" selected="selected">-- Select Organization --</option>
						<%
						
								String sql312 = "select * from xx_org_master order by Org_Name";
								ps3 = conn.prepareStatement(sql312);
								rs3 = ps3.executeQuery();

								while (rs3.next()) {
									String orgname = rs3.getString("Org_Name");
						%>
						<option value="<%=orgname%>"><%=orgname%></option>
						<%
							}
								
						%>
				  </select> <br /> <br />
				  
						
					<div id = 'PIU_Table' style="position: absolute;
margin: 310px -0px 0px 0px;
width: 66%;"></div>
						
			</td></tr></table>
				</td>
				</tr>
				</table>
					
				
				
			</div>
			
			
			<div id = "User_2" class="desc" style="display:none;background:aliceblue;width: 33%;margin: 0px 0px 0px 0px;" >
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PIU Of RVNL:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=PIU_Id id="PIU_Id" 
					style="width: 205px;margin-top: 23px;" onchange="javascript:localadmnpiuchange(this.value);">
						<option value="none">-- Select PIU --</option>
						<%
						//Connection conn1 = null;
						Statement stmt1 = null;

							//conn = ds.getConnection();

								String sql13 = "select * from xx_piu_master order by PIU_Name";
								ps13 = conn.prepareStatement(sql13);
								rs13 = ps13.executeQuery();

								while (rs13.next()) {
									String dname = rs13.getString("PIU_Name");
						%>
						<option value="<%=dname%>"><%=dname%></option>
						<%
							}
								
						%>
						
				  </select> <br />
				  	<div id="piu111" style="margin: 0px 0px 0px 48px;">
				  	
				  	
				  	</div>
						  
				  
				   <br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="User_name" id ="User_name1" type="text" class="textfield" maxlength="50" onkeyup="loadXMLDoc('User_name1','err1')"
					 width="200" style="width: 205px;" > <span id="err1"> </span> <br>
					
					<font color="#99CC00">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User ID should be complete  Designation along with place of <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;posting (For example- <b>SrDEN/E/WAT</b>)
					   </font><br><br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input name="Password" id="Password" type="password" class="textfield"
					 width="200" style="width: 205px" onkeyup="passwordChange1(this.value);">
					 <div id="error6" style="text-align: center;
margin-left: 61px;"></div> 	 <br> <br>
 <label for="chkShowPassword1">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="chkShowPassword1" />
                Show password</label>		
				<br><br>
					 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Officer Name :&nbsp;&nbsp;
					<input name="Officer_Name" id="Officer_Name" type="text" class="textfield" maxlength="50"
					 width="200" style="width: 205px"> <br> <br>
					 
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email Id :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="Email" id="Email" type="text" class="textfield" maxlength="50" onkeyup="checkemail1()"
					 width="200" style="width: 205px"><div id="error4" style="text-align: center;
margin-left: 61px;"></div> <br> 
					 
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact No:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="Phone_Number" id="Phone_Number" type="text" class="textfield"  onkeyup="ValidateNo1()" maxlength="10"
					 width="200" style="width: 205px"><div id="error5" style="text-align: center;
margin-left: 61px;"></div> <br>
			
			<!--  <div style='display:;' id='business_RVNL'> -->&nbsp;
				
				  				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				  
				  <select name=departme id="departme" style="width: 205px">
						<option value="none">-- Select Department --</option>
						<%
						
						String sql14 = "select Department_Name from xx_departments_master where type ='RVNL' order by department_name";
						ps14 = conn.prepareStatement(sql14);
						rs14 = ps14.executeQuery();

						//ResultSet depRS = depPS.executeQuery();
						//String dname1 =null;
						while (rs14.next()) {	
							String dname1 = rs14.getString("Department_Name");

						%>
						<option value="<%=dname1%>"><%=dname1%></option>
						
						<% 
						}	
						%>
				  </select> <br /> <br />
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zone:<br>		
					<%
                            String sql15 = "select * from xx_zones_master order by Zone_Name";
								  PreparedStatement ps15 = conn.prepareStatement(sql15);
									ResultSet rs15 = ps15.executeQuery();
									while (rs15.next()) {
														String zone1 = rs15.getString("Zone_Name");
						  %>
		 <input type ='checkbox' name='Zone_id' id='Zone_id' style="margin-left:185px" value="<%=zone1%>"> <%=zone1%><br>			      
													<%
														}
													%>
				  <br /> <br />
				 
			
<div id="display_1">				
 <table ><tr style="position:absolute;margin: -62px 0px 0px 496px;"><td>
						<%-- &nbsp;&nbsp;&nbsp;Zone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name='Zone' id ="Zoneunderlist" data-plugin="selectpicker" data-live-search="true" style="width: 205px"
					onchange="showDivisionunderlist(this.value)">
						<option value="" selected="selected">-- Select Zone --</option>
						<%
							
								stmt = conn.createStatement();
								rs = stmt.executeQuery("Select * from xx_zones_master order by zone_name");
								String zname1 = null;// request.getParameter("Zone_name");

								while (rs.next()) {
									zname1 = rs.getString("zone_name");
						%>
						<option value="<%=zname1%>"><%=zname1%></option>
						<%
							}
								
						%>
				</select>  --%>
					
				
						<%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PIU Of RVNL:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=PIU_name id="PIUunderList" data-plugin="selectpicker" data-live-search="true" onchange="showDeptUnderList1(this.value)"
					style="width: 205px">
						<option value="" selected="selected">-- Select PIU --</option>
						<%
						
								String sql31 = "select * from xx_piu_master order by PIU_Name";
								PreparedStatement ps31 = conn.prepareStatement(sql31);
								ResultSet rs31 = ps31.executeQuery();

								while (rs31.next()) {
									String dname1 = rs31.getString("PIU_Name");
						%>
						<option value="<%=dname1%>"><%=dname1%></option>
						<%
							}
								conn.close();
								
						%>
				   </select> <br /> <br /> --%>
						
					<div id = 'PIU_Table11'style="width: 96%; margin-top:-875px; margin-left:19px;"  class="scrollit" >
<table class="table table-hover table-bordered"
				style="background-color: #F0FFFF" id="example" class="display" height="1000px">
				<thead>
					<tr class="success">
						<th><b>SNo</b></th>
						<th><b>PIU</b></th>
						<th><b>Department</b></th>	
								<th><b>User Id</b></th>
						
						<th>Officer Name</b></th>
						<th><b>Email Id</b></th>
						<th><b>Contact No</b></th>
					
						<th><b>Modify</b></th>
						<th><b>Reset Password</b></th>
						
				</thead>
				<tbody id="people">
<%
String piuid=null,role=null;
String updatedusername="'",name=null,piu_name=null;
String dep_name1=null,user_name=null,officername=null,email_id=null,contact_no=null,dep_name=null;
int count=0;
 String query111="select a.*, b.PIU_Name from xx_user_master a, xx_piu_master b where a.PIU_Id=b.PIU_Id and Role='LocalUser' order by b.PIU_Name";     
 PreparedStatement ps151 = conn.prepareStatement(query111);
ResultSet rs11 = ps151.executeQuery();
while (rs11.next()) {
/*	int piu_name1= rs11.getInt("PIU_ID");
	String que="select * from xx_piu_master where PIU_Id="+piu_name1;  	
	PreparedStatement ps1qq = conn.prepareStatement(que);   	           
	 ResultSet rs1qq = ps1qq.executeQuery();
	 while(rs1qq.next())
	 {
		 piu_name=rs1qq.getString("PIU_Name");
	 }
	*/
	piu_name=rs11.getString("PIU_Name");
	 dep_name= rs11.getString(8);
	//String desg_name= rs.getString(3);
	 user_name= rs11.getString(2);
	 officername= rs11.getString("Officer_Name");
	 email_id= rs11.getString("Email_Id");
	 contact_no= rs11.getString("Contact_No");
	name=updatedusername+user_name.replaceAll("/", "~")+"'";
	count=count+1;
String qu="select * from xx_departments_master where Department_Id="+dep_name;  	
PreparedStatement ps1q = conn.prepareStatement(qu);   	           
 ResultSet rs1q = ps1q.executeQuery();
 while(rs1q.next())
 {
	   dep_name1=rs1q.getString("Department_Name");
 }
	
%>



                        <tr>
                        <td><%=count%></td>
                        <td><%=piu_name%></td>
						<td><%=dep_name1%></td>
						<td><%=user_name %></td>
						<td><%=officername%></td>
						<td><%=email_id%></td>
						<td><%=contact_no%></td>
						<td class='ListOfTables' width ='15%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin12(<%=name%>);>Modify</button> </td>
						<td class='ListOfTables' width ='15%'><button type='button' class='btn btn-primary' onclick=javascript:resetpasswordsysadmin(<%=name%>);>Reset Password</button> </td>
						<%} 
						}catch(Exception e){
							e.printStackTrace();
						}	finally {
						    try { conn.close(); } catch (Exception e) { /* ignored */ }
						}%>
						</tr></tbody></table>
</div>
						
					
						
			</td></tr></table>
			
		</div>		</div>
		<!--  	</form>  -->
		<table style="margin-left:150px;">		
			<tr >
			<td >
		<br> <br>
				
			<INPUT TYPE="HIDDEN" id="demo">
			<button type="button" id="btnclick" class="btn btn-primary" onclick="validateUser11();">Submit</button> 
			
			
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-primary" value="Cancel" onclick="location.reload()" />
		
		</td>
		
		</tr>
		
	</table>
	<div id="dialogid" style="display: none"
								align="center">
								<br> Please Fill All Data<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid').dialog('close');">cancel</button>
							</div>
	<div id="dialogid24" style="display: none"
								align="center">
								<br> Duplicate/incorrect entry.........<br>
								<br>
								<button id="cancle" class="btn btn-primary"
									onclick="jQuery.noConflict();$('#dialogid24').dialog('close');">cancel</button>
							</div>
	
		</c:if>	
		
		
<c:if test="${param.Project_stage != null}">
		<%			
		if (request.getParameter("Project_stage") != null) {
			String prof_alert2=(String)session.getAttribute("Profile_Alert");
			String str=request.getParameter("Project_stage");
			if(str.equalsIgnoreCase("first")){
				String Type = request.getParameter("Type");	
				String User_name = request.getParameter("user_name");
				String Role = request.getParameter("Role");
				String Password = request.getParameter("password");
				String password1=Password;
				// code of encrytion start here------------		
				
			//String plainText = "123456";
MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(Password.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
	Password = Integer.toHexString(0xFF & digest[i]);

    if (Password.length() < 2) {
    	Password = "0" + Password;
    }

    hexString.append(Password);
}
				//code for encryption end here
				String Officer_Name = request.getParameter("officer_name");
				String Email_Id = request.getParameter("email_id");
				String Contact_No = request.getParameter("contact_no");
				String Zone = request.getParameter("Zone");				
				String Department = request.getParameter("Department_RVNL1");				
			    String Div = request.getParameter("division");
				String msg = Div;
				String Designation = request.getParameter("designation_RVNL1");
							
				String piu = request.getParameter("PIU_name");
				String Dept_RVNL = request.getParameter("Department_RVNL2");
				String Desg_RVNL = request.getParameter("designation_RVNL2");	
				
				String radio = request.getParameter("myRadios");
			//	} else {
					String Orgname = request.getParameter("Org_name");
				//}
				
				String sql3 = "select zone_id from xx_zones_master where zone_name =?";
				//System.out.println("c-User test....33");							
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null, rs1 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null,rs9=null,rs10=null,rs_RVNL1=null,rs_RVNL2 = null;
				PreparedStatement ps1 = null, ps3 = null, ps4 = null, ps5 = null, ps6 = null,ps9=null,ps10=null,ps_RVNL1=null,ps_RVNL2;				
				String org_id = null, dept_id = null, ed_dept_id=null,desg_id = null, piu_id=null;
				try{
					Context initCtx = new InitialContext();
					Context envCtx = (Context) initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

					conn = ds.getConnection();
					
				ps3 = conn.prepareStatement(sql3);
				ps3.setString(1, Zone);
				rs3 = ps3.executeQuery();
				
				String z_id = null;
				while (rs3.next()) {
					z_id = rs3.getString("zone_id");
				}

				String sql4 = "select Division_Id from xx_divisions_map where Division_Name =?";
				ps4 = conn.prepareStatement(sql4);
				ps4.setString(1, msg);
				rs4 = ps4.executeQuery();

				String div_id = null;
				while (rs4.next()) {
					div_id = rs4.getString("Division_Id");
				}
if (!Type.equalsIgnoreCase("Others")){
if (Type.equalsIgnoreCase("RVNL")){
				String sql5 = "select Department_Id from xx_departments_master where Type='RVNL' and Department_Name =?"; 
				ps5 = conn.prepareStatement(sql5);
				ps5.setString(1, Dept_RVNL);
} else if (Type.equalsIgnoreCase("MOR")) {
	String sql5 = "select Department_Id from xx_departments_master where Type='MOR' and Department_Name =?"; 
	ps5 = conn.prepareStatement(sql5);
	ps5.setString(1, Department);
}
				
				rs5 = ps5.executeQuery();
							
				while (rs5.next()) {
					dept_id = rs5.getString("Department_Id");
				}
				
				/*
				ps_RVNL1 = conn.prepareStatement(sql5);
				ps_RVNL1.setString(1, Dept_RVNL);
				rs_RVNL1 = ps_RVNL1.executeQuery();

				String dept_id_RVNL = null;
				while (rs_RVNL1.next()) {
					dept_id_RVNL = rs_RVNL1.getString("department_id");
				}
				*/
				if (Type.equalsIgnoreCase("RVNL")){
					String sql6 = "select Designation_Id from xx_designation_mapping where Type='RVNL' and Department_Id="+dept_id+" and Designation_name =?";
					ps6 = conn.prepareStatement(sql6);
					ps6.setString(1, Desg_RVNL);
	} else if (Type.equalsIgnoreCase("MOR")) {
		String sql6 = "select Designation_Id from xx_designation_mapping where Type='MOR' and Department_Id="+dept_id+" and Designation_name =?";
		ps6 = conn.prepareStatement(sql6);
		ps6.setString(1, Designation);
	}
				rs6 = ps6.executeQuery();

				while (rs6.next()) {
					desg_id = rs6.getString("designation_id");
				}
				/*
				ps_RVNL2 = conn.prepareStatement(sql6);
				ps_RVNL2.setString(1, Desg_RVNL);
				rs_RVNL2 = ps_RVNL2.executeQuery();

				String desg_id_RVNL = null;
				while (rs_RVNL2.next()) {
					desg_id_RVNL = rs_RVNL2.getString("Designation_Id");
				}
				*/
				
				String sql1 = "select piu_id from xx_piu_master where piu_name =?";
				ps1 = conn.prepareStatement(sql1);
				ps1.setString(1, piu);
				rs1 = ps1.executeQuery();

				while (rs1.next()) {
					piu_id = rs1.getString("piu_id");
				}
} 	else {
				String sql2 = "select Org_Id from xx_org_master where Org_name =?";
				ps9 = conn.prepareStatement(sql2);
				ps9.setString(1, Orgname);
				rs9 = ps9.executeQuery();
				while (rs9.next()) {
					org_id = rs9.getString("Org_Id");
				}
}
		//System.out.println("c-User test....99"+User_name+msg+Department+Designation+Orgname);				
	         %>
				<INPUT TYPE="HIDDEN" id="zz_id" value =<%=z_id %>> 
				<INPUT TYPE="HIDDEN" id="dv_id" value =<%=div_id %>>
				<INPUT TYPE="HIDDEN" id="dp_id" value =<%=dept_id %>>
				<INPUT TYPE="HIDDEN" id="ds_id" value =<%=desg_id %>>
				<INPUT TYPE="HIDDEN" id="org_id" value =<%=org_id %>>
		<% 			
		String Ans=null;
		if (!Type.equalsIgnoreCase("Others")){
				if (User_name == null || Password == null || Officer_Name == null || Email_Id == null || Contact_No == null || User_name == ""
						|| Password == "" || Officer_Name =="" || Email_Id =="" || Contact_No == ""
						|| Type == "-- Select Type --" || Zone == "none"
						|| msg == "none" || msg == "-1" || Department == "none"
						|| Designation == "none" || Designation == "-1") {
					Ans="No";
				} else {Ans="Yes";}
		} else {
			if (User_name == null || Type == "-- Select Type --" || Orgname == "none") {
				Ans="No";
			} else {Ans="Yes";}
		}

if (Ans.equalsIgnoreCase("Yes")) {
				
					ResultSet  rss3 = null;
					PreparedStatement  pss3 = null;
					 
					 String query = "select * from xx_user_master where User_name='"+User_name+"'"; 
	                 
	                 pss3 = conn.prepareStatement(query);
						rss3 = pss3.executeQuery();
	                    if(rss3.next())
	                    {   
	                    	%>	
	                    			
							<script type="text/javascript">
							
					 alert("This user already exists!!!");				 
					</script>		
								<%
	                    }else {
		
					
					if(Type.equalsIgnoreCase("RVNL")) {
						System.out.println("RVNL-role="+Role);
						ResultSet  rss4 = null;
						PreparedStatement  pss4 = null;
						 int mailstat1=9;
						 int realstat1=9;
						 
						 String query4 = "select * from xx_user_master where PIU_Id="+piu_id+" and Role='LocalUser'"; 
		                 
		                 pss4 = conn.prepareStatement(query4);
							rss4 = pss4.executeQuery();
		                    if(rss4.next()) {   
		                mailstat1= rss4.getInt("MailStatus");
		                		realstat1= rss4.getInt("RealdateStatus");
		                    } else {
		                    	 query4 = "select * from xx_user_master where PIU_Id="+piu_id; 
				                 
				                 pss4 = conn.prepareStatement(query4);
									rss4 = pss4.executeQuery();
									if(rss4.next()) {   
						                mailstat1= rss4.getInt("MailStatus");
						                		realstat1= rss4.getInt("RealdateStatus");
						                    } else {
						                    mailstat1=1;
						                    realstat1=0;
		                    }
		                    }
					%>
					<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   INSERT INTO xx_user_master (User_name,Password,Role,Type,Department_id,Designation_id,PIU_Id,Officer_Name,Email_Id,Contact_No,MailStatus,RealdateStatus,Created_by,Date_created) VALUES ('<%=User_name%>','<%=Password%>','<%=Role%>','<%=Type%>','<%=dept_id%>','<%=desg_id%>','<%=piu_id%>','<%=Officer_Name%>','<%=Email_Id%>','<%=Contact_No%>',<%=mailstat1 %>,<%=realstat1 %>,'<%=user %>', now());
			</sql:update>

					<%
				
					         } else if (Type.equalsIgnoreCase("MOR")) {
					        	 System.out.println("MOR-role="+Role+prof_alert2);
					        	 if(div_id!=null){
					        	 %>
						
					<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   INSERT INTO xx_user_master (User_name,Password,Role,Type,Zone_id,Division_id,Department_id,Designation_id,Officer_Name,
Email_Id,Contact_No,Created_by,Date_created) VALUES ('<%=User_name%>','<%=Password%>','Supervisor','<%=Type%>','<%=z_id%>','<%=div_id%>','<%=dept_id%>','<%=desg_id%>','<%=Officer_Name %>','<%=Email_Id %>','<%=Contact_No %>','<%=user %>', now());
			</sql:update>


					<%
					        	 }else{
					        		 
					        		 %>
										
										<sql:update dataSource="jdbc/MySQLDB" var="rs">
								   INSERT INTO xx_user_master (User_name,Password,Role,Type,Zone_id,Department_id,Designation_id,Officer_Name,
					Email_Id,Contact_No,Created_by,Date_created) VALUES ('<%=User_name%>','<%=Password%>','Supervisor','<%=Type%>','<%=z_id%>','<%=dept_id%>','<%=desg_id%>','<%=Officer_Name %>','<%=Email_Id %>','<%=Contact_No %>','<%=user %>', now());
								</sql:update>


										<%
					        		 
					        		 
					        		 
					        	 }
					                } else if (Type.equalsIgnoreCase("Others")) {
					                	System.out.println("Others-role="+Role);
						        		 %>
											
											<sql:update dataSource="jdbc/MySQLDB" var="rs">
									   INSERT INTO xx_user_master (User_name,Role,Type,Org_id,Created_by,Date_created) VALUES ('<%=User_name%>','Supervisor','<%=Type%>','<%=org_id%>','<%=user %>', now());
									</sql:update>
											<%
  	
					                }
					if (!Type.equalsIgnoreCase("Others")) {
	if (prof_alert2.equalsIgnoreCase("On")) {
						// Mail code starts from here
			//System.out.println("today:"+Date1+"approval date:"+date);			
						 String result;
						    // Get recipient's email-ID, message & subject-line from index.html page
						    StringBuffer url =    request.getRequestURL();
							String cc1="";
							String pageName1 = url.substring(0, url.lastIndexOf("/"))+"/admn_login.jsp";
						    final String to = Email_Id;
						    final String subject = "RVNL DOCUMENT PORTAL - Login details";
						    final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+User_name.toUpperCase()+"</b> <br><br> You have been added as a User on the portal. Your login details are as under;"
						     +"<br><BR> User Id:  "+User_name+" <BR> Password:  "+password1+"<BR> Login webpage: <a href=\""+ pageName1+"\">"+pageName1+"</a><br><br>You are advised to change your password. <br><br><br><span style='color:brown;  font-size:20px; font-style:italic;'><b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
						    						
						    // Sender's email ID and password needs to be mentioned
						    final String from = "indiarvnl@gmail.com";
						    final String pass = "vsam3WSCJAIw4cj7";
						    
						    final String cc = cc1;
						    // Defining the gmail host
						    String host = "smtp-relay.sendinblue.com";
						 
						    // Creating Properties object
						    Properties props = new Properties();
						 
						    // Defining properties
						   
						    props.put("mail.smtp.starttls.enable", "true");
						    props.put("mail.smtp.host", host);
						    props.put("mail.smtp.user", from);
						    props.put("mail.smtp.password", pass);
						    props.put("mail.smtp.port", "587");
						    props.put("mail.smtp.auth", "true");
						 
						    // Authorized the Session object.
						    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
						        @Override
						        protected PasswordAuthentication getPasswordAuthentication() {
						            return new PasswordAuthentication(from, pass);
						        }
						    });
						 
						    try {
						        // Create a default MimeMessage object.
						        MimeMessage message = new MimeMessage(mailSession);
						        // Set From: header field of the header.
						        message.setFrom(new InternetAddress(from));
						        // Set To: header field of the header.
						        message.addRecipient(Message.RecipientType.TO,
						                new InternetAddress(to));
						        message.setRecipients(Message.RecipientType.CC, cc);
						        // Set Subject: header field
						        message.setSubject(subject);
						        // Now set the actual message
						        message.setText(messg);
						        // Send message
						        Transport.send(message);
						        result = "Your mail sent successfully....";
						        System.out.println("Email sent successfully");
						    } catch (MessagingException mex) {
						        mex.printStackTrace();
						        result = "Error: unable to send mail....";
						    }
						 
						    // mail code ends here
						     //SMS code 
		    
		    try {
// Construct data
//contact number supervisor------contact_No_sup
//contact number sender ------------- supcontact

String usersms = "username=" + "indiarvnl@gmail.com";
String hash = "&hash=" + "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
//String apiKey = "apikey=" + "noVebn4XbP0-UFyeK1rRwkvCNdDw5ZXfVqrSNPndk2";
String message = "&message=" + "Please check your email ("+Email_Id+") for login details.\n\nRVNL Document Portal";
String sender = "&sender=" + "RPDAMS";
String numbers = "&numbers=" + ""+Contact_No+"";

// Send data
HttpURLConnection connsms = (HttpURLConnection) new java.net.URL("http://api.textlocal.in/send in/?").openConnection();

String data = usersms + hash + numbers + message + sender;
//String data = apiKey + numbers + message + sender;
connsms.setDoOutput(true);
connsms.setRequestMethod("POST");
connsms.setRequestProperty("Content-Length", Integer.toString(data.length()));
connsms.getOutputStream().write(data.getBytes("UTF-8"));
final BufferedReader rd2 = new BufferedReader(new InputStreamReader(connsms.getInputStream()));
final StringBuffer stringBuffer = new StringBuffer();
String line;
while ((line = rd2.readLine()) != null) {
stringBuffer.append(line);
}
rd2.close();
System.out.println("Message sent successfully");
//return stringBuffer.toString();
} catch (Exception e) {
System.out.println("Error SMS "+e);
//return "Error "+e;
}					   
// sms code ends here
					}
					}
				%>
				<div class="alert alert-success" align="center"><strong>Success!</strong> User created successfully. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-primary" onclick="location.href='c_user.jsp'">Want to create more Users</button></div>
				
				<% 	
				   
	                    rss3.close();
	                    pss3.close();
				}
			
			}
							}catch(Exception e){
								
								e.printStackTrace();
							}
							 finally {

									try {
										if (rs != null)
											rs.close();
									} catch (Exception e) {
									}
							/*	
									try {
										if (rs1 != null)
											rs1.close();
									} catch (Exception e) {
									}
								*/	

									try {
										if (rs3 != null)
											rs3.close();
									} catch (Exception e) {
									}
									
									try {
										if (rs4 != null)
											rs4.close();
									} catch (Exception e) {
									}
									
									try {
										if (rs5 != null)
											rs5.close();
									} catch (Exception e) {
									}
									
									try {
										if (rs6 != null)
											rs6.close();
									} catch (Exception e) {
									}
									try {
										if (rs9 != null)
											rs9.close();
									} catch (Exception e) {
									}

									try {
										if (stmt != null)
											stmt.close();
									} catch (Exception e) {
									}
									
 /*
									try {
										if (ps1 != null)
											ps1.close();
									} catch (Exception e) {
									}
	*/								

									try {
										if (ps3 != null)
											ps3.close();
									} catch (Exception e) {
									}
									
									try {
										if (ps4 != null)
											ps4.close();
									} catch (Exception e) {
									}
									
									try {
										if (ps5 != null)
											ps5.close();
									} catch (Exception e) {
									}
									
									try {
										if (ps6 != null)
											ps6.close();
									} catch (Exception e) {
									}
									try {
										if (conn != null)
											conn.close();
									} catch (Exception e) {
									}

								}
			
				
		/*	} else if(str.equalsIgnoreCase("second")){
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				PreparedStatement ps = null,ps1=null;
				
				try{
					Context initCtx = new InitialContext();
					Context envCtx = (Context) initCtx.lookup("java:comp/env");
					DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

					conn = ds.getConnection();
					
					
					String uname = (String)pageContext.getAttribute("UserName",PageContext.SESSION_SCOPE);  
					String pwd = (String)pageContext.getAttribute("Password",PageContext.SESSION_SCOPE);  
					String officer = (String)pageContext.getAttribute("Officer_Name",PageContext.SESSION_SCOPE);  
					String email = (String)pageContext.getAttribute("Email_Id",PageContext.SESSION_SCOPE);  
					String cont = (String)pageContext.getAttribute("Contact_No",PageContext.SESSION_SCOPE);  
					String role = (String)pageContext.getAttribute("Role",PageContext.SESSION_SCOPE);  
					String type = (String)pageContext.getAttribute("Type",PageContext.SESSION_SCOPE);  
					String zone_id = (String)pageContext.getAttribute("ZoneID",PageContext.SESSION_SCOPE);  
					String division_id = (String)pageContext.getAttribute("DivisionID",PageContext.SESSION_SCOPE);  
					String dept_id = (String)pageContext.getAttribute("DepartmentID",PageContext.SESSION_SCOPE);  
					String desg_id = (String)pageContext.getAttribute("DesignationID",PageContext.SESSION_SCOPE);  					
					
					String piu_id = (String)pageContext.getAttribute("PIU_ID",PageContext.SESSION_SCOPE);
					String dept_id_RVNL = (String)pageContext.getAttribute("DeptRVNL",PageContext.SESSION_SCOPE);
					String desg_id_RVNL = (String)pageContext.getAttribute("DesgRVNL",PageContext.SESSION_SCOPE);
					if(type.equalsIgnoreCase("RVNL")) {
						 String updateSQL_RVNL = "update xx_user_master set user_name ='"+uname+"',password ='"+pwd+"',officer_name='"+officer+"',email_id='"+email+"',contact_no='"+cont+"',type='"+type+"' where PIU_ID="+piu_id+" and Designation_Id="+desg_id_RVNL+" and Department_id="+dept_id_RVNL;
						  ps1 = conn.prepareStatement(updateSQL_RVNL);
						  ps1.executeUpdate();
					}
					else{
						String updateSQL = "update xx_user_master set user_name ='"+uname+"',password ='"+pwd+"',officer_name='"+officer+"',email_id='"+email+"',contact_no='"+cont+"',type='"+type+"' where Zone_ID="+zone_id+" and Division_ID="+division_id+" and Designation_Id="+desg_id+" and Department_id="+dept_id;
						 
						ps = conn.prepareStatement(updateSQL);
						  ps.executeUpdate();
					}
				
				
				
				 
				  
				}catch(Exception e){

					e.printStackTrace();
				}
				 finally {

						try {
							if (rs != null)
								rs.close();
						} catch (Exception e) {
						}
						try {
							if (conn != null)
								conn.close();
						} catch (Exception e) {
						}
						try {
							if (ps != null)
								ps.close();
						} catch (Exception e) {
						}
				
			}  */
		}else if(str.equalsIgnoreCase("third")){	
			String ed_uname = request.getParameter("ED_user_name");
			String ed_pwd = request.getParameter("ED_password");
			
			//Password Encrytin Starts here
			MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
			mdAlgorithm.update(ed_pwd.getBytes());

			byte[] digest = mdAlgorithm.digest();
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < digest.length; i++) {
				ed_pwd = Integer.toHexString(0xFF & digest[i]);

			    if (ed_pwd.length() < 2) {
			    	ed_pwd = "0" + ed_pwd;
			    }

			    hexString.append(ed_pwd);
			}
			//System.out.println("outputting encrypted password-----------"+ed_pwd);
		// encryption ends here
			
			String ed_desg = request.getParameter("ED_Designation");
			String ed_piuCheck[] = request.getParameterValues("ED_PIU");			
			String ed_str =ed_desg.replace("ED (", "");
			String ed_dept =ed_str.replace(")", "");
			Connection conn =null;
			
			try {
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");
				DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
				PreparedStatement ps5 =null,ps6=null;ResultSet rs5=null, rs6=null;
				conn = ds.getConnection();
			String sql5 = "select Department_Id from xx_departments_master where Department_Name =?";
			ps5 = conn.prepareStatement(sql5);
			ps5.setString(1, ed_dept);
			rs5 = ps5.executeQuery();
			String ed_dept_id =null;
			while (rs5.next()) {
				ed_dept_id = rs5.getString("Department_Id");
			}
			String sql6 = "select Designation_Id from xx_Designation_master where Designation_Name =?";
			ps6 = conn.prepareStatement(sql6);
			ps6.setString(1, ed_desg);
			rs6 = ps6.executeQuery();
			String ed_desg_id =null;
			while (rs6.next()) {
				ed_desg_id = rs6.getString("Designation_Id");
			}
			
			%>		
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   INSERT INTO xx_user_master (User_name,Password,Role,Type,Department_id,Designation_id,Created_by,Date_created) VALUES ('<%=ed_uname%>','<%=ed_pwd%>','Supervisor','RVNL','<%=ed_dept_id%>','<%=ed_desg_id%>','<%=user %>', now());
			</sql:update>
			<% 	
			
			for (int k = 0; k < ed_piuCheck.length; k++) {
	 				  
	 			 Statement stmt = conn.createStatement();
					ResultSet rs2 = stmt.executeQuery("select piu_id from xx_piu_master where piu_name = '"+ed_piuCheck[k]+"'");

					String piu_id = null;

					while (rs2.next()) {
						piu_id = rs2.getString(1);  
					}
	 			  
					%>
					<sql:update dataSource="jdbc/MySQLDB" var="rs">
					   INSERT INTO xx_ed_piu_mapping (designation_id,piu_id) VALUES ('<%=ed_desg_id%>','<%=piu_id%>');
					</sql:update>
					<%				
	 		  }
			//conn.close();
		}catch(Exception e){
			e.printStackTrace();
		} finally {
		    try { conn.close(); } catch (Exception e) { /* ignored */ }
		}
			
		}
		else if(str.equalsIgnoreCase("fourth")){	
			String username = request.getParameter("User_name");
			String pwds = request.getParameter("Password");
			String password=pwds;
			//System.out.println("initial password local admin-----------"+pwds);
			//Password Encrytin Starts here
			MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
			mdAlgorithm.update(pwds.getBytes());

			byte[] digest = mdAlgorithm.digest();
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < digest.length; i++) {
				pwds = Integer.toHexString(0xFF & digest[i]);

			    if (pwds.length() < 2) {
			    	pwds = "0" + pwds;
			    }

			    hexString.append(pwds);
			}
			
		// encryption ends here
		
			String officers = request.getParameter("Officer_Name");
			String emails =request.getParameter("Email");
			String phones =request.getParameter("Phone_Number");
			String pius =request.getParameter("PIU_Id");
			
			String departme =request.getParameter("Depatment");
			String zoneCheck[] = request.getParameterValues("Zone_id");			
			String zones =request.getParameter("Zone_id");
			String zonename =request.getParameter("Zone_Name");
			String userid = request.getParameter("User_Id");
			String zoneid = request.getParameter("Zone_ID");
			String LocalUser = request.getParameter("LocalUser");
			String RVNL = request.getParameter("LocalUser");
			String zones_assigned="";
			Connection conn =null;
			try {
				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");
				DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
			
			PreparedStatement ps5 =null,ps6=null,ps7=null,ps8=null ,ps9=null;ResultSet rs5=null, rs6=null,rs7=null,rs8=null,rs9=null;
				conn = ds.getConnection();
				String sql7 = "select PIU_Id from xx_piu_master where PIU_Name =?";
				ps7 = conn.prepareStatement(sql7);
				ps7.setString(1, pius);
		     	rs7 = ps7.executeQuery();
				String pius_id =null;
				while (rs7.next()) {
					pius_id = rs7.getString("PIU_Id");
					//System.out.println("PIU_ID="+pius_id+"department="+departme);
				}
				ResultSet  rss5 = null;
				PreparedStatement  pss5 = null;
				 int mailstat2=9;
				 int realstat2=9;
				 
				 String query5 = "select * from xx_user_master where PIU_Id="+pius_id; 
                 
                 pss5 = conn.prepareStatement(query5);
					rss5 = pss5.executeQuery();
                    if(rss5.next()) {   
                mailstat2= rss5.getInt("MailStatus");
                		realstat2= rss5.getInt("RealdateStatus");
                    } else {
                                   mailstat2=1;
				                    realstat2=0;
                    }
	
				String sql8 = "select Department_Id from xx_departments_master where Type='RVNL' and Department_Name =?";
				ps8 = conn.prepareStatement(sql8);
				ps8.setString(1,departme);
				rs8 = ps8.executeQuery();
				String departme_id =null;
				while (rs8.next()) {
					departme_id = rs8.getString("Department_Id");
					
				}
			
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
				   INSERT INTO xx_user_master (User_name,Password,Officer_Name,Email_Id,Contact_No,PIU_ID,Department_id,Type,Role,MailStatus,RealdateStatus,Created_by,Date_created) VALUES ('<%=username%>','<%=pwds%>','<%=officers %>','<%=emails %>','<%=phones %>','<%=pius_id %>','<%=departme_id %>','RVNL','LocalUser',<%= mailstat2%>,<%= realstat2%>,'<%=user %>', now());
				</sql:update>
				<%		
				
				String usersql = "select User_ID from xx_user_master where User_name=? and password=? and Email_Id=?";
				ps9 = conn.prepareStatement(usersql);
				ps9.setString(1,username);ps9.setString(2,pwds);ps9.setString(3,emails);
				rs9 = ps9.executeQuery();
				rs9.next();
				String userid1=rs9.getString("User_ID");
								
			for (int k = 0; k < zoneCheck.length; k++) {
	 				  
	 			 Statement stmt = conn.createStatement();
					ResultSet rs2 = stmt.executeQuery("select Zone_Id from xx_zones_master where Zone_Name = '"+zoneCheck[k]+"' order by Zone_Name ");
					if (zones_assigned.equalsIgnoreCase("")) {
						zones_assigned=zoneCheck[k];
					} else { zones_assigned=zones_assigned+","+zoneCheck[k];}
					String zone1 = null;

					while (rs2.next()) {
						zone1 = rs2.getString(1);  
				
					}
					
					%>
					<sql:update dataSource="jdbc/MySQLDB" var="rs">
					   INSERT INTO xx_user_zone_mapping (User_Id,Zone_ID,Piu_Id) VALUES ('<%=userid1%>','<%=zone1%>',<%=pius_id %>);
					</sql:update>
					
					<%	
	 		  }%>
	 		  <div class="alert alert-success" align="center"><strong>Success!</strong> Local-Admin created successfully. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-primary" onclick="location.href='c_user.jsp'">Want to create more Local-Admin</button></div>
	 		  <%
				 		  
	 		 // conn.close();
		}catch(Exception e){
			e.printStackTrace();
		} finally {
		    try { conn.close(); } catch (Exception e) { /* ignored */ }
		}
			if (prof_alert2.equalsIgnoreCase("On")) {
						// Mail code starts from here
			//System.out.println("today:"+Date1+"approval date:"+date);			
						 String result;
						    // Get recipient's email-ID, message & subject-line from index.html page
						    StringBuffer url =    request.getRequestURL();
							String cc1="";
							String pageName1 = url.substring(0, url.lastIndexOf("/"))+"/admn_login.jsp";
						    final String to = emails;
						    final String subject = "RVNL DOCUMENT PORTAL - Login details";
						    final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+username.toUpperCase()+" </b><br><br> You have been added as Local-Admin for " +pius+" PIU of RVNL. Your login details are as under;"
						     +"<BR> User Id:  "+username+" <BR> Password:  "+password+"<br> Zones Assigned:"+zones_assigned+"<BR> Login webpage: <a href=\""+ pageName1+"\">"+pageName1+"</a><br><br>You are advised to change your password. <br><br><br><span style='color:brown; font-size:20px; font-style:italic;'<b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
						    						
						    // Sender's email ID and password needs to be mentioned
						    final String from = "indiarvnl@gmail.com";
						    final String pass = "vsam3WSCJAIw4cj7";
						    
						    final String cc = cc1;
						    // Defining the gmail host
						    String host = "smtp-relay.sendinblue.com";
						 
						    // Creating Properties object
						    Properties props = new Properties();
						 
						    // Defining properties
						   
						    props.put("mail.smtp.starttls.enable", "true");
						    props.put("mail.smtp.host", host);
						    props.put("mail.smtp.user", from);
						    props.put("mail.smtp.password", pass);
						    props.put("mail.smtp.port", "587");
						    props.put("mail.smtp.auth", "true");
						 
						    // Authorized the Session object.
						    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
						        @Override
						        protected PasswordAuthentication getPasswordAuthentication() {
						            return new PasswordAuthentication(from, pass);
						        }
						    });
						 
						    try {
						        // Create a default MimeMessage object.
						        MimeMessage message = new MimeMessage(mailSession);
						        // Set From: header field of the header.
						        message.setFrom(new InternetAddress(from));
						        // Set To: header field of the header.
						        message.addRecipient(Message.RecipientType.TO,
						                new InternetAddress(to));
						        message.setRecipients(Message.RecipientType.CC, cc);
						        // Set Subject: header field
						        message.setSubject(subject);
						        // Now set the actual message
						        message.setText(messg);
						        // Send message
						        Transport.send(message);
						        result = "Your mail sent successfully....";
						        System.out.println("Email sent successfully");
						    } catch (MessagingException mex) {
						        mex.printStackTrace();
						        result = "Error: unable to send mail....";
						    }
						 
						    // mail code ends here
						    //SMS code 
		    
		    try {
// Construct data
//contact number supervisor------contact_No_sup
//contact number sender ------------- supcontact

String usersms = "username=" + "indiarvnl@gmail.com";
String hash = "&hash=" + "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
//String apiKey = "apikey=" + "noVebn4XbP0-UFyeK1rRwkvCNdDw5ZXfVqrSNPndk2";
String message = "&message=" + "Please check your email ("+emails+") for login details.\n\nRVNL Document Portal";
String sender = "&sender=" + "RPDAMS";
String numbers = "&numbers=" + ""+phones+"";

// Send data
HttpURLConnection connsms = (HttpURLConnection) new java.net.URL("http://api.textlocal.in/send in/?").openConnection();

String data = usersms + hash + numbers + message + sender;
//String data = apiKey + numbers + message + sender;
connsms.setDoOutput(true);
connsms.setRequestMethod("POST");
connsms.setRequestProperty("Content-Length", Integer.toString(data.length()));
connsms.getOutputStream().write(data.getBytes("UTF-8"));
final BufferedReader rd2 = new BufferedReader(new InputStreamReader(connsms.getInputStream()));
final StringBuffer stringBuffer = new StringBuffer();
String line;
while ((line = rd2.readLine()) != null) {
stringBuffer.append(line);
}
rd2.close();
System.out.println("Message sent successfully");
//return stringBuffer.toString();
} catch (Exception e) {
System.out.println("Error SMS "+e);
//return "Error "+e;
}					   
// sms code ends here
			}
		}    //c_user.jsp
		} // end of if of project stage
				
%>

				
		
	</c:if>	
	</form>
	<br><br><br><br><br><br><br><br>
	</div>										     
	 <%@include file="included/Newfooter.jsp" %>
	<script type="text/javascript">

$('#PIUunderList').change(function(){
    $('#Zoneunderlist option:first').prop('selected', 'selected');
    $('#OrgUnderlist option:first').prop('selected', 'selected');

});

$('#Zoneunderlist').change(function(){
   $('#PIUunderList option:first').prop('selected', 'selected');
   $('#OrgUnderlist option:first').prop('selected', 'selected'); 
});

  $('#OrgUnderlist').change(function(){
      $('#PIUunderList option:first').prop('selected', 'selected');
      $('#Zoneunderlist option:first').prop('selected', 'selected');
  });
  
</script>
</body>
</html>