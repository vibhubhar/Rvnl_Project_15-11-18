/*var xmlHttp2;
function divisionChange() {
	
	var Dept1 = document.getElementById("Department_name");
	var Dept =Dept1.options[ Dept1.selectedIndex ].value;	

	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp2 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp2 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}

	var url = "Designation_c_user.jsp";

	url += "?Dept=" + Dept;
	xmlHttp2.onreadystatechange = DesginChange;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
}
	
function DesginChange(){
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById("DesgDiv_RVNL1").innerHTML = xmlHttp2.responseText
	}
} */

function showDepartment_DT(str1) {
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
	var url = "Document_dept.jsp";
	
	url += "?dtype=" + str;
	xmlHttp.onreadystatechange = docChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);	
}
function docChange() {
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("DepartmentsDiv").innerHTML = xmlHttp.responseText
	}
}

	



