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
	String uname=(String) session.getAttribute("id");
	String suname=(String) session.getAttribute("id1");
	String sname=request.getParameter("shopname");
	String tafter=request.getParameter("tafter");
	String tbefore=request.getParameter("tbefore");
	String address=request.getParameter("address");
	String date=request.getParameter("bdate");
	String description=request.getParameter("desc");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
	PreparedStatement ps=con.prepareStatement("insert into booking (Booker_Username,Service_Username,Shopname,Date,Come_After,Come_Before,Address,Description) values(?,?,?,?,?,?,?,?)");
	ps.setString(1, uname);
	ps.setString(2, suname);
	ps.setString(3, sname);
	ps.setString(4, date);
	ps.setString(5, tafter);
	ps.setString(6, tbefore);
	ps.setString(7, address);
	ps.setString(8, description);
	
	int x=ps.executeUpdate();
	
	if(x>0)
	{
		RequestDispatcher rs=request.getRequestDispatcher("UserLog.jsp");
		rs.include(request, response);
		out.println("Booking Done");
		
	}
	else
	{	
		RequestDispatcher rs=request.getRequestDispatcher("UserLog.jsp");
		rs.include(request, response);
		out.println("Something went wrong");	
	}
	
%>


</body>
</html>