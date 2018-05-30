<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@ page import="javax.naming.*,java.sql.*,javax.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<%



String piu=request.getParameter("PIU");  
String buffer="<br>";
int flag=0;
Connection conn = null;
//System.out.println("piu name from="+piu);
try{
	
	 Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	     DataSource ds = (DataSource) envCtx.lookup("jdbc/MySQLDB");
	     
	     conn = ds.getConnection();
String piuq="select PIU_ID from xx_piu_master where piu_Name='"+piu+"'";

 PreparedStatement ps4 = conn.prepareStatement(piuq);
   ResultSet rsl = ps4.executeQuery(); 
 rsl.next();
 String piuid=rsl.getString(1);

 System.out.println("piu id from="+piuid);
 
 String sql = "select user_name from xx_user_master where role='LocalUser' and PIU_ID='"+piuid+"'";
 PreparedStatement ps3 = conn.prepareStatement(sql);
   ResultSet rs = ps3.executeQuery(); 
 
 

 buffer=buffer+"<p style='color:red;'> Local admin already exists with User-Id = '";

 while(rs.next()){
	 
	 
	 
	 String user_name = rs.getString("user_name");	
	 
	 System.out.println("username ="+user_name);
	 
	 if(!user_name.equalsIgnoreCase("null")){
		 flag=1;
		 }	 
 	buffer=buffer+user_name+"'";
   }  

buffer=buffer+"</p>"; 
//System.out.println("FLAG="+flag); 
if(flag==1){
 response.getWriter().println(buffer); 
}else{
	response.getWriter().println("");
}

}
 catch(Exception e){
     System.out.println(e);
 } finally {
	    try { conn.close(); } catch (Exception e) { /* ignored */ }
 }





%>




</body>
</html>