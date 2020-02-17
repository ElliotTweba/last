<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@ include file='DBConnect.jsp' %>
 
<html>
   <head>
      <title>SELECT Operation</title>
   </head>

   <body>
      <form action="multi.jsp" method="GET">
          <select name="sex">
    <c:forEach items="${sexList}" var="sex">
       <option value="${sex}">${sex}</option>
    </c:forEach>
  </select>
          <input type="submit" value="submit"/>
      </form>
 
   </body>
</html>

