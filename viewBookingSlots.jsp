
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='DBConnect.jsp' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        <link href="css/buttons.css" rel="stylesheet">
    </head>
    <body>
        <!----------------   JSTL Query  --------------->
        <sql:query dataSource = "${snapshot}" var = "result">
            SELECT * from booking;
        </sql:query>
        <c:forEach var = "row" items = "${result.rows}">
            <div class="single-col">
            <center>
            <p>Available Slots</p>
            <div class="styled-input-container styled-input--square">
                <table>
                    <tr>
                        <td>
                            <div class="styled-input-single">
                                <input type="radio" name="fieldset-2" id="radio2-example-one" value="<c:out value = "${row.time1}"/>" onclick="check();"/>
                                <label for="radio2-example-one">Slot A</label>
                            </div>
                        </td>
                        <td>
                           <div class="styled-input-single">
                               <input type="radio" name="fieldset-2" id="radio2-example-two" value="<c:out value = "${row.time2}"/>" onclick="check();" />
                               <label for="radio2-example-two">Slot B</label>
                           </div> 
                        </td>
                        <td>
                            <div class="styled-input-single">
                                <input type="radio" name="fieldset-2" id="radio2-example-three" value="<c:out value = "${row.time3}"/>" onclick="check();"/>
                                <label for="radio2-example-three">Slot C</label>
                            </div>
                        </td>
                        <td>
                            <div class="styled-input-single">
                                <input type="radio" name="fieldset-2" id="radio2-example-four" value="<c:out value = "${row.time4}"/>" onclick="check();"/>
                                <label for="radio2-example-four">Slot D</label>
                            </div>
                        </td>
                        <td>
                           <div class="styled-input-single">
                               <input type="radio" name="fieldset-2" id="radio2-example-five" value="<c:out value = "${row.time5}"/>" onclick="check();"/>
                               <label for="radio2-example-five">Slot E</label>
                           </div> 
                        </td>
                        <td>
                           <div class="styled-input-single">
                               <input type="radio" name="fieldset-2" id="radio2-example-six" value="<c:out value = "${row.time6}"/>" onclick="check();" />
                               <label for="radio2-example-six">Slot F</label>
                           </div> 
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="styled-input-single">
                                <input type="radio" name="fieldset-2" id="radio2-example-seven" value="<c:out value = "${row.time7}"/>" onclick="check();"/>
                                <label for="radio2-example-seven">Slot G</label>
                            </div>
                        </td>
                        <td>
                           <div class="styled-input-single">
                               <input type="radio" name="fieldset-2" id="radio2-example-eight" value="<c:out value = "${row.time8}"/>" onclick="check();"/>
                               <label for="radio2-example-eight">Slot H</label>
                           </div> 
                        </td>
                        <td>
                            <div class="styled-input-single">
                                <input type="radio" name="fieldset-2" id="radio2-example-nine" value="<c:out value = "${row.time9}"/>" onclick="check();"/>
                                <label for="radio2-example-nine">Slot I</label>
                            </div>
                        </td>
                        <td>
                            <div class="styled-input-single">
                                <input type="radio" name="fieldset-2" id="radio2-example-ten" value="<c:out value = "${row.time10}"/>" onclick="check();"/>
                                <label for="radio2-example-ten">Slot J</label>
                            </div>
                        </td>
                        <td>
                           <div class="styled-input-single">
                               <input type="radio" name="fieldset-2" id="radio2-example-eleven" value="<c:out value = "${row.time11}"/>" onclick="check();"/>
                               <label for="radio2-example-eleven">Slot K</label>
                           </div> 
                        </td>
                        <td>
                           <div class="styled-input-single">
                               <input type="radio" name="fieldset-2" id="radio2-example-twelve" value="<c:out value = "${row.time12}"/>" onclick="check();"/>
                               <label for="radio2-example-twelve">Slot L</label>
                           </div> 
                        </td>
                    </tr>
                </table>
                           <form method="post" action="submitBooking.jsp">
                               <button type="submit" name="book" class="btn">Book</button>
                           </form>
                
            </div>
               </center>             
        </div>
                </c:forEach>           
               
            <br>
    </body>
</html>
