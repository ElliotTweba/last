<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='DBConnect.jsp' %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Health Bank</title>
        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/css/style.css" rel="stylesheet">
        <link href="css/buttons.css" rel="stylesheet">
        
        <script src="js/js/jquery.js"></script>
        
        <style type="text/css">
            .panel-one{
                background-repeat:no-repeat;
                background-size:85%;
                background-position-x: 100%;
                margin-top: 18px;
                background-position-y: 8%;
            }
            .container-two{
                margin-right: 40px;
                margin-left: 40px;
                margin-top: 20px;
                background-color: #fff;
                padding: 10px;
                border: 3px solid #eee;
                
            }
            .col-md-2{
                background: url(images/col.jpg);
                background-position-y: 10%;
                background-repeat:no-repeat;
                
            }
            .panel{
                
                margin-left: 25%;
                width: 900px;
                border-radius: 3px;
            }
            .panel-two{
                
                margin-left: 19%;
                width: 55%;
                border-radius: 3px;
            }
             .close{
                 color: black;
                 float: right;
                 font-size: 28px;
                 font-weight: bold;
             }
             .close:hover,
             .close:focus{
                 color: red;
                 text-decoration: none;
                 cursor: pointer;
             }
             select{
                 width: 160px;
                 box-sizing: border-box;
                 border: 2px solid #ccc;
                 border-radius: 4px;
                 font-size: 16px;
                 background-color: white;
                 background-position: 10px 10px;
                 background-repeat: no-repeat;
                 -webkit-transition: width 0.4s ease-in-out;
                 transition: width 0.4s ease-in-out;
             }
             input[type=text],[type=date],[type=number]{
                 width: 20%;
                 box-sizing: border-box;
                 border: 2px solid #ccc;
                 border-top: none;
                 border-right: none;
                 border-left: none;
                 font-size: 16px;
                 background-color: transparent;
                 margin-bottom: 2%;
                 margin-top: 2%;
             }
            table{
                width: 100%;
                background: #fff;
                border:1px solid #ddd;
                column-rule-color: gray;
            }
            td{
                padding: 10px;
                text-align: center;
            }
            label{
                size: 20px;
                padding: 8px;
            }

        </style>
        <script type="text/javascript">
                $(document).ready(function()
                {

                        $('#finalBooking').show();
                        $('.doctor li:first-child a').addClass('active');
                        $('.doctor li a').click(function(e){

                                var tabDiv=this.hash;
                                $('.doctor li a').removeClass('active');
                                $(this).addClass('.active');
                                $('.switchgroup').hide();
                                $(tabDiv).fadeIn();
                                e.preventDefault();

                        });


                });
        </script>
        <script type="text/javascript">
            function check(){
                var sel = document.getElementsByName("time");
                var len = sel.length;
                for(i=0;i<len;i++){
                    if(sel[i].checked){
                        alert("Your are booking" + sel[i].value);
                    }
                }
            }
            
        </script>
    </head>
    <body>
        <div class="row1">
            <h1>Health Bank</h1>
            <div class="col-md-2 menucontent">
                <a href="#"><h2>Dashboard</h2></a>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="patient.jsp">Medical records</a></li>
                    <li ><a href="finalPatientBookings.jsp">Bookings</a></li>
                    <li><a href="">Logout.</a></li>
                </ul>
            </div>
            <div class="panel-one">
                <div class="panel-heading3">
                    <p>Patient</p>
                </div>
                <!----------------   Panel Starts  --------------->
                <div class="panel">
                    <!----------------   Container two starts  --------------->
                    <div class="container-two">
                        <!----------------   Book Appointment Starts  --------------->
                            <div class="panel-body">
                                <c:catch var="e">
                                    <!----------------   JSTL Query starts --------------->
                                    <sql:query dataSource = "${snapshot}" var = "query">
                                        SELECT * from bookingslots where id = ? and bookDate = ?;
                                        <sql:param value="${param.doctorId}"></sql:param>
                                        <sql:param value="${param.date}"></sql:param>
                                    </sql:query>
                                        <c:forEach var = "row" items = "${query.rows}">
                                            <div class="styled-input-container styled-input--square">
                                                <form method="post" action="submitBooking.jsp">
                                                    <center><p class="main-head">Available - Slots</p></center>
                                                    <label>
                                                        Medical Id
                                                    </label>
                                                    <input type="number" required="required"  name="medId" value="<%=request.getParameter("id")%>" />
                                                    <label>
                                                        Doctor Id
                                                    </label>
                                                    <input type="number" required="required"  name="drId" value="<%=request.getParameter("doctorId")%>" />
                                                    <input type="text" required="required" hidden="" name="category" value="<%=request.getParameter("category")%>" />
                                                    <label>
                                                        Date
                                                    </label>
                                                    <input type="date" required="required"   name="date" value="<%=request.getParameter("date")%>">
                                                    <table>
                                                        <tr>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-one"  value="<c:out value = "${row.slots}"/>" onclick="check();"/>
                                                                <label for="radio2-example-one">Slot A</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-two" value="<c:out value = "${row.slots}"/>" onclick="check();" />
                                                                <label for="radio2-example-two">Slot B</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-three" value="<c:out value = "${row.slots}"/>" onclick="check();"/>
                                                                <label for="radio2-example-three">Slot C</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-four"  value="<c:out value = "${row.slots}"/>" onclick="check();"/>
                                                                <label for="radio2-example-four">Slot D</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-five" value="<c:out value = "${row.slots}"/>" onclick="check();"/>
                                                                <label for="radio2-example-five">Slot E</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-six" value="<c:out value = "${row.slots}"/>" onclick="check();" />
                                                                <label for="radio2-example-six">Slot F</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-seven" value="<c:out value = "${row.slots}"/>" onclick="check();"/>
                                                                <label for="radio2-example-seven">Slot G</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-eight" value="<c:out value = "${row.slots}"/>" onclick="check();"/>
                                                                <label for="radio2-example-eight">Slot H</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-nine"  value="<c:out value = "${row.slots}"/>" onclick="check();"/>
                                                                <label for="radio2-example-nine">Slot I</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-ten" value="<c:out value = "${row.slots}"/>" onclick="check();"/>
                                                                <label for="radio2-example-ten">Slot J</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-eleven" value="<c:out value = "${row.slots}"/>" onclick="check();"/>
                                                                <label for="radio2-example-eleven">Slot K</label>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="styled-input-single">
                                                                <input type="radio" name="time" id="radio2-example-twelve" value="<c:out value = "${row.slots}"/>" onclick="check();"/>
                                                                <label for="radio2-example-twelve">Slot L</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    </table>
                                                                <center>  <button type="submit" name="book" class="btn">Book</button></center>
                                                </form>
                                        </div>
                                    </c:forEach>
                                </c:catch>
                                    <c:if test="${e!=null}">
                                        <script language="JavaScript">
                                            alert("Error Occured Retry!");
                                            location='practitioner.jsp';
                                        </script>
                                    </c:if>
                            </div>
                        <!----------------   Booking Appointment Ends  --------------->
                    </div>
                    <!----------------   Container Two Ends  --------------->
                </div>
                <!----------------   Ends Panel  --------------->
            </div>
            <!----------------   Ends Panel One  --------------->
        </div>
        <!----------------   Row1 Ends  --------------->
    </body>
</html>
