

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddShop
 */
@WebServlet("/AddShop")
public class AddShop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShop() {
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
		HttpSession session=request.getSession();
		String suname=(String) session.getAttribute("id");
		
		String sname=request.getParameter("shopname");
		String sservice=request.getParameter("shopservice");
		String sarea=request.getParameter("shoparea");
		String sotime=request.getParameter("shopotime");
		String sctime=request.getParameter("shopctime");
		String sadd=request.getParameter("shopaddress");
		String scontact=request.getParameter("shopcontact");
		
		out.println(suname);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
			
			PreparedStatement ps=con.prepareStatement("insert into shop values(?,?,?,?,?,?,?,?)");
			ps.setString(1, sname);
			ps.setString(2, sservice);
			ps.setString(3, sarea);
			ps.setString(4, sotime);
			ps.setString(5, sctime);
			ps.setString(6, sadd);
			ps.setString(7, scontact);
			ps.setString(8, suname);
		
			
			int x=ps.executeUpdate();
			
			if(x>0)
			{
				RequestDispatcher rs=request.getRequestDispatcher("ServiceLog.jsp");
				rs.include(request, response);
				out.println("Shop added succesfully!");
				
			}
			else
			{	
				RequestDispatcher rs=request.getRequestDispatcher("AddService.jsp");
				rs.include(request, response);
				out.println("Something went wrong, try again!!");				
			}
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
			
		}

	}

}
