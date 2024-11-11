

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserLoginCheck
 */
@WebServlet("/UserLoginCheck")
public class UserLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginCheck() {
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
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("upwd");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
			
			PreparedStatement ps=con.prepareStatement("Select * from user_regs where username=? and password=?");
			ps.setString(1, uname);
			ps.setString(2, pwd);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				HttpSession session=request.getSession();
				session.setAttribute("id",uname );
				response.sendRedirect("UserLog.jsp");				
			}
			else
			{	RequestDispatcher rd=request.getRequestDispatcher("userlogin.html");
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

