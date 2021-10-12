package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import dao.ProductDao;
import model.Product;

/**
 * Servlet implementation class AddProductsToCart
 */
@WebServlet("/add-product-to-cart")
public class AddProductsToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		int productId = Integer.parseInt(request.getParameter("productID"));
		int userId = Integer.parseInt(request.getParameter("userID"));
		double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
		
		try {
			Product productModel = new Product(productId, unitPrice, userId);
			ProductDao product = new ProductDao(DbCon.getConnection());
			if (product.insertToCart(productModel)) {
				productModel.DisplaySuccessMessage();
				response.sendRedirect("productSuccess.jsp");
			}
			else {
				productModel.DisplayFailedMessage();
				response.sendRedirect("addProduct.jsp");
			}
		}catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
