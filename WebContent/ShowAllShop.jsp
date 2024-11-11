<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Services</title>
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
td:hover
{
	background:orange;
}
</style>
</head>
<body>
<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from shop");
			%>
			<h1 align=center>All Services Registered</h1>
			<table>
			<th>Shop Name</th><th>Shop Service</th><th>Shop Area</th><th>Opening Time</th><th>Closing Time</th><th>Shop Address</th><th>Contact</th><th>Edit</th><th>Delete</th>
			<%
			if(rs.next())
			{
				do
				{
					String sname=rs.getString("Shop_Name");
					String sservice=rs.getString("Shop_Service");
					String sarea=rs.getString("Shop_Area");
					String sotime=rs.getString("Shop_Opening_Time");
					String sctime=rs.getString("Shop_Closing_Time");
					String saddress=rs.getString("Shop_Address");
					String scontact=rs.getString("Shop_Contact");
			%>	
					<tr>
					<td>
					<%= sname %>
					</td>
					<td>
					<%= sservice %>
					</td>
					<td>
					<%= sarea%>
					</td>
					<td>
					<%= sotime%>
					</td>
					<td>
					<%= sctime %>
					</td>
					<td>
					<%= saddress%>
					</td>
					<td>
					<%= scontact%>
					</td>
					<td>
					<button onclick="#">Edit</button>
					</td>
					<td>
					<button onclick="#">Delete</button>
					</td>						           
		            </tr>
			<%
				}while(rs.next());
			}
			
			else
			{
				
				out.println("No Record Found");
				
				
			}
			%>
</table>
<% 
			con.close();
%>


</body>
</html>