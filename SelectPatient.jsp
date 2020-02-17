<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
 <head>
     <style type="css/text">
         
            table{
                width: 900%;
                background: #fff;
                border:1px solid #ddd;
                padding: 10px 10px;
            }
            td{
                padding: 10px;
                text-align: center;
            }
     </style>
 </head>
    <body>
        <table>
            <th>Pat ID</th>
            <th>Disease</th>
            <th>Prescription</th>
            <th>Date</th>
            <!----------------   JSTL Query  --------------->
            <sql:query dataSource = "${snapshot}" var = "result">
                SELECT * from medicalrecords where id = ?;
                <sql:param value="${userId}"></sql:param>
            </sql:query>
                <c:forEach var = "row" items = "${result.rows}">
                    <tr class="pra-form">
                        <td><c:out value = "${row.id}"/></td>
                        <td><c:out value = "${row.disease}"/></td>
                        <td><c:out value = "${row.prescription}"/></td>
                        <td><c:out value = "${row.date}"/></td>
                    </tr>
                </c:forEach>
        </table> 
    </body>
</html>
