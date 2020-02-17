<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>Health Bank</title>
    </head>
    <body>
        <table>
            <th>Doctor Id</th>
            <th>Names</th>
            <th>Nationality</th>
            <th>Passport</th>
            <th>Category</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Gender</th>
            <!----------------   JSTL Query starts --------------->
            <sql:query dataSource = "${snapshot}" var = "result">
                SELECT * from doctors;
            </sql:query>
            <c:forEach var = "row" items = "${result.rows}">
                <tr class="pra-form">
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.names}"/></td>
                    <td><c:out value = "${row.nationality}"/></td>
                    <td><c:out value = "${row.passport}"/></td>
                    <td><c:out value = "${row.category}"/></td>
                    <td><c:out value = "${row.address}"/></td>
                    <td><c:out value = "${row.phone}"/></td>
                    <td><c:out value = "${row.email}"/></td>
                    <td><c:out value = "${row.gender}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
