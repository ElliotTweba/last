<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>example-aggregate-functions-and-grouping-count-with-group-by</title>
</head>
<body>
<%
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
String Host = "jdbc:mysql://localhost:3306/hb";
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
connection = DriverManager.getConnection(Host, "root", "");
statement = connection.createStatement();
String Data = "SELECT pass, COUNT(*)FROM register GROUP BY pass";
rs = statement.executeQuery(Data);
%>
<TABLE border="1"><tr>
<td>pass</td>
<td>Number of duplicates</td>
</tr>
<%
while (rs.next()) {
%>
<tr>
<td><%=rs.getString("pass")%></td>
<td><%=rs.getString("COUNT(*)")%></td>
</tr>
<%   }    %>
</table>
<%
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
out.println("Can’t connect to database.");
}
%>
</body>
</html>