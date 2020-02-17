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
            input[type=text] {
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

        </style>
        <script type="text/javascript">
                $(document).ready(function()
                {

                        $('#finalPatientDetails').show();
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
    </head>
    <body>
        <div class="row1">
                <h1>Health Bank</h1>
            <div class="col-md-2 menucontent">
                <a href="#"><h2>Dashboard</h2></a>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="admin.jsp">Medical records</a></li>
                    <li ><a href="">Bookings</a></li>
                    <li><a href="hospitals.jsp">Hospitals</a></li>
                    <li><a href="doctors.jsp">Doctors</a></li>
                    <li><a href="pharmacists.jsp">Pharmacist</a></li>
                    <li><a href="representative.jsp">Representative</a></li>
                    <li><a href="statistics.jsp">Statistics</a></li>
                </ul>
            </div>
            <div class="panel-one">
                <div class="panel-heading3">
                    <p>Admin</p>
                </div>
                <!----------------   Panel Starts  --------------->
                <div class="panel">
                    <!----------------   Container two starts  --------------->
                    <div class="container-two">
                        <!----------------   Panel Body Starts  --------------->
                        <div class="panel-body">
                            <ul class="nav nav-tabs doctor">
                                <li>
                                    <a href="#ViewAppointments">
                                       Booked Appointments
                                    </a>
                                </li>
                                <li>
                                    <a href="#ViewAppointments">
                                       Canceled Appointments
                                    </a>
                                </li>
                                <li>
                                    <a href="#ViewFeedback">
                                       View Feedback
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!----------------   Panel Body End  --------------->
                        <!----------------   View Patient Details Starts  --------------->
                        <div id="Record" class="switchgroup">
                            <div class="panel-body"><br><br>
                                <table>
                                    <th>Patient Id</th>
                                    <th>Doctor Id</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <!----------------   JSTL Query  --------------->
                                    <sql:query dataSource = "${snapshot}" var = "result">
                                        SELECT * from booked;
                                    </sql:query>
                                    <c:forEach var = "row" items = "${result.rows}">
                                        <tr class="pra-form">
                                            <td><c:out value = "${row.id}"/></td>
                                            <td><c:out value = "${row.drId}"/></td>
                                            <td><c:out value = "${row.date}"/></td>
                                            <td><c:out value = "${row.book}"/></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                        <!----------------   Ends Booked APPS  --------------->
                        <!----------------  View FeedBack  --------------->
                        <div id="ViewFeedback" class="switchgroup">
                            <div class="panel-body">
                                <h3>FeedBack</h3>
                                <table>
                                    <th>Medical id</th>
                                    <th>Comment</th>
                                    <!----------------   JSTL Query  --------------->
                                    <sql:query dataSource = "${snapshot}" var = "result">
                                        SELECT * from feedBack;
                                    </sql:query>
                                    <c:forEach var = "row" items = "${result.rows}">
                                        <tr class="pra-form">
                                            <td><c:out value = "${row.id}"/></td>
                                            <td><c:out value = "${row.suggestion}"/></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <!----------------   ViewFeedback Ends  --------------->
                        </div>
                        <!----------------   Panel Ends  --------------->
                    </div>
                    <!----------------   Container Ends  --------------->
                </div>
                <!---------------- Panel Ends  --------------->
            </div>
            <!---------------- Panel One Ends  --------------->
        </div><br><br>
        <!---------------- Panel Row1 Ends  --------------->
    </body>
    </html>
