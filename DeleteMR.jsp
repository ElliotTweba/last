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
         delete from medicalrecords where id = ?;
         <sql:param value="${param.id}"></sql:param>
      </sql:update>
        <c:choose>
            <c:when test="${query>=1}">
                <script language="JavaScript">
                    alert("Patient Deleted !");
                    location='admin.jsp';
                </script>
            </c:when>
            <c:otherwise>
                <script language="JavaScript">
                    alert("No Found");
                    location='admin.jsp';
                </script>
            </c:otherwise>
        </c:choose>
</body> 
</html>