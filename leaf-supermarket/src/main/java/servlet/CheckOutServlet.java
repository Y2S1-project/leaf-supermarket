package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import dao.UserDao;
import model.User;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/checkOut")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
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
		try {
			int id = Integer.parseInt(request.getParameter("user_id"));
			String Contact = request.getParameter("recipientContact");	
			String houseNo = request.getParameter("house-no");
			String streetName = request.getParameter("street-name");
			String city = request.getParameter("city");
			Double total = Double.parseDouble(request.getParameter("total"));
			String address = houseNo + ", " + streetName + ", " + city;
			System.out.println(Contact);
			
			User user1 = new User();
			user1.setId(id);
			user1.setAddress(address);
			user1.setTelephone(Contact);
			user1.setTotal(total);
			
			UserDao udao = new UserDao(DbCon.getConnection());
			if (udao.updateUser(user1)) {
				System.out.println(user1.getAddress());
				response.sendRedirect("payment.jsp?total="+total);
			}
			else {		
				response.sendRedirect("checkOut.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
