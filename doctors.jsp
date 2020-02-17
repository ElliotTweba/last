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
            .panel-body12{
                width: 110%;
                margin-left: -10%;
            }
            .del{
                margin-left: 5%;
                border-left: none;
                border-top: none;
                border-right: none;
            }
            
        </style>
     
     <script type="text/javascript">
         $(document).ready(function()
         {
             $('#DrList').show();
             $('.doctor li:first-child a').addClass('active');
             $('.doctor li a').click(function(e)
             {
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
                    <li ><a href="adminBookings.jsp">Bookings</a></li>
                    <li><a href="hospitals.jsp">Hospitals</a></li>
                    <li><a href="">Doctors</a></li>
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
                        <div class="panel-body">
                            <ul class="nav nav-tabs doctor">
                                <li> <a href="#DrList">Doctors List</a> </li>
                                <li> <a href="#AddDr">Add Doctor</a> </li>
                                <li> <a href="#SearchDr">Search Doctor</a> </li>
                            </ul>
                            <!----------------   Doctors List Starts  --------------->
                            <div id="#DrList" class="switchgroup">
                                <div class="panel-body12"><br><br>
                                    <%@include file='SelectDR.jsp' %>
                                </div>
                                <form method="post" action="deleteDoctor.jsp">
                                    <input type="number" name="id" class="del">
                                    <button type="submit" class="btn" >Delete</button>
                                </form>
                            </div>
                            <!---------------- Doctors List  Ends   --------------->
                            <!----------------   Add Doctors Starts  --------------->
                            <div id="AddDr" class="switchgroup">
                                <div class=""><br><br>
                                    <center> <p class="main-head">Add New Doctor</p> </center>
                                    <form  action="registerdoctor.jsp" method="post">
                                        <label>Doctor id</label>
                                        <input type="number" class="form-control-one" name="pass" placeholder="Medical id" required="required">
                                        <label>Password</label>
                                        <input type="number" class="form-control-one" name="id" placeholder="Medical id" required="required">
                                        <label>Names</label>
                                        <input type="text" class="form-control-one" name="names" placeholder="Names" required="required">
                                        <label>Nationality</label>
                                        <input type="text" class="form-control-one" name="nationality" placeholder="Nationality" required="required">
                                        <label>Passport</label>
                                        <input type="text" class="form-control-one" name="passport" placeholder="passport" required="required">
                                        Category
                                        <select class="form-control-one" name="category" required="required">
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
                                        <label>Address</label>
                                        <input type="text" class="form-control-one" name="address" placeholder="Address" required="required">
                                        <label>Phone</label>
                                        <input type="number" class="form-control-one" name="phone" placeholder="Phone #" required="required">
                                        <label>Email</label>
                                        <input type="email" class="form-control-one" name="email" placeholder="Email" required="required">
                                        <label>Gender</label>
                                        F<input type="radio" value="F" name="gender">
                                        M<input type="radio" value="M" name="gender"><br>
                                        <button type="submit" class="btn">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!----------------   Add Doctors Ends  --------------->
                        <!----------------  Search Dr Starts  --------------->
                        <div id="SearchDr" class="switchgroup">
                            <div class="panel-body"><br><br>
                                    <center> <p class="main-head">Search - Doctor</p> </center>
                                    <form method="post" action="">
                                        <label>Doctor ID</label>
                                        <input type="number" class="form-control-one" placeholder="Dr id" class="" name="id">
                                        <label>Category</label>
                                        <select class="form-control-one" name="category" required="required">
                                            <option value="">-- Select --</option>
                                            <option value="Bone">Bones</option>
                                            <option value="Muscles">Muscles</option>
                                        </select>
                                        <input type="submit" class="btn" value="Submit">
                                    </form>
                            </div>
                        </div>
                        <!----------------   Search Dr Ends  --------------->
                    </div>
                    <!----------------   Container Two Ends  --------------->
                </div>
                <!----------------   Panel One Ends  --------------->
            </div>
            <!----------------   Panel One Ends  --------------->
        </div><br><br>
        <!----------------   Row One Ends  --------------->
    </body>
    </html>
