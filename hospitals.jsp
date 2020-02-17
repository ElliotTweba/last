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
            .del-form{
                margin-left: 10%;
            }
            .modal {
                display: none;
                position: fixed; 
                z-index: 1;
                left: 0;
                top: 0;
                width: 60%;
                margin-left: 28.4%;
                margin-top: 11%;
                height: 30%;
                overflow: auto;
                background-color: #ddd; 
                border-radius: 3px;
            }
            .modal-content {
                position: relative;
                background-color: #ddd;
                margin: auto;
                padding: 0;
                border: 2px solid #fff;
                border-radius: 3px;
                width: 80%;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: animatetop;
                -webkit-animation-duration: 0.4s;
                animation-name: animatetop;
                animation-duration: 0.4s;
            }
            @-webkit-keyframes animatetop {
                from {top:-300px; opacity:0} 
                to {top:0; opacity:1}
            }
            @keyframes animatetop {
                from {top:-300px; opacity:0}
                to {top:0; opacity:1}
            }
            .close {
                color: white;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
        <script type="text/javascript">
                $(document).ready(function()
                {

                        $('#HospitalList').show();
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
                    <li ><a href="adminBookings.jsp">Bookings</a></li>
                    <li><a href="">Hospitals</a></li>
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
                    <ul class="nav nav-tabs doctor">
                        <li>
                            <a href="#HospitalList">Hospital List</a>
                        </li>
                        <li>
                            <a href="#AddHospital">Add Hospital</a>
                        </li>
                        <li>
                            <a href="#SearchHospital">Search Hospital </a>
                        </li>
                    </ul>
                    <!----------------   Hospital List Starts  --------------->
                    <div id="#HospitalList" class="switchgroup">
                        <div class="panel-body"><br>
                            <%@include file='SelectHospital.jsp' %>
                        </div>
                        <!------------- Del table -------->
                        <div class="del-form">
                            <form action="deleteHospital.jsp" method="post">
                                <input type="number" name="id" required="required">
                                <button type="submit" class="btn">Delete</button>
                            </form>
                        </div>
                    </div>
                    <!---------------- Hospital List  Ends   --------------->
                    <!----------------   Add Hospital Starts  --------------->
                    <div id="AddHospital" class="switchgroup">
                        <div class="panel-body"><br>
                            <div class="pra-form">
                                <form method="post" action="submitHospital.jsp">
                                    <label>Hospital #</label>
                                    <input type="number" class="form-control-one" placeholder="enter hospital number" required="required" name="id" >
                                    <label>Name</label>
                                    <input type="text" class="form-control-one" placeholder="enter hospital name" name="name" required="required">
                                    <label>District</label>
                                    <input type="text" class="form-control-one" placeholder="enter hospital district" name="district" required="required">
                                    <input type="submit" class="btn" value="Submit">
                                </form>
                            </div>
                        </div>
                    </div>
                    <!----------------   Add Hospital Ends  --------------->
                    <!----------------   Search Hospital Starts  --------------->
                    <div id="SearchHospital" class="switchgroup">
                        <div class="panel-body"><br>
                            <div class="pra-form">
                                <form method="post" action="">
                                    <label>Hospital Number</label><br><br>
                                    <input type="number" class="form-control-one" placeholder="enter hospital number" name="id" required="required"><br>
                                    <input type="submit" class="btn" value="Search">
                                </form>
                            </div>
                        </div>
                             <%@include file='SearchHospital.jsp' %>
                    </div>
                    </div>
                <!----------------   Container Two Ends  --------------->
                </div>
            <!----------------   Panel Ends  --------------->
            <!------------- The Modal ------------->
            <center>
                <div id="myModal" class="modal">
                    <!------------- Modal content ------------->
                    <div class="modal-content">
                        <span class="close" >&times;</span>
                        <div class="pra-form">
                            <form method="post" action="updatehospital.jsp">
                                <label>Hospital Number</label>
                                <input type="number" class="form-control-one" name="id" required="required">
                                <label>Name</label>
                                <input type="text" class="form-control-one" placeholder="enter hospital name" name="name" required="required">
                                <label>District</label>
                                <input type="text" class="form-control-one" placeholder="enter hospital district" name="district" required="required">
                                <input type="submit" class="btn" value="Update">
                            </form>
                        </div>
                    </div>
                </div>
            </center>
            <script>
                var modal = document.getElementById('myModal');
                var btn = document.getElementById("myBtn");
                var span = document.getElementsByClassName("close")[0];
                btn.onclick = function() {
                    modal.style.display = "block";
                }
                span.onclick = function() {
                    modal.style.display = "none";
                }
                window.onclick = function(event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            </script>
            </div>
        </div>
        <br><br>
</body>
</html>
