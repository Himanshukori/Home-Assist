

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
 * Servlet implementation class ServiceSignUp
 */
@WebServlet("/ServiceSignUp")
public class ServiceSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceSignUp() {
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
		String fname=request.getParameter("sfname");
		String lname=request.getParameter("slname");
		String uname=request.getParameter("suname");
		String pwd=request.getParameter("spwd");
		String cpwd=request.getParameter("scpwd");
		String dob=request.getParameter("sdob");
		String gender=request.getParameter("sgender");
		String contact=request.getParameter("scontact");
		String aadharn=request.getParameter("san");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
			
			PreparedStatement ps=con.prepareStatement("insert into serviceprovider_regs values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, uname);
			ps.setString(4, pwd);
			ps.setString(5, cpwd);
			ps.setString(6, dob);
			ps.setString(7, gender);
			ps.setString(8, contact);
			ps.setString(9, aadharn);
			int x=ps.executeUpdate();
			
			if(x>0)
			{
				RequestDispatcher rs=request.getRequestDispatcher("servicelogin.html");
				rs.include(request, response);
				out.println("<h4>Signup successfull</h4>");
				
			}
			else
			{	
				RequestDispatcher rs=request.getRequestDispatcher("servicelogin.html");
				rs.include(request, response);
				out.println("<h4 bakground-color:red>SignUp failed</h4>");
				
				
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
			
		}
	}

}
