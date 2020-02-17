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
            radio{
                width: 50px;
                height: 50;
            }
            .panel-body12{
                width: 110%;
                margin-left: -10%;
            
            }
            
        </style>
     
     <script type="text/javascript">
         $(document).ready(function()
         {
             $('#RepreList').show();
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
                        <div class="panel-body">
                            <ul class="nav nav-tabs doctor">
                                <li> <a href="#RepreList">Representative List</a> </li>
                                <li> <a href="#Add">Add Representative</a> </li>
                                <li> <a href="#Search">Search Representative</a> </li>
                            </ul>
                            <!----------------   Representative List Starts  --------------->
                            <div id="#RepreList" class="switchgroup">
                                <div class="panel-body12"><br><br>
                                    <%@include file='SelectRepre.jsp' %>
                                </div>
                            </div>
                            <!---------------- Doctors List  Ends   --------------->
                            <!----------------   Add Doctors Starts  --------------->
                            <div id="Add" class="switchgroup">
                                <div class="panel-body12"><br><br>
                                    <center> <p class="main-head">Add New Representative</p> </center>
                                    <form  action="addRepresentative.jsp" method="post">
                                        <label>Representative ID</label>
                                        <input type="number" class="form-control-one" name="id" placeholder="Medical id" required="required">
                                        <label>Names</label>
                                        <input type="text" class="form-control-one" name="names" placeholder="Names" required="required">
                                        <label>Nationality</label>
                                        <input type="text" class="form-control-one" name="nationality" placeholder="Nationality" required="required">
                                        <label>Passport</label>
                                        <input type="text" class="form-control-one" name="passport" placeholder="passport" required="required">
                                        <label>Address</label>
                                        <input type="text" class="form-control-one" name="address" placeholder="Address" required="required">
                                        <label>Phone</label>
                                        <input type="number" class="form-control-one" name="phone" placeholder="Phone #" required="required">
                                        <label>Email</label>
                                        <input type="email" class="form-control-one" name="email" placeholder="Email" required="required">
                                        <label>Gender</label>
                                        M<input type="radio" name="gender" value="Male" required="required">
                                        F<input type="radio"  name="gender" value="Female" required="required"><br>
                                        <button type="submit" class="btn">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!----------------   Add Doctors Ends  --------------->
                        <!----------------  Search Dr Starts  --------------->
                        <div id="Search" class="switchgroup">
                        <div class="panel-body"><br>
                            <div class="pra-form">
                                <form method="post" action="">
                                    <label>Representative id</label><br><br>
                                    <input type="number" class="form-control-one" placeholder="Repre id" name="id" required="required"><br>
                                    <input type="submit" class="btn" value="Search">
                          
                                  </form>
                            </div>
                        </div>
                        <!----------------   JSTL Query starts --------------->
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from Representative where id = ?;
                                    <sql:param value="${param.id}"></sql:param>
                                </sql:query>
                                <c:forEach var = "row" items = "${result.rows}">
                                    <div class="pra-form">
                                        <center><p class="main-head">Representative - Details</p></center>
                                        <table>
                                            <th> Id</th>
                                            <th>Password</th>
                                            <th>Nationality</th>
                                            <th>Passport</th>
                                            <th>Address</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                            <th>Gender</th>
                                            <tr>
                                                <td><c:out value = "${row.id}"/></td>
                                                <td><c:out value = "${row.pass}"/></td>
                                                <td><c:out value = "${row.nationality}"/></td>
                                                <td><c:out value = "${row.passport}"/></td>
                                                <td><c:out value = "${row.address}"/></td>
                                                <td><c:out value = "${row.email}"/></td>
                                                <td><c:out value = "${row.phone}"/></td>
                                                <td><c:out value = "${row.gender}"/></td>
                                            </tr>
                                        </table>
                                    </div>
                                </c:forEach>
                    </div>
                        <!----------------   Search Representative Ends  --------------->
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
