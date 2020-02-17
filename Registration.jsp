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
                    INSERT INTO register(id, pass, names, nationality, passport, phone, address, email) VALUES (?,?,?,?,?,?,?,?);
                    <sql:param value="${param.id}" />
                    <sql:param value="${param.id}" />
                    <sql:param value="${param.names}" />
                    <sql:param value="${param.nationality}" />
                    <sql:param value="${param.passport}" />
                    <sql:param value="${param.phone}" />
                    <sql:param value="${param.address}" />
                    <sql:param value="${param.email}" />
                </sql:update>
                    <c:choose>
                    <c:when test="${query>=1}">
                        <script language="JavaScript">
                            alert("Booklet Successfully Created");
                            location='representativeBookings.jsp';
                        </script>
                    </c:when>
                    <c:otherwise>
                        <script language="JavaScript">
                            alert("Not Created");
                        </script>
            </c:otherwise>
        </c:choose>
            </c:catch>
       <c:if test="${e!=null}">
           <script language="JavaScript">
               alert("Eror ID/Passport Duplicated!!!!");
               location='representativeBookings.jsp';
            </script>
       </c:if>
            
        </c:if>
         
 
    </body>
</html>