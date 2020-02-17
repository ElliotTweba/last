<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>Health Bank</title>
    </head>
       <sql:update dataSource = "${snapshot}" var = "query">
            UPDATE hospitals SET Name = ?, District = ? where id=?
            <sql:param value="${param.name}"></sql:param>
                <sql:param value="${param.district}"></sql:param>
                <sql:param value="${param.id}"></sql:param>
        </sql:update>
        <c:choose>
            <c:when test="${query>=1}">
                <script language="JavaScript">
                    alert("Successfully Updated !");
                    location='hospitals.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("Hospital Not Found!!!");
                    location='hospitals.jsp';
                </script>
            </c:otherwise>
        </c:choose>
 
</html>