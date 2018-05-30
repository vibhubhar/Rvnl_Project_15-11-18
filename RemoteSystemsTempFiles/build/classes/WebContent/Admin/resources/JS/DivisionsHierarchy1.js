function isEmpty(str) {
	
	if (str == null || str == "" || str == "-1" ||str == "none"){
		return true;
	}else{
	
	return false;
	}
}

function Div_addDesignation() {	
	
	var division1 = document.getElementById("division");
	var division = division1.options[ division1.selectedIndex ].value;
	var dtype1 = document.getElementById("Document_Type") ;
	var dtype = dtype1.options[ dtype1.selectedIndex ].value;	
	var dept1 = document.getElementById("Department_name");
	var dept = dept1.options[ dept1.selectedIndex ].value;
	var desg1 = document.getElementById("designation") ;
	var desg = desg1.options[ desg1.selectedIndex ].value;	
	var time = document.getElementById("EstimatedTime").value;	
	var str =dept +"~"+desg;
	
		
	
	if (isEmpty(division) || isEmpty(dtype) || isEmpty(dept) || isEmpty(desg) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {	
		
	document.DivisionHierarchy.XX_Time.value = time;
	document.DivisionHierarchy.XX_Division.value =division ;
	document.DivisionHierarchy.XX_Document_Type.value = dtype;
	document.DivisionHierarchy.XX_Department.value = dept;
	document.DivisionHierarchy.XX_Designation.value = desg;
	document.DivisionHierarchy.XX_String.value = str;
	
	// var buffer = "<img src='images/ArrowRight.png' width='30' height='30' alt='arrRight'><h1>"+dept+"</h1><img src='images/right.png' width='25' height='30' alt='Right'><h1>"+desg+"</h1>";
	
	document.DivisionHierarchy.Division_stage.value = "first";
	document.getElementById("DivisionHierarchy").submit();
	return true;
	}
	
	}

function Div_addDesignation2(p_division,p_dtype,p_dept,p_desg,p_time) {	
	
	
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
	
    
    if (isEmpty(xx_dept) || isEmpty(xx_desg) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {	
	
    document.DivisionHierarchy.XX_Time.value = p_time;
    document.DivisionHierarchy.XX_Division.value =p_division ;
	document.DivisionHierarchy.XX_Document_Type.value = p_dtype;
	document.DivisionHierarchy.XX_Department.value = p_dept;
	document.DivisionHierarchy.XX_Designation.value = p_desg;
	
    document.getElementById("arrow").innerHTML += buffer ;
	 document.DivisionHierarchy.XX_String.value = desg;
	 document.DivisionHierarchy.XX_Hierarchy.value = buffer;
	document.DivisionHierarchy.Division_stage.value = "second";
	document.getElementById("DivisionHierarchy").submit();
	
	return true;
	}	
}


function Div_complete() {
	var div1 = document.getElementById("division");
	var div = div1.options[ div1.selectedIndex ].value;	
	
	var dtype1 = document.getElementById("Document_Type");
	var dtype = dtype1.options[ dtype1.selectedIndex ].value;	
	
	var dept1 = document.getElementById("Department_name");
	var dept = dept1.options[ dept1.selectedIndex ].value;	
	
	var desg1 = document.getElementById("designation");
	var desg = desg1.options[ desg1.selectedIndex ].value;	
	
	var time = document.getElementById("EstimatedTime").value;
	
	if (isEmpty(div) || isEmpty(dtype) || isEmpty(dept) || isEmpty(desg) || isEmpty(time) )  {		 
		alert('Please fill all the details !!');
		return false;
	}else {	
	 
	 document.DivisionHierarchy.XX_Time.value = time;
	 document.DivisionHierarchy.XX_InitDivision.value = div;
	 document.DivisionHierarchy.XX_InitDocument_Type.value = dtype;
	 document.DivisionHierarchy.XX_InitDepartment.value = dept;
	 document.DivisionHierarchy.XX_InitDesignation.value = desg;
	
	document.DivisionHierarchy.Division_stage.value = "complete";
	document.getElementById("DivisionHierarchy").submit();
	
	return true;
	}
} 

function Div_complete2(str,division,dtype,p_time) {
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
	
	document.DivisionHierarchy.XX_Time.value = p_time;
	 document.DivisionHierarchy.XX_FinalString.value = str;
	 document.DivisionHierarchy.XX_FinalDivision.value = division;
	 document.DivisionHierarchy.XX_FinalDtype.value = dtype;
	document.DivisionHierarchy.Division_stage.value = "complete2";
	document.getElementById("DivisionHierarchy").submit();
	return true;
		}
}


function DepDesgin() {

	

	var Dept1 = document.getElementById("Department_name");
	var Dept2 =Dept1.options[ Dept1.selectedIndex ].value;	
	var Dept = encodeURIComponent(Dept2);
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp2 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp2 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}

	var url = "Designation_RVNL_Hierarchy.jsp";

	url += "?Dept=" + Dept;
	xmlHttp2.onreadystatechange = DesginationChanges;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
		
	}
	function DesginationChanges() {
		
		if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
			document.getElementById("DesgDiv_RVNL").innerHTML = xmlHttp2.responseText
		}
	}






