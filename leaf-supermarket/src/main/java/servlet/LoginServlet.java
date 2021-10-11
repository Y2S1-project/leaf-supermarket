package servlet;
import model.*;
import dao.*;
import connection.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=response.getWriter()){
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			try {
				UserDao udao =new UserDao(DbCon.getConnection());
				User user = udao.userLogin(email, password);
				UserDao udao1 =new UserDao(DbCon.getConnection());
				User user1 = udao1.adminLogin(email, password);
				if(user!=null) {
					user.DisplaySuccessMessage();
					request.getSession().setAttribute("auth",user.getId());
					request.getSession().setAttribute("username", user.getName());
					response.sendRedirect("index.jsp");
				}
				else if(user1!=null) {
					user1.DisplaySuccessMessage();
					request.getSession().setAttribute("auth",user1.getId());
					request.getSession().setAttribute("auth1",user1.getId());
					request.getSession().setAttribute("adminname", user1.getName());
					response.sendRedirect("index.jsp");
				}
				
				else{
					out.print("Failed Login");
				}
				
			}catch(ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}	
		}		
	}
}
