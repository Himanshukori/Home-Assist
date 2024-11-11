

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServiceLoginCheck
 */
@WebServlet("/ServiceLoginCheck")
public class ServiceLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceLoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String suname=request.getParameter("suname");
		String pwd=request.getParameter("spwd");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
			
			PreparedStatement ps=con.prepareStatement("Select * from serviceprovider_regs where username=? and password=?");
			ps.setString(1, suname);
			ps.setString(2, pwd);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				HttpSession session=request.getSession();
				session.setAttribute("id", suname );
				session.setMaxInactiveInterval(30);
				
				response.sendRedirect("ServiceLog.jsp");				
			}
			else
			{	RequestDispatcher rd=request.getRequestDispatcher("servicelogin.html");
				rd.include(request, response);
				out.println("Invalid Username or Password");				
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);					}
		}

	}

