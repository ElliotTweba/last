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
            .emergency{
                color: red;
            }
            .sub-input{
                border-top: none;
                border-left: none;
                border-right: none;
            }
            .sub-input:focus{
                border: none;
            }
            label{
                font-weight: 400;
                color: black;
                padding: 5px;
                font-size: 15px;
            }
            .pre-align{
                padding: 15px 10px;
                display: inline-block;
                width: auto;
            }
            .pre-sub{
                margin-left: 72%;
                margin-top: -6.3%;
            }
            .btn1{
                margin-top:10px;
                background-color: #337ab7;
                width: 90px;
                height: 80px;
                color: white;
                font-size: 20px;
                border: none;
                border-radius: 4px;
            }
            .btn1:hover{
                opacity: 0.6;
            }
            .main-head{
                margin-left: -15%;
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
                    <li ><a href="PharmacistStatistics.jsp">Statistics</a></li>
                    <li><a href="">Logout</a></li>
                </ul>
            </div>
            <div class="panel-one">
                <div  class="panel-heading3">
                    <p>Apothecary </p>
                </div>
                <!----------------   Panel Starts  --------------->
                <div class="panel">
                    <!----------------   Container two starts  --------------->
                    <div class="container-two">
                        <ul class="nav nav-tabs doctor">
                            <li>
                                <a href="#Record">
                                    Add Medication
                                </a>
                            </li>
                        </ul>
                        <!----------------  Add MR Starts  --------------->
                        <div id="Record" class="switchgroup">
                            <div class="panel-body"><br>
                                <div class="pra-form">
                                    <form method="post" action="">
                                        <label>Medical ID </label>
                                        <input type="number" class="form-control-one" placeholder="Enter Patient Id"  name="id">
                                        <label>Date</label>
                                        <input type="date" class="form-control-one" name="date">
                                        <input type="submit" class="btn" value="Search">
                                    </form>
                                 </div>
                            </div>
                        </div>
                        <!----------------  MR Ends   --------------->
                    </div>
                    <!----------------   Container Two Ends  --------------->
                
                <!----------------   Panel Ends  --------------->
                <!----------------   JSTL Query starts --------------->
                <c:if test="${pageContext.request.method=='POST'}">
                    <c:catch var="e">
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT * from medicalrecords where id = ? and date = ?;
                            <sql:param value="${param.id}"></sql:param>
                            <sql:param value="${param.date}"></sql:param>
                        </sql:query>
                            <c:forEach var = "row" items = "${result.rows}">
                                <div class="panel-body">
                                         <div class="pra-form1">
                                    <p class="main-head">Subscription - Form</p> 
                                     <form method="post" action="">
                                                 <div class="pre-align">
                                                     <label>Medical ID</label>
                                                     <input type="number" class="sub-input"  value="<c:out value = "${row.id}"/>" name="id"  >
                                                 </div>
                                                 <div class="pre-align">
                                                     <label>Disease</label>
                                                     <input type="text" class="sub-input" name="disease" value="<c:out value = "${row.disease}"/>">
                                                 </div>
                                                 <div class="pre-align">
                                                     <label>Month</label>
                                                     <select class="sub-input" required="required">
                                                         <option value="">-- Select --</option>
                                                         <option value="Janaury">Janaury</option>
                                                         <option value="Febaury">Febary</option>
                                                         <option value="March">March</option>
                                                     </select>
                                                 </div><br>
                                                 <div class="pre-align">
                                                     <label>Pre - name</label>
                                                     <input type="text" class="sub-input" name="preName">
                                                 </div>
                                                 <div class="pre-align">
                                                     <label>Pre - #</label>
                                                     <input type="number" class="sub-input" name="preNumber">
                                                 </div>
                                                 <div class="pre-align">
                                                     <label>Pre - total</label>
                                                     <input type="number" class="sub-input" name="preTotal" >
                                                 </div><br>
                                                 <div class="pre-align">
                                                     <label>Percentage Used</label>
                                                     <input type="number" class="sub-input" name="used">
                                                     <input type="submit" value="Genarate" onClick="calc2(this.form)"></div>
                                                 <div class="pre-sub">
                                                     <center><input type="submit" class="btn1" value="Submit"></center>
                                                 </div>
                                             </form>
                                         </div>
                                     </div>
                            </c:forEach>
                    </c:catch>
                            <br>
                            <c:if test="${e!=null}">The caught exception is:
                                <c:out value="${e}" /><br>
                            </c:if>
                </c:if>
                </div>
            </div>
            <!----------------   Panel One Ends  --------------->
        </div>
        <br><br>
        <!----------------   Row1 Ends  --------------->
</body>
</html>
