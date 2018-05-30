<%@page import="java.net.HttpURLConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="included/NewHeader1.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page autoFlush="true" buffer="1094kb"%>
<%@ page session="true"%>
<%@include file="sessionCheck.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Create User</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
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

#DivsionsDiv{
display:none;
}

</style>
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
			document.getElementById("error5").style.color = "RED";
			document.getElementById("error5").innerHTML = "Please Enter Your Mobile Number";
			return false;
		} else {

			var phoneno = /^\d{10}$/;
			if (phoneNo.value.match(phoneno)) { //document.getElementById("error5").style.color="green";
				document.getElementById("error5").innerHTML = "";
				document.getElementById("btnclick").disabled = false;
				return true;
			} else {
				document.getElementById("error5").style.color = "red";
				document.getElementById("error5").innerHTML = "Not a Valid Mobile Number";
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
			document.getElementById("error0").style.color = "RED";
			document.getElementById("error0").innerHTML = "Please Enter Your Mobile Number";
			return false;
		} else {

			var phoneno = /^\d{10}$/;
			if (phoneNo.value.match(phoneno)) { //document.getElementById("error0").style.color="green";
				document.getElementById("error0").innerHTML = "";
				document.getElementById("btnclick").disabled = false;
				return true;
			} else {
				document.getElementById("error0").style.color = "red";
				document.getElementById("error0").innerHTML = "Not a Valid Mobile Number";
				document.getElementById("btnclick").disabled = true;
				return false;
			}
		}

		alert("Success ");
		return true;
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('input').on('keypress', function (event) {
		    //var regex = new RegExp("^[a-zA-Z0-9]+$");
		    var regex = new RegExp("['?!<\">\\\\]+$");
		    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
		    if (regex.test(key)) {
		       event.preventDefault();
		       return false;
		    }
	  });
 	
		
		if (document.getElementById("Email")!=null) {
			document.loginForm11.email_old.value=document.getElementById("Email").value;
			}
		if (document.getElementById("Phone_Number")!=null) {
			document.loginForm11.no_old.value=document.getElementById("Phone_Number").value;
			}
		$('#Type').on('change', function() {
			if (this.value == 'RVNL')
			//............................
			{
				$("#business_RVNL").show();
			} else {
				$("#business_RVNL").hide();
			}

			if (this.value == 'MOR')
			//.....................^.......
			{
				$("#business_MOR").show();
			} else {
				$("#business_MOR").hide();
			}
		});
		$("input[name$='myRadios']").click(function() {
			var test = $(this).val();
			$("div.desc").hide();
			$("#User_" + test).show();
		});
	});
</script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#chkShowPassword")
				.bind(
						"click",
						function() {
							var password = $("#password");
							if ($(this).is(":checked")) {
								password
										.after('<input onchange = "passwordChanged(this);" id = "txt_'
												+ password.attr("id")
												+ '" type = "text" value = "'
												+ password.val() + '" />');
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
	$(function() {
		$("#chkShowPassword1")
				.bind(
						"click",
						function() {
							var password1 = $("#Password");
							if ($(this).is(":checked")) {
								Password
										.after('<input onchange = "passwordChanged1(this);" id = "txt_'
												+ Password.attr("id")
												+ '" type = "text" value = "'
												+ Password.val() + '" />');
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

		if (passval.length >= 5) {
			document.getElementById("btnclick").disabled = false;
			//document.getElementById("error6").style.color="GREEN";
			document.getElementById("error6").innerHTML = "";
		} else {
			document.getElementById("btnclick").disabled = true;
			document.getElementById("error6").style.color = "RED";
			document.getElementById("error6").innerHTML = "Please Provide password of atleast 5 chars.";

			//alert("Please Provide password of atleast 5 chars.");
		}

	}
</script>
<script type="text/javascript">
	function passwordChange(passval) {
		//` $('input[type="password"]').prop('disabled', true);

		if (passval.length >= 5) {
			document.getElementById("btnclick").disabled = false;
			//document.getElementById("error1").style.color="GREEN";
			document.getElementById("error1").innerHTML = "";
		} else {
			document.getElementById("btnclick").disabled = true;
			document.getElementById("error1").style.color = "RED";
			document.getElementById("error1").innerHTML = "Please Provide password of atleast 5 chars.";

			//alert("Please Provide password of atleast 5 chars.");
		}

	}
</script>

<script type="text/javascript">
	function loadXMLDoc(element, er) {
		var xmlhttp;
		var k1 = document.getElementById(element).value;
		var k = encodeURIComponent(k1);
		var urls = "pass.jsp?ver=" + k;

		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4) {
				//document.getElementById("err").style.color="red";
				document.getElementById(er).innerHTML = xmlhttp.responseText;
				var ex = document.getElementById("exist");
				if (ex != null) {
					document.getElementById("btnclick").disabled = true;

				} else {

					document.getElementById("btnclick").disabled = false;

				}

			}
		}
		xmlhttp.open("GET", urls, true);
		xmlhttp.send();
	}
</script>
<script type="text/javascript">
    function refreshAndClose() {
    	//location.replace("c_user.jsp");
        window.opener.location.reload(true);
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
		String username1 = request.getParameter("usern");

		String username = username1.replace('~', '/');
	%>


	<%
		int dep_id = 0, piu1 = 0, desig = 0, zoneid = 0, divisionid = 0;
		ResultSet rs3_1 = null;
		PreparedStatement ps3_1 = null;
		ResultSet rs1_1 = null, rs2 = null, rs2_1=null;
		PreparedStatement ps1_1 = null, ps2 = null, ps2_1=null;
		Connection conn = null;
		Statement stmt = null;

		String hier = null, s1 = null, s2 = null, s3 = null, s4 = null, s5 = null, s6 = null, s7 = null, type = null, no = null;
		java.util.ArrayList<String> userlistal = new java.util.ArrayList<String>();
		java.util.ArrayList<String> userlistal1 = new java.util.ArrayList<String>();
		java.util.ArrayList<String> userlistal111 = new java.util.ArrayList<String>();
		java.util.ArrayList<String> userlistal2 = new java.util.ArrayList<String>();
		java.util.ArrayList<String> packagelistal = new java.util.ArrayList<String>();
		DataSource ds = null;
		String zone_name = null, division_name = null;
		int userid = 0;

		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

			conn = ds.getConnection();

			String sql = "select * from xx_user_master where User_name='"+ username + "'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				userid = rs.getInt("User_ID");
				s1 = rs.getString("User_name");
				type = rs.getString("Type");
				s2 = rs.getString("Officer_name");

				s3 = rs.getString("Email_Id");
				no = rs.getString("Contact_No");
				dep_id = rs.getInt("Department_Id");
				desig = rs.getInt("Designation_Id");
				piu1 = rs.getInt("PIU_ID");
				

				String zonetest11 = "select  Zone_Name from xx_zones_master ";
				PreparedStatement pszone1 = conn.prepareStatement(zonetest11);
				ResultSet rszone_11 = pszone1.executeQuery();
				while (rszone_11.next()) {
						String s6111 = rszone_11.getString("Zone_Name");
						userlistal111.add(s6111);
						
					
				}
				
				
				
				String zonetest1 = "select DISTINCT Zone_ID from xx_user_zone_mapping where User_Id="
						+ userid;
				
				PreparedStatement pszone = conn.prepareStatement(zonetest1);
				ResultSet rszone_1 = pszone.executeQuery();
				while (rszone_1.next()) {
					String zone_id1 = rszone_1.getString("Zone_ID");
					userlistal.add(zone_id1);
					
					String zonedisplay = "select Zone_Name from xx_zones_master where Zone_Id="
							+ zone_id1+" order by Zone_Name";
					PreparedStatement ps3_11 = conn
							.prepareStatement(zonedisplay);
					ResultSet rs3_11 = ps3_11.executeQuery();
					while (rs3_11.next()) {
						String s611 = rs3_11.getString("Zone_Name");
						userlistal1.add(s611);
					}
						
				}
				String zonedisplay2 = "select distinct xx_document_mapping.zone from xx_document_mapping, xx_user_master where xx_document_mapping.submitted_by= xx_user_master.user_id and xx_user_master.piu_id="
								+ piu1+" order by xx_document_mapping.Zone";
						PreparedStatement ps3_12 = conn
								.prepareStatement(zonedisplay2);
						ResultSet rs3_12 = ps3_12.executeQuery();
						while (rs3_12.next()) {
							String s612 = rs3_12.getString("Zone");
							userlistal2.add(s612);
						
					}
				
				String sql3 = " select * from xx_designation_mapping where Designation_Id="
						+ desig;
				ps3_1 = conn.prepareStatement(sql3);
				rs3_1 = ps3_1.executeQuery();
				while (rs3_1.next()) {
					s6 = rs3_1.getString("Designation_Name");

				}

				zoneid = rs.getInt("Zone_ID");
				String zonetest = "select * from xx_zones_master where Zone_Id='"
						+ zoneid + "'";
				PreparedStatement zone11 = conn.prepareStatement(zonetest);
				ResultSet rszone11 = zone11.executeQuery();
				while (rszone11.next()) {
					zone_name = rszone11.getString("Zone_Name");

				}
				divisionid = rs.getInt("Division_ID");

				String division = "select * from xx_divisions_master where division_id='"
						+ divisionid + "'";

				PreparedStatement div11 = conn.prepareStatement(division);
				ResultSet rsdiv = div11.executeQuery();
				while (rsdiv.next()) {
					division_name = rsdiv.getString("division_name");

				}

				
				String sql1 = "select * from xx_departments_master where Department_id='"
						+ dep_id + "'";

				ps1_1 = conn.prepareStatement(sql1);
				rs1_1 = ps1_1.executeQuery();
				while (rs1_1.next()) {
					s4 = rs1_1.getString("Department_Name");

				}
				
				if (piu1 != 0) {
					String sql2 = " select * from xx_piu_master where PIU_Id="
							+ piu1;
					
					ps2 = conn.prepareStatement(sql2);
					rs2 = ps2.executeQuery();
					while (rs2.next()) {
						s5 = rs2.getString("PIU_Name");

					}
					
				} else {

				}
			
			}
			String packdisplay2 = "select pks.ct as packcount from xx_zones_master z left join (select e.zone_id, count(e.zone_id) as ct from xx_user_master a, xx_piu_master b, xx_projectattributes_master c, xx_packages_project d, xx_project_division_map e where a.PIU_ID = b.PIU_Id and b.PIU_Name=c.PIU_of_RVNL and c.Project_ID = d.project_id and d.package_id = e.package_id and a.user_id=" + userid + " group by e.zone_id) pks on z.zone_id=pks.zone_id order by z.Zone_Id";
			 ps2_1 = conn.prepareStatement(packdisplay2);
			rs2_1 = ps2_1.executeQuery();
			while (rs2_1.next()) {
				String pack12 = rs2_1.getString("packcount");
				packagelistal.add(pack12);
			
		}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	%>
	
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Modify Local Admin] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8><br>
</div> <br> 
	
	<div class="container" style="margin-top: 40px;">
		<form id="loginForm11" name="loginForm11" method="post">
			<INPUT TYPE="HIDDEN" NAME="Depatment"> 
			<INPUT TYPE="HIDDEN" NAME="cbResults">
				 <INPUT TYPE="HIDDEN" NAME="Project_stage">
				 <INPUT TYPE="HIDDEN" NAME="email_old">
			<INPUT TYPE="HIDDEN" NAME="no_old">
	
			<c:if test="${param.Project_stage == null}">
				<div id="modify"
					style="background: aliceblue none repeat scroll 0% 0%; width: 40%;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PIU :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select name=PIU_Id
						id="PIU_Id"
						style="width: 205px; margin-top: 23px; background-color: #d3d3d3;"
						onchange="javascript:localadmnpiuchange(this.value);" disabled>
						<option value=<%=s5%>><%=s5%></option>
						<%
							try {

									

									String sql13 = "select * from xx_piu_master order by PIU_Name";
									PreparedStatement ps13 = conn.prepareStatement(sql13);
									ResultSet rs13 = ps13.executeQuery();

									while (rs13.next()) {
										String dname = rs13.getString("PIU_Name");
						%>
						<option value="<%=dname%>"><%=dname%></option>
						<%
							}
						%>

					</select> <br />
					<div id="piu111" style="margin: 0px 0px 0px 48px;"></div>


					<br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User
					Id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="User_name" id="User_name1" type="text"
						class="textfield" onkeyup="loadXMLDoc('User_name1','err1')"
						value="<%=s1%>" > <span
						id="err1"> </span> <br>
						<input type="hidden" name="test" id="test" value="<%=s1 %>" /> <font color="#99CC00">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; User ID
						should be complete Designation along with place of <br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;posting
						(For example- <b>SrDEN/E/WAT</b>)
					</font><br> <br>

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Officer
					Name :&nbsp;&nbsp; <input name="Officer_Name" id="Officer_Name"
						type="text" class="textfield" value="<%=s2%>" width="200"
						style="width: 205px"> <br> <br>

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email
					Id :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
						name="Email" id="Email" type="text" class="textfield"
						onkeyup="checkemail1()" value="<%=s3%>" width="200"
						style="width: 205px">
					<div id="error4"  style="margin:0px 0px 0px 158px;"></div>
					<br> 

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact
					No:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="Phone_Number"
						id="Phone_Number" type="text" class="textfield"
						onkeyup="ValidateNo1()" maxlength="10" value="<%=no%>" width="200"
						style="width: 205px">
					<div id="error5" style="margin:10px 0px 0px 170px;"></div>
				

					<!--  <div style='display:;' id='business_RVNL'> -->
					&nbsp;

					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<select name=departme id="departme" style="width: 205px">
						<option value="<%=s4%>"><%=s4%></option>
						<%
							String sql14 = "select Department_Name from xx_departments_master where type ='RVNL'and Department_Name!='"
											+ s4 + "'  order by department_name";
									PreparedStatement ps14 = conn.prepareStatement(sql14);
									ResultSet rs14 = ps14.executeQuery();

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
				<table class="table table-bordered" style="margin-left:100px; width:75%;">
					<tr><th style="padding-left: 50px">Zone Name</th><th style="margin-left: 50px">Package created</th></tr>
					
					<%
					Iterator<String> divitr = userlistal111.iterator();
				Iterator<String> packitr = packagelistal.iterator();
							String username11 = null;
							String packname11 = null;
							while (divitr.hasNext()) {
								%>
								<tr><td>
				<%	
								username11 = divitr.next();
								packname11=packitr.next();
								if (packname11!=null) {
									} else {packname11="-";}
								if (userlistal1.contains(username11)) {
     								if (userlistal2.contains(username11)) {	
					%>
					<div>
						<input type='checkbox' name='Zone_id' id='Zone_id'
							style="margin-left: 50px;" value="<%=username11%>" checked disabled>
						<%=username11%>
					</div>
						<div>
						<input type='hidden' name='Zone_id' id='Zone_id'
							style="margin-left: 50px;" value="<%=username11%>" checked >
						</div>
					<%
						}
							else {
					%>
						<div>
							<input type='checkbox' name='Zone_id' id='Zone_id'
							style="margin-left: 50px;" value="<%=username11%>" checked>
							<%=username11%>
							</div>
					<%
						}
     							}	
     							else {
					                                         
                		%>
					<input type='checkbox' name='Zone_id' id='Zone_id'
						style="margin-left: 50px" value="<%=username11%>" >
					<%=username11%>
					<%
						
									}
     							%>
     				</td><td>
     					<div type='text' name='packs' id='packs'
						style="margin-left: 50px; //margin-top:20px;" value="<%=packname11%>" >
					<%=packname11%></div>
					</td></tr>
					<%
								}
							%>
							</table><br>
							<div style="margin-left:20px; color:blue;">Note:- In case a zone is de-checked then project package details connected to this zone will be deleted.</div>    
							<%
								} catch (Exception e) {
								e.printStackTrace();
							}
						finally{
							conn.close();
						}
					%>
					<br /> <br />


				</div>
				<table>
					<tr>
						<td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							<INPUT TYPE="HIDDEN" id="demo">
							<center><button type="button" id="btnclick" class="btn btn-primary" STYLE="MARGIN-LEFT:100PX;"
								onclick="modifylocaluser();">Submit</button>


							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
							class="btn btn-primary" value="Cancel" onclick="refreshAndClose()" /></center></td>

					</tr>

				</table>
				 <br> <br>
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
			</c:if>


		</form>
		
				
<c:if test="${param.Project_stage != null}">
		<%			
		if (request.getParameter("Project_stage") != null) {
			String prof_alert2=(String)session.getAttribute("Profile_Alert");
			int userid11=0;
			String str=request.getParameter("Project_stage");
		    if(str.equalsIgnoreCase("fourth")){	
			String username11 = request.getParameter("User_name");
			String test1 = request.getParameter("test");
			String officers = request.getParameter("Officer_Name");
			String emails =request.getParameter("Email");
			String phones =request.getParameter("Phone_Number");
			String departme =request.getParameter("departme");
			String zoneCheck[] = request.getParameterValues("Zone_id");			
			String zones =request.getParameter("Zone_id");
			String zonename =request.getParameter("Zone_Name");
			String userid1 = request.getParameter("User_Id");
			String zoneid1 = request.getParameter("Zone_id");
			String PIU_Id = request.getParameter("PIU_Id");
			String RVNL = request.getParameter("LocalUser");
			String email_old = request.getParameter("email_old");
			String no_old = request.getParameter("no_old");
		
			String zones_assigned="";
			
			try {
				PreparedStatement ps5 =null,ps6=null,ps7=null,ps8=null ,ps9=null;ResultSet rs5=null, rs6=null,rs7=null,rs8=null,rs9=null;
				java.util.ArrayList<String> zonal15 = new java.util.ArrayList<String>();
				java.util.ArrayList<String> zonal3 = new java.util.ArrayList<String>();
				java.util.ArrayList<String> packal3 = new java.util.ArrayList<String>();
				
				conn = ds.getConnection();
				String sql8 = "select Department_Id from xx_departments_master where Department_Name ='"+departme+"'";
				ps8 = conn.prepareStatement(sql8);
				ResultSet rs81 = ps8.executeQuery();
				String departme_id =null;
				while (rs81.next()) {
					departme_id = rs81.getString("Department_Id");
					
				}
				
			
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
				   UPDATE xx_user_master SET User_Name='<%=username11 %>',Officer_Name ='<%=officers %>',Email_Id='<%=emails %>',Contact_No='<%=phones %>',Department_id='<%=departme_id %>', Date_created=now() where User_name='<%=test1%>'                                 
				</sql:update>
				<%		
				
				String usersql = "select User_ID from xx_user_master where User_name='"+username11+"'";
				
				ps9 = conn.prepareStatement(usersql);
				rs9 = ps9.executeQuery();
				while(rs9.next()){
				 userid11=rs9.getInt("User_ID");
				}
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
				  DELETE from xx_user_zone_mapping where User_Id='<%=userid11%>'
				</sql:update>
				<%
				String sql9 = "select e.zone_id, e.package_id from xx_user_master a, xx_piu_master b, xx_projectattributes_master c, xx_packages_project d, (select package_Id, zone_id from xx_project_division_map group by package_id, zone_id) e where a.PIU_ID = b.PIU_Id and b.PIU_Name=c.PIU_of_RVNL and c.Project_ID = d.project_id and d.package_id = e.package_id and a.user_id="+userid11;
				PreparedStatement ps19 = conn.prepareStatement(sql9);
				ResultSet rs82 = ps19.executeQuery();
				String pack22 =null;
				String zone22 =null;
				//System.out.println("array="+pack22+"zone"+zone22+userid11);
				while (rs82.next()) {
					zone22 = rs82.getString(1);
					pack22 = rs82.getString(2);
					//System.out.println("array="+pack22+"zone"+zone22);
					packal3.add(pack22);
					zonal3.add(zone22);
				}
				
			for (int k = 0; k < zoneCheck.length; k++) {
	 				  
	 			 Statement stmt1 = conn.createStatement();
					ResultSet rs21 = stmt1.executeQuery("select Zone_Id from xx_zones_master where Zone_Name = '"+zoneCheck[k]+"' order by Zone_Name ");
					
					if (zones_assigned.equalsIgnoreCase("")) {
						zones_assigned=zoneCheck[k];
					} else { zones_assigned=zones_assigned+","+zoneCheck[k];}

					String zone1 = null;

					while (rs21.next()) {
						zone1 = rs21.getString(1);  
						zonal15.add(zone1);				
					}
					
					%>
					<sql:update dataSource="jdbc/MySQLDB" var="rs">
					   
					   Insert into xx_user_zone_mapping(User_Id,Zone_ID,Piu_Id) VALUES(<%=userid11%>,<%=zone1%>,<%=piu1 %>)
					</sql:update>
					
					<%	
			 }
			 Iterator<String> packitr3=packal3.iterator();
			 Iterator<String> zoneitr3=zonal3.iterator();
				String zone3=null;
				String pack3=null;
			while(zoneitr3.hasNext()){
				zone3=zoneitr3.next();	
				pack3=packitr3.next();
			if(zonal15.contains(zone3)){ } else {
				
			//System.out.println("delete="+pack3+"zone"+zone3);
				%>
				<sql:update dataSource="jdbc/MySQLDB" var="rs">
				   
				   Delete from xx_project_division_map where package_id=<%=pack3 %> and zone_id=<%=zone3 %>
				</sql:update>
				
				<%	
			}
			}
		
	if (prof_alert2.equalsIgnoreCase("On")) {
				// Mail code starts from here
				//System.out.println("today:"+Date1+"approval date:"+date);	
				System.out.println("old email:"+email_old+" old no:"+no_old);	
						 String result, cc1, cc2, id1, no2;
						    // Get recipient's email-ID, message & subject-line from index.html page
						    StringBuffer url =    request.getRequestURL();
							if (!email_old.equalsIgnoreCase(emails)) {
								cc1=email_old;
								cc2="<br> New Email Id: "+emails+"<br> Old Email Id: "+email_old;
							} else { 
								cc1=""; cc2="";
							}
							if (!no_old.equalsIgnoreCase(phones)) {
								no2="<br> New Contact No: "+phones+"<br> Old Contact No: "+no_old;
							} else { 
								no2="";
							}
							if (!username11.equalsIgnoreCase(test1)) {
								id1="<br> Old Uder Id: "+test1;
							} else {id1="";}
									
							String pageName1 = url.substring(0, url.lastIndexOf("/"))+"/admn_login.jsp";
						    final String to = emails;
						    final String subject = "RVNL Document Portal - Change in User details";
						    final String messg = "<div style='font-family:Georgia; font-size:16px; text-align:justify; line-height:150%;'>To <BR> <b>"+username11.toUpperCase()+"</b> <br><br> Your portal login details have been modifed as under;"
						     +"<br><BR> New User Id:  "+username11+id1+cc2+no2+"<br> Zones Assigned: "+zones_assigned+"<br> Login webpage: <a href=\" "+ pageName1+"\">"+pageName1+"</a> <br><br><br><span style='color:brown; font-size:20px; font-style:italic;'<b> RVNL Document Portal</b></span><br><br><span style='color:gray;  font-size:10px; font-style:italic;'>Note: This is a system generated email. Don't reply to system email address i.e. indiarvnl@gmail.com.</span></div>";
						    						
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
				//Construct data
				//contact number supervisor------contact_No_sup
				//contact number sender ------------- supcontact

				String usersms = "username=" + "indiarvnl@gmail.com";
				String hash = "&hash=" + "60b97ac840106a43c5a0e44fb778276d90330ece5e2da9ad534868c03137636d";
				//String apiKey = "apikey=" + "noVebn4XbP0-UFyeK1rRwkvCNdDw5ZXfVqrSNPndk2";
				String message = "&message=" + "Please check your email ("+emails+") for modified login details.\n\nRVNL Document Portal";
				String sender = "&sender=" + "RPDAMS";
				String numbers = "&numbers=" + ""+phones+","+no_old+"";

				//Send data
				HttpURLConnection connsms = (HttpURLConnection) new java.net.URL("http://api.textlocal.in/send in/?").openConnection();

				String data = usersms + hash + numbers + message + sender;
				//String data = apiKey + numbers + message + sender;
				connsms.setDoOutput(true);
				connsms.setRequestMethod("POST");
				connsms.setRequestProperty("Content-Length", Integer.toString(data.length()));
				connsms.getOutputStream().write(data.getBytes("UTF-8"));
				final BufferedReader rd = new BufferedReader(new InputStreamReader(connsms.getInputStream()));
				final StringBuffer stringBuffer = new StringBuffer();
				String line;
				while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
				}
				rd.close();
				System.out.println("Message sent successfully");
				//return stringBuffer.toString();
				} catch (Exception e) {
				System.out.println("Error SMS "+e);
				//return "Error "+e;
				}					   
				//sms code ends here
	}
	 		  
	 		  %>


 <div  style='vertical-align: baseline; padding: 10px; margin: 20px;'>
	 <div class="alert alert-success" align="center">
	 <strong>Success!</strong> local-Admin has been updated successfully.
	 <br>
	 <br>
	 <input class='btn btn-primary' value='OK'  onClick="refreshAndClose()" type='button'/>
	 </div>
</div> <br> <br>

	 		  
<%
		//	conn.close();
		}catch(Exception e){
			e.printStackTrace();
		} finally {
		    try { conn.close(); } catch (Exception e) { /* ignored */ }
		}
			
		}
		} // end of if of project stage
				
%>

				
		
	</c:if>	
		
	</div>
	<%@include file="included/Newfooter.jsp"%>

</body>
</html>