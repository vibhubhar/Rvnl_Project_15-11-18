<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
 <%@ page import="com.lowagie.text.pdf.PdfPTable" %>
	<%@ page import="com.lowagie.text.pdf.PdfPCell" %>
  	<%@ page import="com.lowagie.text.pdf.PdfWriter" %>
	<%@ page import="com.lowagie.text.Document" %>
	
	<%@ page import="com.lowagie.text.DocumentException" %>
	<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.lowagie.text.Phrase"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Font"%>
	
	<%@ page import="java.io.*" %>
	 <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.text.DateFormat" %>
    <%@ page import="java.sql.*"%>
    <%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
<%
Context initCtx = new InitialContext();
Context envCtx = (Context) initCtx.lookup("java:comp/env");
DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String sqlQuery = "select distinct a.Document_Number,a.Document_Name,a.Document_Type,a.Document_Status,a.Submitted_by,a.Date_of_Submission,a.Date_of_Revision,b.Document_id,c.Estimated_Time,c.TimeIn,DATEDIFF(a.Date_of_Submission, a.Date_of_Revision) as 'Duration' from xx_document_mapping as a, xx_approval_workflow as b, xx_divisions_hierarchy as c";
con = ds.getConnection();
stmt = con.createStatement();
rs = stmt.executeQuery(sqlQuery);
%>
<%

String document_No = (String)request.getParameter("Document_No");
String document_Name = (String)request.getParameter("Document_Name");
String document_Type = (String)request.getParameter("Document_Type");
String document_Status = (String)request.getParameter("Document_Status");
String submitted_by = (String)request.getParameter("Submitted_by");
String date_of_Submission = (String)request.getParameter("Date_of_Submission");
String date_of_Revision = (String) request.getParameter("Date_of_Revision");
String document_id = (String) request.getParameter("Document_id");
String estimated_Time = (String) request.getParameter("Estimated_Time");
String timeIn = (String) request.getParameter("TimeIn");
String duration = (String) request.getParameter("duration");
%>


<%
response.setContentType("report/pdf");
Document document = new Document();
//document.addTitle("Pdf Report" +startDate1+ "to" +endDate1);

try{
ByteArrayOutputStream buffer = new ByteArrayOutputStream();
PdfWriter.getInstance(document, response.getOutputStream());
document.open();
PdfPTable table1 = new PdfPTable(1);
table1.setHorizontalAlignment(Element.ALIGN_CENTER);
table1.getDefaultCell().setBorder(PdfPCell.NO_BORDER);
table1.setWidthPercentage(80);
document.add(table1);

int i=0;
while(rs.next()){
	document.add(new Phrase("\n\n"));
	
PdfPTable table = new PdfPTable(3);
table.setHorizontalAlignment(Element.ALIGN_CENTER);
table.getDefaultCell().setBorder(PdfPCell.NO_BORDER);
table.setWidthPercentage(80);
table.addCell("Document_No");
table.addCell(":");
table.addCell(rs.getString(1));

//table.addCell("");
//table.addCell("");
//table.addCell("");

table.addCell("Document_Name");
table.addCell(":");
table.addCell(rs.getString(2));

table.addCell("Document_Type");
table.addCell(":");
table.addCell(rs.getString(3));

table.addCell("Document_Status");
table.addCell(":");
table.addCell(rs.getString(4));

table.addCell("Submitted_by");
table.addCell(":");
table.addCell(rs.getString(5));

table.addCell("Date_of_Submission");
table.addCell(":");
table.addCell(rs.getString(6));

table.addCell("Date_of_Revision");
table.addCell(":");
table.addCell(rs.getString(7));

table.addCell("Document_id");
table.addCell(":");
table.addCell(rs.getString(8));

table.addCell("Estimated_Time");
table.addCell(":");
table.addCell(rs.getString(9));

table.addCell("TimeIn");
table.addCell(":");
table.addCell(rs.getString(10));

table.addCell("duration");
table.addCell(":");
table.addCell(rs.getString(11));

document.add(table);
//document.newPage();
i++;
}


document.close();
//document.flush();
document.close();
}catch(Exception e){
e.printStackTrace();
} finally {
    try { con.close(); } catch (Exception e) { /* ignored */ }
}
%>
</body>