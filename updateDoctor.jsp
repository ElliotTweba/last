<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>Health Bank</title>
    </head>
       <sql:update dataSource = "${snapshot}" var = "query">
            UPDATE doctors SET pass = ?, address = ?, phone = ?, email = ? where id=?
            <sql:param value="${param.pass}"></sql:param>
                <sql:param value="${param.address}"></sql:param>
                <sql:param value="${param.mobile}"></sql:param>
                <sql:param value="${param.email}"></sql:param>
                <sql:param value="${param.id}"></sql:param>
        </sql:update>
        <c:choose>
            <c:when test="${query>=1}">
                <script language="JavaScript">
                    alert("Successfully Updated !");
                    location='finalBookings.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("Details Not Found!!!");
                    location='finalBookings.jsp';
                </script>
            </c:otherwise>
        </c:choose>
 
</html>