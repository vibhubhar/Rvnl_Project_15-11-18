<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@include file="sessionCheck.jsp"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approval WorkFlow</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/blitzer/jquery-ui.css"/>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<script type="text/javascript" src="resources/JS/backButton.js"></script>
<script type="text/javascript" src="resources/JS/validate230.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<head><style>tr:hover td {background:#D3D3D3;}</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
var $j = jQuery.noConflict();
$j(document).ready(function() {
    $j( ".mydatepickers" ).datepicker({
		dateFormat : 'dd/mm/yy', changeYear: true
	}).val();
  });


</script>
<script type="text/javascript">
	function frezedate(id, startDate) {
		var $j = jQuery.noConflict();

		var idof = id;
		//alert(startDate);
		var chunks = startDate.split('-');
		var formattedDate = [ chunks[2], chunks[1], chunks[0] ].join("/");
		//alert(formattedDate);
		$j("#" + idof).datepicker({

			dateFormat : 'dd/mm/yy',
			minDate : formattedDate,
			maxDate : '0'

		}).datepicker("show").val();
		//var today = new Date(); var dd = today.getDate(); 

	}
</script>
</head>
<body>
	<form id="documentpullbacklist">
	<%
	String packageid=request.getParameter("packageid");
	
	String userid=request.getParameter("userid");
	String rdstatus = (String) session.getAttribute("RealdateStatus");
	//System.out.print("Real Date Status"+rdstatus);
	%>
	<c:if test="${param.Stage == null}">
	<%
		Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
			Connection conn = null;
			conn = ds.getConnection();
			PreparedStatement ps = null, ps2 = null, hierPS = null;
			ResultSet rs = null, rs2 = null, hierRS = null;
			String Document_Map_Id=null,Document_Number=null,Document_Name=null,Document_Type=null,Revision_Id=null,Division=null,Division_HierarchyId=null;
			Date Date_of_Submission=null,DateFinalize=null;
			String Submitted_by=null,Project_Id=null,Package_Id=null,HierarchyType=null,Zone_HierarchyId=null,Document_Status=null,DateFinalizer=null,Forwarded=null,Status=null;
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			String rd = df.format(new Date());		
			//System.out.print(rd+"Real Date Status"+rdstatus);
			%>
	
			<table class="table table-hover table-bordered"
			style="background-color: #F0FFFF">
			<tr class="success">
				<th>Select</th>
				<th><b>PullBack Date</b></th>
				<th><b>SNo</b></th>
				<!-- <td><b>Project Name</b></td>
				<td><b>Package Name</b></td> -->
				<th><b>Document Type</b></th>
				<th><b>Document Number</b></th>
				<th><b>Document Name</b></th>
				<th><b>Pending with</b></th>
				<!-- <td><b></b></td-->
				<th><b>Pending Since</b></th>
				<th><b>Log Details</b></th>
				
				
				
				<th></th>
			</tr>
<% 
//String userid=null;

String sql1 = "select * from xx_document_mapping where Package_ID='"+packageid+"' And Forwarded='Yes' and Submitted_by='"+userid+"' order by Document_Type";

 ps2 = conn.prepareStatement(sql1);
 rs2 = ps2.executeQuery();
String Document_Map_Idfrmpac=null;
int count=0;
while(rs2.next())
{
	Document_Map_Idfrmpac = rs2.getString("Document_Map_ID");
	
	String select21 = "select * from xx_moreammendments where document_id ='"+Document_Map_Idfrmpac+"'";

	Statement st=null;

	int flag=0;
	st=(Statement) conn.createStatement();
	ResultSet rs222 = st.executeQuery(select21);
	if(rs222.next()){
		flag=1;
		
		
	}
	if(flag==1)
	{
		String sql2="select * from xx_moreammendments where document_id='"+Document_Map_Idfrmpac+"' and status!='return'";
		PreparedStatement ps31 = conn.prepareStatement(sql2);
		ResultSet rs31 = ps31.executeQuery();
		String Document_Map_Idfrmamend=null;
		while(rs31.next())
		{
			Document_Map_Idfrmamend=rs31.getString("document_id");

	
	

	
	String sql3="select * from xx_document_mapping where Document_Map_ID='"+Document_Map_Idfrmamend+"' and Document_status='Pending' order by Document_Type";
	
	PreparedStatement ps4 = conn.prepareStatement(sql3);
	 rs = ps4.executeQuery();  
	 
while(rs.next())
{
	Document_Map_Id = rs.getString("Document_Map_ID");
	Document_Number = rs.getString("Document_Number");
	Document_Name = rs.getString("Document_Name");
	String Document_Type12 = rs.getString("Document_Type");
	Document_Type = URLEncoder.encode(Document_Type12, "UTF-8");
	Revision_Id = rs.getString("Revision_ID");
	Date_of_Submission=rs.getDate("Date_of_Submission");

	Submitted_by = rs.getString("Submitted_by");
	Project_Id = rs.getString("Project_ID");
	Package_Id = rs.getString("Package_ID");
	HierarchyType = rs.getString("HierarchyType");
	Zone_HierarchyId = rs.getString("Zone_HierarchyId");
	Division_HierarchyId=rs.getString("Division_HierarchyId");
	Document_Status = rs.getString("Document_Status");
	DateFinalize = rs.getDate("DateFinalize");
	Division=rs.getString("Division");

	Forwarded = rs.getString("Forwarded");
	Status=rs.getString("Status");
	String Package_name=null,project_name=null;
	String sql112="select * from xx_packages_project where package_id='"+Package_Id+"'";
	PreparedStatement psdat1 = conn.prepareStatement(sql112);
	ResultSet rsdat1 = psdat1.executeQuery();
	
	while(rsdat1.next()){
		
		 Package_name=rsdat1.getString("Package_name");										
	}
	String piuq = "select Project from xx_projectattributes_master where project_id='"
			+ Project_Id + "' order by Project";
	
	PreparedStatement ps3 = conn.prepareStatement(piuq);
	ResultSet rs3 = ps3.executeQuery();
	while (rs3.next()) {

		
		project_name = rs3.getString("Project");
		
	}
	
	Date frezedate=null;String pendingwith=null;
	String sql12="select * from xx_record_actions where Document_id='"+Document_Map_Id+"'";
	PreparedStatement psdat = conn.prepareStatement(sql12);
	ResultSet rsdat = psdat.executeQuery();
	while(rsdat.next()){
		frezedate=rsdat.getDate("CurrentDate");
		pendingwith=rsdat.getString("ActionPerformedBy");
	}
	String frezestr = new SimpleDateFormat("dd/MM/yyyy")
	.format(frezedate);	
	
	 count=count+1;
 %>
<tr>
						<td><INPUT TYPE="radio" NAME="pullbackrec" VALUE="<%=Document_Map_Id%>"/></td>	
	<%
//	System.out.print("Real Date Status"+rdstatus+rd);
if (rdstatus.equalsIgnoreCase("0")) { 
%>						
						<td><input type="text" id="ApprovalDate<%=Document_Map_Id%>"
								name="ApprovalDate<%=Document_Map_Id%>"
								onclick="frezedate('ApprovalDate<%=Document_Map_Id%>','<%=frezedate%>')" readonly="true" 
								style="width: 150px"></td>
<%
} else {
%>
<td><input type="text" id="ApprovalDate<%=Document_Map_Id%>"
							name="ApprovalDate<%=Document_Map_Id%>"  readonly="true"
							style="width: 150px; background-color: lightgray;" value=<%=rd %>></td>
<%
}		
%>						
								
						<td><%=count%></td>
						<%-- <td><%=Package_name%></td>  --%>
						
						<td><%=Document_Type12%></td>
						<td><%=Document_Number %></td>
						<td><%=Document_Name%></td>						
						<%-- <td><%=Revision_Id%></td> --%>
						<!-- <td><%=Project_Id%></td><td><%=Package_Id%></td> -->
						<td><%=pendingwith%></td>
						<td><%=frezestr%></td>
						<td><a
				href="recordReport.jsp?Document_Type=<%=Document_Type%>&doc_id=<%=Document_Map_Id%>" target="_blank">
					Log Details </a>
			</td>
						<%-- <td><%=HierarchyType%></td>
						<td><%=Zone_HierarchyId%></td>
						<td><%=Division_HierarchyId%></td>
						<td><%=Document_Status%></td>
						<td><%=DateFinalize%></td>
						<td><%=Division%></td>
						< td><%=Forwarded%></td> 
						<td><%=Status%></td>--%>
						
						
							<%-- <td><input type="button" class="btn btn-primary"
							id="btnShownt<%=Document_Map_Id%>" value="Finally Approved"
							onclick="FinalApproval('<%=Document_Map_Id%>','<%=Submitted_by%>')"></td> --%>
	<%}

		} }else{
			
			String sql3="select * from xx_document_mapping where Document_Map_ID='"+Document_Map_Idfrmpac+"'";
			
			PreparedStatement ps4 = conn.prepareStatement(sql3);
			 rs = ps4.executeQuery();

		while(rs.next())
		{int count1=0;
			
			Document_Map_Id = rs.getString("Document_Map_ID");
			Document_Number = rs.getString("Document_Number");
			Document_Name = rs.getString("Document_Name");
			String Document_Type3 = rs.getString("Document_Type");
			Document_Type = URLEncoder.encode(Document_Type3, "UTF-8");
			Revision_Id = rs.getString("Revision_ID");
			Date_of_Submission=rs.getDate("Date_of_Submission");

			Submitted_by = rs.getString("Submitted_by");
			Project_Id = rs.getString("Project_ID");
			Package_Id = rs.getString("Package_ID");
			HierarchyType = rs.getString("HierarchyType");
			Zone_HierarchyId = rs.getString("Zone_HierarchyId");
			Division_HierarchyId=rs.getString("Division_HierarchyId");
			Document_Status = rs.getString("Document_Status");
			DateFinalize = rs.getDate("DateFinalize");
			Division=rs.getString("Division");

			Forwarded = rs.getString("Forwarded");
			Status=rs.getString("Status");
			String Package_name=null,project_name=null;
			String sql112="select * from xx_packages_project where package_id='"+Package_Id+"' order by Package_name";
			PreparedStatement psdat1 = conn.prepareStatement(sql112);
			ResultSet rsdat1 = psdat1.executeQuery();
			while(rsdat1.next()){
				
				 Package_name=rsdat1.getString("Package_name");										
			}
			String piuq = "select Project from xx_projectattributes_master where project_id='"
					+ Project_Id + "' order by Project";

			PreparedStatement ps3 = conn.prepareStatement(piuq);
			ResultSet rs3 = ps3.executeQuery();
			
			while (rs3.next()) {

				
				project_name = rs3.getString("Project");
				
			}
			
			Date frezedate=null;String pendingwith=null;
			String sql12="select * from xx_record_actions where Document_id='"+Document_Map_Id+"'";
			PreparedStatement psdat = conn.prepareStatement(sql12);
			ResultSet rsdat = psdat.executeQuery();
			while(rsdat.next()){
				frezedate=rsdat.getDate("CurrentDate");
				pendingwith=rsdat.getString("ActionPerformedBy");
			}
			String frezestr = new SimpleDateFormat("dd/MM/yyyy")
			.format(frezedate);	
			/* String sql2 = "select * from xx_projectattributes_master where Project_ID='"+Project_Id+"'";
			ps = conn.prepareStatement(sql1);
			rs = ps.executeQuery();
			 */
			 count=count+1;
			 
		 %>
		<tr>
								<td><INPUT TYPE="radio" NAME="pullbackrec" VALUE="<%=Document_Map_Id%>"/></td>	
<%
	//System.out.print("Real Date Status"+rdstatus+rd);
if (rdstatus.equalsIgnoreCase("0")) { 
%>			
								
								<td><input type="text" id="ApprovalDate<%=Document_Map_Id%>"
										name="ApprovalDate<%=Document_Map_Id%>"
										onclick="frezedate('ApprovalDate<%=Document_Map_Id%>','<%=frezedate%>')" readonly="true" 
										style="width: 150px"></td>
<%
} else {
%>
<td><input type="text" id="ApprovalDate<%=Document_Map_Id%>"
							name="ApprovalDate<%=Document_Map_Id%>"  readonly="true"
							style="width: 150px; background-color: lightgray;" value=<%=rd %>></td>
<%
}
%>										
								<%-- <td><%=project_name%></td>
								<td><%=Package_name%></td> --%>
								<td><%=count%></td>
								<td><%=Document_Type3%></td>
								<td><%=Document_Number %></td>
								<td><%=Document_Name%></td>						
								<%-- <td><%=Revision_Id%></td> --%>
								<!-- <td><%=Project_Id%></td><td><%=Package_Id%></td> -->
								<td><%=pendingwith%></td>
								<td><%=frezestr%></td>
								<td><a
						href="recordReport.jsp?Document_Type=<%=Document_Type%>&doc_id=<%=Document_Map_Id%> " target="_blank">
							Log Details </a>
					</td>
								<%-- <td><%=HierarchyType%></td>
								<td><%=Zone_HierarchyId%></td>
								<td><%=Division_HierarchyId%></td>
								<td><%=Document_Status%></td>
								<td><%=DateFinalize%></td>
								<td><%=Division%></td>
								< td><%=Forwarded%></td> 
								<td><%=Status%></td>--%>
								
								
									<%-- <td><input type="button" class="btn btn-primary"
									id="btnShownt<%=Document_Map_Id%>" value="Finally Approved"
									onclick="FinalApproval('<%=Document_Map_Id%>','<%=Submitted_by%>')"></td> --%>
			<%

				} 
			
			
			
			
			
		}
		} 

    try { conn.close(); } catch (Exception e) { /* ignored */ }
	
	
	%>
		</table>
</c:if>




	</form>
</body>
</html>