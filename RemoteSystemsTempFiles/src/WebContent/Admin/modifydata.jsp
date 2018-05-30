
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="included/NewHeader.jsp"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*,java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page session="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<script type="text/javascript">
    function refreshAndClose() {
        window.opener.location.reload(true);
        window.close();
    }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
PreparedStatement pstatement = null;
double frmkm=0.000;
double tokm=0.000;
double stnkm=0.000;
String smajsec = null;
String stn = null;
String stnkm1 = null;
String majsec = null;
String frmkm1 = null;
String tokm1 = null;


	System.out.println("You are inside the modifydata");
		String projectid = request.getParameter("Proj_Id22");
		String docid = request.getParameter("Document_Map_ID");
		System.out.println("Doc Id"+docid);
		String documenttype = request.getParameter("DocumentType");
		String documentno = request.getParameter("DocumentNo");
		String documentname = request.getParameter("DocumentName");
		String divs = request.getParameter("divisiontype");
		String divtype = request.getParameter("divisiontype");
		String loctype = request.getParameter("loc_type");

		if (loctype.equalsIgnoreCase("Station")) {
			smajsec = request.getParameter("sMajsec");
			 stn = request.getParameter("stn");
			// stnkm1 = request.getParameter("stnKm");
			//stnkm = Double.parseDouble(stnkm1);
				
		} else { 
			 majsec = request.getParameter("Majsec");
			 frmkm1 = request.getParameter("frmKm");
			 tokm1 = request.getParameter("toKm");
				 frmkm = Double.parseDouble(frmkm1);
				tokm = Double.parseDouble(tokm1);
			}
		System.out.println("proj id -"+projectid+majsec+smajsec+stn);
				
		String forwd1=null;
		
		%>
		<c:choose>
		<c:when test="${fwd2=='yes'}">
		<%
		forwd1 = "yes";
		%>
		</c:when>
		<c:otherwise>
		<% 
		forwd1 = "nm";
		%>
		</c:otherwise>
		</c:choose>
		<%
		System.out.println("fwd1"+forwd1+"PPPPP");
		java.sql.Date subDate=null;
		java.sql.Date finDate=null;
		
		//Date date=null;
		//String dateSubmitted=null;
		if (!forwd1.equalsIgnoreCase("yes")) {
			//System.out.println("You are inside ............forwd if ...the modifydata");
		String dateSubmitted = request.getParameter("Dateofsubmission");
		String datefin = request.getParameter("Datefinalizedbyrvnl");
		Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dateSubmitted);
		subDate = new java.sql.Date(date.getTime());
		Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(datefin);
		finDate = new java.sql.Date(date1.getTime());
	//System.out.println("Date submn"+dateSubmitted);
		}
/*
	System.out.println("DocumentType DocumentType DocumentType "+documenttype);

	System.out.println("DocumentNo DocumentNo DocumentNo DocumentNo"+documentno);

	System.out.println("DocumentName DocumentNameDocumentName  DocumentName "+documentname);

	System.out.println("divisiontype divisiontype divisiontype divisiontype divisiontype"+divs); */
		PreparedStatement p1 =null;
		Connection conn=null;
		Statement stmt=null;
		String majsecid=null;
		String smajsecid=null;
		String stnid=null;
		int updateQuery = 0;
		//System.out.println("printing my data starts from here ::::"+btnName1+"document Map id ::"+docid+"Document Type:::"+documenttype+"document number::"+documentno);
	
	try{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
		
		conn = ds.getConnection();
		String queryString=null;
		String Zonename=null;
		String zoneq="select * from xx_zones_master where xx_zones_master.Zone_Id=(select Ext_Zone_ID from xx_divisions_map where Division_Name='"+divtype+"')";
		//String selectStmt3 = (Statement) conn.createStatement();
		PreparedStatement ps19 = conn.prepareStatement(zoneq);
		ResultSet rs19 = ps19.executeQuery();
		while (rs19.next()) {
			Zonename = rs19.getString("Zone_Name");
		}
	if (loctype.equalsIgnoreCase("Station")) {
			String majq="select a.Stn_Id, b.Majsec_Id from xx_project_station a join xx_project_km b on a.Major_Section = b.Major_Section where a.Project_Id="+projectid+" and a.Major_Section='"+smajsec+"' and a.Station_Name='"+stn+"'";
			PreparedStatement ps29 = conn.prepareStatement(majq);
			ResultSet rs29 = ps29.executeQuery();
			while (rs29.next()) {
				stnid = rs29.getString("Stn_Id");
				smajsecid = rs29.getString("Majsec_Id");
			} 
			System.out.println("stn"+stnid+stn+"maj"+smajsecid+smajsec+projectid);
	} else {
	
		String majq="select Majsec_Id from xx_project_km where Project_Id="+projectid+" and Major_Section='"+majsec+"'";
		PreparedStatement ps29 = conn.prepareStatement(majq);
		ResultSet rs29 = ps29.executeQuery();
		while (rs29.next()) {
			majsecid = rs29.getString("Majsec_Id");
		}
	}
		if (!forwd1.equalsIgnoreCase("yes") ) {  
if (loctype.equalsIgnoreCase("Station")) {
		 queryString = "UPDATE xx_document_mapping SET Document_Type='"+documenttype+"',Document_Number='"+documentno+"',Document_Name='"+documentname+"', Date_of_Submission='"+subDate+"', DateFinalize='"+finDate+"', Division='" + divtype+"', Zone='"+Zonename+"', Majsec_Id="+smajsecid+", From_Km= null, To_Km= null, Stn_Id="+stnid+", Doc_create_date=now() where Document_Map_ID='"+docid+"'";
} else {
	queryString = "UPDATE xx_document_mapping SET Document_Type='"+documenttype+"',Document_Number='"+documentno+"',Document_Name='"+documentname+"', Date_of_Submission='"+subDate+"', DateFinalize='"+finDate+"', Division='" + divtype+"', Zone='"+Zonename+"', Majsec_Id="+majsecid+", From_Km="+frmkm+", To_Km="+tokm+", Stn_id= null, Doc_create_date=now() where Document_Map_ID='"+docid+"'";
}
} else {
	if (loctype.equalsIgnoreCase("Station")) {
        	queryString = "UPDATE xx_document_mapping SET Document_Type='"+documenttype+"',Document_Number='"+documentno+"',Document_Name='"+documentname+"', Majsec_Id ="+smajsecid+", From_Km= null, To_Km= null, Stn_Id ="+stnid+", Doc_create_date=now()  where Document_Map_ID='"+docid+"'";
        } else {
        	queryString = "UPDATE xx_document_mapping SET Document_Type='"+documenttype+"',Document_Number='"+documentno+"',Document_Name='"+documentname+"', Majsec_Id="+majsecid+", From_Km="+frmkm+", To_Km="+tokm+", Stn_Id= null, Doc_create_date=now() where Document_Map_ID='"+docid+"'";
        }
}
       // }
        	System.out.println("outputing query data "+queryString); 
        
               p1 = conn.prepareStatement(queryString);
                   updateQuery = p1.executeUpdate();
                if (updateQuery != 0) { %>
                
                
                <br><br><center> <div class="alert alert-success" align="center" style="margin-top:100px; width:400px;">
	 <strong>Success!</strong> Data has been updated successfully.
	 <br>
	 <br>
	 <input class='btn btn-primary' value='OK'  onClick="refreshAndClose()" type='button'/>
	 </div></center>
                	
                	
                	
           <%     }
                	 
                
                            }
            //} 
            catch (Exception ex) { %>
            	<table style="background-color: #E3E4FA;text-align:center;margin-left:250px;"
                        WIDTH="35%" border="1">
                           <tr><th>Data is Not Updated Please check it. 
                         </th></tr>
                        </table>
             <%  }
            finally {
                // close all the connections.
	            conn.close();
            }
	%>
	
<!-- <div style="text-align:center;margin-top:130px;"><input type="button" class="btn btn-primary"
							 value="Close"
							onclick="javascript:window.close();opener.window.focus();" /></div>
 -->
	
	<!-- <script type="text/javascript">
window.onload = function() {
   window.open('c_document.jsp','google',' menubar=0, resizable=0,dependent=0,status=0,width=300,height=200,left=10,top=10')
}
</script> -->
	
</body>
</html>