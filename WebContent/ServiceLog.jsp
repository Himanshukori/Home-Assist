<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Service Log</title>
<style>
body{
background-image:url("bgimg1.jpg");
background-size:100%; 
}
h1,h4{
	color: #fff;

}
h4 a{
	color: #fff;

}
.container{
	position:absolute;
	top:20%;
	left:30%;
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
</style>
<script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
</script>

</head>
<body>
<h1 align="center">Welcome To Service Provider Log!!!!!</h1>
<% 
String suname=(String) session.getAttribute("id");
%>
<h4 align="right"><%= "Welcome " %><%= suname %></h4>
<h4 align="right"><a href=Logout>Logout</a></h4>

<div class="container">
	<li><a href="AddService.jsp" class="cool-link">Add Service</a></li>
	<li><a href="MyService.jsp" class="cool-link">My Service</a></li>
	<li><a href="BookingRequest.jsp" class="cool-link">Booking Request</a></li>
	<li><a href="ServiceProviderProfile.jsp" class="cool-link">My Profile</a></li>
	<!--  <li><a href="serviceprovidersetting.html" class="cool-link">Settings</a></li>-->
</div>
</body>
</html>