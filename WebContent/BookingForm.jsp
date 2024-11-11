<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body{
	background-image:url("bgimg1.jpg");
	background-size:100%; 
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
input[type=text],input[type=email],input[type=password],input[type=date]
{
	width:95%
}
input[type=number]{
	width:20%;
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
h4{
	color: #fff;

}
h4 a{
	text-decoration:none;
	color: #fff;

}s

</style>

</head>
<body>
<% 
	String uname=(String) session.getAttribute("id");
%>
<%
	String sname=request.getParameter("Shopname");
	String suname=request.getParameter("ShopUserName");
	String booker=request.getParameter("BookerUsername");
	session=request.getSession();
	session.setAttribute("id1",suname );
	
%>

<h4 align="right">Welcome <%=uname %></h4>
<h4 align="left"><a href=UserLog.jsp>Go To Home</a></h4>
			<h4 align="right"><a href=Logout>Logout</a></h4>
<form action="BookService.jsp"> 
<table border=1px>
	<tr>
	<td> Shop Name</td>
	<td><input type="text" name="shopname" value="<%= sname%>"></td>
	</tr>
	<td> Booking Date</td>
	<td><input type="date" name="bdate" value="" ></td> 
	</tr>
	<td> Come between</td>
	<td><input type="number" name="tafter" value="" > to<input type="number" name="tbefore" value="" ></td> 
	</tr>
	<td> Your Address</td>
	<td><input type="text" name="address" value="" ></td>
	</tr>
	<td> Description(service you required)</td>
	<td><input type="text" name="desc" value="" ></td>
	</tr>
	<td></td>
	<td><input type="submit" value="Book"></td>
</table>
</form>
</body>
</html>