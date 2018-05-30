
function goBack() {	
    window.history.back();
}

var xmlHttp

var xmlHttp2
function showDesg(str1) {
	var str = encodeURIComponent(str1);
	
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp2 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp2 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Designation.jsp";
	
	url += "?type=" + str;
	xmlHttp2.onreadystatechange = DesgChange;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
	
	
}
function DesgChange() {
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById("designation").innerHTML = xmlHttp2.responseText
	}
}

var xmlHttp3
function showDivisions(str1) {
	var str = encodeURIComponent(str1);
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp3 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp3 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp3 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Divisions_checkBox.jsp";
	var z="Zone1";
	url += "?cont=" + str+"&zone="+z;
	xmlHttp3.onreadystatechange = stateChanges;
	xmlHttp3.open("GET", url, true);
	xmlHttp3.send(null);
	
	
}
function stateChanges() {
	if (xmlHttp3.readyState == 4 || xmlHttp3.readyState == "complete") {
		document.getElementById("state").innerHTML = xmlHttp3.responseText
	}
}

function showDivisions2(str1) {
	var str = encodeURIComponent(str1);
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp3 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp3 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp3 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Divisions_checkBox.jsp";
	var z="Zone2";
	url += "?cont=" + str+"&zone="+z;
	xmlHttp3.onreadystatechange = stateChanges2;
	xmlHttp3.open("GET", url, true);
	xmlHttp3.send(null);
	
	
}
function stateChanges2() {
	if (xmlHttp3.readyState == 4 || xmlHttp3.readyState == "complete") {
		document.getElementById("state2").innerHTML = xmlHttp3.responseText
	}
}

var index1;
var index2;




var xmlHttp
function showEDPIU(str1) {
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
	var url = "ED_PIU.jsp";
	
	url += "?Desg=" + str;
	xmlHttp.onreadystatechange = ED_DesgChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
	
	
}
function ED_DesgChange() {
	
	if (xmlHttp3.readyState == 4 || xmlHttp3.readyState == "complete") {
		document.getElementById("ED_PIU_Div").innerHTML = xmlHttp3.responseText
	}
}
var ind;
function showuser(designation1,index){
	var designation = encodeURIComponent(designation1);
	var name="Department_RVNL"+index;
	var Dept1 = document.getElementById(name);
	var Dept2 =Dept1.options[ Dept1.selectedIndex ].value;	
	var Dept = encodeURIComponent(Dept2);
	ind=index;
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp2 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp2 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}

	var url = "Cproject_user.jsp";

	url += "?desg="+designation+"&Dept="+Dept+"&index="+index;
	xmlHttp2.onreadystatechange = ProjectIncharge_Cproject1;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
		


	
	
}





function ProjectIncharge_Cproject1(){
	var name="projectinChargediv"+ind;
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById(name).innerHTML = xmlHttp2.responseText
	}
	
}




