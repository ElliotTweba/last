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
            <th>Pat ID</th>
            <th>Disease</th>
            <th>Prescription</th>
            <!----------------   JSTL Query  --------------->
            <sql:query dataSource = "${snapshot}" var = "result">
                SELECT * from medicalrecords;
            </sql:query>
            <c:forEach var = "row" items = "${result.rows}">
                <tr class="pra-form">
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.disease}"/></td>
                    <td><c:out value = "${row.prescription}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
