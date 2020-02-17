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
                border-radius: 3px;
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
        </style>
    </head>
    <body>
        <c:set var="id" value="${userId}" scope="request" />
        <div class="row1">
            <h1>Health Bank</h1>
            <div class="col-md-2 menucontent">
                <a href="#"><h2>Dashboard</h2></a>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="">Medical records</a></li>
                    <li><a href="">Doctors</a></li>
                     <li><a href="finalPatientBookings.jsp?id=1002">Bookings</a></li>
                    <li><a href="./Logout">Logout</a></li>
                </ul>
            </div>
            <div class="panel-one">
                <div  class="panel-heading3">
                    <p>Patient</p>
                </div>
                <!----------------   Panel Starts  --------------->
                <div class="panel">
                    <center><p class="main-head">Medical - Table</p></center>
                    <!----------------   Container two starts  --------------->
                    <div class="container-two">
                        <!----------------   View MR --------------->
                        <div id="Patient" class="switchgroup">
                            
                            <div class="panel-body3"><br><br>
                                <%@include file='SelectPatient.jsp' %>
                            </div>
                        </div>
                        <!----------------   Ends MR  --------------->
                    </div>
                    <!----------------   Container Two  --------------->
                </div>
                <!----------------   Panel Ends  --------------->
            </div>
                <!----------------   Panel One Ends  --------------->
        </div><br><br>
        <!----------------   Row1 Ends  --------------->
    </body>
    </html>
