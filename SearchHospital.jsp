<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>Health Bank</title>
    </head>
    <body>
        <!----------------   JSTL Query starts --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from hospitals where id = ?;
                                    <sql:param value="${param.id}"></sql:param>
                                </sql:query>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <div class="pra-form">
                                        <center><p class="main-head">Hospital - Details</p></center>
                                        <table>
                                            <th>Hospital Number</th>
                                            <th>Name</th>
                                            <th>District</th>
                                            <th>Options</th>
                                            <tr>
                                                <td><c:out value = "${row.id}"/></td>
                                                <td><c:out value = "${row.Name}"/></td>
                                                <td><c:out value = "${row.District}"/></td>
                                                <td><button type="submit" id="myBtn">Update</button></td>
                                            </tr>
                                        </table>
                                    </div>
                                </c:forEach>
    </body>
</html>

