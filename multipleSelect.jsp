

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
    <body>
        <%@page import ="java.sql.*"%>
        <%@page import ="javax.sql.*"%>
        
        <%;
          
                
                Connection con = null;
                ResultSet rs = null;
                Statement st = null;

                Connection con1 = null;
                Statement st1 = null;
                ResultSet rs1 = null;
                
                int a=0;
                int b=0;
                
                
                
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb?zeroDateTimeBehavior=convertToNull","root","");
                     st = con.createStatement();
                     rs = st.executeQuery("SELECT * FROM login WHERE user='rasta'");
                    while(rs.next()){
                        a++;
                        
                    }
                     st.close(); 
                    rs.close(); 
                   
                    
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb?zeroDateTimeBehavior=convertToNull","root","");
                     st1 = con.createStatement();
                     rs1 = st1.executeQuery("SELECT * FROM login WHERE user='tweba'" );
                   while(rs1.next()){
                        b++;
                        
                    }
                   st1.close(); 
                    rs1.close(); 
                   System.out.print("A is"+a);
                    
                    
                    
               
          %>
        
        
    </body>
</html>