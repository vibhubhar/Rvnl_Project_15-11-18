/*
var xmlHttp
function showBasis(str) {
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "ReportBasis.jsp";
	
	url += "?Basis=" + str;
	xmlHttp.onreadystatechange = stateChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
	
	
}
function stateChange() {
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("Basis").innerHTML = xmlHttp.responseText
	}
}
*/


function GenerateReport() {
//	var basis1 = document.getElementById("Basis_type");
//	var basis = basis1.options[ basis1.selectedIndex ].value;
//	var PIU1 = document.getElementById("PIU");
//	var PIU = PIU1.options[ PIU1.selectedIndex ].value;
//	var DocType1 = document.getElementById("DocType");
//	var DocType = DocType1.options[ DocType1.selectedIndex ].value;
//	var Zone1 = document.getElementById("Zone");
//	var Zone = Zone1.options[ Zone1.selectedIndex ].value;	
//	var Division1 = document.getElementById("Division");
//	var Division = Division1.options[ Division1.selectedIndex ].value;
//	
//	
//	document.GenReport.PIU_H.value = PIU;
//	document.GenReport.DocType_H.value = DocType;
//	document.GenReport.Zone_H.value = Zone;
//	document.GenReport.Division_H.value = Division;
//	
	 //   var xmlHttp = new XMLHttpRequest();
	//    xmlHttp.open( "GET", ContinueReport.jsp, false ); // false for synchronous request
	//    xmlHttp.send( null );
	//    return xmlHttp.responseText;
	
	document.GenReport.Project_stage.value = "first";
	document.getElementById("GenReport").submit();
	
}

function showBasis(str1) {
	var str = encodeURIComponent(str1);
	var basis1 = document.getElementById("Basis_type");
	var basis = basis1.options[ basis1.selectedIndex ].value;
	
//	document.GenReport.Basis.value = basis;
	//document.GenReport.Project_stage.value = "first";
	document.getElementById("GenReport").submit();

}

function gopiureport(){
	
	var basis1 = document.getElementById("PIU_name");
	var piuname = basis1.options[ basis1.selectedIndex ].value;
	var basis2 = document.getElementById("Status");
	var status = basis2.options[ basis2.selectedIndex ].value;
	var basis3 = document.getElementById("project");
	var projects = basis3.options[ basis3.selectedIndex ].value;
	var basis4 = document.getElementById("document");
	var documents = basis4.options[ basis4.selectedIndex ].value;
	document.piureport.piuname.value=piuname;
	document.piureport.status.value=status;
	document.piureport.projects.value=projects;
	document.piureport.documents.value=documents;
    document.piureport.stage.value="next";
    document.getElementById("piureport").submit();

} 


function returnsProjects(str1) {	
	var str = encodeURIComponent(str1);
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "DisplayProjects.jsp";
	
	url += "?PIU=" + str;
	xmlHttp.onreadystatechange = PIUChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);

}
function showDivisions(str1) {
	var str = encodeURIComponent(str1);
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Divisions1.jsp";
	
	url += "?zone=" + str;
	xmlHttp.onreadystatechange = stateChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
	
	
}
function stateChange() {
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("DivsionsDiv").innerHTML = xmlHttp.responseText
	}
}


function showproject(division1) {
	var division = encodeURIComponent(division1);
	var zone1=document.getElementById("zone_name").value;
	var zone = encodeURIComponent(zone1);
	//alert(zone);
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp2 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp2 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
		var url = "Project_in.jsp?division_name="+division+"&zone_name="+zone;;

	
	xmlHttp2.onreadystatechange = ProjectChange12;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
		
	}

	function ProjectChange12() {
		
		
		
		if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
			document.getElementById("project_select").innerHTML = xmlHttp2.responseText
		}
	}
	
	
	function showprojectsss(division1,zone1) {
		var division = encodeURIComponent(division1);
		var zone = encodeURIComponent(zone1);
			
		var piu1=document.getElementById("PIU_name").value;
		var piu = encodeURIComponent(piu1);
		
		//alert("piu name"+piu);
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp2 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp2 == null) {
			alert("Browser does not support XMLHTTP Request")
			return;
		}
			var url = "Project_in.jsp?division_name="+division+"&zone_name="+zone+"&piu="+piu;

		
		xmlHttp2.onreadystatechange = ProjectChange123;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);
			
		}

		function ProjectChange123() {
			
			
			
			if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
				document.getElementById("project_select").innerHTML = xmlHttp2.responseText
			}
		}
		
	

	function showprojects(piu1) {
		var piu = encodeURIComponent(piu1);
//		
//		var zone;
//		var zone_names=document.getElementById("zone");
//		var zone_name = zone_names.options[ zone_names.selectedIndex ].value;
//		
	//alert(piu);
//		
		
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp2 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp2 == null) {
			alert("Browser does not support XMLHTTP Request")
			return;
		}
			var url = "Project_piu.jsp?PIU_of_RVNL="+piu;

		
		xmlHttp2.onreadystatechange = ProjectChange;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);
			
		}

	
	function showprojectss(piu1,zone1) {
		//alert("zone--"+zone +"piu name--"+piu);
		var zone = encodeURIComponent(zone1);
		var piu = encodeURIComponent(piu1);
		
		var division1=document.getElementById("division").value;
		var division = encodeURIComponent(division1);
		
		//alert(division);
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp2 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp2 == null) {
			alert("Browser does not support XMLHTTP Request")
			return;
		}
			var url = "projectdisplay.jsp?PIU_of_RVNL="+piu+"&zone_name="+zone+"&division="+division;
			
		
		xmlHttp2.onreadystatechange = ProjectChange1;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);
			
		}

	function ProjectChange1() {
		
		
		
		if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
			document.getElementById("project_select").innerHTML = xmlHttp2.responseText
		}
	}
	
	
	
	
	function showprojectss1(piu1) {
		var piu = encodeURIComponent(piu1);
		//var division=document.getElementById("division").value;
		//var zone=document.getElementById("zone_name").value;
		//alert("division"+division+"zone display------"+zone);
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp2 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp2 == null) {
			alert("Browser does not support XMLHTTP Request")
			return;
		}
			var url = "projectdisplay1.jsp?PIU_of_RVNL="+piu;
			//alert(url);

		
		xmlHttp2.onreadystatechange = ProjectChanges1;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);
			
		}

	function ProjectChanges1() {
		
		
		
		if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
			document.getElementById("project_select").innerHTML = xmlHttp2.responseText
		}
	}
	
	
	function showprojectssnew(piu1,zone1) {
		var zone = encodeURIComponent(zone1);
		var piu = encodeURIComponent(piu1);
		
		var division1=document.getElementById("division1").value;
		var division = encodeURIComponent(division1);
		
		//alert(division);
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp2 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp2 == null) {
			alert("Browser does not support XMLHTTP Request")
			return;
		}
			var url = "projectdisplay.jsp?PIU_of_RVNL="+piu+"&zone_name="+zone+"&division="+division;
			//alert(url);

		
		xmlHttp2.onreadystatechange = ProjectChanges1;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);
			
		}

/* function ProjectChanges1() {
		
		
		
		if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
			document.getElementById("project_select").innerHTML = xmlHttp2.responseText
		}
	}
	
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*function showprojectsss(piu) {
//	alert("showprojectsss"+piu);
//		
		
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp2 = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp2 == null) {
			alert("Browser does not support XMLHTTP Request")
			return;
		}
			var url = "projectdisplay.jsp?PIU_of_RVNL="+piu;

		
		xmlHttp2.onreadystatechange = ProjectChange1;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);
			
		}

	function ProjectChange1() {
		
		
		
		if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
			document.getElementById("project_select").innerHTML = xmlHttp2.responseText
		}
	}
	
	*/
	
	
	
		function ProjectChange() {
			
			
			
			if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
				document.getElementById("project_piu").innerHTML = xmlHttp2.responseText
			}
		}
		
		
		var xmlHttp3;
		function showzone(zone1) 	{
			var zone = encodeURIComponent(zone1);
			
			//alert("inside showzone()----"+zone);
			if (typeof XMLHttpRequest != "undefined") {
				xmlHttp3 = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				xmlHttp3 = new ActiveXObject("Microsoft.XMLHTTP");
			}
			if (xmlHttp3 == null) {
				alert("Browser does not support XMLHTTP Request")
				return;
			}
				var url = "zonedisplay.jsp?zone_name="+zone;

			
			xmlHttp3.onreadystatechange = zoneChange1;
			xmlHttp3.open("GET", url, true);
			xmlHttp3.send(null);
				
			}
		

		function zoneChange1() {
			
			
			
			if (xmlHttp3.readyState == 4 || xmlHttp3.readyState == "complete") {
				document.getElementById("project_select").innerHTML = xmlHttp3.responseText
			}
		}
		
		
		
		function showzone1(zone1) {
			var zone = encodeURIComponent(zone1);
			var piu1=document.getElementById("PIU_name").value;
			var piue = encodeURIComponent(piu1);
			//alert(piu);
			if (typeof XMLHttpRequest != "undefined") {
				xmlHttp3 = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				xmlHttp3 = new ActiveXObject("Microsoft.XMLHTTP");
			}
			if (xmlHttp3 == null) {
				alert("Browser does not support XMLHTTP Request")
				return;
			}
				var url = "zonedisplaytest.jsp?zone_name="+zone+"&piu="+piu;

			
			xmlHttp3.onreadystatechange = zoneChange11;
			xmlHttp3.open("GET", url, true);
			xmlHttp3.send(null);
				
			}
		

		function zoneChange11() {
			
			
			
			if (xmlHttp3.readyState == 4 || xmlHttp3.readyState == "complete") {
				document.getElementById("project_select").innerHTML = xmlHttp3.responseText
			}
		}
		
		
		
		
		
		
		var xmlHttp37;
		function showpiu(zone1) {
			var zone = encodeURIComponent(zone1);
		//alert("inside showpiu()---"+zone);
			if (typeof XMLHttpRequest != "undefined") {
				xmlHttp37 = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				xmlHttp37 = new ActiveXObject("Microsoft.XMLHTTP");
			}
			if (xmlHttp37 == null) {
				alert("Browser does not support XMLHTTP Request")
				return;
			}
				var url = "piudisplay.jsp?PIU_of_RVNL="+zone;

			
				xmlHttp37.onreadystatechange = zoneChange111_121;
				xmlHttp37.open("GET", url, true);
				xmlHttp37.send(null);
				
			}
		

		function zoneChange111_121() {
			
			
			
			if (xmlHttp37.readyState == 4 || xmlHttp37.readyState == "complete") {
				document.getElementById("piuid").innerHTML = xmlHttp37.responseText
			}
		}
		
		
		
		var xmlHttp22;
		function showpiu22(zone1) {
			var zone = encodeURIComponent(zone1);
		
			if (typeof XMLHttpRequest != "undefined") {
				xmlHttp22 = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				xmlHttp22 = new ActiveXObject("Microsoft.XMLHTTP");
			}
			if (xmlHttp22 == null) {
				alert("Browser does not support XMLHTTP Request")
				return;
			}
				var url = "piudisplay22.jsp?PIU_of_RVNL="+zone;

			
			xmlHttp22.onreadystatechange = zoneChangepiu22;
			xmlHttp22.open("GET", url, true);
			xmlHttp22.send(null);
				
			}
		

		function zoneChangepiu22() {
			
			
			
			if (xmlHttp22.readyState == 4 || xmlHttp22.readyState == "complete") {
				document.getElementById("piuid").innerHTML = xmlHttp22.responseText
			}
		}
		
		
		
		
		var xmlHttp23;
		function showpiu1(zone1) {
			var zone = encodeURIComponent(zone1);
			//alert("inside showpiu()---"+zone);
			if (typeof XMLHttpRequest != "undefined") {
				xmlHttp23 = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				xmlHttp23 = new ActiveXObject("Microsoft.XMLHTTP");
			}
			if (xmlHttp23 == null) {
				alert("Browser does not support XMLHTTP Request")
				return;
			}
				var url = "piudisplay1.jsp?PIU_of_RVNL="+zone;

			
				xmlHttp23.onreadystatechange = zoneChange111_12;
				xmlHttp23.open("GET", url, true);
				xmlHttp23.send(null);
				
			}
		

		function zoneChange111_12() {
			
			
			
			if (xmlHttp23.readyState == 4 || xmlHttp23.readyState == "complete") {
				document.getElementById("piuid").innerHTML = xmlHttp23.responseText
			}
		}
		
		
		
		
		
		
		
		
		function showDocument(packageid) {
						
			if (typeof XMLHttpRequest != "undefined") {
				xmlHttp2 = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
			}
			if (xmlHttp2 == null) {
				alert("Browser does not support XMLHTTP Request")
				return;
			}
				var url = "showDocument.jsp?package_id="+packageid;

			
			xmlHttp2.onreadystatechange = ProjectChange11;
			xmlHttp2.open("GET", url, true);
			xmlHttp2.send(null);
				
			}

			function ProjectChange11() {
				
				
				
				if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
					document.getElementById("document").innerHTML = xmlHttp2.responseText
				}
			}
		
		
			function validateDocument(){
				//var ApprovalDate1=document.getElementById("ApprovalDate");
				
				var userid=document.getElementById("userId").value;
				var Project_names=document.getElementById("Project_name");
				var Project_name = Project_names.options[ Project_names.selectedIndex ].value;	
				//var documents1=document.getElementById("documents");
				//var documents = documents1.options[ documents1.selectedIndex ].value;
				
				var docid="";
				var radios = document.getElementsByName('pullbackrec');

				for (var i = 0, length = radios.length; i < length; i++) {
				    if (radios[i].checked) {
				        
				    	docid=radios[i].value;

				        break;
				    }
				}
				if(docid==""){
					// please select any document
					 
					 $j=jQuery.noConflict();
						
					 var dialogid="#dialogid1";
					 
					 $j(dialogid).dialog({
				        modal: true,
				        autoOpen: false,
				        title: "Alert",
				        width: 400,
				        height: 200
				    });
					 
					  $j(dialogid1).dialog('open');
		               return false;
					
					
					
				}else{
					var pullbackdate="";
					var idfordate="ApprovalDate"+docid;
					pullbackdate=document.getElementById(idfordate).value;
					if(pullbackdate==""){
						 
						 //jQuery.noConflict();
							
						 var dialogid="#dialogid";
						 
						 $j(dialogid).dialog({
					        modal: true,
					        autoOpen: false,
					        title: "Alert",
					        width: 400,
					        height: 200
					    });
						 
						  $j(dialogid).dialog('open');
			               return false;
						
						
					}else{
						var url="pullbackmessage.jsp?docid="+docid;
						window.open(url,this.target, 
							       'width=500,height=300,scrollbars=yes,top=500px,left=500px');
						
						document.Add_Document.pulldate.value=pullbackdate;
						document.Add_Document.docid.value=docid;
						//alert(pullbackdate);
						document.Add_Document.userid_1.value=userid;
						document.Add_Document.projectid.value=Project_name;
						document.getElementById("Add_Document").submit();
						
					}
					
				}
				
				//alert(docid);
				//
				//var pullbackdate=document.getElementById(idfordate).value;
				
			}
			
			var xmlHttpdiv2;
			function showDivision22(str1) {
				var str = encodeURIComponent(str1);
				 //alert("showdivision--"+str);
								if (typeof XMLHttpRequest != "undefined") {
									xmlHttpdiv2 = new XMLHttpRequest();
								} else if (window.ActiveXObject) {
									xmlHttpdiv2 = new ActiveXObject("Microsoft.XMLHTTP");
								}
								if (xmlHttpdiv2 == null) {
									alert("Browser does not support XMLHTTP Request")
									return;
								}
								var url = "showDivision22.jsp";
								
								url += "?zone=" + str;
								xmlHttpdiv2.onreadystatechange = showdivisioniner222;
								xmlHttpdiv2.open("GET", url, true);
								xmlHttpdiv2.send(null);
								
								
							}
							function showdivisioniner222() {
								if (xmlHttpdiv2.readyState == 4 || xmlHttpdiv2.readyState == "complete") {
									document.getElementById("DivisionsDiv").innerHTML = xmlHttpdiv2.responseText
								}
							}

							
			var xmlHttpdiv;				
			function showDivision(str1) {
				var str = encodeURIComponent(str1);
 //alert("showdivision--"+str);
				var zone1 = document.getElementById("zone").value;
				var zone = encodeURIComponent(zone1);
				//alert(zone);
				if (typeof XMLHttpRequest != "undefined") {
					xmlHttpdiv = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					xmlHttpdiv = new ActiveXObject("Microsoft.XMLHTTP");
				}
				if (xmlHttpdiv == null) {
					alert("Browser does not support XMLHTTP Request")
					return;
				}
				var url = "Divisions.jsp";
				
				url += "?zone=" + str+"&zonemain="+zone;;
				xmlHttpdiv.onreadystatechange = showdivisioniner;
				xmlHttpdiv.open("GET", url, true);
				xmlHttpdiv.send(null);
				
				
			}
			function showdivisioniner() {
				if (xmlHttpdiv.readyState == 4 || xmlHttpdiv.readyState == "complete") {
					document.getElementById("DivsionsDiv").innerHTML = xmlHttpdiv.responseText
				}
			}

			var xmlHttp221;
			function showProjectsfrmzone(zone1){
				var zone = encodeURIComponent(zone1);
				var division1=document.getElementById("division").value;
				var division = encodeURIComponent(division1);
				if (typeof XMLHttpRequest != "undefined") {
					xmlHttp221 = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					xmlHttp221 = new ActiveXObject("Microsoft.XMLHTTP");
				}
				if (xmlHttp221 == null) {
					alert("Browser does not support XMLHTTP Request")
					return;
				}
				
				var Piu_names=document.getElementById("PIU_name");
				var Piu_name1 = Piu_names.options[ Piu_names.selectedIndex ].value;
				var Piu_name = encodeURIComponent(Piu_name1);
				
				
				var url = "Project_piu.jsp?PIU_of_RVNL="+Piu_name+"&Zone="+zone+"&division="+division;

				
				xmlHttp221.onreadystatechange = showprojectsfrmzoneinner;
				xmlHttp221.open("GET", url, true);
				xmlHttp221.send(null);
								
			}
			
			
			
			function showprojectsfrmzoneinner(){
				
				if (xmlHttp221.readyState == 4 || xmlHttp221.readyState == "complete") {
					document.getElementById("project_select").innerHTML = xmlHttp221.responseText
				}
			}
			
			function doubleupdateinzone(zone){
				showDivision(zone);
				showProjectsfrmzone(zone);
				showpiu(zone);
				//alert("reached in place");
			}
			
			
			function test(zone,division,piu,project,doctype)
			{
				//alert(zone);
				//var $j=jQuery.noConflict();
				
				//var status = document.getElementById(status).value;
			//	var DateStart = document.getElementById(DateStart).value;
				//var DateEnd = document.getElementById(DateEnd).value;
				//alert(Approvaldate);
				
					document.final_approve.stage.value="first";
					document.final_approve.zonename.value=zone;
					document.final_approve.divisionname.value=division;
					document.final_approve.piuname.value=piu;
					document.final_approve.projectname.value=project;
					document.final_approve.docname.value=doctype;
					document.final_approve.status1.value=status;
					document.final_approve.DateStart1.value=DateStart;
					document.final_approve.DateEnd1.value=DateEnd;
					document.getElementById("final_approve").submit();
					
			}

			
			function formsubmitreport()
			{
				var ans="y";
				var t1 = parseInt(document.getElementById("t1").value);
				var t2 = parseInt(document.getElementById("t2").value);
				if (t1<1 || t1>999 || t2<1 || t2>999) {
					//alert("warning... time period limits should be between 1 and 999."+t1+t2);
					ans="n";
					 var dialogid="#dialogid2";
				}
				if (t2 < t1 ) {
					//alert("Warning... ."+t1+" t2: "+t2);
					ans="n";
					 var dialogid="#dialogid3";
				}
				
				
				var project = document.getElementById("project1").value;
				 //alert("myradio="+$("input[name$='myRadios']:checked").val());
				if (isEmpty(project) && $("input[name$='myRadios']:checked").val()=="4") {
					//jQuery.noConflict();
					ans="n";
					 var dialogid="#dialogid1";
				} 
				if (ans=="n") {
					 $j(dialogid).dialog({
				        modal: true,
				        autoOpen: false,
				        title: "Alert",
				        width: 400,
				        height: 200
				    });
					 
					  $j(dialogid).dialog('open');
			         return false;
				} else {

					document.getElementById("piureport").submit();
					return true;
				
				}
					
			}
			
			function reportzonechange(zone){
				showDivision(zone);
				
				showpiu(zone);
				showzone(zone);
				//alert(zone);
				
			}
			
			
			function reportzonechange22(zone){
				showDivision(zone);
				
				showpiu(zone);
				showzone1(zone);
				//alert(zone);
				
			}
			
			function reportzonechange1(zone){
				showDivision(zone);
				
				showpiu22(zone);
				showzone(zone);
				//alert(zone);
				
			}
			
			
			function showprojectspk() {
				//alert("hello pk project show..");
				disablekm_Report("none",1);
				$("#Majsec").val(null);
				$("#sMajsec").val(null);
				disablekm_Report("none",3);
				$("#loctype").hide();
				if (document.getElementById("PIU_name")!=null) {
				var piu1 = document.getElementById("PIU_name");
				var piu2 = piu1.options[ piu1.selectedIndex ].value;
				var piu = encodeURIComponent(piu2);
				} else {piu="";}
				if (document.getElementById("zone")!=null) {
				var zone1 = document.getElementById("zone");
				var zone2 = zone1.options[ zone1.selectedIndex ].value;
				var zone = encodeURIComponent(zone2);
				} else {zone="";}
				if (document.getElementById("division1")!=null) {
				var div1 = document.getElementById("division1");
				var division1 = div1.options[ div1.selectedIndex ].value;
				var division = encodeURIComponent(division1);
			} else {division="";}
				if (document.getElementById("proj_type")!=null) {
					var proj_type1 = document.getElementById("proj_type");
					var proj_type2 = proj_type1.options[ proj_type1.selectedIndex ].value;
					var proj_type = encodeURIComponent(proj_type2);
					} else {proj_type="";}
					
				//alert("1. division"+division+"2. zone dispaly------"+zone+"3. piu--"+piu+"4. project type--"+proj_type);
				if (typeof XMLHttpRequest != "undefined") {
					xmlHttp2 = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
				}
				if (xmlHttp2 == null) {
					alert("Browser does not support XMLHTTP Request");
					return;
				}
				
			
				var url = "projectdisplay.jsp?PIU_of_RVNL="+piu+"&zone_name="+zone+"&division="+division+"&proj_type="+proj_type;
					//alert(url);

				
				xmlHttp2.onreadystatechange = ProjectChanges99;
				xmlHttp2.open("GET", url, true);
				xmlHttp2.send(null);
					
				}
			function showprojectspkzonechange() {
				//alert("heloo pk projet zone change..");
				disablekm_Report("none",1);
				$("#Majsec").val(null);
				$("#sMajsec").val(null);
				disablekm_Report("none",3);
				$("#loctype").hide();
				if (document.getElementById("PIU_name")!=null) {
				var piu1 = document.getElementById("PIU_name");
				var piu2 = piu1.options[ piu1.selectedIndex ].value;
				var piu = encodeURIComponent(piu2);
				} else {piu="";}
				if (document.getElementById("zone")!=null) {
				var zone1 = document.getElementById("zone");
				var zone2 = zone1.options[ zone1.selectedIndex ].value;
				var zone = encodeURIComponent(zone2);
				} else {zone="";}
				var division = "";
				if (document.getElementById("proj_type")!=null) {
					var proj_type1 = document.getElementById("proj_type");
					var proj_type2 = proj_type1.options[ proj_type1.selectedIndex ].value;
					var proj_type = encodeURIComponent(proj_type2);
					} else {proj_type="";}
				//alert("2. division"+division+"zone display------"+zone+"piu--"+piu);
				if (typeof XMLHttpRequest != "undefined") {
					xmlHttp2 = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
				}
				if (xmlHttp2 == null) {
					alert("Browser does not support XMLHTTP Request")
					return;
				}
				
			
				var url = "projectdisplay.jsp?PIU_of_RVNL="+piu+"&zone_name="+zone+"&division="+division+"&proj_type="+proj_type;
					//alert(url);

				
				xmlHttp2.onreadystatechange = ProjectChanges99;
				xmlHttp2.open("GET", url, true);
				xmlHttp2.send(null);
					
				}

			
			function ProjectChanges99() {
				//alert("xml"+xmlHttp2.readyState);
				if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
					document.getElementById("project_select").innerHTML = xmlHttp2.responseText
				//	alert("Project Display- 99");
				}
			}
			

			function showuserspk() {
				if (document.getElementById("PIU_name")!=null) {
				var piu1 = document.getElementById("PIU_name");
				var piu2 = piu1.options[ piu1.selectedIndex ].value;
				var piu = encodeURIComponent(piu2);
				} else {piu="";}
				if (document.getElementById("zone")!=null) {
				var zone1 = document.getElementById("zone");
				var zone2 = zone1.options[ zone1.selectedIndex ].value;
				var zone = encodeURIComponent(zone2);
				} else {zone="";}
				if (document.getElementById("division1")!=null) {
				var div1 = document.getElementById("division1");
				var division1 = div1.options[ div1.selectedIndex ].value;
				var division = encodeURIComponent(division1);
			} else {division="";}
				//alert("1. division"+division+"2. zone dispaly------"+zone+"3. piu--"+piu);
				if (typeof XMLHttpRequest != "undefined") {
					xmlhttp3 = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					xmlhttp3 = new ActiveXObject("Microsoft.XMLHTTP");
				}
				if (xmlhttp3 == null) {
					alert("Browser does not support XMLHTTP Request");
					return;
				}
				
			
				var url = "User_display.jsp?PIU_of_RVNL="+piu+"&zone_name="+zone+"&division="+division;
					//alert(url);

				
				xmlhttp3.onreadystatechange = UserChanges1;
				xmlhttp3.open("GET", url, true);
				xmlhttp3.send(null);
					
				}
			
			function showuserspkzonechange() {
				//alert("heloo pk user zone change..");
				
				if (document.getElementById("PIU_name")!=null) {
				var piu1 = document.getElementById("PIU_name");
				var piu2 = piu1.options[ piu1.selectedIndex ].value;
				var piu = encodeURIComponent(piu2);
				} else {piu="";}
				if (document.getElementById("zone")!=null) {
				var zone1 = document.getElementById("zone");
				var zone2 = zone1.options[ zone1.selectedIndex ].value;
				var zone = encodeURIComponent(zone2);
				} else {zone="";}
				var division = "";
				
				//alert("2. division"+division+"zone display------"+zone+"piu--"+piu);
				if (typeof XMLHttpRequest != "undefined") {
					xmlhttp3 = new XMLHttpRequest();
				} else if (window.ActiveXObject) {
					xmlhttp3 = new ActiveXObject("Microsoft.XMLHTTP");
				}
				if (xmlhttp3 == null) {
					alert("Browser does not support XMLHTTP Request")
					return;
				}
				
			
				var url = "User_display.jsp?PIU_of_RVNL="+piu+"&zone_name="+zone+"&division="+division;
					//alert(url);

				
				xmlhttp3.onreadystatechange = UserChanges1;
				xmlhttp3.open("GET", url, true);
				xmlhttp3.send(null);
						 
				}
			
			function UserChanges1() {
				
							
				if (xmlhttp3.readyState == 4 || xmlhttp3.readyState == "complete") {
					document.getElementById("UserDiv").innerHTML = xmlhttp3.responseText
					   if (document.getElementById("Detailed").checked==true) {
			    	   	 var style2 = {'background-color':'white', 'text-shadow': ''};
			    	   	$("#suser").prop("disabled",false); $("#suser").css(style2);
			    	   	  	 } else {
			        		 var style3 = {'background-color':'rgb(235,235,228)', 'text-shadow': '1px 1px white'};
			        			 $("#suser").prop("disabled",true); $("#suser").css(style3);
			               	 }  	  
				}
			}

			
			