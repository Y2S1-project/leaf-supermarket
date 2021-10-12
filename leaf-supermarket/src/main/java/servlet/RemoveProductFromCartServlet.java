package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import dao.ProductDao;
import model.Product;

/**
 * Servlet implementation class RemoveProductFromCartServlet
 */
@WebServlet("/remove-product")
public class RemoveProductFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveProductFromCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("product-id"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		Product p = new Product();
		p.setId(id);
		p.setUserId(userId);
        
        try{
        	ProductDao product = new ProductDao(DbCon.getConnection());
            product.removeProductFromCart(p.getUserId(), p.getId());
            p.DisplaySuccessMessage();
            response.sendRedirect("cart.jsp");
        }catch(Exception e){
            e.printStackTrace();
            p.DisplayFailedMessage();
        }
	}

}
