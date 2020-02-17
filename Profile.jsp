<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ include file='DBConnect.jsp' %>
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
            .changePwd{
                margin-left: -11%;
                font-size: 15px;
                font-weight: 400;
            }
        </style>
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
                    <li><a href="doctors.jsp">Doctors</a></li>
                    <li><a href="pharmacists.jsp">Pharmacist</a></li>
                    <li><a href="representative.jsp">Representative</a></li>
                    <li><a href="statistics.jsp">Statistics</a></li>
                </ul>
            </div>
            
            <div class="panel-one">
                <div  class="panel-heading3">
                    <p>Manage Profile</p>
                </div>
                <!----------------   session tracking --------------->
                <c:set var="patId" value="${userId}" scope="request" />
                <!----------------   Panel Starts  --------------->
                <div class="panel">
                    <!----------------   Container two starts  --------------->
                    <div class="container-two">
                        <!----------------  Profile Starts  --------------->
                        <div id="Record" >
                            
                            <div class="panel-body">
                                <!----------------   JSTL Query  --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from admin where id = ?;
                            <sql:param value="${userId}"></sql:param>
                        </sql:query>
                            <c:forEach var = "row" items = "${result.rows}">
                                 <div class="pra-form">
                                    <form method="post" action="updateAdmin.jsp">
                                        <label>Admin id</label>
                                        <input type="number" class="form-control-one"  name="id" value="${userId}" required="">
                                        <label>Name</label>
                                        <input type="text" class="form-control-one" value="${row.name}"  name="name" required="" >
                                        <label>Email</label>
                                        <input type="email" class="form-control-one" value="${row.email}" name="email" required="">
                                        <label>Address</label>
                                        <input type="text" class="form-control-one" value="${row.address}" name="address" required="">
                                        <label>Phone</label>
                                        <input type="number" class="form-control-one" value="${row.phone}" name="phone" required="">
                                        <input type="submit" class="btn" value="Update Profile">
                                    </form>
                                 </div>
                            </c:forEach>
                            </div>
                        </div>
                        <!----------------  Profile Ends   --------------->
                    </div>
                </div>
                <!----------------   Panel Ends  --------------->
            </div>
            <!----------------   Panel One Ends  --------------->
            <!----------------   Panel Starts  --------------->
                <div class="panel">
                    <!----------------   Container two starts  --------------->
                    <div class="container-two">
                        <!----------------  Login Details Starts  --------------->
                        <div id="Record" class="switchgroup">
                            <div class="panel-body">
                                <p class="changePwd">Change Password</p>
                                <div class="pra-form">
                                    <form method="post" action="updatePassword.jsp">
                                        <label>Current Password</label>
                                        <input type="text" class="form-control-one" placeholder="Current password"  name="currentPass" required="" >
                                        <label>New Password</label>
                                        <input type="text" class="form-control-one" placeholder="New password" name="newPass" required="">
                                        <input type="submit" class="btn" value="Update Password">
                                    </form>
                                 </div>
                            </div>
                        </div>
                        <!---------------- Login Details Ends   --------------->
                    </div>
                </div>
                <!----------------   Panel Ends  --------------->
        </div><br><br>
        <!----------------   Row1 Ends  --------------->
    </body>
    </html>
