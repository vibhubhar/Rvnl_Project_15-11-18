function isChangedept(str) {
	
	if (str == null || str == "" || str == "none" || str == "-1"){
	return false;
	}
	return true; 
}

function validate() {	
	var Project = document.getElementById("Project").value;		
	var PIU_of_RVNL1 = document.getElementById("PIU_name");
	var PIU_of_RVNL = PIU_of_RVNL1.options[ PIU_of_RVNL1.selectedIndex ].value;	
	var Project_Type1 = document.getElementById("Project_Type");
	var Project_Type = Project_Type1.options[ Project_Type1.selectedIndex ].value;
	var start_Date=	document.getElementById("start_Date").value;
	var Dept_of_RVNL1 =document.getElementById("Department_RVNL1");	
	var Dept_of_RVNL = Dept_of_RVNL1.options[ Dept_of_RVNL1.selectedIndex ].value;
	var packagesofproject1=document.getElementById("packagesofproject");
	var packagesofproject = packagesofproject1.options[ packagesofproject1.selectedIndex ].value;
	var loc="filled"; 
	var nomajsec=document.getElementById("No_Majsec").value;
	for(var i=1;i<=nomajsec;i++){
		if (!$("#Majsec"+i).is(":disabled")) {
			var majsec=document.getElementById("Majsec"+i).value;
			var frmkm=document.getElementById("frmKm"+i).value;
			var tokm=document.getElementById("toKm"+i).value;
			if (isEmpty(majsec) || isEmpty(frmkm) || isEmpty(tokm)) {
				loc=null; i=nomajsec+1;
			} } }
	if (!isEmpty(loc)) {
	var nostn=document.getElementById("No_Stn").value;
	for(var i=1;i<=nostn;i++){
		if (!$("#sMajsec"+i).is(":disabled")) {
			var smajsec=document.getElementById("sMajsec"+i).value;
			var stn=document.getElementById("stn"+i).value;
			var stnkm=document.getElementById("stnKm"+i).value;
			if (isEmpty(smajsec) || isEmpty(stn) || isEmpty(stnkm)) {
				loc=null; i=nostn+1;
			} } }
	}
	var i;
	var rnull="filled";
	var r = new Array();
	//alert("packs..."+packagesofproject);
	if(packagesofproject!=0 ){
		for(i=0;i<packagesofproject;i++){	
		if (document.getElementById("Package"+i).value=="null" || document.getElementById("Package"+i).value=="" || document.getElementById("Package"+i).value==null ) {rnull=null;} else {
			r[i] = document.getElementById("Package"+i).value;
			r[i]=r[i].replace( /\s\s+/g, ' ' );   
			document.getElementById("Package"+i).value=r[i];
			} 		 	
	}
	} 
	var Designation_RVNL = document.getElementById("designation_RVNL").value;	
	var Coordinator_name = document.getElementById("projectinCharge").value;	
	var duplicates = r.reduce(function(acc, el, i, arr) {
		  if (arr.indexOf(el) !== i && acc.indexOf(el) < 0) acc.push(el); return acc;
		}, []);
	
	if(duplicates!="")
		{
			 var dialogid="#dialogid1";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert Same Package Name",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
	          return false;
		}
		else
			{
			 if (isEmpty(Dept_of_RVNL) || isEmpty(Project) || isEmpty(PIU_of_RVNL) || isEmpty(Project_Type) || isEmpty(start_Date) ||  isEmpty(Coordinator_name) || isEmpty(packagesofproject)
					 || isEmpty(r) || isEmpty(rnull) || isEmpty(loc)) {
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
				}else {		
					document.CreateProject.buttonName.value = "saveprojectdetails";
					document.CreateProject.Project_stage.value = "first";
					document.CreateProject.designation.value=Designation_RVNL;
					document.CreateProject.Department_RVNL.value=Dept_of_RVNL;
					document.getElementById("CreateProject").submit();
					document.CreateProject.Project.value="";
					return true;

				}
			}
}
	
function isEmpty(str) {
	
	if (str == null || str == "" || str == "-- Select Value --" || str == "-1" ||str == "none" || str == "-- Select Type --" || str == "--Select Zone --" || str == "-- Select PIU --"){
		return true;
	}else{
	
	return false;
	}
}

function changeIt(str) {
	 	count++;
	 	document.getElementById("formCount").value = count+1;
	 var values = str.split('~');
	 				 var arrayLength = values.length;
	 				 var opt;
	 				 for (var i = 0; i < arrayLength; i++) {
	 					 opt=opt+"<option value='"+values[i]+"'>"+values[i]+"</option>";
	 					 
	 				     //alert(values[i]);
	 				     //Do something
	 					 
	 				 }
	 					var i = 1;
	 					my_div.innerHTML = my_div.innerHTML
	 							+ "<br><select name='DType'+ i++>"+opt+"</select><br>";
	 
	 		 
}
function getvalue(){	
	 var i= 0;
	 var j=0;
	 for(i=0;i<=count;i++) {
		 var dtype = document.getElementsByName("DType")[i].value;
		 var count1 = document.getElementById("formCount").value;
		 if(count1==null || count1==""){
			 count1=1; 
		 }
		 
		 document.forms[0].action='final.jsp?formCount='+count1;
		 

		 if (isEmpty(dtype)) {
				alert('Please fill all the details !!')
				j=1;
				return false;
			} 
			 
	
	
}
	 if(j==0){
		 
		 document.CreateProject.buttonName.value = "savedocumentdetails";
			document.CreateProject.Project_stage.value = "second";
			document.getElementById("CreateProject").submit();
	         }	 	 
}	 

function getvalue11(){
	var packofproject=document.getElementById("noOfPackages").value;	
	var j, j2;
	var Ans1="no";
	for(j=0;j<packofproject;j++) {
		var packSD = document.getElementById("pacstart_Date"+j).value;
		var nosofdrg = document.getElementById("nosofDrg"+j).value;
		
		for (j2=0;j2<nosofdrg;j2++) {
			var noreqd= document.getElementById("no_drg"+j+"_"+j2).value;
			if (isEmpty(noreqd) || parseInt(noreqd) < 0 ) {Ans1="yes"; break;}
		}
		var Railway1 = document.getElementById("Railway"+j);
		var Railway = Railway1.options[ Railway1.selectedIndex ].value;	
		if(isChangedept(Railway)){
			var cbResults = "";	
			 var x = document.getElementsByName("divisions"+j+":1").length;
			 if (x>0) {
			 for (var i = 0; i < x; i++ ) {
				 if (document.getElementsByName("divisions"+j+":1")[i].checked == true) {
					 cbResults += document.getElementsByName("divisions"+j+":1")[i].value + "";					 
				 }
				 }
			 } else {	
				 cbResults +="--select--";}
			 if(isEmpty(cbResults)) {
				 jQuery.noConflict();
					
				 var dialogid="#dialogid";
				 
				 $(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title: "Please select a division in Zone 1.",
			        width: 400,
			        height: 200
			    });
				 
				  $(dialogid).dialog('open');
		          return false;
			 }
		}
		
		var secondRailway1 = document.getElementById("secondRailway"+j);
		var secondRailway = secondRailway1.options[ secondRailway1.selectedIndex ].value;
		if(isChangedept(secondRailway)){
			var cbResults2 = "";	
			 var y = document.getElementsByName("divisions"+j+":2").length;
			 if (y>0) {
			 for (var i = 0; i < y; i++ ) {
				 if (document.getElementsByName("divisions"+j+":2")[i].checked == true) {
					 cbResults2 += document.getElementsByName("divisions"+j+":2")[i].value + "";					
				 }
				 }	
			 } else {	
				 cbResults2 +="--select--";}
			 if(isEmpty(cbResults2)) {
				 jQuery.noConflict();
					
				 var dialogid="#dialogid";
				 
				 $(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title: "Please select a division in Zone 2.",
			        width: 400,
			        height: 200
			    });
				 
				  $(dialogid).dialog('open');
		          return false;
			 }
		}	
	var dept = document.getElementById("Department_RVNL"+j).value;
	 var desg = document.getElementById("designation_RVNL"+j).value;
	 var pkgDirector = document.getElementById("projectinCharge"+j).value;	
	}
	if (isEmpty(packSD) || (isEmpty(Railway) && isEmpty(secondRailway)) || isEmpty(dept) ||  isEmpty(pkgDirector) || isEmpty(desg) || (Ans1=='yes'))  {
		jQuery.noConflict();
		//alert("nodrg"+nosofdrg+"ans"+Ans1+isEmpty(packSD)+isEmpty(Railway)+isEmpty(secondRailway) +isEmpty(dept)+ isEmpty(pkgDirector)+isEmpty(desg));
		 var dialogid="#dialogid";
		 
		 $(dialogid).dialog({
	        modal: true,
	        autoOpen: false,
	        title: "Data Entry Alert!",
	        width: 400,
	        height: 200
	    });
		 
		  $(dialogid).dialog('open');
         return false;
	}
	else{
	document.CreateProject.buttonName.value = "savedocumentdetails";
	document.CreateProject.Project_stage.value = "second";
	document.getElementById("CreateProject").submit();
	return true;
	}
}


function packageval(){
	//alert("9999hellooooo...");
	var packagesofproject = document.getElementById("packagesofproject");
	var projectpackages = packagesofproject.options[ packagesofproject.selectedIndex ].value;	
	var pkhtml="<br><br>";
	for (var i = 0; i < projectpackages; i++) {
	    pkhtml=pkhtml+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Package"+(i+1)+":&nbsp;&nbsp;<input type='text' name='Package"+i+ "' id ='Package"+i+"' maxlength='50' style='width:165px' placeholder='Package Short Name'>";
		i=i+1;
		if (i<projectpackages) {
			pkhtml=pkhtml+"&nbsp;&nbsp;&nbsp;&nbsp;Package"+(i+1)+":&nbsp;&nbsp;<input type='text' name='Package"+i+"' id ='Package"+i+"' maxlength='50' style='width:165px' placeholder='Package Short Name'> " ;
		}
		pkhtml=pkhtml+"<br><br>";
	  }
	packagediv.innerHTML = pkhtml;

	$("input").on('keypress', function (event) {
		    var regex = new RegExp("['?!<\">\\\\&]+$");
	    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
	    if (regex.test(key)) {
	       event.preventDefault();
	       return false;
	    }

	  });

}



function validateDocument(typ) {	
	var dtype1 = document.getElementById("DocumentType");
	var dtype = dtype1.options[ dtype1.selectedIndex ].value;	
	var dno = document.getElementById("DocumentNo").value;	
	var dname = document.getElementById("DocumentName").value;	
	var sdate = document.getElementById("Dateofsubmission").value;
	var fdate = document.getElementById("Datefinalizedbyrvnl").value;
	var division = document.getElementById("divisiontype");
	var division1 = division.options[division.selectedIndex].value;
	var dupl1="No";
	var dupl2="No";
	var dupl3="No";
	var err = document.getElementById("exist");
	if (!isEmpty(err)) {dupl1="Yes"; } else {dupl1="No";} 
	
	//alert("1pk"+dupl1);
	var loctype2=null;
	if (document.getElementById("loc_type")!=null) {
		loctype2 = document.getElementById("loc_type").value;
	}
	
	var ans="No";
	var ans2="No";
	//alert("22 me str:"+loctype2+"typ:"+typ);
	if (loctype2!=null) {
	if (loctype2=="Station") {
		var smajsec = document.getElementById("sMajsec");
		var smajsec1 = smajsec.options[smajsec.selectedIndex].value;	
		//var stn = document.getElementById("stn");
		//var stn1 = stn.options[stn.selectedIndex].value;	
		if (isEmpty(smajsec1) || isEmpty(document.getElementById("stnKm").value) ) {ans="yes";} else {ans="no";}
	} else {
		var majsec = document.getElementById("Majsec");
		var majsec1 = majsec.options[majsec.selectedIndex].value;	
		var err8 = document.getElementById("exist1").value;
		var err9 = document.getElementById("exist2").value;
		//alert("3pk"+err8+err9);
		if (err8=='true') {dupl2="Yes"; } else {dupl2="No";} 
		if (err9=='true') {dupl3="Yes"; } else {dupl3="No";} 
		if (isEmpty(majsec1) || isEmpty(document.getElementById("frmKm").value) || isEmpty(document.getElementById("toKm").value)) {ans="yes";} else {ans="no";}
	}
	} else {ans="yes";}
	
	if (typ=="create") {
	var rad = document.Create_Document.myRadios;	
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
	if (document.getElementById('Both').checked) {
		CheckedRadio = document.getElementById('Both').value;
		}
	if (document.getElementById('Zone').checked) {
		CheckedRadio = document.getElementById('Zone').value;
		}
	if (document.getElementById('Division').checked) {
		CheckedRadio = document.getElementById('Division').value;
		}
	
   document.Create_Document.CheckedValue.value = CheckedRadio ;
   if (isEmpty(CheckedRadio)) {ans2="yes";} else {ans2="No";}
	}
	//alert("ans"+ans+ans2);
	//alert("2pk"+err+dupl1+dupl2+dupl3);
	 if (isEmpty(dtype) || isEmpty(dno) || isEmpty(dname) || isEmpty(sdate) || isEmpty(fdate) || isEmpty(division1) || ans2=="yes" || ans=="yes")  {
		 var $j=jQuery.noConflict();
			
		 var dialogid="#dialogid";
		 
		 $j(dialogid).dialog({
	        modal: true,
	        autoOpen: false,
	        title: "Please Fill Complete Data",
	        width: 400,
	        height: 200
	    });
		 
		  $j(dialogid).dialog('open');
	return false;
		} else if (dupl1=="Yes" || dupl2=="Yes" || dupl3=="Yes"){
			var $j= jQuery.noConflict();
				
			 var dialogid="#dialogid24";
			 
			 $j(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Duplicat/Incorrect entry........",
		        width: 400,
		        height: 200
		    });
			 
			  $j(dialogid).dialog('open');
	           return false;
			
			  }  else {
		 if (typ=="create") {		 
	document.Create_Document.selecteddivision.value = division1 ;
	document.Create_Document.identification.value = "first";
	document.getElementById("btnclick").disabled = true;
	document.getElementById("Create_Document").submit();
	return true;
		 } else {
	if (typ=="edit") {
	document.Edit_Document.selecteddivision.value = division1 ;
	document.getElementById("Edit_Document").submit();
	}
		 }
	 }
		 
}

function getCheckedZones() {
	//alert("xx");
	var cbResults = "";	
	 var x = document.getElementsByName("DocZones").length;
	 for (var i = 0; i < x; i++ ) {
		 if (document.getElementsByName("DocZones")[i].checked == true) {
			 cbResults += document.getElementsByName("DocZones")[i].value + "";					 
		 }
		 }	
	 if(isEmpty(cbResults)) {
		 alert("Please select atleast one checkbox");
		 return false;
	 }
	 else{
		 document.Create_Document.identification.value = "zoneSelect";
		 document.getElementById("Create_Document").submit();
			return true; 
	 }
	
}

function getCheckedDivisions() {
	var cbResults = "";	
	 var x = document.getElementsByName("Docdivisions").length;
	 for (var i = 0; i < x; i++ ) {
		 if (document.getElementsByName("Docdivisions")[i].checked == true) {
			 cbResults += document.getElementsByName("Docdivisions")[i].value + "";					 
		 }
		 }	
	 if(isEmpty(cbResults)) {
		 alert("Please select atleast one checkbox");
		 return false;
	 }
	 else{
		 document.Create_Document.identification.value = "divisionSelect";
		 document.getElementById("Create_Document").submit();
			return true; 
	 }
	
}

function getCheckedBoth() {
	var cbResults = "";	
	 var x = document.getElementsByName("DocZones").length;
	 for (var i = 0; i < x; i++ ) {
		 if (document.getElementsByName("DocZones")[i].checked == true) {
			 cbResults += document.getElementsByName("DocZones")[i].value + "";					 
		 }
		 }
	 var cbResults2 = "";	
	 var x = document.getElementsByName("Docdivisions").length;
	 for (var i = 0; i < x; i++ ) {
		 if (document.getElementsByName("Docdivisions")[i].checked == true) {
			 cbResults2 += document.getElementsByName("Docdivisions")[i].value + "";					 
		 }
		 }
	 if(isEmpty(cbResults || cbResults2)) {
		 alert("Please select atleast one checkbox for each !!");
		 return false;
	 }
	 else{
		 document.Create_Document.identification.value = "bothSelect";
		 document.getElementById("Create_Document").submit();
			return true; 
	 }
	
}


function updateHierarchy(doc_id,hType) {
	
	 document.Create_Document.XX_Doc_id.value = doc_id;
	 document.Create_Document.XX_HType.value = hType;
	
	 document.Create_Document.identification.value = "updateHierarchy";
	 document.getElementById("Create_Document").submit();
	
}

function submitlistusers(hiertype,docid,zstr,dstr,doctyp,initiatedfrm,submitiondate){

	//alert("kkjj"+submitiondate);
	var checkboxs=document.getElementsByName("useriddiv");
	var checkboxs1=document.getElementsByName("useridzon");

	var divisionnumbervalue=document.getElementsByName("divisionnumber");
	var zonenumbervalue=document.getElementsByName("zonenumber");
	
    var okay=false;
    var okay1=false;
    var invalid = true;
	 var invalid1 = true;
	// alert("11111 ... pppp.."+checkboxs.length+"divn"+divisionnumbervalue.length+"222... pppp.."+checkboxs1.length+"divn"+zonenumbervalue.length);
	 for(var i=0,l=checkboxs.length;i<l;i++)
	    {
	        if(checkboxs[i].checked && isEmpty(divisionnumbervalue[i].value))
	        {
	        	//okay=true;
	        	invalid=false;
	            break;
	        }
	    }
	 for(var i=0,l=checkboxs.length;i<l;i++)
	    {
		        if(checkboxs[i].checked)
	        {
	        	okay=true;
	        	//invalid=false;
	            break;
	        }
	    }
	 for(var j=0,k=checkboxs1.length;j<k;j++)
	    {
	        if(checkboxs1[j].checked && isEmpty(zonenumbervalue[j].value))
	        {
	        	//okay1=true;
	        	invalid1=false;
	        	
	            break;
	        }
	    }
	 for(var j=0,k=checkboxs1.length;j<k;j++)
	    {
	        if(checkboxs1[j].checked)
	        {
	        	okay1=true;
	        	//invalid1=false;
	            break;
	        }
	    }
	// alert("Thank you for checking a checkbox"+invalid+okay+invalid1+okay1);
		 if(invalid && invalid1 && (okay || okay1)) {
    	
    	document.ForwardUser.initatedfrm1.value=initiatedfrm;
    	
    	document.ForwardUser.stage.value = "first";
    	document.ForwardUser.HierType.value = hiertype;
    	document.ForwardUser.Zone_String.value =zstr;
    	document.ForwardUser.Division_String.value = dstr;
    	document.ForwardUser.DType.value = doctyp;
    	document.ForwardUser.document_id.value = docid;
    	document.ForwardUser.submitiondate1.value =submitiondate;
    	document.getElementById("ForwardUser").submit();
    	
    	} else {
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
    	}
}

function forwardlistusers(docid){
	
	document.ForwardUser.stage.value = "second";
	document.ForwardUser.document_id.value = docid;
	document.getElementById("ForwardUser").submit();
}


function validatetest() {
//alert("hello");	
	var Project = document.getElementById("Project").value;		
	var PIU_of_RVNL1 = document.getElementById("PIU_name");
	var PIU_of_RVNL = PIU_of_RVNL1.options[ PIU_of_RVNL1.selectedIndex ].value;	
	var Project_Type1 = document.getElementById("Project_Type");
	var Project_Type = Project_Type1.options[ Project_Type1.selectedIndex ].value;
	var start_Date=	document.getElementById("start_Date").value;
	var loc="filled"; 
	var nomajsec=document.getElementById("No_Majsec").value;
	for(var i=1;i<=nomajsec;i++){
		if (!$("#Majsec"+i).is(":disabled")) {
			var majsec=document.getElementById("Majsec"+i).value;
			var frmkm=document.getElementById("frmKm"+i).value;
			var tokm=document.getElementById("toKm"+i).value;
			if (isEmpty(majsec) || isEmpty(frmkm) || isEmpty(tokm)) {
				loc=null; i=nomajsec+1;
			} } }
	
	if (!isEmpty(loc)) {
	var nostn=document.getElementById("No_Stn").value;
	for(var i=1;i<=nostn;i++){
		if (!$("#sMajsec"+i).is(":disabled")) { 
			var smajsec=document.getElementById("sMajsec"+i).value;
			var stn=document.getElementById("stn"+i).value;
			var stnkm=document.getElementById("stnKm"+i).value;
			if (isEmpty(smajsec) || isEmpty(stn) || isEmpty(stnkm)) {
				loc=null; i=nostn+1;
			} } }
	}
	
	var packageno =	document.getElementById("counttest").value;
	packageno=packageno-1;
	//var rnull="filled";
	//var teackage1=null;
	var i;
	var rnull="filled";
	var r = new Array();
	//alert("packs..."+packagesofproject);
			
	if(packageno!=0 ){
		for(i=0;i<packageno;i++){	
		if (document.getElementById("Package"+i).value=="null" || document.getElementById("Package"+i).value=="" || document.getElementById("Package"+i).value==null ) {rnull=null;} else {
			r[i] = document.getElementById("Package"+i).value;
			r[i]=r[i].replace( /\s\s+/g, ' ' );   
			document.getElementById("Package"+i).value=r[i];
			} 		 	
	}
	} 
	var Dept_of_RVNL1 =document.getElementById("Department_RVNL1");	
	var Dept_of_RVNL = Dept_of_RVNL1.options[ Dept_of_RVNL1.selectedIndex ].value;
	var Designation_RVNL1 = document.getElementById("designation_RVNL");	
	var Designation_RVNL = Designation_RVNL1.options[ Designation_RVNL1.selectedIndex ].value;	
	var Coordinator_name = document.getElementById("projectinCharge").value;	
	var duplicates = r.reduce(function(acc, el, i, arr) {
		  if (arr.indexOf(el) !== i && acc.indexOf(el) < 0) acc.push(el); return acc;
		}, []);
	
	if(duplicates!="")
		{
			 var dialogid="#dialogid1";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Alert Same Package Name",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
	          return false;
		}
		else
			{
			 if (isEmpty(Dept_of_RVNL) || isEmpty(Project) || isEmpty(PIU_of_RVNL) || isEmpty(Project_Type) || isEmpty(start_Date) ||  isEmpty(Coordinator_name) 
					 || isEmpty(Designation_RVNL) || isEmpty(loc)|| isEmpty(rnull)) {
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
				}else {		
				
					document.CreateProject.buttonName.value = "saveprojectdetails";
					document.CreateProject.Project_stage.value = "first";
					document.CreateProject.designation.value=Designation_RVNL;
					document.CreateProject.Department_RVNL.value=Dept_of_RVNL;
					document.getElementById("CreateProject").submit();
					return true;
}
			}
 }
function packageupdate(){
	var packofproject=1;	
	var j, j2;
	var Ans1="no";
	
	for(j=0;j<packofproject;j++) {
		var nosofdrg = document.getElementById("nosofDrg"+j).value;
		for (j2=0;j2<nosofdrg;j2++) {
			var noreqd= document.getElementById("no_drg"+j+"_"+j2).value;
			if (isEmpty(noreqd)) {Ans1="yes"; break;}
		}
	
		var packSD = document.getElementById("pacstart_Date"+j).value;		
		var Railway1 = document.getElementById("Railway"+j);
		var Railway = Railway1.options[ Railway1.selectedIndex ].value;	
		if(isChangedept(Railway)){
			var cbResults = "";	
			 var x = document.getElementsByName("divisions1:"+j).length;
			 if (x>0) {
			 for (var i = 0; i < x; i++ ) {
				 if (document.getElementsByName("divisions1:"+j)[i].checked == true) {
					 cbResults += document.getElementsByName("divisions1:"+j)[i].value + "";					 
				 } } } else {cbResults +="--select--";}	
			 //alert("x-"+x+" cbResult-"+cbResults+"length-"+document.getElementsByName("divisions1:"+j).length);
			 if(isEmpty(cbResults)) {
				 jQuery.noConflict();
					
				 var dialogid="#dialogid";
				 
				 $(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title: "Please select a division in Zone 1.",
			        width: 400,
			        height: 200
			    });
				 
				  $(dialogid).dialog('open');
		          return false;
			 }
		}
		
		var secondRailway1 = document.getElementById("secondRailway"+j);
		var secondRailway = secondRailway1.options[ secondRailway1.selectedIndex ].value;
		if(isChangedept(secondRailway)){
			var cbResults2 = "";	
			 var y = document.getElementsByName("divisions2:"+j).length;
			 if (y>0) {
			 for (var i = 0; i < y; i++ ) {
				 if (document.getElementsByName("divisions2:"+j)[i].checked == true) {
					 cbResults2 += document.getElementsByName("divisions2:"+j)[i].value + "";					
				 } } } else {cbResults2 +="--select--";}	
			 if(isEmpty(cbResults2)) {
				 jQuery.noConflict();
					
				 var dialogid="#dialogid";
				 
				 $(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title: "Please select a division in Zone 2.",
			        width: 400,
			        height: 200
			    });
				 
				  $(dialogid).dialog('open');
		          return false;
			 }
		}	
	 var dept = document.getElementById("Department_RVNL"+j).value;
	 if( cbResults =="--select--" && cbResults2 =="--select--") {
	 		// alert("inside if");
			 jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Please select a Railway Zone",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
	          return false;
		 }
	 var desg = document.getElementById("designation_RVNL"+j).value;
	 var pkgDirector = document.getElementById("projectinCharge"+j).value;	
	}
	if (isEmpty(packSD) || (isEmpty(Railway) && isEmpty(secondRailway))  || isEmpty(dept) ||  isEmpty(pkgDirector) || isEmpty(desg) || (Ans1=="yes"))  {
		jQuery.noConflict();
		//alert("packsd-"+packSD+" Rly-"+Railway+" dept-"+dept+" pkgDirector-"+pkgDirector+" Desg-"+desg);
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
	}
	else{
	document.CreateProject.Project_stage.value = "update";
	document.getElementById("CreateProject").submit();
	return true;
	}
}

function getvalue111(packagedata){
	var j, j2;
	var Ans1="no";
	for(j=0;j<packagedata;j++) {
		var nosofdrg = document.getElementById("nosofDrg"+j).value;
		for (j2=0;j2<nosofdrg;j2++) {
			var noreqd= document.getElementById("no_drg"+j+"_"+j2).value;
			if (isEmpty(noreqd) || parseInt(noreqd)<0) {Ans1="yes"; break;}
		}
		var packSD = document.getElementById("pacstart_Date"+j).value;	
		var Railway1 = document.getElementById("Railway"+j);
		var Railway = Railway1.options[ Railway1.selectedIndex ].value;	
		if(isChangedept(Railway)){
			var cbResults = "";	
			 var x = document.getElementsByName("divisions1:"+j).length;
			 if (x>0) {
			  for (var i = 0; i < x; i++ ) {
				 if (document.getElementsByName("divisions1:"+j)[i].checked == true) {
					 cbResults += document.getElementsByName("divisions1:"+j)[i].value + "";					 
				 }
				 }
			  } else {	
				 cbResults +="--select--";}
			 if(isEmpty(cbResults)) {
				 jQuery.noConflict();
					
				 var dialogid="#dialogid";
				 
				 $(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title: "Please select a division in Zone 1.",
			        width: 400,
			        height: 200
			    });
				 
				  $(dialogid).dialog('open');
		          return false;
			 }
		}
		
		var secondRailway1 = document.getElementById("secondRailway"+j);
		var secondRailway = secondRailway1.options[ secondRailway1.selectedIndex ].value;
		
		
		if(isChangedept(secondRailway)){
			var cbResults2 = "";	
			 var y = document.getElementsByName("divisions2:"+j).length;
			// alert("no of div:"+y+secondRailway+"divisions2:"+j);
			 if (y>0) {
			 //alert("2."+j+secondRailway1+secondRailway+y);
			 for (var i = 0; i < y; i++ ) {
				 if (document.getElementsByName("divisions2:"+j)[i].checked == true) {
					 cbResults2 += document.getElementsByName("divisions2:"+j)[i].value + "";					
				 } 
			 } 
			 } else {	
			 cbResults2 +="--select--";}
			 if(isEmpty(cbResults2)) {
				 jQuery.noConflict();
					
				 var dialogid="#dialogid";
				 
				 $(dialogid).dialog({
			        modal: true,
			        autoOpen: false,
			        title: "Please select a division in Zone 2.",
			        width: 400,
			        height: 200
			    });
				 
				  $(dialogid).dialog('open');
		          return false;
			 }
		}	
		//divisions0:1 index id		 
	 //var dept1 = document.getElementById("Department_RVNL"+j);
	 var dept = document.getElementById("Department_RVNL"+j).value;
	 //alert(dept+j);
 if( cbResults =="--select--" && cbResults2 =="--select--") {
	 		// alert("inside if");
			 jQuery.noConflict();
				
			 var dialogid="#dialogid";
			 
			 $(dialogid).dialog({
		        modal: true,
		        autoOpen: false,
		        title: "Please select a Railway Zone",
		        width: 400,
		        height: 200
		    });
			 
			  $(dialogid).dialog('open');
	          return false;
		 }
	  var desg = document.getElementById("designation_RVNL"+j).value;
	  var pkgDirector = document.getElementById("projectinCharge"+j).value;	
	}
	if (isEmpty(packSD) || (isEmpty(Railway) && isEmpty(secondRailway)) || isEmpty(dept) ||  isEmpty(pkgDirector) || isEmpty(desg) || (Ans1=="yes"))  {
		jQuery.noConflict();
		
		 var dialogid="#dialogid";
		 
		 $(dialogid).dialog({
	        modal: true,
	        autoOpen: false,
	        title: "Data Entry Alert!",
	        width: 400,
	        height: 200
	    });
		 
		  $(dialogid).dialog('open');
         return false;
	}
	else{
		document.CreateProject.Project_stage.value="second";
		document.CreateProject.final_project.value = "second";
		document.CreateProject.Project_stage1.value = "sachin";
		document.getElementById("CreateProject").submit();
		return true;
	}
	
	
	
}




var xmlHttploc2;
function ShowLocation(code,projectid,str1,stn,km1) {
	var str=encodeURIComponent(str1);
		 			if (typeof XMLHttpRequest != "undefined") {
		 				xmlHttploc2 = new XMLHttpRequest();
					} else if (window.ActiveXObject) {
						xmlHttploc2 = new ActiveXObject("Microsoft.XMLHTTP");
					}
					if (xmlHttploc2 == null) {
						alert("Browser does not support XMLHTTP Request")
						return;
					}
					var url = "showLocation.jsp";
					if (code==1) {
					url += "?code="+code+"&projectid="+projectid+"&doctype=" + str;
					} else if (code==2 || code == 3 || code == 4) {
						url += "?code="+code+"&projectid="+projectid+"&majsec=" + str + "&Km="+km1;	
					} else if (code==5) {
						url += "?code="+code+"&projectid="+projectid+"&smajsec=" + str ;
					}  else if (code==6) {
						url += "?code="+code+"&projectid="+projectid+"&smajsec=" + str + "&stn="+stn;
					} 
					//alert("url"+url);
					xmlHttploc2.onreadystatechange = function() {
						if (xmlHttploc2.readyState == 4 || xmlHttploc2.readyState == "complete") {
							//alert("code="+code);
							if (code==1) {
							document.getElementById("LocationDiv").innerHTML = xmlHttploc2.responseText
							} else if (code==2 || code == 3 || code == 4) {
								if (code==3) {
								document.getElementById("err9").innerHTML = xmlHttploc2.responseText
								} else {
								document.getElementById("err8").innerHTML = xmlHttploc2.responseText
								}
								var ex1=document.getElementById("exist1").value; 
								var ex2=document.getElementById("exist2").value;
							//alert("opk exist1: "+ex1+"opk exist2:"+ex2);
								if(ex1=='true' || ex2=='true'){
									document.getElementById("btnclick").disabled = true;
									if (code==3) {document.getElementById("toKm").focus();} else {document.getElementById("frmKm").focus();}
																	
								}else{
									//if (document.getElementById("exist").value='true') {
								//		document.getElementById("btnclick").disabled = true;
								//	} else {
								document.getElementById("btnclick").disabled = false;
								//	}
							}

							} else if (code==5) {
								document.getElementById("stnDiv").innerHTML = xmlHttploc2.responseText		
							} else if (code==6) {
								document.getElementById("stnkmDiv").innerHTML = xmlHttploc2.responseText		
							}
					    }

					}
					xmlHttploc2.open("GET", url, true);
					xmlHttploc2.send(null);
				}
				
function disablekm(str,code) {
	//alert("dis.."+str);
	if (code==1 || code==2) {
	if (str != "none" ) {
	 $("#frmKm").prop("disabled",false);
	 $("#toKm").prop("disabled",false);
	 } else {
		 $("#frmKm").prop("disabled",true);
		 $("#toKm").prop("disabled",true);
		 }
	 $("#frmKm").val(null);
	 $("#toKm").val(null);
	 $("#exist1").val("null");
	 $("#exist2").val("null");
	 $("#err8").html("<INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value='null'>");
	 $("#err9").html("<INPUT TYPE='HIDDEN' NAME='exist2' ID='exist2' value='null'>");
} else {
	if (str != "none" ) {
		 $("#stn").prop("disabled",false);
		} else {
			 $("#stn").prop("disabled",true);
			}
	 $("#stn").val(null);
	 $("#stnKm").val(null);
	}
}

function ShowLocation_Report(code,projname,str1,stn,km1) {
	var str=encodeURIComponent(str1);
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttploc2 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttploc2 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttploc2 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "showLocation_Report.jsp";
	if (code==1) {
	url += "?code="+code+"&projname="+projname+"&type=" + str;
	} else if (code==2 || code == 3 || code == 4) {
		url += "?code="+code+"&projname="+projname+"&majsec=" + str + "&Km="+km1;	
	} else if (code==5) {
		url += "?code="+code+"&projname="+projname+"&smajsec=" + str ;
	}  else if (code==6) {
		url += "?code="+code+"&projname="+projname+"&smajsec=" + str + "&stn="+stn;
	} else if (code==7) {
		url += "?code="+code+"&projname="+projname+"&smajsec=" + str ;
	}  else if (code==8) {
		url += "?code="+code+"&projname="+projname+"&smajsec=" + str + "&stn="+stn;
		} 
	//alert("url"+url);
	xmlHttploc2.onreadystatechange = function() {
		if (xmlHttploc2.readyState == 4 || xmlHttploc2.readyState == "complete") {
			//alert("code="+code);
			if (code==1) {
			document.getElementById("LocationDiv").innerHTML = xmlHttploc2.responseText
			} else if (code==2 || code == 3 || code == 4) {
				if (code==3) {
				document.getElementById("err9").innerHTML = xmlHttploc2.responseText
				} else {
				document.getElementById("err8").innerHTML = xmlHttploc2.responseText
				}
				var ex1=document.getElementById("exist1").value; 
				var ex2=document.getElementById("exist2").value;
			//alert("opk exist1: "+ex1+"opk exist2:"+ex2);
				if(ex1=='true' || ex2=='true'){
					document.getElementById("btnclick").disabled = true;
					if (code==3) {document.getElementById("toKm").focus();} else {document.getElementById("frmKm").focus();}
													
				}else{
				document.getElementById("btnclick").disabled = false;
			}

			} else if (code==5) {
				document.getElementById("frmstnDiv").innerHTML = xmlHttploc2.responseText		
			} else if (code==6) {
				document.getElementById("frmstnkmDiv").innerHTML = xmlHttploc2.responseText		
			} else if (code==7) {
				document.getElementById("tostnDiv").innerHTML = xmlHttploc2.responseText		
			} else if (code==8) {
				document.getElementById("tostnkmDiv").innerHTML = xmlHttploc2.responseText		
			}
	    }

	}
	xmlHttploc2.open("GET", url, true);
	xmlHttploc2.send(null);
}

function disablekm_Report(str,code) {
	//alert("dis.."+str);
	if (code==1) {
	if (str != "none" ) {
	 $("#frmKm").prop("disabled",false);
	 $("#toKm").prop("disabled",false);
	 } else {
		 $("#frmKm").prop("disabled",true);
		 $("#toKm").prop("disabled",true);
		 }
	 $("#frmKm").val(null);
	 $("#toKm").val(null);
	 $("#exist1").val("null");
	 $("#exist2").val("null");
	 $("#err8").html("<INPUT TYPE='HIDDEN' NAME='exist1' ID='exist1' value='null'>");
	 $("#err9").html("<INPUT TYPE='HIDDEN' NAME='exist2' ID='exist2' value='null'>");
} else {
	if (str != "none" ) {
		 $("#frmstn").prop("disabled",false);
		 $("#tostn").prop("disabled",false);
		} else {
			 $("#frmstn").prop("disabled",true);
			 $("#tostn").prop("disabled",true);
			}
	 $("#frmstn").val(null);
	 $("#frmstnKm").val(null);
	 $("#tostn").val(null);
	 $("#tostnKm").val(null);
	}
}
