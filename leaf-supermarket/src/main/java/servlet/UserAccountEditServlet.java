package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import dao.CustomerDao;
import model.Customer;




@WebServlet("/UserAccountEditServlet")
public class UserAccountEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UserAccountEditServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charser=UTF-8");
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("user_name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			Customer p = new Customer();
			p.setName(name);
			p.setEmail(email);
			p.setPassword(password);
			p.setId(id);
			
			CustomerDao user = new CustomerDao(DbCon.getConnection());
			boolean success = user.editUserInfo(p);
			if(success) {
				System.out.println("Success");
				 response.sendRedirect("UserAccountDisplay.jsp");
			}else {
				System.out.println("Fail");
			}
			
		}catch(Exception e) {
		}
	}

}
