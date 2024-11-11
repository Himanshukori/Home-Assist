<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bookingform</title>
</head>
<body>
<% 
	String uname=(String) session.getAttribute("id");
%>
<%
	String sname=request.getParameter("Shopname");
	String suname=request.getParameter("ShopUserName");
	String booker=request.getParameter("BookerUsername");
%>
<%=sname %>
<%=suname %>
<%=uname %>
<h5 align="right">Welcome <%=uname %></h5>
<form action=""> 
<table border=1px>
	<tr>
	<td> Shop Name</td>
	<td><%=sname %></td>
	</tr>
	<td> Come between</td>
	<td><input type="text" name="tafter" value="" > to<input type="text" name="tbefore" value="" ></td> 
	</tr>
	<td> Your Address</td>
	<td><textarea rows="2" column="50" ></textarea></td>
	</tr>
	<td> Description(service you required)</td>
	<td><textarea rows="2" column="50" ></textarea></td>
	</tr>
	<td></td>
	<td><input type="submit" value="Book"></td>
	
	

</table>


</form>

</body>
</html>