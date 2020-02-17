<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
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
            h1{
                width: 120%;
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
                    <li><a href="">Statistics</a></li>
                </ul>
            </div>
                
            <div class="panel-one">
                    
                         
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb", "root", "");
	Statement statement = connection.createStatement();
        
        Connection con,con1,con2,con3,con4,con5,con6,con7;
        ResultSet rs,rs1,rs2,rs3,rs4,rs5,rs6,rs7;
        Statement st,st1,st2,st3,st4,st5,st6,st7;
        int a=0;
        int b=0;
        int c=0;
        int d=0;
        int e=0;
        int f=0;
        int g=0;
        int h=0;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb?zeroDateTimeBehavior=convertToNull","root","");
        st = con.createStatement();
        rs = st.executeQuery("SELECT * FROM medicine WHERE name='panado'");
        while(rs.next()){
            a++;
        }
        
        Class.forName("com.mysql.jdbc.Driver");
        con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb?zeroDateTimeBehavior=convertToNull","root","");
        st1 = con1.createStatement();
        rs1 = st1.executeQuery("SELECT * FROM medicine WHERE name='grandpa'");
        while(rs1.next()){
            b++;
        }
        
        Class.forName("com.mysql.jdbc.Driver");
        con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb?zeroDateTimeBehavior=convertToNull","root","");
        st2 = con2.createStatement();
        rs2 = st2.executeQuery("SELECT * FROM medicine WHERE name='flue'");
        while(rs2.next()){
            c++;
        }
        
        Class.forName("com.mysql.jdbc.Driver");
        con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb?zeroDateTimeBehavior=convertToNull","root","");
        st3 = con3.createStatement();
        rs3 = st3.executeQuery("SELECT * FROM medicine WHERE name='panado'");
        while(rs3.next()){
            d++;
        }
        
        Class.forName("com.mysql.jdbc.Driver");
        con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb?zeroDateTimeBehavior=convertToNull","root","");
        st4 = con.createStatement();
        rs4 = st4.executeQuery("SELECT * FROM medicine WHERE name='panado'");
        while(rs4.next()){
            e++;
        }
        
        Class.forName("com.mysql.jdbc.Driver");
        con5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb?zeroDateTimeBehavior=convertToNull","root","");
        st5 = con5.createStatement();
        rs5 = st5.executeQuery("SELECT * FROM medicine WHERE name='panado'");
        while(rs5.next()){
            f++;
        }
        
        Class.forName("com.mysql.jdbc.Driver");
        con6 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb?zeroDateTimeBehavior=convertToNull","root","");
        st6 = con6.createStatement();
        rs6 = st6.executeQuery("SELECT * FROM medicine WHERE name='panado'");
        while(rs6.next()){
            g++;
        }
        
        Class.forName("com.mysql.jdbc.Driver");
        con7 = DriverManager.getConnection("jdbc:mysql://localhost:3306/hb?zeroDateTimeBehavior=convertToNull","root","");
        st7 = con7.createStatement();
        rs7 = st7.executeQuery("SELECT * FROM medicine WHERE name='panado'");
        while(rs7.next()){
            h++;
        }
	
	ResultSet resultSet = statement.executeQuery("select * from medicine");
	
	if(resultSet.next()){
		map = new HashMap<Object,Object>();  map.put("label", "HIV/AIDS");map.put("y", a); list.add(map);
                map = new HashMap<Object,Object>();  map.put("label", "HIV/AIDS");map.put("y", b); list.add(map);
                map = new HashMap<Object,Object>();  map.put("label", "HIV/AIDS");map.put("y", c); list.add(map);
                map = new HashMap<Object,Object>();  map.put("label", "HIV/AIDS");map.put("y", d); list.add(map);
                map = new HashMap<Object,Object>();  map.put("label", "HIV/AIDS");map.put("y", e); list.add(map);
                map = new HashMap<Object,Object>();  map.put("label", "HIV/AIDS");map.put("y", f); list.add(map);
                map = new HashMap<Object,Object>();  map.put("label", "HIV/AIDS");map.put("y", g); list.add(map);
                map = new HashMap<Object,Object>();  map.put("label", "HIV/AIDS");map.put("y", h); list.add(map);
		dataPoints = gsonObj.toJson(list);
	}
	connection.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}
%>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {  
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "Health Statistics"
	},
	axisY: {
		title: "Number of Patients(%)"
	},
	axisX: {
		title: "Disease Name"
	},
	data: [{
		type: "scatter",
		xValueFormatString: "#,##0.00 Avr",
		yValueFormatString: "#,##0.00 Medicine",
		toolTipContent: "<b>Month:</b> {--}, <br><b>Average:</b> {y}",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
chart.render();
 
}
</script>

<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

                    </div>
                    <!----------------   panel one  --------------->
                
            </div>
            <!----------------   Panel One Ends  --------------->
        <br><br>
        <!----------------   Row One Ends  --------------->
    </body>
    </html>
