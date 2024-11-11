

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserSignUp
 */
@WebServlet("/UserSignUp")
public class UserSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSignUp() {
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
		String fname=request.getParameter("ufname");
		String lname=request.getParameter("ulname");
		String uname=request.getParameter("uuname");
		String pwd=request.getParameter("upwd");
		String cpwd=request.getParameter("ucpwd");
		String dob=request.getParameter("udob");
		String gender=request.getParameter("ugender");
		String contact=request.getParameter("ucontact");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
			
			PreparedStatement ps=con.prepareStatement("insert into user_regs values(?,?,?,?,?,?,?,?)");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, uname);
			ps.setString(4, pwd);
			ps.setString(5, cpwd);
			ps.setString(6, dob);
			ps.setString(7, gender);
			ps.setString(8, contact);
			
			int x=ps.executeUpdate();
			
			if(x>0)
			{
				RequestDispatcher rs=request.getRequestDispatcher("userlogin.html");
				rs.include(request, response);
				out.println("Signup successfull");
				
			}
			else
			{	
				RequestDispatcher rs=request.getRequestDispatcher("userlogin.html");
				rs.include(request, response);
				out.println("SignUp failed");
				
				
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
			
		}
	}
}

