<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>Health Bank</title>
    </head>
    <body>
        <sql:update dataSource = "${snapshot}" var = "query">
                    INSERT INTO booking(id, book_date, time1, time2, time3, time4, time5, time6, time7, time8, time9, time10, time11, time12,) VALUES 
                    (?,?,?,?,?,?,?,?,?,?,?,?,?,?);
                    <sql:param value="${param.id}" />
                    <sql:param value="${param.book_date}" />
                    <sql:param value="${param.time1}" />
                    <sql:param value="${param.time2}" />
                    <sql:param value="${param.time3}" />
                    <sql:param value="${param.time4}" />
                    <sql:param value="${param.time5}" />
                    <sql:param value="${param.time6}" />
                    <sql:param value="${param.time7}" />
                    <sql:param value="${param.time8}" />
                    <sql:param value="${param.time9}" />
                    <sql:param value="${param.time10}" />
                    <sql:param value="${param.time11}" />
                    <sql:param value="${param.time12}" />
                </sql:update>
                    <c:choose>
                        <c:when test="${query>=1}">
                            <script language="JavaScript">
                                alert("Slots Successfully added");
                                location='representativeBookings.jsp.jsp';
                            </script>
                        </c:when>
                        <c:otherwise>
                            <script language="JavaScript">alert("No submited"); </script>
                        </c:otherwise>
                    </c:choose>
    </body>
</html>