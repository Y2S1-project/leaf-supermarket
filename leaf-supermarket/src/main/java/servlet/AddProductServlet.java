package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import dao.*;
import model.*;


@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddProductServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		double quantity = Double.parseDouble(request.getParameter("quantity"));
		double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
		double incrementUnit = Double.parseDouble(request.getParameter("incrementUnit"));
		double discount = Double.parseDouble(request.getParameter("discount"));
		String category = request.getParameter("category");
		
		try {
		
		Product productModel = new Product(name,quantity,unitPrice,incrementUnit,discount,category);
		ProductDao product = new ProductDao(DbCon.getConnection());
		if (product.saveProduct(productModel)) {
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
