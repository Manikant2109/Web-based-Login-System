<%@page contentType="text/html" import="java.sql.*"%>
<html><head><title>THE GREEN AURA</title><link rel="shortcut icon" href="favicon.ico" type="image/x-icon"></head>
<body text = "white">

    <%
        String uname=request.getParameter("txtemail");
        String pass = request.getParameter("txtPass");
       

        try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("Jdbc:Oracle:thin:@localhost:1521:xe","system","333");
    PreparedStatement stmt = con.prepareStatement("select pass1 from tga where email=?");
    stmt.setString(1, uname);  
    ResultSet rs = stmt.executeQuery();
    if(rs.next()){
        if(pass.equals(rs.getString(1)))
        {	
	%>	
	   <jsp:include page="welcome.html" ></jsp:include>
        <%
	}		
        else
	{
	   out.println("<h1>Wrong Password entered ....</h1>");
        %>	
	   <jsp:include page="login.html" ></jsp:include>
        <%
	}	
        }
    else
    {
	
	out.println("<h1>Username does not exist ....</h1>");
    %>
    <jsp:include page="login.html" ></jsp:include>
        <%
    }
        }catch(Exception e){out.println(e);}
   %>
    </body>
</html>

