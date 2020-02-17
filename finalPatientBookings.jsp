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
             .close {
                 color: black;
                 float: right;
                 font-size: 28px;
                 font-weight: bold;
             }
             .close:hover,
             .close:focus {
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
             input[type=text],[type=date] {
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
                 input[type=text]:focus {
                     width: 200px;
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
            .panel-body2{
                width: 60%;
                margin-left: 29%;
            }

        </style>
        <script type="text/javascript">
                $(document).ready(function(){
                    $('#bookingHistory').show();
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
                    <li ><a href="">Doctors</a></li>
                    <li ><a href="">Bookings</a></li>
                    <li><a href="">Logout</a></li>
                </ul>
            </div>
            <div class="panel-one">
                <div class="panel-heading3">
                    <p>Patient</p>
                </div>
                <!----------------   session tracking --------------->
                <c:set var="patId" value="${userId}" scope="request" />
                <!----------------   Panel Starts  --------------->
                <div class="panel">
                    <!----------------   Container two starts  --------------->
                    <div class="container-two">
                        <!----------------   Panel Body Starts  --------------->
                        <div class="panel-body">
                            <ul class="nav nav-tabs doctor">
                                <li>
                                    <a href="#bookingHistory">Booking History</a>
                                </li>
                                <li>
                                    <a href="#finalBooking">Book Appointment</a>
                                </li>
                                <li>
                                    <a href="#finalCancel">Cancel Booking</a>
                                </li>
                                
                                <li>
                                    <a href="#Details">My Details</a>
                                </li>
                                <li>
                                    <a href="#feedBack1">Feedback</a>
                                </li>
                            </ul>
                        </div>
                        <!----------------   Panel Body End  --------------->
                        <!----------------   Book Appointment Starts  --------------->
                        <div id="bookingHistory" class="switchgroup">
                            <div class="panel-body">
                                <h3>Booking History</h3>
                                <div class="panel-body3">
                                    <%@include file='bookingHistory.jsp' %>
                            </div>
                            </div>
                        </div>
                        <!----------------   Booking Appointment Ends  --------------->
                        <!----------------   Book Appointment Starts  --------------->
                        <div id="finalBooking" class="switchgroup">
                            <div class="panel-body3">
                                <h3>New Booking</h3>
                                <div class="content-inside">
                                    <form id="drForm" class="swing" method="post" action="slotSelection.jsp" >
                                        <center>
                                                <div class="dr-field">
                                                    <input type="number" name="id" value="${userId}" hidden="" >
                                                </div>
                                            <div class="dr-lable">
                                                Doctor Id<br>
                                                <div class="dr-field">
                                                    <input type="number" name="doctorId" required="required">
                                                </div>
                                            </div>
                                            <div class="dr-lable">
                                                Category<br>
                                                <div class="dr-field">
                                                    <select required="required" name="category">
                                                        <option value="">--Select--</option>
                                                        <option value="General Physician">General Physician</option>
                                                        <option value="Heart">Heart</option>
                                                        <option value="Bone">Bone</option>
                                                        <option value="Dentist">Dentist</option>
                                                        <option value="Neurologist">Neurologist</option>
                                                        <option value="Kidney">Kidney</option>
                                                        <option value="Cardiologist">Cardiologist</option>
                                                        <option value="Plastic Surgeon">Plastic Surgeon</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="dr-lable">
                                                Date<br>
                                                <div class="dr-field">
                                                    <input type="date" name="date" required="required">
                                                </div>
                                            </div>
                                            <div class="dr-lable">
                                                <button type="submit" name="submit" class="btn">Check</button>
                                            </div>
                                        </center>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!----------------   Booking Appointment Ends  --------------->
                        <!----------------   Cancel Booking Starts  --------------->
                        <div class="switchgroup" id="finalCancel">
                            <div class="panel-body3">
                                <h3>Cancel Booking</h3>
                                <div class="content-inside">
                                    <form id="drForm" class="swing" method="post" action="cancelBooking.jsp">
                                        <center>
                                            <div class="dr-lable">
                                                Doctor Id<br>
                                                <div class="dr-field">
                                                    <input type="text" name="drId" required="required">
                                                </div>
                                            </div>
                                            <div class="dr-lable">
                                                Date<br>
                                                <div class="dr-field">
                                                    <input type="date" name="date" required="required">
                                                </div>
                                            </div>
                                            <div class="dr-lable">
                                                <button type="submit" name="submit" class="btn">Delete</button>
                                            </div>
                                        </center>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!----------------   Cancel Booking Ends  --------------->
                        <!----------------   Search Doctor --------------->
                        <div class="switchgroup" id="finalSearch">
                            <div class="panel-body3">
                                <h3>Search Doctor</h3>
                                <div class="content-inside">
                                    <form id="drForm" class="swing" method="post" action="DrName.jsp">
                                        <center>
                                            <div class="dr-lable">
                                                Search By<br>
                                                <div class="dr-field">
                                                    <select required="required"  name="selector">
                                                        <option required="required">--Select--</option>
                                                        <option value="1" >Name</option>
                                                        <option value="2">Type</option>
                                                        <option value="3" >Address</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="dr-lable">
                                                Text<br>
                                                <div class="dr-field">
                                                    <input type="text" name="txt" required="required">
                                                </div>
                                            </div>
                                            <div class="dr-lable">
                                                <button type="submit" name="submit" class="btn">Search</button>
                                            </div>
                                        </center>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!----------------   Search Doctor Ends  --------------->
                        <!----------------     My Details Start     --------------->
                        <div class="switchgroup" id="Details">
                            <div class="panel-body3">
                                <h3>My Details</h3>
                                <!----------------   JSTL Query  --------------->
                                <sql:query dataSource = "${snapshot}" var = "result">
                                    SELECT * from register where id = ?;
                                    <sql:param value="${userId}"></sql:param>
                                </sql:query>
                                    <c:forEach var = "row" items = "${result.rows}">
                                        <div class="content-inside">
                                            <form id="drForm" class="swing" method="post" action="updatePatient.jsp">
                                                <input type="text" name="id" value="${row.id}" hidden="" required="required">
                                                <center>
                                                    <div class="dr-lable">
                                                        Names<br>
                                                        <div class="dr-field">
                                                            <input type="text" name="id" value="${row.names}" required="required">
                                                        </div>
                                                    </div>
                                                    <div class="dr-lable">
                                                        Password <br>
                                                        <div class="dr-field">
                                                            <input type="text" name="pass" required="required" value="<c:out value = "${row.pass}"/>">
                                                        </div>
                                                    </div>
                                                    <div class="dr-lable">
                                                        Address <br>
                                                        <div class="dr-field">
                                                            <textarea cols="30" rows="3" name="address" required="required" ></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="dr-lable">Mobile <br>
                                                    <div class="dr-field">
                                                        <input type="number" name="mobile" required="required" value="<c:out value = "${row.phone}"/>">
                                                    </div>
                                                </div>
                                                <div class="dr-lable">
                                                    <button type="submit" name="submit" class="btn">Update</button>
                                                </div>
                                        </center>
                                    </form>
                                </div>
                            </c:forEach>
                            </div>
                        </div>
                <!----------------   My Details Ends  --------------->
                        <!----------------   Feedback Form Starts  --------------->
                        <div class="switchgroup" id="feedBack1">
                            <div class="panel-body3">
                                <h3>Feedback</h3>
                                <div class="content-inside">
                                    <form id="drForm" class="swing" method="post" action="feedBack.jsp">
                                        <center>
                                            <textarea cols="40" rows="5" required="required"></textarea>
                                            <div class="dr-lable">
                                                <button type="submit" name="submit" class="btn">Submit</button>
                                            </div>
                                        </center>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!----------------   Feedback Ends  --------------->
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
