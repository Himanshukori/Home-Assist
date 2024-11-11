<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Service</title>
<style>
body{
background-image:url("bgimg1.jpg");
background-size:100%; 
}
h4{
	color: #fff;

}
h4 a{
	text-decoration:none;
	color: #fff;
}
.wrap{
	width:450px;
	margin:auto;
	background: #00adee;
	margin-top:50px;
	padding:5px;
}
form{
	padding:10px;
	font-family:arial;
	border: 1px dotted white;
	margin:10px;
}
h2{
	text-align:center;
	background:orange;
	color:white;
	padding:10px;
	border-radius: 10px;
	
}
input{
	padding:10px;
	margin:10px;
	border-radius:5px;
	border:none;
}
select{
	width:60%;
	height:30px;
	
}
input[type=text],input[type=email],input[type=number],input[type=password]
{
	width:95%
}
input[type=submit]{
	width:95%;
	background:orange;
	cursor:pointer;
	font-size: 18px;
	font-weight:bold;
	color:white;
}
input[type=submit]:hover
{
background:yellow;
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
<h1 align="center">Add Service Details!!!!!</h1>
<hr>

<% 
String suname=(String) session.getAttribute("id");
%>
<h4 align="right">Welcome <%= suname %></h5>
<h4 align="right"><a href=Logout>Logout</a></h4>
<h4 align="left"><a href=ServiceLog.jsp>Go To Home</a></h4>
<div class="wrap">
<form action="AddShop">
 
<input type="text" name="shopname" placeholder="Enter Shopname(should not have space)" />
(if you dont't have shop write self)
<br>
Choose Service
<select name="shopservice">
<option>Electrician</option>
<option>Plumber</option>
<option>Carpenter</option>
<option>Painter</option>
<option>Maid</option>
</select>
<br>
Choose Area
<select name="shoparea">
				<option>Bhawarkua</option>
				<option>Vijay_Nagar</option>
				<option>Aanpurna</option>
				<option>Naulakha</option>
				<option>Collectarate</option>
				</select>
<br>

<input type="number" name="shopotime" placeholder="Opening Time(in 24 hou format )" required/>

<input type="number" name="shopctime" placeholder="Closing time(in 24 hou format )" required/>

<input type="text" name="shopaddress" placeholder="Shop Address" required/>

<input type="text" name="shopcontact" placeholder="Contact" required/>

<input type="submit" value="Add" />
<% session.setAttribute("id", suname ); %>

</form>
</div>
</body>
<script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script>
</html>