<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Bookings</title>
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
td:hover
{
	background:orange;
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

<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from booking where Booker_Username='"+uname+"' ");
			%>
			<h1 align=center color=blue>Users list</h1>
			<table>
			<th>Shop Name</th><th>Come after</th><th>Come Before</th><th>Address(You gave)</th><th>Desription(Service you Demanded)</th><th>Status</th>
			<%
			if(rs.next())
			{
				do
				{
					String sname=rs.getString("Shopname");
					String tafter=rs.getString("Come_After");
					String tbefore=rs.getString("Come_Before");
					String address=rs.getString("Address");
					String desc=rs.getString("Description");
					String status=rs.getString("Booking_Status");
		
			%>	
					<tr>
					<td>
					<%= sname %>
					</td>
					<td>
					<%= tafter %>
					</td>
					<td>
					<%= tbefore%>
					</td>
					<td>
					<%= address%>
					</td>
					<td>
					<%= desc %>
					</td>
					<td>
					<h5><%= status%></h5>
					</td>
					</tr>
			<%
				}while(rs.next());
			}			
			else
			{
				
				out.println("You Not Booked any Service Till now!!!!!");
			}
			%>
</table>
<% 
			con.close();
%>


</body>
</html>