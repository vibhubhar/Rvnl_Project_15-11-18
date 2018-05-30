<!DOCTYPE html >
<html>
<head>
<style>
.bigchart {
width:750px !important;
margin-top:-50px;
margin-left:-20px;
}
.bigchart1 {
width:750px !important;
margin-top:-50px;
margin-left:150px;
}

.chart-container {
//display:block;
position:absolute;
//display:inline-block;
width: 400px;
margin-left:20px;
}
.pie-chart-container {
position:absolute;
//display:inline-block;
width: 400px;
margin-left:780px;
}

</style>
		<link rel="stylesheet" type="text/css" href="resources/css/form-style.css">
		<%@ page import ="java.text.SimpleDateFormat"%>
 <%@ page import ="java.util.Date"%>
<script src="resources/JS/Chart230.js"></script>
<meta charset="ISO-8859-1">
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<title>Model Graphs</title>
	<%@include file="included/NewHeader.jsp"%>
	<%@ page session="true" %>
 <%@include file="sessionCheck.jsp"%>
	<script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>  
		
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
/*
$(function () {
	$("#chartContainer").CanvasJSChart({ //Pass chart options
		data: [
		{
		type: "column", //change it to column, spline, line, pie, etc
		dataPoints: [
			{ x: 10, y: 10 },
			{ x: 20, y: 14 },
			{ x: 30, y: 18 },
			{ x: 40, y: 22 },
			{ x: 50, y: 18 },
			{ x: 60, y: 28 }
		]
	}
	]
});

});
*/
</script>
 
 <style>
div #menu2 {
margin-top: 0px;
margin-left:20px;
padding-right:20px;
}
</style>
 
<script>

$(document).ready(function() {
	//$( "#menu ul" ).append( "<li><a href='admn_logout.jsp'>Logout</a></li>");

//	var usr1=document.getElementById("menu1").value;
//$("#menu11").append('<h8><span style="text-align:center;margin-top:4px; margin-left:30%;font-size: x-large; color:white; padding:5px; "><b>D A S H B O A R D</u></b></span><font style="color:hotpink; margin-left: 24%; font-weight:normal; font-size: medium;">&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#fff; font-weight:normal">:&nbsp;'+usr1+'&nbsp;&nbsp;</h8>');
});


</script>
</head>
<body>
<br>
<div style="margin-left:500px; font-family: arial; font-weight:bold; text-decoration: underline; color:gray; "  width="100%"><h1>Model Graphs</h1></div>

<%

String role1=(String)session.getAttribute("role");
String role=(String)session.getAttribute("Type");
String zone_id1=(String)session.getAttribute("zone_id"); 
String piu_id1=(String)session.getAttribute("piu_id"); 
String div_id1=(String)session.getAttribute("Division_Id");
String user = (String) session.getAttribute("user_name");
String  code1 = request.getParameter("code");
System.out.println(code1);
String filter1 = null, filter11="", Zone=null, divn=null, piu=null;
int code= Integer.parseInt(code1);
Connection conn = null;
PreparedStatement ps31=null, ps32=null, ps33=null;
ResultSet  rs31=null, rs32=null, rs33=null;
Statement stmt = null, stmt1=null, stmt2=null, stmt3=null, stmt4=null;
ResultSet rs = null,rs11=null, rs51=null, rs12=null, rs13=null, rs14=null;
String arguments=null;
String qpend=null, q22=null, title1=null, title2=null;
String yrmm1=null, nsub1=null, nappd1=null, yrmm2=null, nsub2=null, nappd2=null, yrmm3=null, nsub3=null, nappd3=null, nrly3=null, npending3=null, label1="[", dataset1="[", dataset2="[", label2="[", dataset3="[";

try {
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

conn = ds.getConnection();

//System.out.println(",,,,,"+role1+role+zone_id1+piu_id1+div_id1+user);
 if(role.equalsIgnoreCase("MOR") && zone_id1.equalsIgnoreCase("18")){
	 filter1=""; code=1;
}else if(role.equalsIgnoreCase("MOR")){
	if 	(!zone_id1.equalsIgnoreCase(null)){
			String sql31 = "select Zone_Name from xx_zones_master  where Zone_Id="+zone_id1; 
			ps31 = conn.prepareStatement(sql31);
			rs31 = ps31.executeQuery();
		if (rs31.next()) {
			Zone=rs31.getString("Zone_Name");
			filter1="Zone='"+Zone+"'";
			filter11="Zone='"+Zone+"'";
		}
	}
	if 	(!div_id1.equalsIgnoreCase(null) && !div_id1.equalsIgnoreCase("86")){
		String sql32 = "select division_name from xx_divisions_master  where division_id="+div_id1; 
		ps32 = conn.prepareStatement(sql32);
		rs32 = ps32.executeQuery();
	if (rs32.next()) {
		divn=rs32.getString("division_name");
		filter11=filter11+" and BMR.division='"+divn+"'";
		filter1=filter1+" and Division='"+divn+"'";
		
	}
}
	code=2;
 }else if(role.equalsIgnoreCase("RVNL") && piu_id1.equalsIgnoreCase("27")){
	 filter1=""; 
	 if (role.equalsIgnoreCase("RVNL") && role1.equalsIgnoreCase("System Administrator")) {
		 code=3;
			 } else { 
				 code=1;
			 }
	  } else {
	 if 	(!piu_id1.equalsIgnoreCase(null)){
			String sql33 = "select PIU_Name from xx_piu_master  where PIU_Id="+piu_id1; 
			ps33 = conn.prepareStatement(sql33);
			rs33 = ps33.executeQuery();
		if (rs33.next()) {
			piu=rs33.getString("PIU_Name");
			filter1="PIU_of_RVNL='"+piu+"'";
			filter11="PIU_of_RVNL='"+piu+"'";
		}
	}
	 if (role.equalsIgnoreCase("RVNL") && role1.equalsIgnoreCase("LocalUser")) {
 code=4;
	 } else { 
		 code=5;
	 }
 }
 
 
 // year month string ......
 Calendar cal = Calendar.getInstance();  //Get current date/month i.e 19 Nov, 2017
 cal.add(Calendar.MONTH, -12);   //Go to date, 11 months ago 19 Dec, 2016
 //cal.set(Calendar.DAY_OF_MONTH, 1); //set date, to make it 1 Dec, 2016
 SimpleDateFormat monthDate = new SimpleDateFormat("MMM-yy");
 int month1=0;
 int year1=0;
 int day1=0;
 String month_name1=null;
 String aa1="(SELECT ";
 String sdate1=null;
 String edate1=null;
 int yrmm=0;
 for (int i = 1; i < 13; i++) {
    // Calendar calendar1 = Calendar.getInstance();
     cal.add(Calendar.MONTH, 1);
     month_name1 = monthDate.format(cal.getTime());
     month1=cal.get(Calendar.MONTH)+1;
     year1=cal.get(Calendar.YEAR);
     day1=cal.get(Calendar.DAY_OF_MONTH);
     yrmm=year1*100+month1;
      if (i==1) {
    	  aa1=aa1+ yrmm+ " as MM, '"+ month_name1+"' as MM2 ";
    	  sdate1=year1+"-"+month1+"-"+"01";
        } else {
    	  aa1=aa1+" UNION ALL SELECT "+ yrmm+ ", '"+ month_name1+"' ";  
    	  edate1=year1+"-"+month1+"-"+day1; 
      }
  }
 aa1=aa1+") as aa ";
 //System.out.println(aa1);
 
 //SimpleDateFormat monthDate1 = new SimpleDateFormat("yyyy");

 
 String nrly1=null, nrvnl1=null, nothers1=null, ndivn1=null;
 String query22="select aa.mm2, if(pks.mc!='',pks.mc,0) as Doc_submit, if(pks2.ma!='',pks2.ma,0) as Doc_appd  from " + aa1+" left join (select sno, month_submit, count(month_submit) as mc  from (select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,concat(year(docm.Date_of_Submission)*100+month(docm.Date_of_Submission)) as sno, concat(SUBSTRING(monthname(docm.Date_of_Submission),1,3),'-',substring(year(docm.date_of_Submission),3,2)) as month_submit, docm.Document_status,ram.CurrentDate,concat(SUBSTRING(monthname(ram.CurrentDate),1,3),'-',substring(year(ram.CurrentDate),3,2)) as month_action, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy and Date(Date_of_Submission) between '"+sdate1+"' and '" + edate1+"' " ;
	String query23=") as pks1 group by month_submit) as pks on aa.MM=pks.sno left join (select sno1, month_action, count(month_action) as ma  from (select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,(year(docm.Date_of_Submission)*100+month(docm.Date_of_Submission)) as sno, concat(SUBSTRING(monthname(docm.Date_of_Submission),1,3),'-',substring(year(docm.date_of_Submission),3,2)) as month_submit, docm.Document_status,ram.CurrentDate,(year(ram.CurrentDate)*100+month(ram.CurrentDate)) as sno1, concat(SUBSTRING(monthname(ram.CurrentDate),1,3),'-',substring(year(ram.CurrentDate),3,2)) as month_action, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy and Date(Date_of_Submission) between '"+sdate1+"' and '"+edate1+"' and docm.Document_Status='Finally Approved' ";
	String query24=") as pks11 group by month_action) as pks2 on aa.MM=pks2.sno1 order by aa.MM";
//		 String query22="select aa.mm2, if(pks.mc!='',pks.mc,0) as Doc_submit, if(pks2.ma!='',pks2.ma,0) as Doc_appd  from " + aa1+ (SELECT '201604' as MM, 'Apr-16' as MM2 union all select '201605', 'May-16' union all select '201606','Jun-16' union all select '201607','Jul-16' union all select '201608','Aug-16' union all select '201609','Sep-16' union all select '201610','Oct-16' union all select '201611','Nov-16' union all select '201612','Dec-16' union all select '201701','Jan-17' union all select '201702','Feb-17' union all select '201703','Mar-17') as aa left join (select sno, month_submit, count(month_submit) as mc  from (select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,concat(year(docm.Date_of_Submission)*100+month(docm.Date_of_Submission)) as sno, concat(SUBSTRING(monthname(docm.Date_of_Submission),1,3),'-',substring(year(docm.date_of_Submission),3,2)) as month_submit, docm.Document_status,ram.CurrentDate,concat(SUBSTRING(monthname(ram.CurrentDate),1,3),'-',substring(year(ram.CurrentDate),3,2)) as month_action, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy and Date(Date_of_Submission) between '2016-04-01' and '2017-03-31' ) as pks1 group by month_submit) as pks on aa.MM=pks.sno left join (select sno1, month_action, count(month_action) as ma  from (select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,(year(docm.Date_of_Submission)*100+month(docm.Date_of_Submission)) as sno, concat(SUBSTRING(monthname(docm.Date_of_Submission),1,3),'-',substring(year(docm.date_of_Submission),3,2)) as month_submit, docm.Document_status,ram.CurrentDate,(year(ram.CurrentDate)*100+month(ram.CurrentDate)) as sno1, concat(SUBSTRING(monthname(ram.CurrentDate),1,3),'-',substring(year(ram.CurrentDate),3,2)) as month_action, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy and Date(Date_of_Submission) between '2016-04-01' and '2017-03-31' and docm.Document_Status='Finally Approved' ) as pks11 group by month_action) as pks2 on aa.MM=pks2.sno1 order by aa.MM";
		  
 //select sno, month_submit, count(month_submit) from (select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,concat(year(docm.Date_of_Submission)*100+month(docm.Date_of_Submission)) as sno, concat(SUBSTRING(monthname(docm.Date_of_Submission),1,3),'-',substring(year(docm.date_of_Submission),3,2)) as month_submit, docm.Document_status,ram.CurrentDate,concat(SUBSTRING(monthname(ram.CurrentDate),1,3),'-',substring(year(ram.CurrentDate),3,2)) as month_action, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy and Date(Date_of_Submission) between '2016-04-01' and '2017-03-31' ) as pks group by month_submit order by sno
//select sno1, month_action, count(month_action) from (select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,(year(docm.Date_of_Submission)*100+month(docm.Date_of_Submission)) as sno, concat(SUBSTRING(monthname(docm.Date_of_Submission),1,3),'-',substring(year(docm.date_of_Submission),3,2)) as month_submit, docm.Document_status,ram.CurrentDate,(year(ram.CurrentDate)*100+month(ram.CurrentDate)) as sno1, concat(SUBSTRING(monthname(ram.CurrentDate),1,3),'-',substring(year(ram.CurrentDate),3,2)) as month_action, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy and Date(Date_of_Submission) between '2016-04-01' and '2017-03-31' and docm.Document_Status='Finally Approved' ) as pks group by month_action order by sno1
//select aa.mm2,aa.MM, pks.sno, pks.month_submit, if(pks.mc!='',pks.mc,0) as mc1  from (SELECT '201604' as MM, 'Apr-16' as MM2 union all select '201605', 'may-16' union all select '201606','may-16' union all select '201607','may-16' union all select '201608','may-16' union all select '201609','may-16' union all select '201610','may-16' union all select '201611','may-16' union all select '201612','may-16' union all select '201701','may-16' union all select '201702','may-16' union all select '201703','may-16') as aa left join (select sno, month_submit, count(month_submit) as mc  from (select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,concat(year(docm.Date_of_Submission)*100+month(docm.Date_of_Submission)) as sno, concat(SUBSTRING(monthname(docm.Date_of_Submission),1,3),'-',substring(year(docm.date_of_Submission),3,2)) as month_submit, docm.Document_status,ram.CurrentDate,concat(SUBSTRING(monthname(ram.CurrentDate),1,3),'-',substring(year(ram.CurrentDate),3,2)) as month_action, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy and Date(Date_of_Submission) between '2016-04-01' and '2017-03-31' ) as pks1 group by month_submit) as pks on aa.MM=pks.sno order by aa.MM
//select aa.mm2, if(pks.ma!='',pks.ma,0) as ma1  from (SELECT '201604' as MM, 'Apr-16' as MM2 union all select '201605', 'May-16' union all select '201606','Jun-16' union all select '201607','Jul-16' union all select '201608','Aug-16' union all select '201609','Sep-16' union all select '201610','Oct-16' union all select '201611','Nov-16' union all select '201612','Dec-16' union all select '201701','Jan-17' union all select '201702','Feb-17' union all select '201703','Mar-17') as aa left join (select sno1, month_action, count(month_action) as ma  from (select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,(year(docm.Date_of_Submission)*100+month(docm.Date_of_Submission)) as sno, concat(SUBSTRING(monthname(docm.Date_of_Submission),1,3),'-',substring(year(docm.date_of_Submission),3,2)) as month_submit, docm.Document_status,ram.CurrentDate,(year(ram.CurrentDate)*100+month(ram.CurrentDate)) as sno1, concat(SUBSTRING(monthname(ram.CurrentDate),1,3),'-',substring(year(ram.CurrentDate),3,2)) as month_action, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy and Date(Date_of_Submission) between '2016-04-01' and '2017-03-31' and docm.Document_Status='Finally Approved' ) as pks1 group by month_action) as pks on aa.MM=pks.sno1 order by aa.MM

/*
//String query="select aa.mm2, if(pks.ma!='',pks.ma,0) as ma1  from (SELECT '201604' as MM, 'Apr-16' as MM2 union all select '201605', 'May-16' union all select '201606','Jun-16' union all select '201607','Jul-16' union all select '201608','Aug-16' union all select '201609','Sep-16' union all select '201610','Oct-16' union all select '201611','Nov-16' union all select '201612','Dec-16' union all select '201701','Jan-17' union all select '201702','Feb-17' union all select '201703','Mar-17') as aa left join (select sno1, month_action, count(month_action) as ma  from (select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,(year(docm.Date_of_Submission)*100+month(docm.Date_of_Submission)) as sno, concat(SUBSTRING(monthname(docm.Date_of_Submission),1,3),'-',substring(year(docm.date_of_Submission),3,2)) as month_submit, docm.Document_status,ram.CurrentDate,(year(ram.CurrentDate)*100+month(ram.CurrentDate)) as sno1, concat(SUBSTRING(monthname(ram.CurrentDate),1,3),'-',substring(year(ram.CurrentDate),3,2)) as month_action, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,docm.Division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy and Date(Date_of_Submission) between '2016-04-01' and '2017-03-31' and docm.Document_Status='Finally Approved' ) as pks1 group by month_action) as pks on aa.MM=pks.sno1 order by aa.MM";

JDBCCategoryDataset dataset=new JDBCCategoryDataset("jdbc:mysql://localhost:3306/MySQL","com.mysql.jdbc.Driver","root","root");
 
dataset.executeQuery( query);
JFreeChart chart = ChartFactory .createBarChart3D(
"Approved Documents",
"Nos. of Docs",
"Month/Year",
dataset,
PlotOrientation.VERTICAL,true, true, false);
 
CategoryPlot plot = chart.getCategoryPlot();
CategoryItemRenderer renderer = plot.getRenderer();
 
renderer.setSeriesPaint(0, Color.green);
try
{
//ChartUtilities.saveChartAsJPEG(new File("F:\chart.jpg"), chart, 500, 450);
}
catch (IOException e)
{
System.out.println("Problem in creating chart.");
}
	
*/


String query = "select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,docm.Document_status,ram.CurrentDate,ram.ActionPerformed, ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.mor_Aging, BMR.rvnl_aging, BMR.Org_Aging, docm.Zone,BMR.division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km, org1.Org_Name, org1.Type, org1.division_id from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select if(e.division_name='Headquarters',CONCAT('HQ-',c.Zone),e.division_name) as division, a.Document_id, sum(if(b.type='MOR',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as mor_Aging, sum(if(b.type='RVNL',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as rvnl_Aging, sum(if(b.type='Others',DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)),null)) as Org_Aging from xx_record_actions a join xx_user_master b on a.ActionPerformedBy=b.User_name join xx_divisions_master e on b.Division_id=e.Division_id join xx_document_mapping c on a.Document_id=c.Document_Map_ID  group by a.Document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1, (select  rec1.Document_id, rec1.ActionPerformedBy, OM.Org_Name, UM.Type, UM.Division_ID from xx_record_actions rec1 left join xx_user_master UM on rec1.ActionPerformedBy=UM.User_name left join xx_org_master OM on UM.Org_ID = OM.Org_Id) org1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and ram.Document_Id=org1.Document_Id and ram.ActionPerformedBy=org1.ActionPerformedBy";
if (filter1 != "") {
	if (filter11 != "") {
	query=query+" and document_status='pending' and "+filter11;
	} else {
		query=query+" and document_status='pending'";
	}
	query22=query22+" and "+filter1;
	query23=query23+" and "+filter1;
} else {
	query=query+" and document_status='pending'";
}
String 	query1="select Count(if (Type='MOR', 1 , null)) as nrly,  Count(if (Type='RVNL', 1 , null)) as nrvnl,  Count(if (Type='Others', 1 , null)) as nothers, Count(if (Type='MOR' and division_id="+div_id1+", 1 , null)) as ndivn from (" + query+ ") as pkrly";
System.out.println("11Problem in creating chart."+query1);
stmt = conn.createStatement();
rs = stmt.executeQuery(query1);
while (rs.next()) {
	nrly1 = rs.getString(1);
	nrvnl1 = rs.getString(2);
	nothers1 = rs.getString(3);
	ndivn1 = rs.getString(4);
}

System.out.println("22 Problem in creating chart.");
/* // previous (one year before) and cumm figures
String qprevious = "select count(if(Document_Status='pending',1, null)) as ntpend, count(if(Document_Status='Finally Approved', 1, null)) as ntappd from xx_document_mapping where forwarded='yes' and Date_of_Submission < '"+sdate1+"'";
stmt2 = conn.createStatement();
rs12 = stmt2.executeQuery(qprevious);
while (rs12.next()) {
	yrmm2 = "\"previous\",";
	nsub2 = rs12.getString(1);
	nappd2 = rs12.getString(2);
	}
//removeData(myChart);addData(myChart,['Apl-18'],[45,10]);
label1=label1+yrmm2;
dataset1=dataset1+nsub2+", ";
dataset2=dataset2+nappd2+", ";

String query25=query22+query23+query24;
//System.out.println(query25);

stmt1 = conn.createStatement();
rs11 = stmt1.executeQuery(query25);
//int k=0;
while (rs11.next()) {
	yrmm1 = rs11.getString(1);
	nsub1 = rs11.getString(2);
	nappd1 = rs11.getString(3);
	label1=label1+"\""+yrmm1+"\", ";
	 dataset1 = dataset1+nsub1+", ";
	 dataset2 = dataset2+nappd1+", ";
}
String qtotal="select count(if(Document_Status='pending',1, null)) as ntpend, count(if(Document_Status='Finally Approved', 1, null)) as ntappd from xx_document_mapping where forwarded='yes'";
stmt3 = conn.createStatement();
rs13 = stmt3.executeQuery(qtotal);
while (rs13.next()) {
	yrmm3 = "\"Cumm.\"";
	nsub3 = rs13.getString(1);
	nappd3 = rs13.getString(2);
	}
//removeData(myChart);addData(myChart,['Apl-18'],[45,10]);
label1=label1+yrmm3+"]";
dataset1=dataset1+nsub3+"]";
dataset2=dataset2+nappd3+"]";
*/

String query25=query22+query23+query24;
//System.out.println("qq new"+query25);

stmt1 = conn.createStatement();
rs11 = stmt1.executeQuery(query25);
int k=0;
while (rs11.next()) {
	yrmm1 = rs11.getString(1);
	nsub1 = rs11.getString(2);
	nappd1 = rs11.getString(3);
	k++;
	if (k!=12) { 
	label1=label1+"\""+yrmm1+"\", ";
	 dataset1 = dataset1+nsub1+", ";
	 dataset2 = dataset2+nappd1+", ";
} else {
		label1=label1+"\""+yrmm1+"\"]";
		 dataset1 = dataset1+nsub1+"] ";
		 dataset2 = dataset2+nappd1+"] ";
	}
}

q22="select DISTINCT docm.Document_Map_ID,projm.PIU_of_RVNL,projm.Project,projm.Project_Coordinator,pkgm.package_name,projm.CoordinatingDepartment,projm.Designation,docm.Document_Type,docm.Document_Number,docm.Document_Name,docm.Date_of_Submission,docm.Document_status,ram.CurrentDate,ram.ActionPerformedBy,DATEDIFF(CURDATE(),docm.Date_of_Submission) as Aging,bmax.date1,BMR.Department, DATEDIFF(ifnull(ram.ActionedOn,now()),ifnull(ram.CurrentDate,docm.date_of_submission)) as pendingsince, BMR.ActionPerformed, BMR.tot_aging, docm.Zone,BMR.division, loc1.Major_Section, docm.From_Km, docm.To_Km, loc1.Station_Name, loc1.Station_Km from xx_projectattributes_master projm,xx_packages_project pkgm,xx_document_mapping docm,xx_approval_workflow wfm,xx_record_actions ram,(select division,  department, ActionPerformed, document_id, sum(BMR_aging) as tot_aging  from (select if(e.division_name='Headquarters',CONCAT('HQ-',c.Zone),e.division_name) as division, if(b.type='RVNL','RVNL',if(b.Type='Others', om.Org_Name,d.Department_Name)) as Department, a.ActionPerformed, a.Document_id, DATEDIFF(ifnull(a.ActionedOn,now()),ifnull(a.CurrentDate,c.date_of_submission)) as BMR_Aging from xx_record_actions a left join xx_user_master b on a.ActionPerformedBy=b.User_name left join xx_document_mapping c on a.Document_id=c.Document_Map_ID left join xx_departments_master d on b.Department_id=d.Department_id left join xx_divisions_map e on b.Division_ID=e.division_id left join xx_org_master om on b.Org_ID = om.Org_Id ) as BMR1  group by division,  Department, ActionPerformed, document_id) BMR, (select distinct((select max(ram1.Rownum) date1 from xx_record_actions ram1 where ram1.document_id = ram.document_id)) as date1,ram.Document_id from xx_record_actions ram) bmax, (select a.Document_Map_ID, b.Major_Section, c.Station_Km, c.Station_Name from xx_document_mapping a left join xx_project_km b on a.Majsec_Id = b.Majsec_Id left join xx_project_station c on a.Stn_Id = c.Stn_Id ) loc1 where projm.project_id = docm.project_id and docm.Document_Map_ID = loc1.Document_Map_ID and ram.Document_id = wfm.Document_id and docm.document_Map_id=BMR.document_Id and ram.Rownum = bmax.date1 and projm.Project_ID = pkgm.Project_ID and pkgm.package_id = docm.Package_ID and docm.Document_Map_ID = ram.Document_id and docm.Document_Map_ID=wfm.Document_id and bmax.Document_id= ram.Document_id and docm.ShowInReport='y' and BMR.ActionPerformed='pending' ";
if (filter1!="") {
	q22=q22+" and document_status='pending' and "+filter11;
} else {
	q22=q22+" and document_status='pending'";
}
System.out.println("q22 = "+q22);
if (code==2) {
if (!div_id1.equalsIgnoreCase("86")) {
	 qpend="select Department, Count(Department) as nrly2 from (" + q22+ ") as pkrly group by Department";
	 title1="Monthwise position for last one year ("+divn+")";
			 title2="Department wise No. of pending documents ("+divn+")"; 

} else {
	 qpend="select Division, Count(if (Type='MOR', 1 , null)) as nrly2,  Count(if (Type='RVNL', 1 , null)) as nrvnl2,  Count(if (Type='Others', 1 , null)) as nothers2, Count(if (Type='MOR' and division_id="+div_id1+", 1 , null)) as ndivn2 from (" + query+ ") as pkrly group by Division";
	 title1="Monthwise position for last one year ("+Zone+")";
	 title2="Division wise No. of pending documents ("+Zone+")"; 
} 
} else {
if (code==4 || code==5) {
	 title1="Monthwise position for last one year ("+piu+" PIU)";
 title2="Division wise No. of pending documents ("+piu+" PIU)"; 
 qpend="select Division, Count(if (Type='MOR', 1 , null)) as nrly2,  Count(if (Type='RVNL', 1 , null)) as nrvnl2,  Count(if (Type='Others', 1 , null)) as nothers2, Count(if (Type='MOR' and division_id="+div_id1+", 1 , null)) as ndivn2 from (" + query+ ") as pkrly group by Division";
	
 } else {
	 title1="Monthwise position for last one year (IR)";
	 title2="Zone wise No. of pending documents (IR)"; 	
	 qpend="select zone, Count(if (Type='MOR', 1 , null)) as nrly2,  Count(if (Type='RVNL', 1 , null)) as nrvnl2,  Count(if (Type='Others', 1 , null)) as nothers2, Count(if (Type='MOR' and division_id="+div_id1+", 1 , null)) as ndivn2 from (" + query+ ") as pkrly group by zone";
	 
 }
}
System.out.println("pp new"+qpend);
stmt4 = conn.createStatement();
rs14 = stmt4.executeQuery(qpend);
int k2=0;
while (rs14.next()) {
k2++;
}
int k3=0;
rs14.beforeFirst();
while (rs14.next()) {
	nrly3 = rs14.getString(1);
	npending3 = rs14.getString(2);
	k3++;
	//System.out.println(k3+nrly3);
	if (k3<k2) { 
	label2=label2+"\""+nrly3+"\", ";
	 dataset3 = dataset3+npending3+", ";
} else {
		label2=label2+"\""+nrly3+"\"]";
		 dataset3 = dataset3+npending3+"] ";
	}

	}
if (label2.equalsIgnoreCase("[")) {
	label2="['No pending documents.....']";
	dataset3="[0]";
}
System.out.println(k2+label1+dataset1+dataset2+label2+dataset3);
} catch(Exception e){
	
	e.printStackTrace();
} finally {
    try { rs31.close(); } catch (Exception e) { /* ignored */ }
    try { rs32.close(); } catch (Exception e) { /* ignored */ }
    try { rs33.close(); } catch (Exception e) { /* ignored */ }
    try { rs.close(); } catch (Exception e) { /* ignored */ }
    try { rs11.close(); } catch (Exception e) { /* ignored */ }
    try { rs14.close(); } catch (Exception e) { /* ignored */ }
    try { ps31.close(); } catch (Exception e) { /* ignored */ }
    try { ps32.close(); } catch (Exception e) { /* ignored */ }
    try { ps33.close(); } catch (Exception e) { /* ignored */ }
    try { conn.close(); } catch (Exception e) { /* ignored */ }
}
%>
<script>
	var Labelpk=<%=label1%>;
	var datapk1=<%=dataset1%>;
	var datapk2=<%=dataset2%>;
	var Labelpk2=<%=label2%>;
	var datapk3=<%=dataset3%>;
	//alert("leg1--"+Labelpk+"data1--"+datapk1);
	//alert("leg3--"+Labelpk2+"data3--"+datapk3);
	//alert("array"+LabelArray);
	//removeData(myChart);
	//addData(myChart,[yrmm1],[nsub1,nappd1]);
	</script>
	
<input type="hidden" id="menu1" value='<%=user %>'>
 <br><br>
<br>
 <div>
<div class="chart-container" id="pkchart" > 
<canvas id="myChart" ></canvas>
</div>
<div class="pie-chart-container" id="pkpiechart" > 
<canvas id="mypieChart" ></canvas>
</div></div>
<br><br><br>
<script language="JavaScript" type="text/javascript">
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    //backgroundColor:'rgba(100,100,100,0.7)',
    data: {
        labels: Labelpk,
        	//["Dec-16", "Jan-17", "Feb-17", "Mar-17", "Apr-17", "May-17", "Jun-17", "Jul-17", "Aug-17", "Sep-17", "Oct-17", "Nov-17"],
        datasets: [{
            label: 'Nos. Submitted',
            data: datapk1,
            	//[10, 5, 6, 15, 10, 7, 18, 13, 0, 8, 28, 2],
            backgroundColor: //[
                //'rgba(255, 99, 132, 0.7)',
                //'rgba(255, 99, 132, 0.7)',
               /* 'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                */
                'rgba(255, 99, 132, 0.7)',
                             
                // 'rgba(54, 162, 235, 0.2)',
               // 'rgba(255, 206, 86, 0.2)',
               // 'rgba(75, 192, 192, 0.2)',
               // 'rgba(153, 102, 255, 0.2)',
               // 'rgba(255, 159, 64, 0.2)'
           // ],
            borderColor: [
               /* 'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
           */ ],
            borderWidth: 1
        }, {
            label: 'Nos. Approved',
            data: datapk2,
            //[40, 16, 37, 3, 1, 11, 1, 24, 1, 0, 21, 3 ],
          
        	   backgroundColor:// [
               // 'rgba(0, 0, 255, 0.7)',
                //'rgba(0, 0, 255, 0.7)',
              /*  'rgba(0, 0, 255, 0.7)',
                'rgba(0, 0, 255, 0.7)',
                'rgba(0, 0, 255, 0.7)',
                'rgba(0, 0, 255, 0.7)',
                'rgba(0, 0, 255, 0.7)',
                'rgba(0, 0, 255, 0.7)',
                'rgba(0, 0, 255, 0.7)',
                'rgba(0, 0, 255, 0.7)',
                'rgba(0, 0, 255, 0.7)',
                'rgba(0, 0, 255, 0.7)',
                'rgba(0, 0, 255, 0.7)',
                */
                'rgba(0, 0, 255, 0.7)',
                /*,
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)',
                'rgba(255, 99, 132, 0.7)'
                             
                // 'rgba(54, 162, 235, 0.2)',
               // 'rgba(255, 206, 86, 0.2)',
               // 'rgba(75, 192, 192, 0.2)',
               // 'rgba(153, 102, 255, 0.2)',
               // 'rgba(255, 159, 64, 0.2)'*/
            //],
            borderColor: [
               /* 'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
           */ ],
       
            borderWidth: 1
        }]
    },
    options: {
    /*	
    	"hover": {
            "animationDuration": 0
        },
        "animation": {
            "duration": 1,
            "onComplete": function () {
                var chartInstance = this.chart,
                ctx = chartInstance.ctx;

                ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                ctx.textAlign = 'center';
                ctx.textBaseline = 'bottom';

                this.data.datasets.forEach(function (dataset, i) {
                    var meta = chartInstance.controller.getDatasetMeta(i);
                    meta.data.forEach(function (bar, index) {
                        var data = dataset.data[index];                            
                        ctx.fillText(data, bar._model.x, bar._model.y - 5);
                    });
                });
            }
        }, */
            title: {
                display: true,
                text: '<%=title1%>',
                fontSize: 14
            },
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
            
    }
});
/*
function addData(chart, label, data) {
    chart.data.labels.push(label);
    chart.data.datasets.forEach((dataset,index) => {
        dataset.data.push(data[index]);
    });
    chart.update();
}
function removeData(chart) {
    chart.data.labels.pop();
    chart.data.datasets.forEach((dataset) => {
        dataset.data.pop();
    });
    chart.update();
}
*/
$('#myChart').css({'background-color': 'rgba(255, 255, 255, 1)', 'border':'1px solid'});
    $('#pkchart').click(function(){ //on add input button click
       $(this).toggleClass("bigchart");
    });
var ctxpie = document.getElementById("mypieChart");
var mypieChart = new Chart(ctxpie, {
    type: 'doughnut',
    data: {
        labels: Labelpk2,
        	
        datasets: [{
            label: 'Nos. Pending',
            backgroundColor: ["#33FFFF","#FF9933", "#8e5ea2","rgba(0, 0, 255, 0.7)","#33FF66", "#339900", "pink", "#990000","#FF0000","#e201f1","#F27D7D","#1e95cd","#9B9898", "#F5F5F5","#FFFF33","#aad196","#C0C0C0"],
            data: datapk3,
            //"#990000","#FF0000","#FFFF33",,"#c458582","#3cba38"
            //backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#3e95de", "#8e5eb3","#3cbacd","#e8c3ab","#c458fg","#3e95af",,"#7458fg","#8e95af", "#9e5edf" "#8e5edf","#3cbaab","#e8c3ca","#c458582,"#3cba38"],
            }]},
    options: {
    /*	"hover": {
            "animationDuration": 0
        },
        "animation": {
            "duration": 1,
            "onComplete": function () {
                var chartInstance = this.chart,
                ctx = chartInstance.ctx;

                ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                ctx.textAlign = 'center';
                ctx.textBaseline = 'bottom';

                this.data.datasets.forEach(function (dataset, i) {
                    var meta = chartInstance.controller.getDatasetMeta(i);
                    meta.data.forEach(function (bar, index) {
                        var data = dataset.data[index];                            
                        ctx.fillText(data, bar._model.x, bar._model.y - 5);
                    });
                });
            }
        },
*/
    	title: {
                display: true,
                text: '<%=title2%>',
                fontSize: 14
            }
    }  
    
});
$('#mypieChart').css({'background-color': 'rgba(255, 255, 255, 1)', 'border':'1px solid'});
$('#pkpiechart').click(function(){ //on add input button click
    $(this).toggleClass("bigchart1"); 
 });
</script>

<div  width="100%" style="font-family:serif; color:black; margin-left:300px; margin-top:200px;"><h4>Click on the graph to zoom in/out..................................Bring curser on graph segment to view details.</h4></div>
<br><br><br>
<button type="button" id="btnclick" style="margin-left:600px;" class="btn btn-primary" onclick="window.location='NewIndex.jsp';">Back</button> 
<br><br><br>
	   			
 <%@include file="included/Newfooter.jsp" %>

</body>


</html>