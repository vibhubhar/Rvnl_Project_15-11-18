var xmlHttp
var xmlHttpmy
var xmlHttp2my
var ind
function showDeptmy(str1,index) {
	var str = encodeURIComponent(str1);
	ind=index;
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttpmy = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttpmy = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttpmy == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "Departments_RVNL_my.jsp";
	
	url += "?PIU=" + str+"&id="+index;
	xmlHttpmy.onreadystatechange = DeptChangemy;
	xmlHttpmy.open("GET", url, true);
	xmlHttpmy.send(null);
	
	
}
function showDept(str1) {
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
	var url = "Departments_RVNL.jsp";
	
	url += "?PIU=" + str;
	xmlHttp.onreadystatechange = DeptChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
	
	
}

function DeptChangemy(){
	
	var te="DeptDiv_RVNL"+ind;

	
	if (xmlHttpmy.readyState == 4 || xmlHttpmy.readyState == "complete") {
		
		document.getElementById(te).innerHTML = xmlHttpmy.responseText
	}
}

function DeptChange() {
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("DeptDiv_RVNL").innerHTML = xmlHttp.responseText
	}
}

var xmlHttp2
var ind1

function showDesginmy(index) {
	
	var te="PIU_name"+index;
ind1=index;
var PIU1 = document.getElementById(te);
var PIU2 =PIU1.options[ PIU1.selectedIndex ].value;	
var PIU = encodeURIComponent(PIU2);
var de ="Department_RVNL"+index;

var Dept1 = document.getElementById(de);
var Dept2 =Dept1.options[ Dept1.selectedIndex ].value;	
var Dept = encodeURIComponent(Dept2);
if (typeof XMLHttpRequest != "undefined") {
	xmlHttp2my = new XMLHttpRequest();
} else if (window.ActiveXObject) {
	xmlHttp2my = new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp2my == null) {
	alert("Browser does not support XMLHTTP Request")
	return;
}

var url = "Designation_RVNL_my.jsp";

url += "?PIU=" + PIU + "&Dept=" + Dept+"&id="+index;

xmlHttp2my.onreadystatechange = DesginChangemy;
xmlHttp2my.open("GET", url, true);
xmlHttp2my.send(null);

}

var idxX;
function showDesgin(index) {

//var PIU1 = document.getElementById("PIU_name");
//var PIU =PIU1.options[ PIU1.selectedIndex ].value;	

var name="Department_RVNL"+index;
var Dept1 = document.getElementById(name);
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
idxX=index;
var url = "Designation_RVNL.jsp";

url += "?PIU=" + 1 + "&Dept=" + Dept+"&Index="+index;
xmlHttp2.onreadystatechange = DesginChange;
xmlHttp2.open("GET", url, true);
xmlHttp2.send(null);
	
}

function DesginChange() {
	
	
	var name="DesgDiv_RVNL"+idxX;
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById(name).innerHTML = xmlHttp2.responseText
	}
}


function DesginChangemy() {	
		
	if (xmlHttp2my.readyState == 4 || xmlHttp2my.readyState == "complete") {
		document.getElementById("DesgDiv_RVNL"+ind1).innerHTML = xmlHttp2my.responseText
	}
}


function showDept1(str1) {
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
	var url = "DeptDiv_RVNLProj.jsp";
	
	url += "?PIU=" + str;
	xmlHttp.onreadystatechange = DeptChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
	
	
}

function showDesgin1() {
	var PIU1 = document.getElementById("PIU_name");
	var PIU2 =PIU1.options[ PIU1.selectedIndex ].value;	
	var PIU = encodeURIComponent(PIU2);
	var Dept1 = document.getElementById("Department_RVNL");
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

	var url = "DesgDiv_RVNLProj.jsp";

	url += "?PIU=" + PIU + "&Dept=" + Dept;
	xmlHttp2.onreadystatechange = DesginChange1;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
		
	}

function DesginChange1() {
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById("DesgDivRVNL").innerHTML = xmlHttp2.responseText
	}
}


function returnProjects(str1) {	
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
	var url = "SearchProjects.jsp";

	url += "?PIU=" + str;
	xmlHttp.onreadystatechange = PIUChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);

}
function PIUChange() {
	
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("ProjectList").innerHTML = xmlHttp.responseText
	}
}
function returnProjectsType(str1) {	
	var str = encodeURIComponent(str1);
	var PIU1 = document.getElementById("PIU_name");
	var PIU2 =PIU1.options[ PIU1.selectedIndex ].value;
	var PIU = encodeURIComponent(PIU2);
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "SearchProjectsType.jsp";
	
	url += "?PROJECTS=" + str+"&piu="+PIU;
	xmlHttp.onreadystatechange = Project_Type;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
		
	
}
function Project_Type() {
	
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("ProjectList").innerHTML = xmlHttp.responseText
	}
}


function returnProjectslocal(str1) {	
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
	var url = "searchprojectlocal.jsp";

	url += "?PIU=" + str;
	xmlHttp.onreadystatechange = PIUChangelocal;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);

}
function PIUChangelocal() {
	
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("ProjectList").innerHTML = xmlHttp.responseText
	}
}
function returnProjectsTypelocal(str1) {	
	var str = encodeURIComponent(str1);
	var PIU1 = document.getElementById("PIU_name");
	var PIU2 =PIU1.options[ PIU1.selectedIndex ].value;
	var PIU = encodeURIComponent(PIU2);
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	var url = "searchprojecttypelocal.jsp";
	
	url += "?PROJECTS=" + str+"&piu="+PIU;
	xmlHttp.onreadystatechange = Project_Typelocal;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
		
	
}
function Project_Typelocal() {
	
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("ProjectList").innerHTML = xmlHttp.responseText
	}
}




function openPopUp(project_name1,piu1)
{
	var project_name = encodeURIComponent(project_name1);
	var piu = encodeURIComponent(piu1);
	var w = 700;
	var h = 400;
	var winl = (screen.width-w)/2;
	var wint = (screen.height-h)/2;
	if (winl < 0) winl = 0;
	if (wint < 0) wint = 0;

	var page = "popup.jsp?Project_n="+project_name+"&piu="+piu;
	windowprops = "height="+h+",width="+w+",top="+ wint +",left="+ winl +",location=no,"
	+ "scrollbars=yes,menubars=no,toolbars=no,resizable=no,status=yes";
	window.open(page, "Popup", windowprops);
}

function showDeptUnderList(str1) {
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
	var url = "ShowUsers.jsp";
	
	url += "?PIU=" + str;
	xmlHttp.onreadystatechange = changePIU;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
		
}

function changePIU() {
	
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("PIU_Table").innerHTML = xmlHttp.responseText
	}
}



function showDeptUnderList1(str1) {
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
	var url = "showlocaluser.jsp";
	
	url += "?PIU=" + str;
	xmlHttp.onreadystatechange = changePIU11;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
		
}

function changePIU11() {
	
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("PIU_Table11").innerHTML = xmlHttp.responseText
	}
}





function showDivisionunderlist(str1) {
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
	var url = "ShowUsers.jsp";
	
	url += "?Zone=" + str;
	xmlHttp.onreadystatechange = changePIU;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
		
}

function showZoneUnderlist(str1) {
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
	var url = "ShowUsers_list.jsp";
	
	url += "?Zone=" + str;
	xmlHttp.onreadystatechange = changePIU;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
		
}



function showPiuUnderList(str1) {
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
	var url = "ShowUsers_list.jsp";
	
	url += "?PIU=" + str;
	xmlHttp.onreadystatechange = changePIU;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
		
}

function showOrgUnderList(str1) {
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
	var url = "ShowUsers.jsp";
	
	url += "?Org=" + str;
	xmlHttp.onreadystatechange = changePIU;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
		
}

function showOrgUserList(str1) {
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
	var url = "ShowUsers_list.jsp";
	
	url += "?Org=" + str;
	xmlHttp.onreadystatechange = changePIU;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
		
}





var idx;
function showDesgInPackage(str1,index) {
	idx=index;
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

	var url = "Designation_RVNL_Package.jsp";

	url += "?Dept=" + str+"&index="+index;
	xmlHttp2.onreadystatechange = DesginChangeInPackage;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
		
	}
	
function DesginChangeInPackage() {
	var divid="DesgDiv_RVNL"+idx;
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById(divid).innerHTML = xmlHttp2.responseText
	}
}



function getDesignation_cproject(){
	

		//var PIU1 = document.getElementById("PIU_name");
		//var PIU =PIU1.options[ PIU1.selectedIndex ].value;	


		var Dept1 = document.getElementById("Department_RVNL");
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

		var url = "Designation_Cprojects.jsp";

		url += "?PIU=" + 1 + "&Dept=" + Dept;
		xmlHttp2.onreadystatechange = Desgin_Cproject;
		xmlHttp2.open("GET", url, true);
		xmlHttp2.send(null);
			
	
		

	
	
}
function Desgin_Cproject() {
	
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById("DesgDiv_RVNL").innerHTML = xmlHttp2.responseText
	}
}

function getuser_ProjectIncharge(str1){
	var str = encodeURIComponent(str1);
	var Dept1 = document.getElementById("Department_RVNL");
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

	var url = "Cproject_user.jsp";

	url += "?desg="+str+"&Dept="+Dept;
	xmlHttp2.onreadystatechange = ProjectIncharge_Cproject;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
		

	
	
}

function ProjectIncharge_Cproject(){
	
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById("projectinChargediv").innerHTML = xmlHttp2.responseText
	}
	
}

var idxx;
function getuser_ProjectIncharge_Package(str1,index){
	var str = encodeURIComponent(str1);
	var Dept1 = document.getElementById("Department_RVNL"+index);
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
	idxx = index;
	var url = "Cproject_user_Package.jsp";

	url += "?desg="+str+"&Dept="+Dept+"&Index="+index;
	xmlHttp2.onreadystatechange = ProjectIncharge_Cproject_Package;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
		

	
	
}

function ProjectIncharge_Cproject_Package(){
	
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById("projectinChargediv"+idxx).innerHTML = xmlHttp2.responseText
	}
	
}


var idxX_c;
function showDesgin_cUser(index) {
//var PIU1 = document.getElementById("PIU_name");
//var PIU =PIU1.options[ PIU1.selectedIndex ].value;	

var name="Department_RVNL"+index;
var Dept1 = document.getElementById(name);
var Dept2 =Dept1.options[ Dept1.selectedIndex ].value;
var Dept = encodeURIComponent(Dept2);
var Type1 =document.getElementById("Type");
var Type2 = Type1.options[Type1.selectedIndex].value;
var Type = encodeURIComponent(Type2);
//var Piu = document.getElementById("PIU_name").value;
//var Zone = document.getElementById("Zone").value;
//var Divn = document.getElementById("division").value;

if (typeof XMLHttpRequest != "undefined") {
	xmlHttp2 = new XMLHttpRequest();
} else if (window.ActiveXObject) {
	xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
}
if (xmlHttp2 == null) {
	alert("Browser does not support XMLHTTP Request")
	return;
}
idxX_c=index;
var url = "Designation_RVNL_cUser.jsp";
//alert("111..."+Piu+Zone+Divn);
//url += "?PIU=" + Piu + "&Dept=" + Dept+"&Index="+index+"&Type="+Type+"&Zone="+Zone+"&Divn="+Divn;
url += "?PIU=" + 1 + "&Dept=" + Dept+"&Index="+index+"&Type="+Type;

//alert(url);
xmlHttp2.onreadystatechange = DesginChange_cUser;
xmlHttp2.open("GET", url, true);
xmlHttp2.send(null);
	
}

function DesginChange_cUser() {
	
	
	var name="DesgDiv_RVNL"+idxX_c;
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById(name).innerHTML = xmlHttp2.responseText
	}
}

var idxX_c;
function show(index) {
var name="Department_RVNL"+index;
var Dept1 = document.getElementById(name);
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
idxX_c=index;
var url = "Designation_RVNL_cUser2.jsp";

url += "?PIU=" + 1 + "&Dept=" + Dept+"&Index="+index+"&Type=RVNL";
xmlHttp2.onreadystatechange = DesginChange_cUser1;
xmlHttp2.open("GET", url, true);
xmlHttp2.send(null);
	
}

function DesginChange_cUser1() {
	
	
	var name="DesgDiv_RVNL"+idxX_c;
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById(name).innerHTML = xmlHttp2.responseText
	}
}

function show1(index) {
	
	var name="Department_RVNL"+index;
	
	var Dept1 = document.getElementById(name);
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
	idxX_c=index;
	var url = "designationproject.jsp";

	url += "?PIU=" + 1 + "&Dept=" + Dept+"&Index="+index+"&Type=RVNL";
	//alert(url);
	xmlHttp2.onreadystatechange = DesginChange_cUser2;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
		
	}

function DesginChange_cUser2() {
	
	
	var name="DesgDiv_RVNL"+idxX_c;
	//alert(name);
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById(name).innerHTML = xmlHttp2.responseText
	}
}


function modifying(id){
	var url="CreateProjects1.jsp?ID="+id;
	window.open(url,this.target);
//returnProjects(id);
}

function modifydoc(docids){
	//alert("hello"+docids);
	var url="C_documents1.jsp?Document_Map_ID="+docids;
	window.open(url);
}

/*function sysdoc(zoneName,zoneId)
alert(zoneName);
{
	
	//popup.jsp?Project_n="+project_name+"&piu="+piu;
	var url="modifytoDb.jsp?type="zone+"&zoneName="+zoneName+"&zId="+zoneId;
	window.open(url,this.target, 'width=800,height=700,scrollbars=1,top=0px,left=300px');


}*/
/*function ModifyForm() {
	
	if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
		document.getElementById("modifyList").innerHTML = xmlHttp.responseText
	}
}*/




function localadmnpiuchange(piu1){
	var piu = encodeURIComponent(piu1);
	if (typeof XMLHttpRequest != "undefined") {
		xmlHttp2 = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlHttp2 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	if (xmlHttp2 == null) {
		alert("Browser does not support XMLHTTP Request")
		return;
	}
	
	var url = "local_admn_exists.jsp";

	url += "?PIU="+piu;
	
	
	
//alert(piu);
	xmlHttp2.onreadystatechange = localadminpiu;
	xmlHttp2.open("GET", url, true);
	xmlHttp2.send(null);
	
}

function localadminpiu(){
	
	if (xmlHttp2.readyState == 4 || xmlHttp2.readyState == "complete") {
		document.getElementById("piu111").innerHTML = xmlHttp2.responseText;
		var ex= document.getElementById("piu111").innerText;
		if(ex!=""){
			document.getElementById("btnclick").disabled = true;
						
		}else{
			
			document.getElementById("btnclick").disabled = false;
			
		}
	}
	
}

