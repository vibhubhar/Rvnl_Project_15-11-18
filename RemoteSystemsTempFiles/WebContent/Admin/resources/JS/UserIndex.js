function AddDocument(project_id,package_id,userid,zone,division)  {
	document.user_index.Divisions.value = division;
document.user_index.Zones.value = zone;
document.user_index.userid.value = userid;
document.user_index.projectid.value = project_id;
document.user_index.packageid.value = package_id;
document.getElementById("user_index").submit();
}



function GMdays1(str,str1)
{
	var name;var bla;
	var checkboxGM1=document.getElementById("GM").checked;
	var GMDivision2=document.getElementById("GMDivision").checked;  
	var Gmdays=document.getElementById("GMdays").value;  
	var GMdaysdivision=document.getElementById("GMdaysdivision").value;
	// alert("gmdays="+Gmdays+"gmdaysdivn="+GMdaysdivision);
	 if(!isEmpty(Gmdays) && !isEmpty(GMdaysdivision)){
			
			name="Both";
			Gmdays=Gmdays+"/"+GMdaysdivision;
		}
	 if(isEmpty(Gmdays) && !isEmpty(GMdaysdivision)){
		Gmdays=document.getElementById("GMdaysdivision").value;
		name="Division";
	}
	if(isEmpty(GMdaysdivision) && !isEmpty(Gmdays) ){
		 Gmdays=document.getElementById("GMdays").value;
		 name="Headquarter";
	}
	
	 if(!checkboxGM1  && (!GMDivision2)){


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
	 }
	 if((checkboxGM1 && isEmpty(Gmdays)) || (GMDivision2) && isEmpty(GMdaysdivision)){


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
	 }
	 
	 else{
		// alert("name="+name+"gmdays="+Gmdays);
		 document.Edit_Document.assigneddays.value = Gmdays;
		    document.Edit_Document.username.value = str;
			document.Edit_Document.assigneduser.value = name;
			document.Edit_Document.assigneduser1.value = str1;
			document.Edit_Document.identification.value = "first";
			document.getElementById("Edit_Document").submit();
	 }	 
	 
	 
	 
	 
	 
	 
}



function DRMdays1(str,str1,str2)
{
	
	var checkboxDRM=document.getElementById("DRM").checked;
	var DRMdays=document.getElementById("DRMdays").value;
	
	if(!checkboxDRM.checked && isEmpty(DRMdays)){
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
		}else{
			
			
			document.Edit_Document.assigneddays.value = DRMdays;
			
			document.Edit_Document.username.value = str1;
			document.Edit_Document.assigneduser.value = str;
			document.Edit_Document.assigneduser1.value = str2;
			document.Edit_Document.identification.value = "first";
			
			
			document.getElementById("Edit_Document").submit();
			
		}

}

function Railwaydays1(str)
{
	
	//alert("kaka");
	var Railwaydays=document.getElementById("Railwaydays").value;
if(isEmpty(Railwaydays)){
	 
	var $j = jQuery.noConflict();
		
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
}else{
	
	
	document.Edit_Document.assigneddays.value = Railwaydays;
	document.Edit_Document.identification.value = "first";
	document.Edit_Document.assigneduser1.value = str;
	document.Edit_Document.assigneduser.value = "MOR";
	document.Edit_Document.username.value = "Railways";
	document.getElementById("Edit_Document").submit();
}


}



