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
           SELECT * from hospitals;
       </sql:query>
       <c:forEach var = "row" items = "${result.rows}">
           <div class="pra-form">
               <table>
                   <th>Hospital ID</th>
                   <th>Name</th>
                   <th>District</th>
                   <tr>
                       <td><c:out value = "${row.id}"/></td>
                       <td><c:out value = "${row.Name}"/></td>
                       <td><c:out value = "${row.District}"/></td>
                   </tr>
               </table>
           </div>
       </c:forEach> 
    </body>
</html>