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
            UPDATE admin SET pass = ? where pass=?
                <sql:param value="${param.newPass}"></sql:param>
                <sql:param value="${param.currentPass}"></sql:param>
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
                    alert("Password Don't Match!!!");
                    location='Profile.jsp';
                </script>
            </c:otherwise>
        </c:choose>
    </c:catch>
                <c:if test="${e!=null}">
                <script language="JavaScript">
                    alert("Password Don't Match!!!");
                    location='Profile.jsp';
                </script>
            </c:if>
 
</html>