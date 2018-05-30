function isEmpty(str) {
	
	if (str == null || str == "" || str == "-1" ||str == "none"){
		return true;
	}else{
	
	return false;
	}
}

function addDesignation() {		
	var zone1 = document.getElementById("Zone");
	var zone = zone1.options[ zone1.selectedIndex ].value;
	var dtype1 = document.getElementById("Document_Type") ;
	var dtype = dtype1.options[ dtype1.selectedIndex ].value;	
	var dept1 = document.getElementById("Department_name");
	var dept = dept1.options[ dept1.selectedIndex ].value;
	var desg1 = document.getElementById("designation") ;
	var desg = desg1.options[ desg1.selectedIndex ].value;	
	var time = document.getElementById("EstimatedTime").value;		
	var str =dept +"~"+desg;
	
	
   
	
	if (isEmpty(zone) || isEmpty(dtype) || isEmpty(dept) || isEmpty(desg) || isEmpty(time))  {		 
			alert('Please fill all the details !!');
			return false;
		}else {	
	
	document.ApprovalHierarchy.XX_Time.value =time ;
	document.ApprovalHierarchy.XX_Zone.value =zone ;
	document.ApprovalHierarchy.XX_Document_Type.value = dtype;
	document.ApprovalHierarchy.XX_Department.value = dept;
	document.ApprovalHierarchy.XX_Designation.value = desg;
	document.ApprovalHierarchy.XX_String.value = str;
	
	// var buffer = "<img src='images/ArrowRight.png' width='30' height='30' alt='arrRight'><h1>"+dept+"</h1><img src='images/right.png' width='25' height='30' alt='Right'><h1>"+desg+"</h1>";
	
	document.ApprovalHierarchy.Project_stage.value = "first";
	
	
	document.getElementById("ApprovalHierarchy").submit();
	

	return true;
		}	
}

function addDesignation2(p_zone,p_dtype,p_dept,p_desg,p_time) {	
	
	
	var dept = document.getElementById("pdept").value;
	var desg = document.getElementById("pdesg").value;
	
	
	var xx_dept1 = document.getElementById("Department_name");
	var xx_dept = xx_dept1.options[ xx_dept1.selectedIndex ].value;	
	
	var xx_desg1 = document.getElementById("designation");
	var xx_desg = xx_desg1.options[ xx_desg1.selectedIndex ].value;	
		
	var time = document.getElementById("EstimatedTime2").value;
	p_time = p_time +"~"+time;
	
	
	
	
	
	var x ="~~"+ p_dept+"~"+p_desg+"~~"+xx_dept+"~"+xx_desg;
	//alert("PDEP"+p_dept);
	
	p_dept =p_dept+"~"+p_desg;
	p_desg="~"+xx_dept+"~"+xx_desg;
	//var desg = "~~"+dept+"~"+desg;
	// desg = desg+"~~"+xx_dept+"~"+xx_desg;
	 
	
	var desg = dept+"~"+desg+"~~"+xx_dept+"~"+xx_desg;
//	var desg = desg +","+xx_desg;
  //  alert(desg);
    
    var sub = [];
    var mySplitResult = desg.split("~~");
    var  buffer = "<table>";
    for(i = 0; i < mySplitResult.length; i++)
      {
    //	alert(i+"->"+mySplitResult[i]);
    	 sub[i] =mySplitResult[i].split("~");
    	
    	 buffer = buffer+"<tr>";
    	 for(j=0;j<1;j++) {
    	//	alert("i="+i+"j="+j+"->"+sub[i][j]);
    	
    		
    	  buffer = buffer+"<td><img src='images/ArrowRight.png' width='30' height='30' alt='arrRight'></td><td style='width:400px'><h1>"+sub[i][j]+"</h1></td>"+"<td><img src='images/right.png' width='25' height='30' alt='Right'></td>"+"<td><h1>"+sub[i][j+1]+"</h1></td>";
      //  document.write("<br /> Element " + i + " = " + mySplitResult[i]);
   	 
      }
    	 buffer = buffer+"</tr>"; 
     }
    buffer = buffer+"</table>";
	//document.getElementById("para_desg").innerHTML = desg ; 
   // document.ApprovalHierarchy.XX_Department.value="";
    
    if (isEmpty(xx_dept) || isEmpty(xx_desg) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {	
    
	
    document.ApprovalHierarchy.XX_Time.value =p_time ;
	document.ApprovalHierarchy.XX_Zone.value =p_zone ;
	document.ApprovalHierarchy.XX_Document_Type.value = p_dtype;
	document.ApprovalHierarchy.XX_Department.value = p_dept;
	document.ApprovalHierarchy.XX_Designation.value = p_desg;
	
//	var html = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	
//	 html+= "<b>"+xx_desg+"</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
//	"<img src='images/ArrowRight.png' width='30' height='30' alt='arrRight'>";
		
	// html+=buffer;
		
	//	document.getElementById("arrow").innerHTML += html ;
	
		   // ->
	
	 document.getElementById("arrow").innerHTML += buffer ;
	 document.ApprovalHierarchy.XX_String.value = desg;
	 document.ApprovalHierarchy.XX_Hierarchy.value = buffer;
	document.ApprovalHierarchy.Project_stage.value = "second";
	document.getElementById("ApprovalHierarchy").submit();
	
	return true;
	}		
}


function complete() {
	var div1 = document.getElementById("Zone");
	var div = div1.options[ div1.selectedIndex ].value;	
	
	var dtype1 = document.getElementById("Document_Type");
	var dtype = dtype1.options[ dtype1.selectedIndex ].value;	
	
	var dept1 = document.getElementById("Department_name");
	var dept = dept1.options[ dept1.selectedIndex ].value;	
	
	var desg1 = document.getElementById("designation");
	var desg = desg1.options[ desg1.selectedIndex ].value;	
	
	var time = document.getElementById("EstimatedTime").value;
	
	
	if (isEmpty(div) || isEmpty(dtype) || isEmpty(dept) || isEmpty(desg) || isEmpty(time) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {	
	
	
	 document.ApprovalHierarchy.XX_Time.value = time;
	 document.ApprovalHierarchy.XX_InitZone.value = div;
	 document.ApprovalHierarchy.XX_InitDocument_Type.value = dtype;
	 document.ApprovalHierarchy.XX_InitDepartment.value = dept;
	 document.ApprovalHierarchy.XX_InitDesignation.value = desg;
	
	document.ApprovalHierarchy.Project_stage.value = "complete";
	document.getElementById("ApprovalHierarchy").submit();
	return true;
	}
} 

function complete2(str,zone,dtype,p_time) {
	var dept1 = document.getElementById("Department_name");
	var dept = dept1.options[ dept1.selectedIndex ].value;	
	
	var desg1 = document.getElementById("designation");
	var desg = desg1.options[ desg1.selectedIndex ].value;	
	var time = document.getElementById("EstimatedTime2").value;
	
	
	
	if(time==null){		
	}
	else{
		p_time =p_time+"~"+time;
	}
	
	if(dept=="none"||desg=="none") {
		
	}
	else{
	str = str+"~~"+dept+"~"+desg;
	}
	
	if (isEmpty(dept) || isEmpty(desg) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {
	
	
//	alert(str);
	
	document.ApprovalHierarchy.XX_Time.value = p_time;
	 document.ApprovalHierarchy.XX_FinalString.value = str;
	 document.ApprovalHierarchy.XX_FinalZone.value = zone;
	 document.ApprovalHierarchy.XX_FinalDtype.value = dtype;
	document.ApprovalHierarchy.Project_stage.value = "complete2";
	document.getElementById("ApprovalHierarchy").submit();

	return true;
	}
}

function updateHierarchy() {	
	var r = confirm("Do you want to update hiearchy ?"); 
	var x;
	if(r==true) {
		x="OK";

	 document.ApprovalHierarchy.stage.value = "update1";
		document.getElementById("ApprovalHierarchy").submit();	

	}
	else  {
		x="Cancel";
	
	}   
	
}

function addDesignationfordoc() {	
	
	var zone1 = document.getElementById("Zone");
	var zone = zone1.options[ zone1.selectedIndex ].value;
	var dtype = document.getElementById("Document_Type").value; ;
	//var dtype = dtype1.options[ dtype1.selectedIndex ].value;	
	var dept1 = document.getElementById("Department_name");
	var dept = dept1.options[ dept1.selectedIndex ].value;
	var desg1 = document.getElementById("designation_RVNL") ;
	var desg = desg1.options[ desg1.selectedIndex ].value;	
	var time = document.getElementById("EstimatedTime").value;		
	var str =dept +"~"+desg;
	
	
	
	
   
	
	if (isEmpty(zone) || isEmpty(dtype) || isEmpty(dept) || isEmpty(desg) || isEmpty(time))  {		 
			alert('Please fill all the details !!');
			return false;
		}else {	
	
	document.Hierarchy.XX_Time.value =time ;
	document.Hierarchy.XX_Zone.value =zone ;
	document.Hierarchy.XX_Document_Type.value = dtype;
	document.Hierarchy.XX_Department.value = dept;
	document.Hierarchy.XX_Designation.value = desg;
	document.Hierarchy.XX_String.value = str;
	document.Hierarchy.Project_stage.value = "first";
	// var buffer = "<img src='images/ArrowRight.png' width='30' height='30' alt='arrRight'><h1>"+dept+"</h1><img src='images/right.png' width='25' height='30' alt='Right'><h1>"+desg+"</h1>";
	
	//var type1=document.getElementById("XX_Type").value;
	//document.Hierarchy.XX_Stage.value = "first";
	//document.Hierarchy.XX_Type.value = type1;
	
	document.getElementById("Hierarchy").submit();
	

	return true;
		}	
}

/*
var typedrop;
function submitHierarchy() {
	
	var type1 = document.getElementById("HierarchyType");	
	var type = type1.options[ type1.selectedIndex ].value;
	
	
	document.Hierarchy.XX_Type.value =type ;
	document.Hierarchy.XX_Stage.value = "first";
	document.getElementById("Hierarchy").submit();
	
}
*/

function completefordoc() {
	var div1 = document.getElementById("Zone");
	var div = div1.options[ div1.selectedIndex ].value;	
	
	var dtype = document.getElementById("Document_Type").value;
	//var dtype = dtype1.options[ dtype1.selectedIndex ].value;	
	
	var dept1 = document.getElementById("Department_name");
	var dept = dept1.options[ dept1.selectedIndex ].value;	
	
	var desg1 = document.getElementById("designation_RVNL");
	var desg = desg1.options[ desg1.selectedIndex ].value;	
	
	var time = document.getElementById("EstimatedTime").value;
	
	
	if (isEmpty(div) || isEmpty(dtype) || isEmpty(dept) || isEmpty(desg) || isEmpty(time) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {	
	
	
	 document.Hierarchy.XX_Time.value = time;
	 document.Hierarchy.XX_InitZone.value = div;
	 document.Hierarchy.XX_InitDocument_Type.value = dtype;
	 document.Hierarchy.XX_InitDepartment.value = dept;
	 document.Hierarchy.XX_InitDesignation.value = desg;
	// document.Hierarchy.Division_stage.value="zones";
	document.Hierarchy.Project_stage.value = "complete";
	document.getElementById("Hierarchy").submit();
	return true;
	}
} 

function addDesignation2fordoc(p_zone,p_dtype,p_dept,p_desg,p_time) {	
	
	
	var dept = document.getElementById("pdept").value;
	var desg = document.getElementById("pdesg").value;
	
	
	var xx_dept1 = document.getElementById("Department_name");
	var xx_dept = xx_dept1.options[ xx_dept1.selectedIndex ].value;	
	
	var xx_desg1 = document.getElementById("designation_RVNL");
	var xx_desg = xx_desg1.options[ xx_desg1.selectedIndex ].value;	
		
	var time = document.getElementById("EstimatedTime2").value;
	p_time = p_time +"~"+time;
	
	
	
	
	
	var x ="~~"+ p_dept+"~"+p_desg+"~~"+xx_dept+"~"+xx_desg;
	//alert("PDEP"+p_dept);
	
	p_dept =p_dept+"~"+p_desg;
	p_desg="~"+xx_dept+"~"+xx_desg;
	//var desg = "~~"+dept+"~"+desg;
	// desg = desg+"~~"+xx_dept+"~"+xx_desg;
	 
	
	var desg = dept+"~"+desg+"~~"+xx_dept+"~"+xx_desg;
//	var desg = desg +","+xx_desg;
  //  alert(desg);
    
    var sub = [];
    var mySplitResult = desg.split("~~");
    var  buffer = "<table>";
    for(i = 0; i < mySplitResult.length; i++)
      {
    //	alert(i+"->"+mySplitResult[i]);
    	 sub[i] =mySplitResult[i].split("~");
    	
    	 buffer = buffer+"<tr>";
    	 for(j=0;j<1;j++) {
    	//	alert("i="+i+"j="+j+"->"+sub[i][j]);
    	
    		
    	  buffer = buffer+"<td><img src='images/ArrowRight.png' width='30' height='30' alt='arrRight'></td><td style='width:400px'><h1>"+sub[i][j]+"</h1></td>"+"<td><img src='images/right.png' width='25' height='30' alt='Right'></td>"+"<td><h1>"+sub[i][j+1]+"</h1></td>";
      //  document.write("<br /> Element " + i + " = " + mySplitResult[i]);
   	 
      }
    	 buffer = buffer+"</tr>"; 
     }
    buffer = buffer+"</table>";
	//document.getElementById("para_desg").innerHTML = desg ; 
   // document.ApprovalHierarchy.XX_Department.value="";
    
    if (isEmpty(xx_dept) || isEmpty(xx_desg) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {	
    
	
    document.Hierarchy.XX_Time.value =p_time ;
	document.Hierarchy.XX_Zone.value =p_zone ;
	document.Hierarchy.XX_Document_Type.value = p_dtype;
	document.Hierarchy.XX_Department.value = p_dept;
	document.Hierarchy.XX_Designation.value = p_desg;
	
//	var html = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	
//	 html+= "<b>"+xx_desg+"</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
//	"<img src='images/ArrowRight.png' width='30' height='30' alt='arrRight'>";
		
	// html+=buffer;
		
	//	document.getElementById("arrow").innerHTML += html ;
	
		   // ->
	
	 document.getElementById("arrow").innerHTML += buffer ;
	 document.Hierarchy.XX_String.value = desg;
	 document.Hierarchy.XX_Hierarchy.value = buffer;
	document.Hierarchy.Project_stage.value = "second";
	document.getElementById("Hierarchy").submit();
	
	return true;
	}		
}

function complete2fordoc(str,zone,dtype,p_time,docid) {
	var dept1 = document.getElementById("Department_name");
	var dept = dept1.options[ dept1.selectedIndex ].value;	
	
	var desg1 = document.getElementById("designation_RVNL");
	var desg = desg1.options[ desg1.selectedIndex ].value;	
	var time = document.getElementById("EstimatedTime2").value;
	
	
	
	if(time==null){		
	}
	else{
		p_time =p_time+"~"+time;
	}
	
	if(dept=="none"||desg=="none") {
		
	}
	else{
	str = str+"~~"+dept+"~"+desg;
	}
	
	if (isEmpty(dept) || isEmpty(desg) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {
	
	
//	alert(str);
	
	document.Hierarchy.XX_Time.value = p_time;
	 document.Hierarchy.XX_FinalString.value = str;
	 document.Hierarchy.XX_FinalZone.value = zone;
	 document.Hierarchy.XX_FinalDtype.value = dtype;
	document.Hierarchy.Project_stage.value = "complete2";
	document.getElementById("Hierarchy").submit();

	return true;
	}
}

function sendto(){
	
	
}

