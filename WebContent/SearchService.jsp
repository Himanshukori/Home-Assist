<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
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
table{
	width:800px;
	margin:auto;
	text-align:center;
	text-layout:fixed;
}
table,tr,th,td{
	padding:20px;
	color:white;
	border:1px solid #080808;
	border-collapse:collapse;
	font-size:18px;
	font-family:Arial;
	background:linear-gradient(top, #3c3c3c 0%, #222222 100%);
	background:-webkit-linear-gradient(top, #3c3c3c 0%, #222222 100%);
}
select{
	width:70%;
	height:60%;
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
<% 
String uname=(String) session.getAttribute("id");
%>
<h4 align="right"><%= "Welcome "%><%= uname %></h4>
<h4 align="left"><a href=UserLog.jsp>Go To Home</a></h4>
<h4 align="right"><a href=Logout>Logout</a></h4>

	<form action="Search.jsp">
		<table>
			<tr>
				<td>Service</td>
				<td><select name="sservice">
				<option>Electrician</option>
				<option>Plumber</option>
				<option>Carpenter</option>
				<option>Painter</option>
				<option>Laundary</option>
				</select></td>
			</tr>
			<tr>
				<td>Area</td>
				<td><select name="sarea">
				<option>Bhawarkua</option>
				<option>Vijay_Nagar</option>
				<option>Aanpurna</option>
				<option>Naulakha</option>
				<option>Collectarate</option>
				</select></td>
			</tr>
			<tr>
			<td></td>
			<td><input type="submit" value="Search"></td>
			</tr>
		</table>
	</form>
</body>
</html>