<%@page contentType="text/html" import="java.sql.*"%>
<html><head><title>THE GREEN AURA</title><link rel="shortcut icon" href="favicon.ico" type="image/x-icon"></head>
<body text = "white">


    <%
	String fname=request.getParameter("txtfname");
        String lname=request.getParameter("txtlname");
        String email=request.getParameter("txtemail");
        String pass1 = request.getParameter("txtPass1");
        String pass2 = request.getParameter("txtPass2");

  if(pass1.equals(pass2)){
        try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("Jdbc:Oracle:thin:@localhost:1521:xe","system","333");
    PreparedStatement stmt = con.prepareStatement("insert into tga values (?,?,?,?)");
    stmt.setString(1, fname);    stmt.setString(2, lname); stmt.setString(3,email);
    stmt.setString(4, pass1);    
    int row = stmt.executeUpdate();
    if(row==1) 
	{ 
	out.println("Registration Successful");
	%>	
	   <jsp:include page="login.html" ></jsp:include>
        <% 
	}
    else {    
        out.println("Registration FAILED !!!!");
        %>
            <jsp:include page="register.html" ></jsp:include>
        <%
    
        }
    }
	catch(Exception e)
	{out.println(e);}
  }
  else 
  {
  out.println("<h1>Password Mismatch</h1>");
  %>
  <jsp:include page="register.html" ></jsp:include>
<%  
}
    %>
    </body>
</html>