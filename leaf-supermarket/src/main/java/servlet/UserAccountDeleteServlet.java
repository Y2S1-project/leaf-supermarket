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



@WebServlet("/UserAccountDeleteServlet")
public class UserAccountDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserAccountDeleteServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int id = Integer.parseInt(request.getParameter("id"));
		Customer p = new Customer();
		p.setId(id);
        
        try{
        	CustomerDao user = new CustomerDao(DbCon.getConnection());
            user.deleteUser(p.getId());
            response.sendRedirect("register.jsp");
        }catch(Exception e){
            e.printStackTrace();
        }
	}

}
