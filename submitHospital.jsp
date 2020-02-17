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
            INSERT INTO hospitals(id, Name, District) VALUES (?,?,?);
            <sql:param value="${param.id}" />
            <sql:param value="${param.name}" />
            <sql:param value="${param.district}" />
        </sql:update>
        <c:choose>
            <c:when test="${query>=1}">
                <script language="JavaScript">
                    alert("Hospital added");
                    location='hospitals.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("No submited");
                </script>
            </c:otherwise>
        </c:choose>
    </body>
</html>