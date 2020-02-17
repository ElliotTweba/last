<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='DBConnect.jsp'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health Bank</title>
    </head>
    <body>
        <!----------------   JSTL Query starts --------------->
    <sql:query dataSource = "${snapshot}" var = "result">
        SELECT * from doctors where names = ?;
        <sql:param value="${param.txt}"></sql:param>
    </sql:query>
    <c:forEach var= "row" items = "${result.rows}">
        <div class="pra-form">
            <center><p class="main-head">Doctor - Details</p></center>
            <table>
                <th>Doctor ID</th>
                <th>Names</th>
                <th>Nationality</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Email</th>
                <tr>
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.names}"/></td>
                    <td><c:out value = "${row.nationality}"/></td>
                    <td><c:out value = "${row.category}"/></td>
                    <td><c:out value = "${row.nationality}"/></td>
                    <td><c:out value = "${row.address}"/></td>
                    <td><c:out value = "${row.phone}"/></td>
                    <td><c:out value = "${row.email}"/></td>
                </tr>
            </table>
        </div>
    </c:forEach>
    </body>
</html>
