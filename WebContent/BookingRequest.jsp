<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Request</title>
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
<h3 align="center">Booking Requests</h5>
<hr>
<% 
String suname=(String) session.getAttribute("id");
%>
<h4 align="right"><%= "Welcome "%><%= suname %></h4>
<h4 align="right"><a href=Logout>Logout</a></h4>
<h4 align="left"><a href=ServiceLog.jsp>Go To Home</a></h4>

<% 
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
			
			Statement st=con.createStatement();
			Statement st1=con.createStatement();
			ResultSet rs=st.executeQuery("select * from booking where Service_Username='"+suname+"' ");
			
			%>
			<table>
			<th>Shop Name</th><th>Booker Name</th><th>Booker Contact</th><th>Booking Date</th><th>Come after</th><th>Come Before</th><th>Address</th><th>Desription(Service Demanded)</th><th>Status Till Now</th><th>Cofirm</th>
			<%
			if(rs.next())
			{
			
				do{
					String sname=rs.getString("Shopname");
					String bdate=rs.getString("date");
					String tafter=rs.getString("Come_After");
					String tbefore=rs.getString("Come_Before");
					String address=rs.getString("Address");
					String desc=rs.getString("Description");
					String status=rs.getString("Booking_Status");
					String uname=rs.getString("Booker_Username");
					
					ResultSet rs1=st1.executeQuery("select First_name,Last_name,Contact from user_regs where Username='"+uname+"' ");					
					if(rs1.next())
					{
							String ufname=rs1.getString("First_name");
							String ulname=rs1.getString("Last_name");
							String ucontact=rs1.getString("Contact");
						
				
			%>	
					<tr>
					<td>
					<%= sname %>
					</td>
					
					<td>
					<%= ufname %> <%= ulname %>
					</td>
					<td>
					<%= ucontact %>
					</td>		
					<td>
					<%= bdate %>
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
					<td>
					<a href=ConfirmBooking.jsp?uname=<%=uname %>&suname=<%=suname %>>Confirm Booking</a>
					</td>
					</tr>
			<%			
					}
				}while(rs.next());			
			}
		else
		{
				
			out.println("You not have any booking request!!!!!");
		}			
			%>
</table>
<% 
			con.close();
%>

</body>
</html>