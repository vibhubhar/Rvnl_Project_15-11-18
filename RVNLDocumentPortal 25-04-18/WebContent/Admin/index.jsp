<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<title>Login</title>
<meta name="description" content="">
<meta name="author" content="">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="css/styles.css" rel="stylesheet">
<script type="text/javascript" src="js/scriptMin.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	
	<style type="text/css">
	.errors {
	background-color:#FFCCCC;
	border:1px solid #CC0000;
	width:400px;
	margin-bottom:8px;
}
	</style>

   <script>
   function isNullOrEmpty(param){
		if(param=="" || param==null){
			return true;
		}
		return false;
	}
   function changePassword() {
		var newPass = $("#newPassChange").val();
		var conPass = $("#conPassChange").val();
		var oldPass = $("#oldPassChange").val();
		if(isNullOrEmpty(oldPass)){
			showMessage("Please Enter Old Password.");
			return false;
		}
		if(isNullOrEmpty(newPass)){
			showMessage("Please Enter New Password.");
			return false;
		}
		if(isNullOrEmpty(conPass)){
			showMessage("Please Enter Confirm Password.");
			return false;
		}
		if (newPass == conPass) {
			
			$("#resetPass").submit();
		} else {
			showMessage("Confirm Password does not match!");
			
		}

	}
   
   $(document).ready(function(){
	   var message = $(":input[name='message']").val();
	   showMessage(message);
		
	 //  var message=$(".error").html();
	 if(message=='APP0008: The password shall be reset.'){
		 $("#reset").removeClass('hide').addClass('show').show();
		 $("#resetClick").addClass('active').show();
		 
		 $("#loginClick").removeClass('active');
		 $("#login").removeClass('show').addClass('hide').hide();
		 
	 }
	 if(message=='APP0009: The password has expired. Please reset the password.'){
		 $("#reset").removeClass('hide').addClass('show').show();
		 $("#resetClick").addClass('active').show();
		 
		 $("#loginClick").removeClass('active');
		 $("#login").removeClass('show').addClass('hide').hide();
		 
	 }
	   var SHOW_CLASS = 'show',
	      HIDE_CLASS = 'hide',
	      ACTIVE_CLASS = 'active';
	  
	  $( '.tabs' ).on( 'click', 'li a', function(e){
	    e.preventDefault();
	    var $tab = $( this ),
	         href = $tab.attr( 'href' );
	  
	     $( '.active' ).removeClass( ACTIVE_CLASS );
	     $tab.addClass( ACTIVE_CLASS );
	  
	     $( '.show' )
	        .removeClass( SHOW_CLASS )
	        .addClass( HIDE_CLASS )
	        .hide();
	    
	      $(href)
	        .removeClass( HIDE_CLASS )
	        .addClass( SHOW_CLASS )
	        .hide()
	        .fadeIn( 550 );
	  }); 
	  $('#pass').keypress(function(e){
	       if(e.keyCode==13)
	    	   loginRealApp();
	    });
	    $('#name').keypress(function(e){
		       if(e.keyCode==13)
		    	   loginRealApp();
		    });
	    $(document).keypress(function(e) {
    	  if(e.which == 13) {
    		  loginRealApp();
    	  }
    	});
	});


	function loginRealApp() {
		  var flag=true;
		  if(isNullOrEmpty($('#name').val())){
			  	showMessage("Please Enter User Name.");
				flag=false;
				return false;
				}
		  
		  if(isNullOrEmpty($('#pass').val())){
				showMessage("Please Enter Password.");
				flag=false;
				return false;
			}
		  if(flag){
		 	 $("#loginIndex").submit();
		  }
	 }
	
	function showMessage(message) {
		if (!isNullOrEmpty(message)) {
			if (message == "APP0013: Transaction completed.") {
				$("#messageIndex").html(message).removeClass("error").addClass(
						"success");
				$("#messageIndex").show();
			}else if (message == "Session Expires") {
				checkSessionExpires('NO');
			} else {
				$("#messageIndex").html(message).removeClass("success").addClass(
						"error");
				$("#messageIndex").show();
			}
			$('html, body').animate({ scrollTop: 0 }, 'slow');
			
		} else {
			$("#messageId").hide();
		}
		// to scroll html body to top //
		

	}
   
   
   
   </script>

<style type="text/css">
.info, .success, .warning, .error, .validation {
border: 1px solid;
margin: 10px 0px;
padding:15px 10px 15px 50px;
background-repeat: no-repeat;
background-position: 10px center;
}

.success {
color: #4F8A10;
background-color: #DFF2BF;
background-image:url('images/success.png');
background-size: 31px 31px;
background-repeat: no-repeat;
}

.error {
color: #D8000C;
background-color: #FFBABA;
background-image: url('images/error.png');
background-size: 31px 31px;
background-repeat: no-repeat;
}
</style>
    <!--API call-->

</head>
<body>
	
	<div id="loginform">
	 <s:if test="hasActionMessages()">
		<s:iterator value="actionMessages">
			<input type="hidden" name="message"  value="<s:property/>" >
		</s:iterator>
	</s:if>
	
	<s:if test="hasActionErrors()">
	  <s:iterator value="actionErrors">
			<input type="hidden" name="message"  value="<s:property/>" >
		</s:iterator>
	</s:if>
	<div class="error" style="display: none;" id="messageIndex"></div>
	
	<div id="facebook" style="margin-top: 124px;"><i class="fa fa-facebook"></i>
		<div id="connect" style=" margin-top: 56px; ">
			<img src="img/CnS_logo.jpg" width="254px"/>
		</div>
	</div>

<%-- <s:if test="hasActionErrors()"> --%>
<!--    <div class="errors"> -->
<%--       <s:actionerror/> --%>
<!--    </div> -->
<%-- </s:if> --%>
	
	<div id="mainlogin" class="container">

        <div class="flat-form" >
            <ul class="tabs" style="margin-top: 113px;background: rgb(27, 98, 158);">
                <li>
                    <a href="#login" class="active" id="loginClick">Login</a>
                </li>
<!--                 <li> -->
<!--                     <a href="#register" >Register</a> -->
<!--                 </li> -->
                <li>
                    <a href="#reset" id="resetClick" style="display: none;">Reset Password</a>
                </li>
            </ul>
            <div id="login" class="form-action show" >
                <h1 style="font-size: 34px;margin-top: 32px;">Login to C&S Electric</h1>
                <p style="  font-weight: 600;margin-top: 18px;">
                     To login use your user ID and password.
                </p>
                 <form action="login"  id="loginIndex" method="post">
                <s:token /> 
                   <ul>		
                        <li><input type="hidden" name="loginVal" value="login">
                            <input type="text" id="name" name="name" placeholder="Username" style="font-size: larger;font-weight: 600;background-color: #E4E3E3;" />
                        </li>
                        <li>
                            <input type="password" id="pass" name="pass" placeholder="Password" style="font-size: larger;font-weight: 600;background-color: #E4E3E3;"/>
                        </li>
                        <li>
                        	
                            <input type="button" onclick="loginRealApp();" value="Login" class="button" />
                        </li>
                    </ul>
                </form>
            </div>

            <!--/#reset.form-action-->
            <div id="reset" class="form-action hide">
                <h1>Reset Password</h1>
                
                <form action="resetPass" method="post" id="resetPass">
                <input type="hidden" name="userId" value="<s:property value="userSessnId"/>"/>
                    <ul  style="list-style: none;padding-left: 0px;">
                    <li>
                            <input type="password" id="oldPassChange" name="oldPassword" placeholder="Old Password" color="#1B263F" style="font-size: larger;font-weight: 600;"/>
                        </li>
                        <li>
                            <input type="password" id="newPassChange" name="password" placeholder="New Password" color="#1B263F" style="font-size: larger;font-weight: 600;"/>
                        </li>
                        <li>
                            <input type="password" id="conPassChange" placeholder="Confirm Password" style="font-size: larger;font-weight: 600;"/>
                        </li>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
                        <li>
                            <input type="button" value="Update" class="button" onclick="changePassword();"/>
                        </li>
                    </ul>
                </form>
            </div>
            <!--/#reset.form-action-->
        </div>
    </div>
   </div>
  
<!-- <script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>    -->
</body>
</html>



