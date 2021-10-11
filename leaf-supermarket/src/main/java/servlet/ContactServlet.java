package servlet;
import java.io.*;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import connection.DbCon;
import dao.ContactDao;
import model.Contact;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ContactServlet() {
        super();  
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String type = request.getParameter("type");
		int telephone = Integer.parseInt(request.getParameter("telephone"));
		String message = request.getParameter("message");
		
		try {
			Contact contactModel = new Contact(type,name,email,telephone,message);
			ContactDao regUser = new ContactDao(DbCon.getConnection());
			if (regUser.saveContact(contactModel)) {
				contactModel.DisplaySuccessMessage();
				response.sendRedirect("contactSuccess.jsp");
			}
			else {
				contactModel.DisplayFailedMessage();
				response.sendRedirect("contact.jsp");
			}
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
