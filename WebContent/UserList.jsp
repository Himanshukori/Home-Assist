<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List</title>
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
<%@ 		page import="java.sql.*"%>
<%			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from user_regs");
			%>
			<h1 align=center color=blue>Users list</h1>
			<table>
			<th>First Name</th><th>Second Name</th><th>Username</th><th>Password</th><th>D.O.B</th><th>Gender</th><th>Contact</th><th>Edit</th><th>Delete</th>
			<%
			if(rs.next())
			{
				do
				{
					String fname=rs.getString("First_Name");
					String lname=rs.getString("Last_Name");
					String username=rs.getString("Username");
					String password=rs.getString("Password");
					String dob=rs.getString("D.O.B");
					String gender=rs.getString("Gender");
					String contact=rs.getString("Contact");
			%>	
					<tr>
					<td>
					<%= fname %>
					</td>
					<td>
					<%= lname %>
					</td>
					<td>
					<%= username%>
					</td>
					<td>
					******
					</td>
					<td>
					<%= dob %>
					</td>
					<td>
					<%= gender%>
					</td>
					<td>
					<%= contact%>
					</td>
					<td>
					<button onclick="Edit.jsp">Edit</button>
					</td>
					<td>
					<a href=DeleteUser?uname=<%= username %>>Delete</a>
					</td>
					<!-- 
					<td>
		            out.println("<a href=DelPro?pname="+name+">Delete</a>");
		            out.println("</td>");
		            out.println("<td>");
		            out.println("<a href=UpdateProduct?pname="+name+"&price="+price+"&category="+category+"&company="+company+">Update</a>");
		            out.println("</td>");
		            -->		           
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