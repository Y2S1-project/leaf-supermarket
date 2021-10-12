package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import dao.ProductDao;
import model.Product;

/**
 * Servlet implementation class IncrementServlet
 */
@WebServlet("/IncrementServlet")
public class IncrementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncrementServlet() {
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
		response.setContentType("text/html;charser=UTF-8");
		
		try {	
			int id = Integer.parseInt(request.getParameter("product-id"));
			double increment = Double.parseDouble(request.getParameter("increment"));
			double unit_price = Double.parseDouble(request.getParameter("unit-price"));
			PrintWriter out = response.getWriter();
			System.out.print("increment: "+increment);
			System.out.print("id: "+id);
			Product p = new Product();
			p.setId(id);
			p.setInc(increment);	
			p.setUnitPrice(unit_price);
			
			ProductDao product = new ProductDao(DbCon.getConnection());
			boolean success = product.editQuantity(p);
			if(success) {
				p.DisplaySuccessMessage();
				response.sendRedirect("cart.jsp");
			}else {
				p.DisplayFailedMessage();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
