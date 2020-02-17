
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .emergency{
                color: red;
            }
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
            <h1>Health Bank</h1>
            <div class="col-md-2 menucontent">
                <a href="#"><h2>Dashboard</h2></a>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="">Medical records</a></li>
                    <li ><a href="registerPatient.html">Register</a></li>
                    <li><a href="finalBookings.jsp">Bookings</a></li>
                    <li><a href="">Logout</a></li>
                </ul>
            </div>
            <div class="panel-one">
                <div  class="panel-heading3">
                    <p>Doctor</p>
                </div>
                <!----------------   Panel Starts  --------------->
                <div class="panel">
                    <!----------------   Container two starts  --------------->
                    <div class="container-two">
                        <ul class="nav nav-tabs doctor">
                            <li>
                                <a href="#Record">
                                    Add Record
                                </a>
                            </li>
                            <li>
                                <a href="#Emergency">
                                    <div class="emergency"> Emergency</div>
                                </a>
                            </li>
                        </ul>
                        <!----------------  Add MR Starts  --------------->
                        <div id="Record" class="switchgroup">
                            <div class="panel-body"><br>
                                <div class="pra-form">
                                    <form method="post" action="AddMR.jsp">
                                        <label>Medical ID</label>
                                        <input type="number" class="form-control-one" placeholder="enter medical id"  name="id"  >
                                        <label>Disease</label>
                                        <input type="text" class="form-control-one" placeholder="enter disease" name="disease" >
                                        <label>Prescription</label>
                                        <input type="text" class="form-control-one" placeholder="enter prescription" name="prescription" >
                                        <label>Date</label>
                                        <input type="date" class="form-control-one" name="date" >
                                        <input type="submit" class="btn" value="Submit">
                                    </form>
                                 </div>
                            </div>
                        </div>
                        <!----------------  MR Ends   --------------->
                        <!----------------   Emergency Starts  --------------->
                        <div id="Emergency" class="switchgroup">
                            <div class="panel-body"><br>
                                <div class="pra-form">
                                    <form method="post" action="AddMR.jsp">
                                        <label>Patient ID / PassPort / Voter's Card</label>
                                        <input type="number" class="form-control-one" placeholder="enter patient id" class="" name="id" >
                                        <label>Disease</label>
                                        <input type="text" class="form-control-one" placeholder="enter disease" name="disease"  >
                                        <label>Description</label>
                                        <input type="text" class="form-control-one" placeholder="enter prescription" name="prescription" >
                                        <label>Date</label>
                                        <input type="date" class="form-control-one" name="date" >
                                        <input type="submit" class="btn" value="Submit">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!----------------   Emergency Ends  --------------->
                    </div>
                </div>
                <!----------------   Panel Ends  --------------->
            </div>
            <!----------------   Panel One Ends  --------------->
        </div>
        <!----------------   Row1 Ends  --------------->
    </body>
    </html>
