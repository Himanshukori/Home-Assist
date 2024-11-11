<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	String uname=request.getParameter("uname");
	String suname=request.getParameter("suname");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
	String qr="update booking set Booking_Status='Confirm' where Booker_Username=? and Service_Username=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, uname);
	ps.setString(2, suname);
	int i=ps.executeUpdate();
	RequestDispatcher rd=request.getRequestDispatcher("ServiceLog.jsp");
	if(i!=0)
	{
		rd.include(request, response);
		out.println("Booking confirmed");

	}
	else
	{
		rd.include(request, response);
		out.println("Booking not confirmed");
		
		
	}
	
%>

</body>
</html>