<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>Health Bank</title>
    </head>
    <c:catch var="e">
       <sql:update dataSource = "${snapshot}" var = "query">
            UPDATE admin SET name = ?, email = ?, address = ?, phone = ? where id=?
                <sql:param value="${param.name}"></sql:param>
                <sql:param value="${param.email}"></sql:param>
                <sql:param value="${param.address}"></sql:param>
                <sql:param value="${param.phone}"></sql:param>
                <sql:param value="${param.id}"></sql:param>
        </sql:update>
        <c:choose>
            <c:when test="${query>=1}">
                <script language="JavaScript">
                    alert("Successfully Updated !");
                    location='Profile.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("Details Not Found!!!");
                    location='Profile.jsp';
                </script>
            </c:otherwise>
        </c:choose>
    </c:catch>
                <c:if test="${e!=null}">
                <script language="JavaScript">
                    alert("Unable to updtade details!");
                    location='Profile.jsp';
                </script>
            </c:if>
 
</html>