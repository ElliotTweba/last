<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='DBConnect.jsp' %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Health Bank</title>
        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/css/style.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <script src="js/js/jquery.js"></script>
        
        <style type="text/css">
            
            .panel-one{
                background-repeat:no-repeat;
                background-size:85%;
                background-position-x: 100%;
                margin-top: 18px;
                background-position-y: 8%;
                width: 100%;
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
                width: auto;
                border-radius: 3px;
            }
            table{
                width: 100%;
                background: #fff;
                border:1px solid #ddd;
                padding: 10px 10px;
            }
            td{
                padding: 10px;
                text-align: center;
            }
            input[type=number] {
                width: 200px;
                box-sizing: border-box;
                border: 2px solid #ccc;
                font-size: 16px;
                border-top: none;
                border-left: none;
                border-right: none;
                background-color: white;
            }
            .del-form{
                margin-left: 5%;
            }
            .del-form2{
                margin-left: 10%;
            }
            .profile{
                float: right;
                border-radius: 20px;
                border: none;
                background-color: white;
                font-size: 20px;
                color: #337AB7;
            }
            .profile:focus{
                border: none;
            }
            @media screen and (min-width:640px{
                .row1{ 
                    width:100%;
                    display: block;
                }
                .menucontent{
                    width: 200px;
                }
                .panel-one{
                    width: 300px;
                }
                .panel{
                    width: 400px;
                }}
        </style>
        <script type="text/javascript">
            $(document).ready(function()
            {
                $('#Record').show();
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
                <h1>Health Bank
                    <a href="Profile.jsp" class="profile">Profile</a>
                </h1>
            <div class="col-md-2 menucontent">
                <a href="#"><h2>Dashboard</h2></a>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="">Medical records</a></li>
                    <li ><a href="adminBookings.jsp">Bookings</a></li>
                    <li><a href="hospitals.jsp">Hospitals</a></li>
                    <li><a href="doctors.jsp">Doctors</a></li>
                    <li><a href="pharmacists.jsp">Pharmacist</a></li>
                    <li><a href="representative.jsp">Representative</a></li>
                    <li><a href="statistics.jsp">Statistics</a></li>
                </ul>
            </div>
                
            <div class="panel-one">
                <div  class="panel-heading3">
                    <p>Admin</p>
                </div> 
                <!----------------   Panel Starts  --------------->
                <div class="panel">
                    <!----------------   Container two starts  --------------->
                    <div class="container-two">
                        <ul class="nav nav-tabs doctor">
                            <li>
                                <a href="#Record">
                                    Patient List
                                </a>
                            </li>
                            <li>
                                <a href="#MRList">
                                    MR - Table
                                </a>
                            </li>
                        </ul>
                        <!----------------   View Patient Details Starts  --------------->
                        <div id="Record" class="switchgroup">
                            <div class="panel-boddy"><br><br>
                               <%@include file='SelectPatients.jsp' %>
                            </div>
                            <div class="del-form">
                                <form action="Delete.jsp" method="post">
                                    <input type="number" placeholder="Enter patient id" required="required" name="id">
                                    <button type="submit" class="btn">Delete</button>
                                </form>
                            </div>
                        </div>
                        <!----------------   Ends Patient Details  --------------->
                        <!----------------   MRList Starts  --------------->
                        <div id="MRList" class="switchgroup">
                            <div class="panel-body"><br><br>
                                <%@include file='SelectMR.jsp' %>
                            </div>
                            <!----------------   Deleleting form  --------------->
                            <div class="del-form2">
                                <form action="DeleteMR.jsp" method="post">
                                    <input type="number" placeholder="Enter patient id" required="required" name="id">
                                    <button type="submit" class="btn">Delete</button>
                                </form>
                            </div>
                        </div>
                        <!----------------   MRList Ends  --------------->
                    </div>
                    <!----------------   Container Two  --------------->
                </div>
                <!----------------   Panel Ends  --------------->
            </div>
            <!----------------   Panel One Ends  --------------->
        </div><br><br>
        <!----------------   Row One Ends  --------------->
    </body>
    </html>
