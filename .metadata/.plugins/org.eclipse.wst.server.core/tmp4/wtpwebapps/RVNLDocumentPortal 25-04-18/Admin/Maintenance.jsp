<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%@ page import="javax.naming.*,java.sql.*,javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@include file="included/NewHeader.jsp"%>
<title>Maintenance </title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>

div.absolute {
   	position:absolute;
   	margin-top: 5px;
   	margin-left: 13px;
   	margin-bottom: 20px;
 	padding: 15 px;
    width: auto;
    height: 30px;
    border: 3px double #ff4d4d;
    background-color:#ffe6e6;
        }
    table.center {
    margin-left:auto; 
    margin-right:auto;
  }
  
</style>

<SCRIPT type="text/javascript">
   // window.history.forward();
   // function noBack() { window.history.forward(); }
   
    function formSubmit() {
    	var mq1=document.getElementById("marquee-launch").value;
    	var mq2=document.getElementById("marquee-maint").value;
    	var mq3=document.getElementById("marquee-other").value;
    	var mq4=document.getElementById("marquee-Rly").value;
    	var mq5=document.getElementById("marquee-RVNL").value;
    	var msg1=document.getElementById("msg-1").value;
    	var msg2=document.getElementById("msg-2").value;
    	var msg3=document.getElementById("msg-3").value;
    	var pic1=document.getElementById("pic-1").value;
    	var pic2=document.getElementById("pic-2").value;
    	var pic3=document.getElementById("pic-3").value;
    	if (mq1.length<500 && mq2.length<500 && mq3.length<500 && mq4.length<500 && mq5.length<500 && msg1.length<500 && msg2.length<500 && msg3.length<500 && pic1.length<500 &&
    			pic2.length<500 && pic3.length<500) {
    
    		document.maintPage.Project_stage.value="first" ;
    	document.getElementById('maintPage').submit();
    	//alert("heloo");
    	} else {alert("One of input is longer than 500 char. Please reduce the length.........");}
    }
    
</SCRIPT>
</head>
<style type="text/css">
</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
</head>
<body>   
 <div class="absolute" style="font-weight:bold" ><h8>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Maintenance] &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h8>

<h8><font style="color:red; font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome&nbsp;</font><font style="color:#3333cc; font-weight:normal">:&nbsp;<%=(String)session.getAttribute("user_name") %>&nbsp;&nbsp;&nbsp;</font></h8><br>
</div>
   

<form id="maintPage" name="maintPage" method="post"  >
<INPUT TYPE="HIDDEN" NAME="Project_stage">		
	<c:if test="${param.Project_stage == null}">	
	
    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
    String msg1=null, msg2=null, msg3=null, pic1=null, pic2=null, pic3=null, item=null, desc=null;					
		
   // String error=null;
     //       error=(String)session.getValue("u_error");
       //     if(error==null)   {
    	   
    	   %>
    	   <br><br>
   <table   style="width:90%; margin-left:30px; margin-right:50px;">
   <center><tr height="50px"><b><th>S. No.</th><th> Item</th><th>Description</th></b></tr></center>
   <%
    	         Connection conn2 = null;
     			PreparedStatement ps227=null, ps32=null, ps33=null;
     			ResultSet  rs227=null, rs32=null, rs33=null;
     			int n2=0;
     			
     						//Statement stmt = null;
     						try {
     							Context initCtx = new InitialContext();
     							Context envCtx = (Context) initCtx.lookup("java:comp/env");
     							DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");

     							conn2 = ds.getConnection();
     							String sql35 = "select item, description from xx_maintenance where item<>'profile_alert' and item<>'doc_action_alert' order by item";
     								
    								ps227 = conn2.prepareStatement(sql35);
    								rs227 = ps227.executeQuery();
    								while (rs227.next()) {
    									item=rs227.getString(1);
    									 desc=rs227.getString(2);
    									 n2++;
             %>   
   <tr><td width="5%"> <%=n2 %></td><td width="15%"> <%=item %></td>
                <td width="80%"> <input type="text" maxlength="500" style="width:100%;     border-top: groove;
    border-right: groove;height:30px;// background-color:#F0FCB4;" id="<%=item %>" name="<%=item %>" value="<%=desc %>"></td></tr>
                     
                     <%
    								}
									
     						}catch(Exception e){
    							
    							e.printStackTrace();
    						} finally {
    						    try { rs227.close(); } catch (Exception e) { /* ignored */ }
    						    try { ps227.close(); } catch (Exception e) { /* ignored */ }
    						    try { conn2.close(); } catch (Exception e) { /* ignored */ }
    						}
     						
                     %>
</table>
<br><br>
<button type="button" id="btnclick" class="btn btn-primary" style="margin-left:100px;" onclick="formSubmit();">Submit</button> 
			
			
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-primary" value="Cancel" onclick="location.reload()" />
		
	</c:if>	
		
		
<c:if test="${param.Project_stage != null}">
		<%			
		String mq1=request.getParameter("marquee-launch");
		String mq2=request.getParameter("marquee-maint");
		String mq3=request.getParameter("marquee-other");
		String mq4=request.getParameter("marquee-Rly");
		String mq5=request.getParameter("marquee-RVNL");
		String msg11=request.getParameter("msg-1");
		String msg21=request.getParameter("msg-2");
		String msg31=request.getParameter("msg-3");
		String pic11=request.getParameter("pic-1");
		String pic21=request.getParameter("pic-2");
		String pic31=request.getParameter("pic-3");
		/*
		String path="images";
		    ArrayList<String> filenames = new ArrayList<String>();
		   
		   File directory = new File(path);
	        //get all the files from a directory
	        File[] fList = directory.listFiles();
	        for (File file : fList){
	            System.out.println(file.getName());
	        }
		     
		      InputStream in = getClass().getClassLoader().getResourceAsStream( path );
		      String resource;
		      BufferedReader br = new BufferedReader( new InputStreamReader( in ) );
		        while( (resource = br.readLine()) != null ) {
		        filenames.add( resource );
		      }

		   // return filenames;
		 
		    System.out.println("out......."+mq1+mq3+pic21+ filenames.get(2));
		    */
		try {
					
			%>
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   UPDATE xx_maintenance SET Description="<%=mq1 %>"  where Item="marquee-launch"   
			</sql:update>	
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   UPDATE xx_maintenance SET Description="<%=mq2 %>"  where Item="marquee-maint" 
			</sql:update>
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   UPDATE xx_maintenance SET Description="<%=mq3 %>"  where Item="marquee-other" 
			</sql:update>	
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   UPDATE xx_maintenance SET Description="<%=mq4 %>"  where Item="marquee-Rly" 
			</sql:update>	
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   UPDATE xx_maintenance SET Description="<%=mq5 %>"  where Item="marquee-RVNL" 
			</sql:update>	
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   UPDATE xx_maintenance SET Description="<%=msg11 %>"  where Item="msg-1" 
			</sql:update>	
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   UPDATE xx_maintenance SET Description="<%=msg21%>"  where Item="msg-2" 
			</sql:update>	
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   UPDATE xx_maintenance SET Description="<%=msg31 %>"  where Item="msg-3" 
			</sql:update>	
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   UPDATE xx_maintenance SET Description="<%=pic11 %>"  where Item="pic-1" 
			</sql:update>	
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   UPDATE xx_maintenance SET Description="<%=pic21 %>"  where Item="pic-2" 
			</sql:update>	
			<sql:update dataSource="jdbc/MySQLDB" var="rs">
			   UPDATE xx_maintenance SET Description="<%=pic31 %>"  where Item="pic-3"  
			</sql:update>	
			<br>
			 <div  style='vertical-align: baseline; padding: 10px; margin: 20px;'>
				 <div class="alert alert-success" align="center">
				 <strong>Success!</strong> Maintenance Page has been updated successfully.
				 <br>
				 <br>
				 <input class='btn btn-primary' value='OK'  onclick="window.location='Maintenance.jsp';" type='button'/>
				 </div>
			</div> <br> <br>

				 		  
			<%
				//		conn.close();
					}catch(Exception e){
						e.printStackTrace();
					}			
			%>
		</c:if>	
			</form>		
				<%@include file="included/footer.jsp"%>

			</body>
			</html>