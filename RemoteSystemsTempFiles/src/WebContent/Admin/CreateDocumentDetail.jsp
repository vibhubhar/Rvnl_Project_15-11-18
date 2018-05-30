<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import = "java.lang.Integer"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rail Vikas Nigam Limited</title>
<link href="loginmodule.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="images/logo.jpg" type="image/x-icon"> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
</head>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rail Vikas Nigam Limited</title>
<link href="resources/css/main.css" rel="stylesheet" type="text/css">
<script src="resources/JS/backButton.js"></script>
<script src="resources/JS/validate230.js"></script>
<script language="javascript">
	function changeIt() {
		var i = 1;
		my_div.innerHTML = my_div.innerHTML
				+ "<br><input type='text' name='Dname'+ i++> <select name='DType'+ i++> <option id ='op' + i++> <input type='text' name='DNo'+ i++><input type='text' name='SDate'+ i++><input type='text' name='RDate'+ i++>";
	                    }
	$(function() {
	     $( "#datepicker1" ).datepicker();
	     $( "#datepicker2" ).datepicker();

	   });
</script>
</head>
<body>
	<br>
	<br>


	<sql:query var="rs" dataSource="jdbc/MySQLDB">
               select * from xx_documentattributes_master
             </sql:query>

	<form name="form" id="form" method="post">
	
    <tr width ="100%">
    <td>
<input autocomplete="off" class="input" id="Dname" name="Dname" type="text" placeholder="Document Name" data-items="8"/>
</td>	
<td>
<select name=DType id="DType" placeholder="Document Type">
					<option id ="op" value="none">-- Select document type --</option>
					<c:forEach var="row" items="${rs.rows}">
						<option value="${row.document_type}"><input type='checkbox' name='docType' id='docType' value="${row.document_type}">${row.document_type}<br></option>
						
					</c:forEach>
			</select>
</tr>
<td>
<input   id="DNo" name="DNo" type="text" placeholder="Document Number" data-items="8"/>
</td>
<td>
<input autocomplete="off" class="input" id="datepicker1" name="SDate" type="text" placeholder="Expected Start Date" data-items="8"/>
</td>
<td>
<input autocomplete="off" class="input" id="datepicker2" name="RDate" type="text" placeholder="Revision Date" data-items="8"/>
</td>
<td>
<input type="button" value="+" onClick="changeIt()">
<div id="my_div"></div>
</td>
							
</tr><br><tr>
      <td>&nbsp;</td>

       <td>     <br><br>
       
       <button type="button" onclick="javascript:validateDocument();">Display</button> 
       
       </form>		
       </td>
    </tr>
</table>
      
	<%
		String dname = request.getParameter("Dname");
		String dtype = request.getParameter("DType");
		String dno = request.getParameter("DNo");
		String sdate = request.getParameter("SDate");
		String rdate = request.getParameter("RDate");
		String ProjectId = request.getParameter("ProjectId");
		//String P_ID = (String)pageContext.getAttribute("ProjectID",PageContext.SESSION_SCOPE);  
		System.out.println("project iddfvdvsdvv v--" + ProjectId);
  System.out.println("---"+dname+"//"+dtype+"//"+dno+"//"+sdate+"//"+rdate);
		try {
System.out.println("------jhu");
			if (dname == null || dname == "" || dtype == null || dtype == "-- Select document type --"
					|| dtype == "" || dno == null || dno == "") {
				System.out.println("------xcvmn ");
	
		} else {

	%>   
	<sql:update dataSource="jdbc/MySQLDB" var="rs">
   INSERT INTO xx_document_mapping (Document_Name,Document_Number,Document_Type,Date_of_Submission,Date_of_Revision,Project_ID) VALUES ('<%=dname%>','<%=dno%>','<%=dtype%>','<%=sdate%>','<%=rdate%>','<%=ProjectId%>');
</sql:update>


	<%
		}
		} catch (Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
	%>

</body>
</html>


