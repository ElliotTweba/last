<%@page import="java.sql.*"%>
<%
String Slots="";
String lang[]=request.getParameterValues("time");
for(int i=0;i<lang.length;i++){
    Slots+=lang[i]+" ";
}

        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb", "root", "");
        Statement st=con.createStatement();
        int i=st.executeUpdate("insert into bookingslots(slots) values('"+Slots+"')");
        out.println("Data is successfully inserted into database.");
        }
        catch(Exception e){
        System.out.println(e);
} %>


