/*
function showDivisionspackage(str,index) {
	showDivisionspackagesub1(str,index);
	showDivisionspackagesub2(str,index);
	
}
var xmlHttp1;
function showDivisionspackagesub1(str,index){
	index1=index;
	if (typeof XMLHttpRequest != "undefined") {
		
		
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Divisions_checkBoxPackage.jsp";
	var z="Zone1";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=1";
	xmlHttp.onreadystatechange = stateChangespackage;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
	
}
//var xmlHttp2
function showDivisionspackagesub2(str,index){
	index1=index;
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp1 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp1 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp1 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Divisions_checkBoxPackage.jsp";
	var z="Zone1";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=1";
	xmlHttp1.onreadystatechange = stateChangespackage;  // need to be changed for another dropdown
	xmlHttp1.open("GET", url, true);
	xmlHttp1.send(null);
	
}


function stateChangespackage() {
	var divid="state"+index1;
alert("printing id-----"+divid);
	if (xmlHttp1.readyState == 4 || xmlHttp1.readyState == "complete") {
		document.getElementById(divid).innerHTML = xmlHttp1.responseText
	}
}



function showDivisions2package(str,index) {
	index2=index;
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp== null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Divisions_checkBoxPackage.jsp";
	var z="Zone2";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=2";
	xmlHttp.onreadystatechange = stateChanges2package;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
//	var piu=document.getElementById('piuid1');
//	var url1 = "zone2inner.jsp";
//	var z1="Zonetwo"+index;
//	url1 += "?cont=" + piu+"&zone="+z1+"&index="+index+"&id=2";
//	xmlHttp2.onreadystatechange = stateChanges2package;
//	xmlHttp2.open("GET", url1, true);
//	xmlHttp2.send(null);
	
}
function stateChanges2package() {
	var divid="state2"+index2;
alert("for second-----"+divid);
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById(divid).innerHTML = xmlHttp.responseText
	}
}*/
//------------------------------------------------------------------------------------------------------------------------------------------------





function showDivisionspackage(str,index) {
	showDivisionspackagesub1(str,index);
	showDivisionspackagesub2(str,index);
	
}
var xmlHttp44;
function showDivisionspackagesub1(str1,index){
	var str = encodeURIComponent(str1);
	index1=index;
	if (typeof XMLHttpRequest != "undefined") {
		
		
		xmlHttp44 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp44 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp44 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Divisions_checkBoxPackage.jsp";
	var z="Zone1";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=1";
	xmlHttp44.onreadystatechange = stateChangespackage;
	xmlHttp44.open("GET", url, true);
	xmlHttp44.send(null);
	
}
var xmlHttp2
function showDivisionspackagesub2(str1,index,test){
	var str = encodeURIComponent(str1);
	index1=index;
	var t=test;
	
	 xmlHttp2= "xmlHttp2"+t;
	 
	if (typeof XMLHttpRequest != "undefined") {
		
		xmlHttp2 = new XMLHttpRequest();
		
	} else if (window.ActiveXObject) {
		xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
		
	}
	if (xmlHttp2 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	
	var url = "Divisions_checkBoxPackage.jsp";
	var z="Zone1";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=1";
	xmlHttp2.onreadystatechange = stateChangespackage;  // need to be changed for another dropdown
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
	
}

var xmlHttp22
function stateChangespackage() {
	var divid="state"+index1;
	//var j=test;
	//xmlHttp22= "xmlHttp22"+t;
alert("printing id-----0000000000000"+xmlHttp22);
	if (xmlHttp22.readyState == 4 || xmlHttp22.readyState == "complete") {
		xmlHttp22.getElementById(divid).innerHTML = xmlHttp22.responseText
	}
}


var xmlHttp
function showDivisions2package(str1,index,test) {
	var str = encodeURIComponent(str1);
	index2=index;
	var t=test;
	xmlHttp="xmlHttp"+t;
	//alert("test-------"+xmlHttp);
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp== null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Divisions_checkBoxPackage.jsp";
	var z="Zone2";
	url += "?cont=" + str+"&zone="+z+"&index="+index+"&id=2";
	xmlHttp.onreadystatechange = stateChanges2package;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
//	var piu=document.getElementById('piuid1');
//	var url1 = "zone2inner.jsp";
//	var z1="Zonetwo"+index;
//	url1 += "?cont=" + piu+"&zone="+z1+"&index="+index+"&id=2";
//	xmlHttp2.onreadystatechange = stateChanges2package;
//	xmlHttp2.open("GET", url1, true);
//	xmlHttp2.send(null);
	
}
function stateChanges2package() {
	var divid="state2"+index2;
	//var j=test;
	//xmlHttp="xmlHttp"+j;
alert("for second-----"+divid);
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById(divid).innerHTML = xmlHttp.responseText
	}
}

