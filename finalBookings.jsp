<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
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
            .customers{
                margin-left: 34%;
                margin-top: 4%;
                width: 100%;
            }
            h3{
                margin-left: 32%;
            }
            td{
                padding: 10px 5px;
                margin-left: 5%;
            }
        </style>
        
    </head>
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
        <script>
            function confirm(){
                alert("Comfirm");
            }
        </script>
    <body>
        <div class="row1">
                <h1>Health Bank</h1>
            <div class="col-md-2 menucontent">
                <a href="#"><h2>Dashboard</h2></a>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="practitioner.jsp">Medical records</a></li>
                    <li ><a href="registerPatient.html">Register</a></li>
                    <li><a href="">Bookings</a></li>
                    <li><a href="">Logout</a></li>
                </ul>
            </div>
            <div class="panel-one">
                <div class="panel-heading3">
                    <p>Doctor</p>
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
                                    <a href="#finalPatientDetails">
                                        My Appointments
                                    </a>
                                </li>
                                <li>
                                    <a href="#finalBooking">
                                        Add Prescription
                                    </a>
                                </li>
                                <li>
                                    <a href="#finalCancel">
                                        View Customer
                                    </a>
                                </li>
                                <li>
                                    <a href="#Details">
                                        My Details
                                    </a>
                                </li>
                            </ul>
                        </div>
                        
                        <!----------------   Panel Body End  --------------->
                        
                        <!----------------   View Patient Details Starts  --------------->
                        <div id="finalPatientDetails" class="switchgroup">
                            <div class="panel-body1">
                                <h3>My Appointments</h3>
                                <div class="content-inside">
                                    <form id="drForm" class="swing" method="post" action="">
                                        <center>
                                            <div class="dr-lable">
                                                Book id
                                                <div class="dr-field">
                                                    <input type="text" name="id" required="required">
                                                </div>
                                            </div>
                                            <div class="dr-lable">
                                                <button type="submit" name="submit" class="btn">View</button>
                                            </div>
                                        </center>
                                    </form>
                                </div>
                            </div>
                            <div class="customers">
                                <table>
                                    <th>Medical id</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Confirm</th>
                                    <!----------------   JSTL Query  --------------->
                                    <sql:query dataSource = "${snapshot}" var = "result">
                                        SELECT * from booked where id = ?;
                                    <sql:param value="${userId}"></sql:param>
                                    </sql:query>
                                    <c:forEach var = "row" items = "${result.rows}">
                                        <tr class="pra-form">
                                            <td><c:out value = "${row.id}"/></td>
                                            <td><c:out value = "${row.date}"/></td>
                                            <td><c:out value = "${row.time}"/></td>
                                            <td><center><input type="checkbox" onclick="confirm()"></center></td>
                                        </tr>
                                    </c:forEach>
                                </table> 
                            </div>   
                        </div>
                        
                <!----------------   Ends Patient Details  --------------->
                
                <!----------------   Add Description Starts  --------------->
                <div id="finalBooking" class="switchgroup">
                    <div class="panel-body1">
                        <h3>Add Treatment</h3>
                        <div class="content-inside">
                        <form id="drForm" class="swing" method="post" action="">
                            <center>
                                <form method="post" action="" class="tableOne">
                                    <div class="dr-lable">
                                        Book ID:- <input type="text" name="search" required="required">
                                        <button type="submit" name="submit" class="btn">search</button>
                                    </div>
                                </form>
                            </center>
                    </div>
                    </div>
                </div>
                <!----------------   Add Description Ends  --------------->
                
                <!----------------  View Customers --------------->
                <div class="switchgroup" id="finalCancel">
                    <div class="panel-body1">
                        <h3>View Customers</h3>
                        <div class="content-inside">
                        <form id="drForm" class="swing" method="post" action="">
                            <center>
                            <div class="dr-lable">
                                Book Id<br>
                                
                            </div>
                            <div class="dr-lable">
                                Names
                            </div>
                            <div class="dr-lable">
                                <button type="submit" name="submit" class="btn">Del</button>
                            </div>
                            </center>
                        </form>
                        </div>
                    </div>
                </div>
                <!----------------     View Customers Ends    --------------->
                
                <!----------------     My Details Start     --------------->
                <div class="switchgroup" id="Details">
                    <div class="panel-body3">
                        <h3>My Details</h3>
                         <sql:query dataSource = "${snapshot}" var = "result">
                             SELECT * from doctors where id = ?;
                             <sql:param value="${userId}"></sql:param>
                         </sql:query>
                         <c:forEach var = "row" items = "${result.rows}">
                           <div class="content-inside">
                            <form id="drForm" class="swing" method="post" action="updateDoctor.jsp">
                                <center>
                                    <div class="dr-field">
                                        <input type="text" name="id" hidden="" required="required" value="${row.id}">
                                    </div>
                                    <div class="dr-field">
                                        Names :-&nbsp;&nbsp; 
                                        <c:out value = "${row.names}"></c:out>
                                    </div><br>
                                       Password <br>
                                    <div class="dr-field">
                                        <input type="text" name="pass" required="required" value = "${row.pass}">
                                    </div>
                                <div class="dr-lable">
                                    Address <br>
                                    <div class="dr-field">
                                        <textarea cols="30" rows="3" name="address" required="required"  value = "${row.address}"></textarea>
                                    </div>
                                </div>
                                <div class="dr-lable">Mobile <br>
                                    <div class="dr-field">
                                        <input type="number" name="mobile" required="required"  value = "${row.phone}">
                                    </div>
                                </div>
                                <div class="dr-lable">Email <br>
                                    <div class="dr-field">
                                        <input type="text" name="email" required="required"  value = "${row.email}">
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
                
                </div>
                <!----------------   Panel Ends  --------------->
                </div>
            </div>
                
        </div>
    </body>
    </html>
