<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>Health Bank</title>
    </head>
    <body>
        <c:catch var="e">
            <sql:update dataSource = "${snapshot}" var = "query">
                INSERT INTO booked(id, drId, category, date, time) VALUES (?,?,?,?,?);
                <sql:param value="${param.medId}"></sql:param>
                <sql:param value="${param.drId}"></sql:param>
                <sql:param value="${param.category}"></sql:param>
                <sql:param value="${param.date}"></sql:param>
                <sql:param value="${param.time}"></sql:param>
            </sql:update>
                <c:choose>
                    <c:when test="${query>=1}">
                        <script language="JavaScript">
                            alert("Booking added");
                            location='finalPatientBookings.jsp';
                         </script>
                    </c:when>
                </c:choose>
        </c:catch>
                    <c:if test="${e!=null}">
                        <script language="JavaScript">
                            alert("No submited");
                            location='finalPatientBookings.jsp';
                         </script>
                    </c:if>
    </body>
</html>