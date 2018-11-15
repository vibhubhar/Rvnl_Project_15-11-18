function isEmpty(str) {
				if (str == null || str == "" || str == "-- Select Role --"  || str =="-- Select Department --" || str =="-- Select Designation --" || str == "-- Select Type --" || str == "none" || str =="-- Select PIU --" || str == "-1")
				return true;
				return false;
}


function isChangePiu(str) {
	
	if (str == null || str == "" || str == "-- Select PIU --" || str == "none"){
	return false;
	}
	return true; 
}
function isChangedept(str) {
	
	if (str == null || str == "" ||  str == "none" || str == "-1"){
	return false;
	}
	return true; 
}
function isChangeZone(str) {
	
	if (str == null || str == "" ||  str == "none"){
	return false;
	}
	return true; 
}

function isChangeType(str) {
	
	if (str == null || str == "" ||  str == "none"){
	return false;
	}
	return true; 
}



function modifyuser() {			
	var ans="0";
	var type1 = document.getElementById("Type").value;
	var err = document.getElementById("exist");
	var username = document.getElementById("user_name").value;	
	if (type1!="Others") {
    var officers = document.getElementById("officer_name").value;					
	var emails = document.getElementById("email_id").value;					
	var phones = document.getElementById("contact_no").value;
	var error0 = document.getElementById("error0").innerHTML;
	var error3 = document.getElementById("error3").innerHTML;
	if (isEmpty(username) || isEmpty(officers) || isEmpty(emails) || isEmpty(phones) ) {
		ans="1";
	}
	if (!isEmpty(err) || !isEmpty(error0) || !isEmpty(error3)){
		ans="2";
	}
	} else  {
		if (isEmpty(username)) {
			ans="1";
		}
		if (!isEmpty(err)){
			ans="2";
		}
	}
	
		
	
	 
		 if (ans=="1" ) {
			 //alert("Password"+pwds+"officers"+officers+"emails"+emails+"phones"+phones);
			 
			 jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Please Fill Complete Data",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
               return false;
			}  else if (ans=="1"){
				 jQuery.noConflict();
					
				 var dialogid="#dialogid24";
				 
				 $(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title: "Duplicat/Incorrect entry........",
			        width: 400,
			        height: 200
			    });
				 
				  $(dialogid).dialog('open');
	               return false;
			
		} 

	 else {		
			document.getElementById("Form20").submit();	
			return true;
		  }	

}



function modifylocaluser() {			

	var username = document.getElementById("User_name1").value;					
    var officers = document.getElementById("Officer_Name").value;					
	var emails = document.getElementById("Email").value;					
	var phones = document.getElementById("Phone_Number").value;
	var err1 = document.getElementById("exist");
	var error4 = document.getElementById("error4").innerHTML;
	var error5 = document.getElementById("error5").innerHTML;

	var Department1 =document.getElementById("departme");
	//alert("inside no "+Department1);
	var Department = Department1.options[ Department1.selectedIndex ].value;
	var pius =document.getElementById("PIU_Id");
	var cbResults1 = "";	
	var cbResults = "";
	 var x = document.getElementsByName("Zone_id").length;
	 
	 for (var i = 0; i < x; i++ ) {
		 if (document.getElementsByName("Zone_id")[i].checked == true) {
			 cbResults += document.getElementsByName("Zone_id")[i].value;		
			//alert(cbResults);
		 }
	 }
	 
		 if (isEmpty(username) || isEmpty(officers) || isEmpty(emails) || isEmpty(phones) || isEmpty(Department1) || isEmpty(cbResults) ) {
			 //alert("Password"+pwds+"officers"+officers+"emails"+emails+"phones"+phones);
				 
			 jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Please Fill Complete Data",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
               return false;
			}  else if (!isEmpty(err1) || !isEmpty(error4) || !isEmpty(error5)){
				 jQuery.noConflict();
				 var dialogid="#dialogid24";
				 
				 $(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title: "Duplicat/Incorrect entry........",
			        width: 400,
			        height: 200
			    });
				 
				  $(dialogid).dialog('open');
	               return false;
			
		} 

	 else {	 
		 document.loginForm11.Zone_id.value=cbResults;
		 document.loginForm11.Depatment.value=Department;
		 document.loginForm11.Project_stage.value = "fourth";
		 document.getElementById("loginForm11").submit();	
			return true;
		  }	

}



function validateUser11() {			
	
	var rad = document.loginForm11.myRadios;	
	var prev = null;
	for(var i = 0; i < rad.length; i++) {
	    rad[i].onclick = function() {
	        (prev)? console.log(prev.value):null;
	        if(this !== prev) {
	            prev = this;	         
	        }	      
	    };
	}
	var CheckedRadio = null;
	if (document.getElementById('User').checked) {
		CheckedRadio = document.getElementById('User').value;
		
		}
	if(document.getElementById('User1').checked) {
		CheckedRadio = document.getElementById('User1').value;
		//alert(CheckedRadio);	
	}
	if(CheckedRadio==1) {
	//alert("sajhgjas"+CheckedRadio);
	var user_name = document.getElementById("user_name").value;					
    var password = document.getElementById("password").value;	
    var Type1 =document.getElementById("Type");
	var Type = Type1.options[ Type1.selectedIndex ].value;
	var officer_name = document.getElementById("officer_name").value;					
	var email_id = document.getElementById("email_id").value;					
	var contact_no = document.getElementById("contact_no").value;
	var Division1 =document.getElementById("division");
	var err = document.getElementById("exist");
	var err25 = document.getElementById("err25").innerHTML;
	var error0 = document.getElementById("error0").innerHTML;
	var error1 = document.getElementById("error1").innerHTML;
	var error3 = document.getElementById("error3").innerHTML;
	// alert("error="+isEmpty(err)+", err25="+isEmpty(err25)+", erro0="+isEmpty(error0)+", error1="+isEmpty(error1)+", error3="+isEmpty(error3));
	if(isNaN(contact_no)){
 		alert("Please enter numeric value for Contact No !!")
 		return false;
	}
	
	
	//var exist = document.getElementById("exist");					
	//if(exist==null){
		
		// exist = document.getElementById("exist").value;
	//}					
		
					if ( Type =="RVNL") {
					
						var PIU1 =document.getElementById("PIU_name");
						var Role1 =document.getElementById("Role");
						var Role = Role1.options[ Role1.selectedIndex ].value;
						var PIU = PIU1.options[ PIU1.selectedIndex ].value;	
						//alert("role="+Role);
						var Dept_RVNL1;var Dept_RVNL;var Desgn_RVNL1;
						var Desgn_RVNL;
						
						var Department1 =document.getElementById("Department_RVNL2");
						var Department = Department1.options[ Department1.selectedIndex ].value;					 
						var Designation1 =document.getElementById("designation_RVNL2");
						var Designation = Designation1.options[ Designation1.selectedIndex ].value;	
					
 						 if (isEmpty(user_name) || isEmpty(password) || isEmpty(Type) || isEmpty(PIU) || isEmpty(Department1) || isEmpty(Designation1) || isEmpty(Role) || isEmpty(contact_no) || isEmpty(email_id) || isEmpty(officer_name)) {
														
							
						 jQuery.noConflict();
								
							 var dialogid="#dialogid";
							 
							 $(dialogid).dialog({
						        modal: true,
						        autoOpen: false,
						        title: "Please Fill Complete Data",
						        width: 400,
						        height: 200
						    });
							 
							  $(dialogid).dialog('open');
				               return false;
 						 } else if (!isEmpty(err) || !isEmpty(error0) || !isEmpty(error1) || !isEmpty(error3)){
 							 jQuery.noConflict();
								
							 var dialogid="#dialogid24";
							 
							 $(dialogid).dialog({
						        modal: true,
						        autoOpen: false,
						        title: "Duplicat/Incorrect entry........",
						        width: 400,
						        height: 200
						    });
							 
							  $(dialogid).dialog('open');
				               return false;
 						
 						  }  
						    else {		
							 
							 document.loginForm11.Project_stage.value = "first";
								document.getElementById("loginForm11").submit();							
								return true;
							 }											
					} else 	if ( Type =="MOR") {
						//var Role1 =document.getElementById("Role");
						//var Role = Role1.options[ Role1.selectedIndex ].value;	
						
						
						var Zone1 =document.getElementById("Zone");
						var Zone = Zone1.options[ Zone1.selectedIndex ].value;						
						var Division1,Division;
						if(Zone!="Railway Board"){
						if (isChangeZone(Zone)){								
							var Division1 =document.getElementById("division");
							var Division = Division1.options[ Division1.selectedIndex ].value;	
                           }else{                      	   
                        	 var Division1 =document.getElementById("division1");
   							 var Division = Division1.options[ Division1.selectedIndex ].value;	
                                 }		
						}
				
						var Department1 =document.getElementById("Department_RVNL1");
						var Department = Department1.options[ Department1.selectedIndex ].value;					 
						var Designation1 =document.getElementById("designation_RVNL1");
						var Designation = Designation1.options[ Designation1.selectedIndex ].value;		
																				
						if (isEmpty(user_name) || isEmpty(password) 
								|| isEmpty(Type) || isEmpty(Zone) || 
								 isEmpty(Department) || isEmpty(Designation) || isEmpty(contact_no) || isEmpty(email_id) || isEmpty(officer_name)) {   
							//alert("jhfj"+Division);//
							 jQuery.noConflict();
							
							 var dialogid="#dialogid";
							 
							 $(dialogid).dialog({
						        modal: true,
						        autoOpen: false,
						        title: "Please Fill Complete Data",
						        width: 400,
						        height: 200
						    });
							 
							  $(dialogid).dialog('open');
				               return false;
						 } else if (!isEmpty(err) || !isEmpty(error0) || !isEmpty(error1) || !isEmpty(error3)){
 							 jQuery.noConflict();
								
							 var dialogid="#dialogid24";
							 
							 $(dialogid).dialog({
						        modal: true,
						        autoOpen: false,
						        title: "Duplicat/Incorrect entry........",
						        width: 400,
						        height: 200
						    });
							 
							  $(dialogid).dialog('open');
				               return false;
 					
						}
						 else {										 
							 document.loginForm11.Project_stage.value = "first";
							  document.getElementById("loginForm11").submit();							
								return true;
							  }													
					     } else if ( Type =="Others") {
					 		  	 var Org1 =document.getElementById("Org_name");
								var Org = Org1.options[ Org1.selectedIndex ].value;					 
								
							if (isEmpty(user_name) || isEmpty(Org)) {   
								 jQuery.noConflict();
								
								 var dialogid="#dialogid";
								 
								 $(dialogid).dialog({
							        modal: true,
							        autoOpen: false,
							        title: "Please Fill Complete Data",
							        width: 400,
							        height: 200
							    });
								 
								  $(dialogid).dialog('open');
					               return false;
					               
							 } else if (!isEmpty(err) || !isEmpty(err25)){
	 							 jQuery.noConflict();
									
								 var dialogid="#dialogid24";
								 
								 $(dialogid).dialog({
							        modal: true,
							        autoOpen: false,
							        title: "Duplicat/Incorrect entry........",
							        width: 400,
							        height: 200
							    });
								 
								  $(dialogid).dialog('open');
					               return false;
	 						
	 						
							}
							 else {							 			 
								 document.loginForm11.Project_stage.value = "first";
								  document.getElementById("loginForm11").submit();							
									return true;
								  }	
					     }
	}else if(CheckedRadio==3){ // Create ED
		
		var user = document.getElementById("ED_user_name").value;					
	    var pass = document.getElementById("ED_password").value;	
	    var desg1 =document.getElementById("ED_Designation");
		var desg = desg1.options[ desg1.selectedIndex ].value;	
		
		 var cbResults = "";	
		 var x = document.getElementsByName("ED_PIU").length;
		 for (var i = 0; i < x; i++ ) {
			 if (document.getElementsByName("ED_PIU")[i].checked == true) {
				 cbResults += document.getElementsByName("ED_PIU")[i].value;					 
			 }
			 }	 
		
		 if (isEmpty(user) || isEmpty(pass) 
					|| isEmpty(desg) || isEmpty(cbResults)) {
				alert("Please fill all the details !!")						
				return false;
			}
			 else {										 
				 document.loginForm11.Project_stage.value = "third";
					document.getElementById("loginForm11").submit();							
					return true;
				  }	
		 
}else if(CheckedRadio==2){
	
	var username = document.getElementById("User_name1").value;					
    var pwds = document.getElementById("Password").value;
   //alert("Password"+pwds); 
    var officers = document.getElementById("Officer_Name").value;					
	var emails = document.getElementById("Email").value;					
	var phones = document.getElementById("Phone_Number").value;
	
	var Department1 =document.getElementById("departme");
	//alert("inside no "+Department1);
	var Department = Department1.options[ Department1.selectedIndex ].value;
	var pius =document.getElementById("PIU_Id");
	var cbResults1 = "";	
	 var x = document.getElementsByName("Zone_id").length;
	 
	 for (var i = 0; i < x; i++ ) {
		 if (document.getElementsByName("Zone_id")[i].checked == true) {
			 cbResults += document.getElementsByName("Zone_id")[i].value;		
			 //alert("diaplaying checkbox data----"+cbResults);
		 }
	 }
	 	var err = document.getElementById("piu111").innerText;
		var err1 = document.getElementById("exist");
		var error4 = document.getElementById("error4").innerHTML;
		var error5 = document.getElementById("error5").innerHTML;
		var error6 = document.getElementById("error6").innerHTML;
		 //alert("error="+isEmpty(err)+", erro4="+isEmpty(error4)+", error5="+isEmpty(error5)+", error6="+isEmpty(error6));
		
	 //alert("diaplaying checkbox data----"+cbResults);
		 if (isEmpty(username) || isEmpty(pwds) || isEmpty(officers) || isEmpty(emails) || isEmpty(phones) || isEmpty(Department1) || isEmpty(cbResults) ) {
			 //alert("Password"+pwds+"officers"+officers+"emails"+emails+"phones"+phones);
			 
			 jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Please Fill Complete Data",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
               return false;
		 } else if (!isEmpty(err) || !isEmpty(err1) || !isEmpty(error4) || !isEmpty(error5) || !isEmpty(error6)){
				 jQuery.noConflict();
				
			 var dialogid="#dialogid24";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Duplicat/Incorrect entry........",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
               return false;
		
	} 
	 else {		
		 document.loginForm11.Zone_id.value=cbResults;
		 document.loginForm11.Depatment.value=Department;
		 document.loginForm11.Project_stage.value = "fourth";
			document.getElementById("loginForm11").submit();	
			return true;
		  }	

}
}
function validateDept() {	
	var Type1 =document.getElementById("Type");
	var Type = Type1.options[ Type1.selectedIndex ].value;	
						
	if ( Type =="RVNL") {
		var PIU1 =document.getElementById("PIU_name");
		var PIU = PIU1.options[ PIU1.selectedIndex ].value;
		var dept = document.getElementById("Department_Name").value;	
		
		if (isEmpty(dept) || isEmpty(PIU) || isEmpty(Type)) {
			alert("Please fill all the details !!")
			return false;
			}

			else {
			document.getElementById("dept_form").submit();
			return true;

			}	
	}
	else {
		var dept = document.getElementById("Department_Name").value;
		if (isEmpty(dept) || isEmpty(Type)) {
			alert("Please fill all the details !!")
			return false;
			}
			else {
			document.getElementById("dept_form").submit();
			return true;
			}	
	     } 	
    }



function validateDivision() {			
	var divison = document.getElementById("Division_name").value;					
	var zone1 =document.getElementById("Zone_name");
	var zone = zone1.options[ zone1.selectedIndex ].value;
	
	if (isEmpty(divison) || isEmpty(zone)) {
		alert("Please fill all the details !!")
		return false;
		}

		else {
		document.getElementById("Create_Division").submit();
		return true;

		}					 
	 			 					 					
    }

function validateDocType() {			
	var doctype = document.getElementById("Document_Type").value;	
	if (isEmpty(doctype)) {
		alert("Please fill all the details !!")
		return false;
		}

		else {
			//document.Create_DocumentType.identification.value = "first";
		document.getElementById("Create_DocumentType").submit();
		return true;
		}		
}

function validateProjType() {			
	var projtype = document.getElementById("Project_Type").value;	
	if (isEmpty(projtype)) {
		alert("Please fill all the details !!")
		return false;
		}

		else {
			
		document.getElementById("Create_ProjectType").submit();
		return true;
		}	

}

function validateZone() {			
	var zone = document.getElementById("Zone_name").value;
	if (isEmpty(zone)) {
		alert("Please fill all the details !!")
		return false;
		}

		else {
		document.getElementById("CreateZone").submit();
		return true;
		}	
}

function validateUser() {			
	var user = document.getElementById("user_name").value;
	
    var pwd = document.getElementById("password").value;
	

        if (isEmpty(user)||isEmpty(pwd)) {
		alert("Please fill all the details !!")
		return false;
		}

		else {
		document.getElementById("loginPage").submit();
		return true;
		}

}


function validateUser1() {			
	//var user = document.getElementById("user_name").value;
	
    var pwd = document.getElementById("password").value;
    var pwd1 = document.getElementById("password1").value;
    var pwd2 = document.getElementById("password2").value;
	
    
        if (isEmpty(pwd) || isEmpty(pwd1) || isEmpty(pwd2)) {
        	jQuery.noConflict();
        	
 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			return false;
	
		}

		else {
			//alert("password getting Updated !Please Login Again");
		document.getElementById("loginPage").submit();
		
		return true;
		
		}

}






function validatePIU() {			
	
	var piu = document.getElementById("PIU").value;
	
	if (isEmpty(piu)) {
		alert("Please fill all the details !!")
		return false;
		}

		else {
		document.getElementById("Create_PIU").submit();
		return true;
		}	
}

function validateDesignation() {			
	
	var Type1 =document.getElementById("Type");
	var Type = Type1.options[ Type1.selectedIndex ].value;		
	var desg = document.getElementById("Designation").value;
	
	if (isEmpty(desg) || isEmpty(Type) ) {
		alert("Please fill all the details !!")
		return false;
		}
		else {
		document.getElementById("Create_designation").submit();
		return true;
		}	
}

function validateInsertion() {
	var dbType = document.getElementById("ItemType").value;
	if(dbType=="zone") {
		var zone1 = document.getElementById("zoneName").value;
		var zone = encodeURIComponent(zone1);
		if(isEmpty(zone)){

			 jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			return false;
		}
		else{			
			document.getElementById("insertion").submit();
			
			var url="Updatechange.jsp?zoneName="+zone;
			window.open(url,this.target, 
				       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		
			//window.location.href='Update.jsp'
		}
	}
	else if(dbType=="division"){
		var d_zone1 =document.getElementById("D_Zone");
		var d_zone = d_zone1.options[ d_zone1.selectedIndex ].value;		
		var division1 = document.getElementById("divisionName").value;
		var division = encodeURIComponent(division1);
		if(isEmpty(d_zone)||isEmpty(division)){

			 //var j=jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			return false;
		}
		else{			
			document.getElementById("insertion").submit();
			var url="Updatechange.jsp?division="+division;
			window.open(url,this.target, 
				       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		}
	}
	else if(dbType=="Others"){		
		var org1 = document.getElementById("Org").value;
		var org = encodeURIComponent(org1);
		if(isEmpty(org)){

			 //var j=jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			return false;
		}
		else{			
			document.getElementById("insertion").submit();
			var url="Updatechange.jsp?Org="+org;
			window.open(url,this.target, 
				       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		}
	} else if(dbType=="piu"){		
		var piu1 = document.getElementById("piu").value;
		var piu = encodeURIComponent(piu1);
		if(isEmpty(piu)){

			 //var j=jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			return false;
		}
		else{			
			document.getElementById("insertion").submit();
			var url="Updatechange.jsp?piu="+piu;
			window.open(url,this.target, 
				       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		}

	}else if(dbType=="Documents"){		
		//alert("hhhh");
		var documents1 = document.getElementById("Documents").value;
		var documents = encodeURIComponent(documents1);
		var loctype1 =document.getElementById("loctype1");
		var loctype = loctype1.options[ loctype1.selectedIndex ].value;	
		if(isEmpty(documents) || isEmpty(loctype)){


			 //var j=jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			return false;
		}
		else{			
			document.getElementById("insertion").submit();
			var url="Updatechange.jsp?documents="+documents;
			window.open(url,this.target, 
				       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		}
	}else if(dbType=="Projects"){		
		var projects1 = document.getElementById("Projects").value;
		var projects = encodeURIComponent(projects1);
		if(isEmpty(projects)){

			 //var j=jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			return false;
		}
		else{			
			document.getElementById("insertion").submit();
		
			var url="Updatechange.jsp?Projects="+projects;
			window.open(url,this.target, 
				       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		}
	}
	else if(dbType=="Departments"){
		var type1 =document.getElementById("dType");
		var type = type1.options[ type1.selectedIndex ].value;		
		var dept1 = document.getElementById("department").value;
		var dept = encodeURIComponent(dept1);
		if(isEmpty(type)||isEmpty(dept)){


			 //var j=jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			return false;
		}
		else{			
			document.getElementById("insertion").submit();
			var url="Updatechange.jsp?dept="+dept;
			window.open(url,this.target, 
				       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		}
	}
	else if(dbType=="Designations"){
		var type1 =document.getElementById("dTypes");
		var type = type1.options[ type1.selectedIndex ].value;		
		var desg1 = document.getElementById("designations").value;
		var desg = encodeURIComponent(desg1);
		var dept =document.getElementById("department");
		var department =dept.options[ dept.selectedIndex ].value;
		
		if(isEmpty(type)||isEmpty(department) || isEmpty(desg) || dept==null){

			 //var j=jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			return false;
		}
		else{			
			document.getElementById("insertion").submit();
			var url="Updatechange.jsp?desg="+desg;
			window.open(url,this.target, 
				       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			
			return true;
		}
	}
}

function validateModification() {
	
	var dbType = document.getElementById("Item_Type").value;
		
	if(dbType=="zone") {
		var zone = document.getElementById("zoneName1").value;
		
		if(isEmpty(zone)){
			 jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			$(function(){
				$(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			});
			return false;
		}
		else{		
			document.modification.stage.value="first";
			document.getElementById("modification").submit();
//			window.opener.location.reload(true);
//	        window.close();
			//var url="Updatechange.jsp?zone="+zone;
			//window.open(url,this.target, 
				//       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
		
			
			
			return true;
			
		}
	}
	if(dbType=="division") {
		var division = document.getElementById("divisionName1").value;
		if(isEmpty(division)){
			 
				
			 var dialogid="#dialogid";
			 
			$(function(){
				$(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			});
			return false;
		}
		else{
			
			document.modification.stage.value="first";
			document.getElementById("modification").submit();
		//	window.opener.location.reload(true);
	      //  window.close();
			//var url="Updatechange.jsp?division1="+division;
		//	window.open(url,this.target, 
			//	       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		}
	} if(dbType=="Others") {
		var org = document.getElementById("Org_Name1").value;
		if(isEmpty(org)){
			
				
			 var dialogid="#dialogid";
			 
			$(function(){
				$(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			});
			return false;
		}
		else{			
			document.modification.stage.value="first";
			document.getElementById("modification").submit();
			
			return true;
		}
	} if(dbType=="piu") {
			var piu = document.getElementById("PIU_Name1").value;
			if(isEmpty(piu)){
				
					
				 var dialogid="#dialogid";
				 
				$(function(){
					$(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title: "Alert",
			        width: 400,
			        height: 200
			    });
				 
				  $(dialogid).dialog('open');
				});
				return false;
			}
			else{			
				document.modification.stage.value="first";
				document.getElementById("modification").submit();
				return true;
				}

	}if(dbType=="Documents") {
		var documents = document.getElementById("Document_Type1").value;
		if(isEmpty(documents)){
			 
				
			 var dialogid="#dialogid";
			 
			$(function(){
				$(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			});
			return false;
		}
		else{		
			document.modification.stage.value="first";
			document.getElementById("modification").submit();
			//window.opener.location.reload(true);
	        //window.close();
			//var url="Updatechange.jsp?documents1="+documents;
			//window.open(url,this.target, 
			//	       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		}
	}if(dbType=="Projects") {
		var projects = document.getElementById("Project_type1").value;
		if(isEmpty(projects)){
			
				
			 var dialogid="#dialogid";
			 
			$(function(){
				$(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			});
			return false;
		}
		else{			
			document.modification.stage.value="first";
			document.getElementById("modification").submit();
			//window.opener.location.reload(true);
	        //window.close();
			//var url="Updatechange.jsp?projects1="+projects;
			//window.open(url,this.target, 
				//       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		}
	}
	if(dbType=="Departments") {
		var dept = document.getElementById("depName1").value;
		if(isEmpty(dept)){
			
				
			 var dialogid="#dialogid";
			 
			$(function(){
				$(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			});
			return false;
		}
		else{			
			document.modification.stage.value="first";
			document.getElementById("modification").submit();
			//window.opener.location.reload(true);
	        //window.close();
			//var url="Updatechange.jsp?dept1="+dept;
			//window.open(url,this.target, 
				//       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		}
	}
	if(dbType=="Designations") {
		
		var desg = document.getElementById("desigName1").value;
		//var type = type1.options[ type1.selectedIndex ].value;		
		var dept = document.getElementById("depnamenew").value;
		
		
		if(isEmpty(desg) || isEmpty(dept)){
			
				
			 var dialogid="#dialogid";
			 
			$(function(){
				$(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			});
			return false;
		}
		else{			
			document.modification.stage.value="first";
			document.getElementById("modification").submit();
			//window.opener.location.reload(true);
	        //window.close();
			//var url="Updatechange.jsp?desg1="+desg;
		//	window.open(url,this.target, 
			//	       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
			
			//alert('Data Filled');
			
			return true;
		}
	}
}



var xmlHttp;
function getdept(type1){
	var type = encodeURIComponent(type1);
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Dept_on_master.jsp";
	
	url += "?dtype=" + type;
	xmlHttp.onreadystatechange = docChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);	
	
	
}

function docChange() {
	
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("Desgdiv").innerHTML = xmlHttp.responseText
	}
}



function validateProject(){
	alert("asdads");
	var userid=document.getElementById("userId").value;
	var Project_names=document.getElementById("Project_name");
	var pack=document.getElementById("packages1");
	//alert(pack);
	var pack_nam = pack.options[ pack.selectedIndex ].value;	
	//alert("pack_name"+pack_nam);
	var Project_name = Project_names.options[ Project_names.selectedIndex ].value;	
	if(Project_name=="none" || Project_name=="" || Project_name=="null" ||pack_nam=="none" || pack_nam=="" || pack_nam=="null" )
		{
		
		 jQuery.noConflict();
			
			 var dialogid="#dialogid";
			 
			$(function(){
				$(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
			});
		}
	else{
	
	document.Add_Project.userid_1.value=userid;
	document.Add_Project.projectid.value=Project_name;
	document.getElementById("Add_Project").submit();
}
}

var xmlHttp2;

function showpakage(projectid) {
	
	
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp2 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp2 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
		var url = "Package_project_in.jsp?project_id="+projectid;

	
	xmlHttp2.onreadystatechange = ProjectChange;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
		
	}

	function ProjectChange() {
		
		
		
		if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
			document.getElementById("package").innerHTML = xmlHttp2.responseText
		}
	}


	function showpakages(projectid) {
		
		
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp2 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp2 == null) {
			alert("Browser does not support XMLHTTP Request")
			return;
		}
			var url = "Project_Package_Document.jsp?project_id="+projectid;

		
		xmlHttp2.onreadystatechange = ProjectChange;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);
			
		}

		function ProjectChange() {
			
			
			
			if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
				document.getElementById("package").innerHTML = xmlHttp2.responseText
			}
		}
function showUser(docid){
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp2 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp2 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	
	var project_ids = document.getElementById("Project_name");
	var projectids = project_ids.options[ project_ids.selectedIndex ].value;
	
		var url = "documentLists.jsp?document_type="+docid+"&projectid="+projectids;

	
	xmlHttp2.onreadystatechange = DocumentChange;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);

}

function DocumentChange() {
	
	
	
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById("hierarchyList").innerHTML = xmlHttp2.responseText
	
}}

	var xmlHttp2;
	
	
function forwardUser(variable1){
	
	var project_ids = document.getElementById("Project_name");
	var projectids = project_ids.options[ project_ids.selectedIndex ].value;	
	var docid = document.getElementById("documentName");	
	var documentids = docid.options[ docid.selectedIndex ].value;	
	//var hiertyp = document.getElementById("hierarchy_typ").value;
	
//	var CheckedRadio = document.Add_User.userRadio.value;
//	alert(CheckedRadio);
//	
	document.Add_User.project_ids.value=projectids;
	document.Add_User.docid.value=documentids;
	//document.Add_User.hiertyp.value=hiertyp;
	//document.Add_User.level.value=CheckedRadio;
    document.getElementById("Add_User").submit();

}



function FinalApproval(document_id,user_id){
//	alert(document_id);
	
	//var r = confirm("Are you sure you want to finally approve");
	//if (r == true) {
	var $j=jQuery.noConflict();
	
	 var dialogid="#dialogid"+document_id;
	 
	 $j(dialogid).dialog({
        modal: true,
        autoOpen: false,
        title: "Document Confirmation",
        width: 400,
        height: 200
    });
	 
	  $j(dialogid).dialog('open');
	  
	  
	
	
}
function finalapproval2nd(document_id,user_id)
{
	
	var $j=jQuery.noConflict();
	var dialogid="#dialogid"+document_id;
	 $j(dialogid).dialog('close');
	var dateid="ApprovalDate"+document_id;
	var Approvaldate = document.getElementById(dateid).value;
	//alert(Approvaldate);
	if(Approvaldate!=""){
		document.final_approve.stage.value="first";
		document.final_approve.doc_id.value=document_id;
		document.final_approve.user_id.value=user_id;
		//alert(user_id);
		document.final_approve.approvaldate.value=Approvaldate;
		document.getElementById("final_approve").submit();
		/*var url="finalforward.jsp?document_id="+document_id;
		window.open(url,this.target, 
			       'width=400,height=400,scrollbars=yes,top=50px,left=500px');
		*/
		//alert('Data Filled');
		
		
	}else{
		
		var dialogid="#dapprovaldate";
		 
		 $j(dialogid).dialog({
	        modal: true,
	        autoOpen: false,
	        title: "Document Confirmation",
	        width: 400,
	        height: 200
	    });
		 
		  $j(dialogid).dialog('open');
		
		
		//
		
		
	}
	 
//	document.final_approve.stage.value="first";
//	document.final_approve.doc_id.value=document_id;
//	document.final_approve.user_id.value=user_id;
//	//alert(user_id);
//
//	
//	document.getElementById("final_approve").submit();
}



function deleteuser(username){
	
	//alert("hello 3322......");
	var username1=encodeURIComponent(username);
	//alert("user="+username1);
	var url="deleteuser.jsp?usern="+username1;
	window.open(url,this.target, 
			'width=500,height=400,scrollbars=no,top=100px,left=400px');
	
	
}




function resetpasswordsysadmin(username){
	var username1=encodeURIComponent(username);
	//alert("user="+username1);
	
	var url="ResetPasswordAdmin.jsp?usern="+username1;
///	window.open(url,this.target, 
	//	       'width=700,height=700,scrollbars=yes,top=100px,left=500px');
	window.open(url);
	
}
function resetpasswordsysadmin1(username){
//alert("3311bbbbaaaaabbbbuuu");
	var username1=encodeURIComponent(username);
	//alert("user="+username1);
	
	var url="modifydatalocaladmin.jsp?usern="+username1;
	window.open(url);
	
}

function resetpasswordsysadmin12(username){
	var username1=encodeURIComponent(username);
	//alert("user="+username1);
	var url="modifylocaluser.jsp?usern="+username1;
	//window.open(url,this.target,"_self");
			//'width=700,height=700,scrollbars=yes,top=100px,left=500px');
	//location.replace(url);
	window.open(url);
}



 function actionresetpassword(username){
	 var passwd=document.getElementById('password1').value;

	 var passwd1=document.getElementById('password2').value;
	 
	 if (isEmpty(passwd) || isEmpty(passwd1)){
			
		 //jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
               return false;
		     
	 }
	 else{
	 document.resetpassword.usern1.value=username;
	 document.resetpassword.stage.value='first';
	 document.resetpassword.password.value=passwd;
	 document.getElementById('resetpassword').submit();
	 }
 }

 function validateUserLocal()
 {
		var rad = document.loginForm11.myRadios;	
		var prev = null;
		for(var i = 0; i < rad.length; i++) {
		    rad[i].onclick = function() {
		        (prev)? console.log(prev.value):null;
		        if(this !== prev) {
		            prev = this;	         
		        }	      
		    };
		}
		var CheckedRadio = null;
		if (document.getElementById('User').checked) {
			CheckedRadio = document.getElementById('User').value;
			
			}
		if(CheckedRadio==1) {
		//alert("sajhgjas"+CheckedRadio);
		var user_name = document.getElementById("user_name").value;					
	    var password = document.getElementById("password").value;	
	    var Type1 =document.getElementById("Type");
		var Type = Type1.options[ Type1.selectedIndex ].value;
		var officer_name = document.getElementById("officer_name").value;					
		var email_id = document.getElementById("email_id").value;					
		var contact_no = document.getElementById("contact_no").value;
		var Division1 =document.getElementById("division");
		var err = document.getElementById("exist");
		var err25 = document.getElementById("err25").innerHTML;
		var error0 = document.getElementById("error0").innerHTML;
		var error1 = document.getElementById("error1").innerHTML;
		var error3 = document.getElementById("error3").innerHTML;
		
		 //alert("division::"+Division1);
		if(isNaN(contact_no)){
	 		alert("Please enter numeric value for Contact No !!")
	 		return false;
		}
						if ( Type =="RVNL") {
						
							var PIU1 =document.getElementById("PIU_name");
							var Role1 =document.getElementById("Role");
							var Role = Role1.options[ Role1.selectedIndex ].value;
							var PIU = PIU1.options[ PIU1.selectedIndex ].value;	
							//alert("piuu --"+PIU);
							var Dept_RVNL1;var Dept_RVNL;var Desgn_RVNL1;
							var Desgn_RVNL;
							
							var Department1 =document.getElementById("Department_RVNL2");
							var Department = Department1.options[ Department1.selectedIndex ].value;					 
							var Designation1 =document.getElementById("designation_RVNL2");
							var Designation = Designation1.options[ Designation1.selectedIndex ].value;	
						
	 						 if (isEmpty(user_name) || isEmpty(password) || isEmpty(Type) || isEmpty(PIU) || isEmpty(Department1) || isEmpty(Designation1) || isEmpty(Role) || isEmpty(contact_no) || isEmpty(email_id) || isEmpty(officer_name)) {
															
								
							 jQuery.noConflict();
									
								 var dialogid="#dialogid";
								 
								 $(dialogid).dialog({
							        modal: true,
							        autoOpen: false,
							        title: "Please Fill Complete Data",
							        width: 400,
							        height: 200
							    });
								 
								  $(dialogid).dialog('open');
					               return false;
							     } else if (!isEmpty(err) || !isEmpty(error0) || !isEmpty(error1) || !isEmpty(error3)){
		 							 jQuery.noConflict();
										
									 var dialogid="#dialogid24";
									 
									 $(dialogid).dialog({
								        modal: true,
								        autoOpen: false,
								        title: "Duplicat/Incorrect entry........",
								        width: 400,
								        height: 200
								    });
									 
									  $(dialogid).dialog('open');
						               return false;
		 						
		 						  }  
							    else {		
								 
								 document.loginForm11.Project_stage.value = "first";
									document.getElementById("loginForm11").submit();							
									return true;
								 }											
						} else if ( Type =="MOR"){
							//var Role1 =document.getElementById("Role");
							//var Role = Role1.options[ Role1.selectedIndex ].value;	
							
							
							var Zone1 =document.getElementById("Zone");
							var Zone = Zone1.options[ Zone1.selectedIndex ].value;						
							var Division1,Division;
							if(Zone!="RailwayBoard"){
							if (isChangeZone(Zone)){								
								var Division1 =document.getElementById("division");
								var Division = Division1.options[ Division1.selectedIndex ].value;	
	                           }else{                      	   
	                        	 var Division1 =document.getElementById("division1");
	   							 var Division = Division1.options[ Division1.selectedIndex ].value;	
	                                 }		
							}
					
							var Department1 =document.getElementById("Department_RVNL1");
							var Department = Department1.options[ Department1.selectedIndex ].value;					 
							var Designation1 =document.getElementById("designation_RVNL1");
							var Designation = Designation1.options[ Designation1.selectedIndex ].value;		
																					
							if (isEmpty(user_name) || isEmpty(password) 
									|| isEmpty(Type) || isEmpty(Zone) || 
									 isEmpty(Department) || isEmpty(Designation) || isEmpty(Division) || isEmpty(contact_no) || isEmpty(email_id) || isEmpty(officer_name)) {   
								//alert("jhfj"+Division);//
								 jQuery.noConflict();
								
								 var dialogid="#dialogid";
								 
								 $(dialogid).dialog({
							        modal: true,
							        autoOpen: false,
							        title: "Please Fill Complete Data",
							        width: 400,
							        height: 200
							    });
								 
								  $(dialogid).dialog('open');
					               return false;
							} else if (!isEmpty(err) || !isEmpty(error0) || !isEmpty(error1) || !isEmpty(error3)){
	 							 jQuery.noConflict();
									
								 var dialogid="#dialogid24";
								 
								 $(dialogid).dialog({
							        modal: true,
							        autoOpen: false,
							        title: "Duplicat/Incorrect entry........",
							        width: 400,
							        height: 200
							    });
								 
								  $(dialogid).dialog('open');
					               return false;
	 						
	 						  }
							 else {										 
								 document.loginForm11.Project_stage.value = "first";
									document.getElementById("loginForm11").submit();							
									return true;
								  }													
						     } else if ( Type =="Others") {
						    	 
					 		  	 var Org1 =document.getElementById("Org_name");
									var Org = Org1.options[ Org1.selectedIndex ].value;					 
									
								if (isEmpty(user_name) || isEmpty(Org)) {   
									 jQuery.noConflict();
									
									 var dialogid="#dialogid";
									 
									 $(dialogid).dialog({
								        modal: true,
								        autoOpen: false,
								        title: "Please Fill Complete Data",
								        width: 400,
								        height: 200
								    });
									 
									  $(dialogid).dialog('open');
						               return false;
								} else if (!isEmpty(err) || !isEmpty(err25)){
		 							 jQuery.noConflict();
										
									 var dialogid="#dialogid24";
									 
									 $(dialogid).dialog({
								        modal: true,
								        autoOpen: false,
								        title: "Duplicat/Incorrect entry........",
								        width: 400,
								        height: 200
								    });
									 
									  $(dialogid).dialog('open');
						               return false;
		 						
		 						  }
								 else {							 			 
									 document.loginForm11.Project_stage.value = "first";
									  document.getElementById("loginForm11").submit();							
										return true;
									  }	
		                      }			
			  }	

 }