var xmlHttp
function showList(str1) {
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
	var url = "showList.jsp";
	
	url += "?type=" + str;
	xmlHttp.onreadystatechange = onChange;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
		
}


function onChange(){
		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
			document.getElementById("list").innerHTML = xmlHttp.responseText
		}	
}

function deleteRow(i){
    document.getElementById('zone').deleteRow(i)
}
function getConfirmation(){
    var retVal = confirm("Do you want to add ?");
    if( retVal == true ){
       document.write ("User wants to add!");
       return true;
    }
    else{
       document.write ("User does not want to continue!");
       return false;
    }
 }
