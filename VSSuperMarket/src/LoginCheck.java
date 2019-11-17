import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session ;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname=request.getParameter("uname");
		
		String password =request.getParameter("password");
		
		if(request.getSession()==null) 
		{
		session.setAttribute("Status", "");
		}
		if(!uname.equals("admin") || !password.equals("admin") )
		{
			session=request.getSession(false);
			
			session.setAttribute("Status", "Invalid user credentials");
			response.sendRedirect("login.jsp");
			
			
		}
		else
		{
			session=request.getSession(true);
			session.setAttribute("Status", "success");
			session.setAttribute("username", "admin");
			response.sendRedirect("home.jsp");
			
		}
		doGet(request, response);
	}

}
