

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

/**
 * Servlet implementation class Alogin
 */
@WebServlet("/Alogin")
public class Alogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Alogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		java.lang.String name=request.getParameter("aname");
		java.lang.String password=request.getParameter("apwd");
		if(name.equals("admin") && password.equals("12345"))
		{
			HttpSession session=request.getSession();
			session.setAttribute("id",name );

			response.sendRedirect("AdminLog.jsp");
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("adminlogin.html");
			rd.include(request, response);
			out.println("<p align=center style=color: red>Invalid Id or Password</p>");
			
		}
	}

}
