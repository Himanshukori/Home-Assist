<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Services</title>
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
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
			
			String service=request.getParameter("sservice");
			String area=request.getParameter("sarea");
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from shop where Shop_Service='Plumber'");
			%>
			<% 
				String uname=(String) session.getAttribute("id");
			%>
			<h4 align="right"><%= "Welcome "%><%= uname %></h4>
			<h4 align="left"><a href=UserLog.jsp>Go To Home</a></h4>
			<h4 align="right"><a href=Logout>Logout</a></h4>						
			<h1 align=center color=blue>Service Providers list!!!!</h1>
			<table>
			<th>Shop Name</th><th>Shop Area</th><th>Shop Opening Time</th><th>Shop Closing Time</th><th>Shop Contact</th><th>Book</th>
			<%
			if(rs.next())
			{
				do
				{
					String sname=rs.getString("Shop_Name");
					String sarea=rs.getString("Shop_Area");
					String sotime=rs.getString("Shop_Opening_Time");
					String sctime=rs.getString("Shop_Closing_Time");
					String scontact=rs.getString("Shop_Contact");
					String suname=rs.getString("Username");
					
			%>	
					<tr>
					<td>
					<%= sname %>
					</td>
					<td>
					<%= sarea %>
					</td>
					<td>
					<%= sotime %>
					</td>
					<td>
					<%= sctime%>
					</td>
					<td>
					<%= scontact%>
					</td>

					<td>
					<a href=BookingForm.jsp?Shopname=<%= sname %>&ShopUserName=<%= suname %>& BookerUsername<%=uname %>>Book</a>
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
				
				out.println("There is no shop till now for this Service!!!");
				
				
			}
			%>
	</table>
	<% 
			con.close();
	%>

</body>
</html>