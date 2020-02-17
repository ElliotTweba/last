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
                padding: 10px 10px;
            }
            td{
                padding: 10px;
                text-align: center;
            }
        </style>
        <script type="text/javascript">
                $(document).ready(function()
                {

                        $('#info-table').show();
                        $('.menucontent li:first-child a').addClass('active');
                        $('.menucontent li a').click(function(e){

                                var tabDiv=this.hash;
                                $('.menucontent li a').removeClass('active');
                                $(this).addClass('.active');
                                $('.switchgroup').hide();
                                $(tabDiv).fadeIn();
                                e.preventDefault();

                        });

                });
        </script>
        <script>
            function check(){
                var type = document.getElementsByName("time");
                    var totalelements = document.forms[0].elements.length;
                    for(var i=0;i<type;i++){
                        var elementname = document.forms[0].elements[i].name;
                        if(elementname != undefined & elementname.indexOf()!=1){
                            document.forms[0].elements[i].checked = document.frm.chk_all.checked;
                        }
                    }
                }
        </script>
    </head>
    <body>
        <div class="row1">
            <div class="row header">
                <h1>Health Bank</h1>
            </div>
                <div class="col-md-2 menucontent">
                    <a href="#"><h2>Dashboard</h2></a>
                    <ul class="nav nav-pills nav-stacked">
                        <li><a href="#info-table">Bookings</a></li>
                        <li ><a href="#patientRegistry">Register</a></li>
                        <li><a href="#addslots">Add Slots</a></li>
                        <li><a href="">Logout</a></li>
                    </ul>
                </div>
            <div class="panel-one">
                <div  class="panel-heading3">
                    <p>Representative</p>
                    <!----------------   session tracking --------------->
                    <c:set var="patId" value="${userId}" scope="request" />
                </div>
                <!----------------   Panel Starts  --------------->
                <div class="panel">
                    <!----------------   Container two starts  --------------->
                    <div class="container-two">
                        <!----         info table -------->
                        <div class="switchgroup" id="info-table">
                            <div class="panel-body"><br>
                                <div class="pra-form">
                                    <table>
                                        <th>Medical ID</th>
                                        <th>Category</th>
                                        <th>Doctor</th>
                                        <th>Date</th>
                                        <th>Comfirm</th>
                                        <!----------------   JSTL Query  --------------->
                                        <sql:query dataSource = "${snapshot}" var = "result">
                                            SELECT * from booked where id = ?;
                                            <sql:param value="${userId}"></sql:param>
                                        </sql:query>
                                        <c:forEach var = "row" items = "${result.rows}">
                                            <tr class="pra-form">
                                                <td><c:out value = "${row.id}"/></td>
                                                <td><c:out value = "${row.category}"/></td>
                                                <td><c:out value = "${row.doctor}"/></td>
                                                <td><c:out value = "${row.date}"/></td>
                                                <td><input type="checkbox" value="comfirm"></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!----------------   Add slots start--------------->
                        <div class="switchgroup" id="addslots">
                            <div class="panel-body">
                                <center>
                                    <p class="main-head">Select - Slots</p>
                                    <div class="styled-input-container styled-input--square">
                                        <form method="post" action="addSlots2.jsp">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-one" value="9:00-9:30" onclick="check();"/>
                                                            <label for="radio2-example-one">Slot A</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-two" value="9:30-10:00" onclick="check();"/>
                                                            <label for="radio2-example-two">Slot B</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-three" value="10:00-10:30" onclick="check();"/>
                                                            <label for="radio2-example-three">Slot C</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-four" value="10:30-11:00" onclick="check();">
                                                            <label for="radio2-example-four">Slot D</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-five" value="11:00-11:30" onclick="check();">
                                                            <label for="radio2-example-five">Slot E</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-six" value="11:30-12:00" onclick="check();">
                                                            <label for="radio2-example-six">Slot F</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-seven" value="12:00-12:30" onclick="check();"/>
                                                            <label for="radio2-example-seven">Slot G</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-eight" value="12:30-13:00" onclick="check();"/>
                                                            <label for="radio2-example-eight">Slot H</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-nine" value="14:00-14:30" onclick="check();">
                                                            <label for="radio2-example-nine">Slot I</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-ten" value="14:30-15:00" onclick="check();">
                                                            <label for="radio2-example-ten">Slot J</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-eleven" value="15:00-15:30" onclick="check();">
                                                            <label for="radio2-example-eleven">Slot K</label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="styled-input-single">
                                                            <input type="checkbox" name="time" id="radio2-example-twelve" value="15:30-16:00" onclick="check();">
                                                            <label for="radio2-example-twelve">Slot L</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table><br><br>
                                            <input type="number" value="${userId}" name="id">
                                            <input type="date" required="required" name="date">
                                            <button type="submit" class="btn" name="submit">Submit</button>
                                        </form>
                                    </div>
                                </center> 
                            </div>
                    </div>
                    <!----------------   End add slots --------------->
                    <!----------------   Register patient starts--------------->
                    <div class="switchgroup" id="patientRegistry">
                        <div class="panel-body">
                            <div class="pra-form">
                                <center> <p class="main-head">Create New Booklet</p> </center>
                                <form  action="Registration.jsp" method="post">
                                    <label>Medical id </label>
                                    <input type="number" class="form-control-one" name="id" placeholder="enter medical id" required="required">
                                    <label>Names</label>
                                    <input type="text" class="form-control-one" name="names" placeholder="enter names" required="required">
                                    <label>Nationality</label>
                                    <input type="text" class="form-control-one" name="nationality" placeholder="enter nationality" required="required">
                                    <label>Passport</label>
                                    <input type="text" class="form-control-one" name="passport" placeholder="enter passport" required="required">
                                    <label>Phone</label>
                                    <input type="number" class="form-control-one" name="phone" placeholder="enter phone" required="required">
                                    <label>Address</label>
                                    <input type="text" class="form-control-one" name="address" placeholder="enter address" required="required">
                                    <label>Email</label>
                                    <input type="email" class="form-control-one" name="email" placeholder="enter email" required="required">
                                    <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn">Submit</button>
                                </div>
                            </form>
                        </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            <!----------------   End Row  --------------->
        </div>
        <script  src="js/medicalRecordTable.js"></script>
    </body>
</html>


