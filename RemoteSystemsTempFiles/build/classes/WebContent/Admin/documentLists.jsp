<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String docid=request.getParameter("document_type");
String projectid=request.getParameter("projectid");
System.out.println(docid+"docid");
String buffer="";
String htype=null,divhid=null,zonhid=null;
int flag=0,Typ=0;


try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     Connection conn = ds.getConnection();
	     String sql="select *  from xx_document_mapping where project_ID='"+projectid+"' and Document_Type='"+docid+"'";
	   //String sql = "select mas.designation_name from xx_designation_master mas,xx_designation_mapping map ,xx_departments_master dmas,"+
//	         	 "xx_piu_master piu where map.designation_Id = mas.designation_Id and map.Department_Id = dmas.Department_id and piu.piu_id = map.piu_id and" +
//	   	      " piu.piu_name ='"+piu+"' and dmas.department_name = ?";

	     
	      buffer="<div id ='hierarchyList' style='display: inline;'><tr></br>Document Name:<select name='documentName' id='documentName' style='width: 205px' ><option value='-1'>Select Document Name</option></div>";  

	   PreparedStatement ps4 = conn.prepareStatement(sql);
	    // ps3.setString(1, piu);
	     ResultSet rsl = ps4.executeQuery(); 
	     while(rsl.next()){
	   String Docname=rsl.getString("Document_Name");
	   int docmapid=rsl.getInt("Document_Map_ID");
	   if(!Docname.equalsIgnoreCase("null")){
	   	 flag=1;
	   	 }	 
	   buffer=buffer+"<option value='"+docmapid+"'>"+Docname+"</option>";  
	   }  
	     
	   // session.setAttribute("designation_name", Desg_name);
	   buffer=buffer+"</select>"; 
	   System.out.println("FLAG="+flag); 
	   if(flag==1){
	   response.getWriter().println(buffer); 
	   }else{
	   	//buffer=buffer+"<option value='CPM'>CPM</option></select>";
	      buffer="<div id ='hierarchyList' style='display: inline;'><select name='documentName' id='documentName' style='width: 205px'><option value='-1'>Select</option></div>";  
	   	response.getWriter().println(buffer);
	   }

	   conn.close();
}catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>