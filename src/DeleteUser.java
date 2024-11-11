

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
        super();
        // TODO Auto-generated constructor stub

    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
    	String username=request.getParameter("uname");
    	try
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Home_Assist","root","root");
    		String qr="delete from user_regs where Username=?";
    		PreparedStatement ps=con.prepareStatement(qr);
    		ps.setString(1, username);
    		int i=ps.executeUpdate();
    		RequestDispatcher rd=request.getRequestDispatcher("UserList.jsp");
    		
    		if(i>0)
    		{
    			rd.include(request, response);
    			out.println(username+" deleted");
    		}
    		else
    		{
    			rd.include(request, response);
    			out.println(username+" not deleted");
    		}
    		con.close();
    	}catch(Exception e)
    	{
    		out.println(e);
    	}

	}

}
