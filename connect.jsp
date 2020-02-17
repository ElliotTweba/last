

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
    <body>
        <%@page import ="java.sql.*"%>
        <%@page import ="javax.sql.*"%>
        
        <%
            
                String type=request.getParameter("selector");
                String user1=request.getParameter("user");
                String pass1=request.getParameter("pass");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb?zeroDateTimeBehavior=convertToNull","root","");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM login WHERE pass='"+pass1+"' and user ='"+user1+"'" );
                    if(rs.next()){
                        response.sendRedirect("admin.jsp");
                        
                    }
                    else{
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Username & Password dont match');");
                        out.println("location='index.html';");
                        out.println("</script>");
                    }
                }
                catch(Exception e){
                    out.println(e);
                }
           
            
            
            %>
        
        
    </body>
</html>