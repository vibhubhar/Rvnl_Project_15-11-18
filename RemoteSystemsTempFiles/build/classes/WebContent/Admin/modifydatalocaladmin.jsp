<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@include file="included/NewHeader1.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%-- <jsp:include page="Divisions.jsp" flush="true" /> --%>
<%@ page autoFlush="true" buffer="1094kb"%>
<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>

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
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js"
	type="text/javascript"></script>
<link
	href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validateSysAdmin230.js"></script>
<script src="resources/JS/PIU_depend230.js"></script>
<script src="resources/JS/Headquarter.js"></script>
<script src="resources/JS/Reports230.js"></script>
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

	
	//window.setAlwaysOnTop(true);
window.focus();
if (document.getElementById("email_id")!=null) {
document.Form20.email_old.value=document.getElementById("email_id").value;
}
if (document.getElementById("contact_no")!=null) {
document.Form20.no_old.value=document.getElementById("contact_no").value;
}
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
                password.after('<input onchange = "passwordChanged(this);" id = "txt_' + password.attr("id") + '" type = "text" value = "' + password.val() + '" />');
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
                Password.after('<input onchange = "passwordChanged1(this);" id = "txt_' + Password.attr("id") + '" type = "text" value = "' + Password.val() + '" />');
                Password.hide();
            } else {
                Password.val(Password.next().val());
                Password.next().remove();
                Password.show();
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
<script type="text/javascript">
    function refreshAndClose() {
        //location.replace("c_user.jsp");
        //window.opener.location.reload(true);
       window.close();
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
<%
String username1 =request.getParameter("usern");

String username=username1.replace('~','/'); 
String role1=(String)session.getAttribute("role");
String role=(String)session.getAttribute("Type");
String zone_id1=(String)session.getAttribute("zone_id"); 
String piu_id1=(String)session.getAttribute("piu_id"); 
String div_id1=(String)session.getAttribute("Division_Id");
String user = (String) session.getAttribute("user_name");
%>

<%int dep_id=0,piu1=0,desig=0,zoneid=0,divisionid=0,orgid=0;
		ResultSet rs3_1 = null, rs19=null, rs251=null;
		PreparedStatement ps3_1 = null, ps19=null, ps251=null;
		ResultSet rs1_1 = null, rs2 = null;
		PreparedStatement ps1_1 = null, ps2 = null;
		Connection conn = null;
		Statement stmt = null;
		
		String hier = null,s1=null,s2=null,s3=null,s4=null,s5=null,s6=null,s7=null,type=null,no=null, role2=null;
		
		DataSource ds=null;
		String zone_name=null,division_name=null;

		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			 ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

			conn = ds.getConnection();
		
		String  sql ="select * from xx_user_master where User_name='"+username+"'";	   
		
         PreparedStatement ps = conn.prepareStatement(sql);   	           
	         ResultSet rs = ps.executeQuery();
	         while(rs.next())
	         {
	        	 s1=rs.getString("User_name");
	        	 type=rs.getString("Type");
	           	 s2=rs.getString("Officer_name");        
	           	role2=rs.getString("Role");  
	           	if (role2.equalsIgnoreCase("Supervisor")) {
	           		role2="User";
	           	}
	        	 s3=rs.getString("Email_Id");
	        	  no=rs.getString("Contact_No");
	        	 dep_id=rs.getInt("Department_Id");
	        	 desig=rs.getInt("Designation_Id");
	        	 orgid=rs.getInt("Org_Id");
	        	// System.out.println("org="+orgid+type);
	        	 String  sql3 =" select * from xx_designation_master where Designation_Id="+desig;	  
		         
	        	  ps3_1 = conn.prepareStatement(sql3);   	           
		          rs3_1 = ps3_1.executeQuery();
		         while(rs3_1.next())
		         {
		      s6=rs3_1.getString("Designation_Name");
	        	 
		         }
		         
	        	 zoneid=rs.getInt("Zone_ID");
	        	 String  zonetest ="select * from xx_zones_master where Zone_Id='"+zoneid+"'";	     
	        	 PreparedStatement zone11 = conn.prepareStatement(zonetest);   	           
		          ResultSet rszone11 = zone11.executeQuery();
		         while(rszone11.next())
		         {
		      zone_name=rszone11.getString("Zone_Name");
	        	 
		         }
		         divisionid=rs.getInt("Division_ID");
		        
		        String  division ="select * from xx_divisions_master where division_id='"+divisionid+"'";	     
	        	 
	        	  PreparedStatement div11 = conn.prepareStatement(division);   	           
		          ResultSet rsdiv = div11.executeQuery();
		         while(rsdiv.next())
		         {
		        	 division_name=rsdiv.getString("division_name");
	        	 
		         }
		         if(divisionid==86){
			        	division_name="Headquarters";
			        }
	        	 piu1=rs.getInt("PIU_ID");
	        	 String  sql1 ="select * from xx_departments_master where Department_id='"+dep_id+"'";	     
	        	 
	        	  ps1_1 = conn.prepareStatement(sql1);   	           
		          rs1_1 = ps1_1.executeQuery();
		         while(rs1_1.next())
		         {
		      s4=rs1_1.getString("Department_Name");
	        	 
		         }
		         
		         if(piu1!=0){
		         String  sql2 =" select * from xx_piu_master where PIU_Id="+piu1;	 
		         
	        	  ps2 = conn.prepareStatement(sql2);   	           
		          rs2 = ps2.executeQuery();
		         while(rs2.next())
		         {
		      s5=rs2.getString("PIU_Name");
		      
	        	 
		         }
		        
		         }
		         else if (orgid  != 0){
		        	 String  sql32 =" select * from xx_org_master where Org_Id="+orgid;	 
			         
		        	  ps19 = conn.prepareStatement(sql32);   	           
			          rs19 = ps19.executeQuery();
			         while(rs19.next())
			         {
			      s7=rs19.getString("Org_Name");
			      
		        	 
			         }
			            	 
		         }
		        
	         }
	         
		}
		catch(Exception e)
		{
			e.printStackTrace();
		} 
	    
		%>
	
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Modify User] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8><br>
</div> <br> 

<div class="container" style="margin-top:40px; width: 40%;">
	<form id="Form20" name="Form20" method="post" action="updateuser.jsp">
	<INPUT TYPE="HIDDEN" NAME="Depatment">
	<INPUT TYPE="HIDDEN" NAME="cbResults">
	<INPUT TYPE="HIDDEN" NAME="Project_stage">
			<INPUT TYPE="HIDDEN" NAME="email_old">
			<INPUT TYPE="HIDDEN" NAME="no_old">
	
<%-- 	<c:if test="${param.Project_stage == null}"> --%>	
		<!-- <table class="table table-hover table-bordered" >
			<tr class="success"><td style="width: 40%;"><h3 style="text-align:center;"><font color="grey">Create User</font></h3></td><td><h3 style="text-align:center;">
			<font color="grey">List of Users</font></h3></td></tr>
			<td><input type = "radio" name="myRadios" id="User" value ="1" style='margin-left:80px' checked="checked"><b>Create User</b> &nbsp;&nbsp;
					<input type = "radio" name="myRadios" id="User1" value ="2"><b>Create Local Admin</b>
				</td>
			
		
					</table> -->
			<!--  	<td style="background-color: #FEF9E7" width ="40%">	-->				
										
				<div id ="User_1" class="desc">
				<table style="border:1px solid black; margin:-20px 0px 0px 0px;" ><tr class="success"><td style="background-color: aliceblue;width:40%;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="red">*</font>Required Field<br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Type :
					<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="Type" id="Type" style="width: 205px;height: 27px;background-color: #d3d3d3;" value="<%=type %>" disabled>
										 <option selected="selected"><%=type %></option> 															</select><br> <br>
				<input type="hidden" name="type_test" id="type_test" value="<%=type %>" /> <br> <br>
				   
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User Id:
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="user_name" id ="user_name" type="text" class="textfield" value="<%=s1%>"  onkeyup="loadXMLDoc('user_name','err')" width="200" style="width: 205px;margin-left: 16px;" />  
					<span id="err"> </span> <br>
					<input type="hidden" name="test" id="test" value="<%=s1 %>" />
					<font color="#99CC00">
				&nbsp;&nbsp;&nbsp;&nbsp;   User ID should be complete  Designation along with place of posting <br>
				&nbsp;&nbsp;&nbsp;&nbsp; without any space(s) in between (For example- <b>SrDEN/E/WAT</b>)
				   </font><br><br>
				<%
				try {
				if (orgid != 0) {
				%>				
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Organization:
						<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div id="Org1" style='display:inline; ' ><select name="Org_name" id="Org_name"  disabled 
							style="width: 205px; margin-top:6px; height: 27px; background-color: #d3d3d3;">
								<option value='<%=s7 %>'><%=s7 %></option>
								 </select></div><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
          <%				
				} else {
					%>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Officer Name :
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="officer_name" id="officer_name" type="text" class="textfield" value="<%=s2%>"
					 width="200" style="width: 200px"> <br> <br>
					 
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email Id :
					 <font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="email_id" id="email_id" type="text" class="textfield" onkeyup="checkemail()" value="<%=s3%>" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off
					 width="200" style="width: 	200px"><div id="error3" style="margin-left: 61px;"></div> <br> <br>
					 
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact No:
					 <font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="contact_no" id="contact_no" type="text" onkeyup="ValidateNo()" value="<%=no%>" class="textfield" maxlength="10" onCopy=return(false) onDrag=return(false) onDrop=return(false) onPaste=return(false) autocomplete=off
					 width="200" style="width: 200px"> <div id="error0" style="margin-left: 61px;"></div><br> <br>
						
						
						<%  if(s5 !=null) {%>
						
				&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Role:
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					  <select name="Role" id="Role" style="width: 205px;background-color:#d3d3d3;" disabled>
					  <!-- <option selected="selected">-- Select Role --</option>
						<option value="System Administrator">System Administrator</option>
						<option value="Supervisor" >User</option> -->
						<option value="<%=role2 %>" ><%=role2 %></option>
					<!--  	<option value="Coordinator">Coordinator</option>  -->
						
				</select> <br> <br>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PIU Of RVNL:
				<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name=PIU_name id="PIU_name"	style="width: 205px;background-color:#d3d3d3;" disabled>
						<!-- <option value="none">-- Select PIU --</option> -->
						<%
								//conn = ds.getConnection();

								String sql3 = "select * from xx_piu_master where piu_Id="+piu1+"";
								PreparedStatement ps311_1 = conn.prepareStatement(sql3);
								ResultSet rs311_1 = ps311_1.executeQuery();

								while (rs311_1.next()) {
									String dname11 = rs311_1.getString("PIU_Name");
						%>
						<option value="<%=dname11%>"><%=dname11%></option>
						<%
							}	
						
						%>
				  </select> <br/> <br/>
				  
				  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department:
				  <font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<select name=Department_RVNL2 id="Department_RVNL2" onchange='showDesgin_cUser(2)'
					style="width: 205px;">
						<option value="<%=s4 %>"><%=s4 %></option> 
						 <%
						
						String dep_sql = "select department_name from xx_departments_master where type ='RVNL'";
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
                

                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Designation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select  name='DesgDiv_RVNL2' id='DesgDiv_RVNL2' style="width: 205px;margin:3px 0px 12px 0px;" value="<%=s6%>" >
						<option value="<%=s6%>"><%=s6%></option> 	
						 
						 <%
						// ResultSet rs = stmt.executeQuery("select  division_name from xx_divisions_map where ext_zone_id = (select zone_id from xx_zones_master where zone_name = '"+country+"' ");  
						  String depts="Select Department_Id from xx_departments_master where Department_Name='"+s4+"' and Type='"+type+"'";
						 PreparedStatement ps4 = conn.prepareStatement(depts);
						  // ps3.setString(1, piu);
						   ResultSet rsl = ps4.executeQuery(); 
						   String depatment_id=null;
						 while(rsl.next()){
						 depatment_id=rsl.getString(1);
						 }
						 String sql = "select Designation_name from xx_designation_mapping where Department_Id ='"+depatment_id+"' and Type='"+type+"' and Designation_name!='"+s6+"'";
						 
						 

						 PreparedStatement ps3 = conn.prepareStatement(sql);
						   //ps3.setString(1, dept);
						  // ps3.setString(1, piu);
						   ResultSet rs = ps3.executeQuery(); 
						 while(rs.next()){
							
							 String designation_name = rs.getString("designation_name");	
							
										
						%>
						<option value ="<%=designation_name %>"><%=designation_name %></option>
						
						<% 
						}	
						
						
						%>
				  </select>			  
				 <br /> <br />
				<%
				
										
						}
						 else {	%>
				
	
						
						
		
			<!-- 	<div style='display:none;' id='business_MOR'> -->
				<!--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Role:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    <select name="Role" id="Role" style="width: 205px" onchange="showDiv(this)">
					  <option selected="selected">-- Select Role --</option>
						<option value="Supervisor">User</option>
						
					 	<option value="Coordinator">Coordinator</option>  
						
				</select> <br> <br>-->
	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zone :
					<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name='Zone' id ="Zone" class="textfield" style="width: 205px"  value="<%=zone_name %>" width="200" style="width: 205px;" disabled>
						<%-- <option value="none">-- Select Zone --</option> --%>
						<%-- <%
						try{
						
							String sql33_3="Select * from xx_zones_master where Zone_Id !='18' Order by Zone_name";
							PreparedStatement stmt33_3 = conn.prepareStatement(sql33_3);
								ResultSet depRS3 = stmt33_3.executeQuery();
								String zname = null;// request.getParameter("Zone_name");

								while (depRS3.next()) {
									zname = depRS3.getString("zone_name");
						%>
						<option value="<%=zname%>"><%=zname%></option>
						<%
							}
						}catch(Exception e){
							e.printStackTrace();
						}	 --%>
								
						
				  <br /> <br />

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Division :
					<font color="red">*</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				   
					<input type="text" name='division' id='division1' class="textfield" value="<%=division_name %>"  width="200" style="width: 205px;" disabled>
						<!-- <option value="none">-- Select Division --</option>	 -->					
			     	
				   <br /> <br />
				   
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<select name=Department_RVNL1 id="Department_RVNL1"	style="width: 205px;" onchange='showDesgin_cUser(1)' >
						 <option value="<%=s4 %>"><%=s4 %></option> 
						 <%
						String dep_sql = "select department_name from xx_departments_master where type ='MOR' order by department_name";
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
                

                   
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Designation:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name='DesgDiv_RVNL1' id='DesgDiv_RVNL1' style="width: 205px;margin:3px 0px 12px 0px;" value="<%=s6%>">
						 <option value="<%=s6%>"><%=s6%></option> 
						 <%
						// ResultSet rs = stmt.executeQuery("select  division_name from xx_divisions_map where ext_zone_id = (select zone_id from xx_zones_master where zone_name = '"+country+"' ");  
						  String depts="Select Department_Id from xx_departments_master where Department_Name='"+s4+"' and Type='"+type+"'";
						  
						 PreparedStatement ps4 = conn.prepareStatement(depts);
						  // ps3.setString(1, piu);
						   ResultSet rsl = ps4.executeQuery(); 
						   String depatment_id=null;
						 while(rsl.next()){
						 depatment_id=rsl.getString(1);
						 }
						 String sql = "select Designation_name from xx_designation_mapping where Department_Id ='"+depatment_id+"' and Type='"+type+"' and Designation_name!='"+s6+"'";
						 

						 PreparedStatement ps3 = conn.prepareStatement(sql);
						   //ps3.setString(1, dept);
						  // ps3.setString(1, piu);
						   ResultSet rs = ps3.executeQuery(); 
						 while(rs.next()){
							
							 String designation_name = rs.getString("designation_name");	
							
										
						%>
						<option value ="<%=designation_name %>"><%=designation_name %></option>
						
						<%
						}	
						%>
				  </select>			 				  
				 <br /> <br />
				
					
			 <%} 
				} 
				}catch(Exception e){
							e.printStackTrace();
						} finally {
    try { conn.close(); } catch (Exception e) { /* ignored */ }
}%>	
				
				
			</div>
			
</div>
		<table>		
			<tr>
			<td>
			
	<!-- 		<INPUT TYPE="HIDDEN" id="demo">
		<center>	<button type="submit" name="button" id="btnclick" style="margin-left: 150px;" class="btn btn-primary" >Submit</button>   -->
			<INPUT TYPE="HIDDEN" id="demo">
					<center>
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		 <button type="button" id="btnclick" class="btn btn-primary" style="margin-left:100px;"
								onclick="modifyuser();">Submit</button>
			
			
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-primary" value="Cancel" onClick="refreshAndClose()" /> </center>
		
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
	
							<br><br>
		<%-- </c:if>	 --%>

	</td></tr></table></div></form><br><br></div>
	
										      <%@include file="included/Newfooter.jsp" %>
</body><br><br>
</html>