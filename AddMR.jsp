<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
<html>
    <head>
        <title>Health Bank</title>
    </head>
    <body>
        <c:if test="${pageContext.request.method=='POST'}">
            <c:catch var="e">
                <sql:update dataSource = "${snapshot}" var = "query">
                    INSERT INTO medicalrecords(id, disease, prescription,date) VALUES (?,?,?,?);
                    <sql:param value="${param.id}" />
                    <sql:param value="${param.disease}" />
                    <sql:param value="${param.prescription}" />
                    <sql:param value="${param.date}" />
                </sql:update>
                    <c:choose>
                        <c:when test="${query>=1}">
                            <script language="JavaScript">
                                alert("MR Successfully added");
                                location='practitioner.jsp';
                            </script>
                        </c:when>
                        <c:otherwise>
                            <script language="JavaScript">alert("No submited"); </script>
                        </c:otherwise>
                    </c:choose>
            </c:catch>
            <c:if test="${e!=null}">
                <script language="JavaScript">
                    alert("Error Occured Retry!");
                    location='practitioner.jsp';
                </script>
            </c:if>
        </c:if>
    </body>
</html>