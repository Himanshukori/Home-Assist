<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UserLog</title>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body{
	
	background-image:url("bgimg1.jpg");
	background-size:100%; 
	font-family: sans-serif;
	font-size: 1em;
	text-align: center;
}
h1,h4{
	color: #fff;

}
h4 a{
	text-decoration:none;
	color: #fff;
}	
.container1{
	position:absolute;
	top:20%;
	left:50%;
	transform: translateX(-50%) translateY(-50%);	
}
li{
	display:inline-block;
}
li a{
	text-decoration:none;
	display:inline-block;
	color: #fff;
	font-family: Source Sans Pro;
	font-weight:lighter;
	font-size:25px;
	padding:0 20px;
}
.cool-link::after{
	content: '';
	display: block;
	width: 0;
	height:2px;
	backgrond: #fff;
	transition:width .3s;
}
.cool-link:hover::after{
	width: 100%;
	transition: width .3s;
}
img{
	width: 250px ;
	height: 150px;
}
th{
	font-size: 2em;
	background-color:#f9ddff;
	padding:20px;
}
table{
	
	width:80%;
}
td{
	font-size:50px;
	padding:25px;
}
.fa
{
	margin: 10px;
	color: white;
	font-weight: bold;
}

</style>
 
<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>
 
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">

</head>
<body>
<h1 align="center" >Welcome To User Log</h1>
<% 
String uname=(String) session.getAttribute("id");
%>
<h4 align="right"><i class="fa fa-user-circle-o"></i><%= "  Welcome "%><%= uname %></h4>
<h4 align="right"><i class="fa fa-power-off"></i><a href=Logout>Logout</a></h4>
<div class="container1">
	<li><a href="SearchService.jsp" class="cool-link">Search For Service</a></li>
	<li><a href="MyBooking.jsp" class="cool-link">My Booking</a></li>
	<li><a href="UserProfile.jsp" class="cool-link">My Profile</a></li>
	<!--  <li><a href="usersetting.html" class="cool-link">Settings</a></li>-->
</div>
<table align="center">
	<tr>
	<th colspan="4">Services</th>
	</tr>
	<!-- 
	<tr>
	<th colspan="4">Click on service image to see shops.</th>
	</tr>
	 -->
	<tr>
		<td><a href="ElecricianList.jsp"><img src="electrician.jpg"></a></td>
		<td><a href="PlumberList.jsp"><img src="plumber.jpg"></a></td>
		<td><a href="PainterList.jsp"><img src="painter.jpg"></a></td>	
	</tr>
	<tr>
	<td>Electrician</td>
	<td>Plumber</td>
	<td>Painter</td>
	</tr>
	<tr>
		<td><a href="CarpenterList.jsp"><img src="carpenter.jpg"></a></td>
		<td></td>
		<td><a href="LaundaryList.jsp"><img src="laundary.jpg"></a></td>	
	</tr>
	<tr>
	<td>Carpenter</td>
	<td></td>
	<td>Laundary</td>
	</tr>
	
</table>		
</body>
 
<script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script>

</html>