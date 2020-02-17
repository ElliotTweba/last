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
                INSERT INTO pharmacist(id, pass, names, nationality, passport, phone, email, gender) VALUES (?,?,?,?,?,?,?,?);
                <sql:param value="${param.id}" />
                <sql:param value="${param.id}" />
                <sql:param value="${param.names}" />
                <sql:param value="${param.nationality}" />
                <sql:param value="${param.passport}" />
                <sql:param value="${param.phone}" />
                <sql:param value="${param.email}" />
                <sql:param value="${param.gender}" />
            </sql:update>
                <c:choose>
                    <c:when test="${query>=1}">
                        <script language="JavaScript">
                            alert("Pharmacist Successfully Added");
                            location='pharmacists.jsp';
                        </script>
                    </c:when>
                    <c:otherwise>
                        <script language="JavaScript">
                            alert("Pharmacist Not Added");
                            location='registerpharmacist.jsp';
                        </script>
                    </c:otherwise>
                </c:choose>
        </c:catch>
                    <c:if test="${e!=null}">
                        <script language="JavaScript">
                            alert("Error Occured Retry!");
                            location='registerpharmacist.jsp';
                        </script>
                    </c:if>
    </body>
</html>