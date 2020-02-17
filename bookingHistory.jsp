<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
    <body>
        <table>
            <th>Doctor id</th>
            <th>Category</th>
            <th>Date</th>
            <th>Time</th>
            <!----------------   JSTL Query  --------------->
            <sql:query dataSource = "${snapshot}" var = "result">
                SELECT * from booked where id = ?;
                <sql:param value="${userId}"></sql:param>
            </sql:query>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr class="pra-form">
                        <td><c:out value = "${row.drId}"/></td>
                        <td><c:out value = "${row.category}"/></td>
                        <td><c:out value = "${row.date}"/></td>
                        <td><c:out value = "${row.time}"/></td>
                    </tr>
                </c:forEach>
        </table> 
    </body>
</html>
