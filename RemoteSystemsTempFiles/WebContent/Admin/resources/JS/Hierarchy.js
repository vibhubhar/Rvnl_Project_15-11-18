function isEmpty(str) {
	
	if (str == null || str == "" || str == "-1" ||str == "none"){
		return true;
	}else{
	
	return false;
	}
}

function Div_addDesignationfordoc() {	
	
	var division1 = document.getElementById("division");
	var division = division1.options[ division1.selectedIndex ].value;
	var dtype = document.getElementById("Document_Type").value ;
	//var dtype = dtype1.options[ dtype1.selectedIndex ].value;	
	var dept1 = document.getElementById("Department_name");
	var dept = dept1.options[ dept1.selectedIndex ].value;
	var desg1 = document.getElementById("designation_RVNL") ;
	var desg = desg1.options[ desg1.selectedIndex ].value;	
	var time = document.getElementById("EstimatedTime").value;	
	var str =dept +"~"+desg;
	
		
	
	if (isEmpty(division) || isEmpty(dtype) || isEmpty(dept) || isEmpty(desg) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {	
		
	document.Hierarchy.XX_Time.value = time;
	document.Hierarchy.XX_Division.value =division ;
	document.Hierarchy.XX_Document_Type.value = dtype;
	document.Hierarchy.XX_Department.value = dept;
	document.Hierarchy.XX_Designation.value = desg;
	document.Hierarchy.XX_String.value = str;
	
	// var buffer = "<img src='images/ArrowRight.png' width='30' height='30' alt='arrRight'><h1>"+dept+"</h1><img src='images/right.png' width='25' height='30' alt='Right'><h1>"+desg+"</h1>";
	
	document.Hierarchy.Division_stage.value = "first";
	document.getElementById("Hierarchy").submit();
	return true;
	}
	
	}

function Div_addDesignation2fordoc(p_division,p_dtype,p_dept,p_desg,p_time) {	
	
	
	//alert("Fgf");
//	var zone=request.getParameter("XX_Zone");
//	var dtype = request.getParameter("XX_Document_Type");
//	var dept = request.getParameter("XX_Department");
//	var desg= request.getParameter("XX_Designation");
	//alert(zone+dtype+dept+desg);
	//alert("PPPP:"+p_zone+p_dtype+p_dept+p_desg);
//	var zone = document.getElementById("pzone").value;	
//	var dtype = document.getElementById("pd_type").value;
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
	
    
    if (isEmpty(xx_dept) || isEmpty(xx_desg) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {	
	
    document.Hierarchy.XX_Time.value = p_time;
    document.Hierarchy.XX_Division.value =p_division ;
	document.Hierarchy.XX_Document_Type.value = p_dtype;
	document.Hierarchy.XX_Department.value = p_dept;
	document.Hierarchy.XX_Designation.value = p_desg;
	
    document.getElementById("arrow").innerHTML += buffer ;
	 document.Hierarchy.XX_String.value = desg;
	 document.Hierarchy.XX_Hierarchy.value = buffer;
	document.Hierarchy.Division_stage.value = "second";
	document.getElementById("Hierarchy").submit();
	
	return true;
	}	
}



function Div_completefordoc() {
	var div1 = document.getElementById("division");
	var div = div1.options[ div1.selectedIndex ].value;	
	
	var dtype = document.getElementById("Document_Type").value;
	//var dtype = dtype1.options[ dtype1.selectedIndex ].value;	
	
	var dept1 = document.getElementById("Department_name");
	var dept = dept1.options[ dept1.selectedIndex ].value;	
	
	var desg1 = document.getElementById("designation_RVNL");
	var desg = desg1.options[ desg1.selectedIndex ].value;	
	
	var time = document.getElementById("EstimatedTime").value;
	
	if (isEmpty(div) || isEmpty(dtype) || isEmpty(dept) || isEmpty(desg) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {	
	 
	 document.Hierarchy.XX_Time.value = time;
	 document.Hierarchy.XX_InitDivision.value = div;
	 document.Hierarchy.XX_InitDocument_Type.value = dtype;
	 document.Hierarchy.XX_InitDepartment.value = dept;
	 document.Hierarchy.XX_InitDesignation.value = desg;
	
	document.Hierarchy.Division_stage.value = "complete";
	document.getElementById("Hierarchy").submit();
	
	return true;
	}
} 

function Div_complete2fordoc(str,division,dtype,p_time) {
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
	
	document.Hierarchy.XX_Time.value = p_time;
	 document.Hierarchy.XX_FinalString.value = str;
	 document.Hierarchy.XX_FinalDivision.value = division;
	 document.Hierarchy.XX_FinalDtype.value = dtype;
	document.Hierarchy.Division_stage.value = "complete2";
	document.getElementById("Hierarchy").submit();
	return true;
		}
}

function Nav2_ZoneHierarchy() {
	var doc_id = document.getElementById("DOC_ID").value;
	var z_Str = document.getElementById("Z_STR").value;
	var docType = document.getElementById("DOC_TYPE").value;

	document.Hierarchy.DOC_ID.value =doc_id;
	document.Hierarchy.Z_STR.value =z_Str;
	document.Hierarchy.DOC_TYPE.value =docType;
	
	document.Hierarchy.Division_stage.value="zones";

	document.getElementById("Hierarchy").submit();
	
}

function Div_completeforboth() {
	var div1 = document.getElementById("division");
	var div = div1.options[ div1.selectedIndex ].value;	
	
	var dtype = document.getElementById("Document_Type").value;
	//var dtype = dtype1.options[ dtype1.selectedIndex ].value;	
	
	var dept1 = document.getElementById("Department_name");
	var dept = dept1.options[ dept1.selectedIndex ].value;	
	
	var desg1 = document.getElementById("designation");
	var desg = desg1.options[ desg1.selectedIndex ].value;	
	
	var time = document.getElementById("EstimatedTime").value;
	
	if (isEmpty(div) || isEmpty(dtype) || isEmpty(dept) || isEmpty(desg) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {	
		//var type1=document.getElementById("XX_Type").value;
		
	//	document.Hierarchy.XX_Type.value = type1;
		//document.Hierarchy.XX_Stage.value = "first";
		
		
	 document.Hierarchy.XX_Time.value = time;
	 document.Hierarchy.XX_InitDivision.value = div;
	 document.Hierarchy.XX_InitDocument_Type.value = dtype;
	 document.Hierarchy.XX_InitDepartment.value = dept;
	 document.Hierarchy.XX_InitDesignation.value = desg;
	
	document.Hierarchy.Division_stage.value = "complete";
	document.getElementById("Hierarchy").submit();
	
	return true;
	}
} 


function sendto(doc_id)  {
/*document.Hierarchy.doc_id.value = doc_id;
document.getElementById("Hierarchy").submit();
*/
		///alert(dileep);
    var url = "http://localhost:8080/RVNLDocumentPortal/Admin/Approval.jsp";
    window.location.replace(url);
    
}


