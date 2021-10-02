package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;
import dao.*;
import model.*;


@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EditProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html;charser=UTF-8");
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("product_name");
			double quantity = Double.parseDouble(request.getParameter("quantity"));
			double unitPrice = Double.parseDouble(request.getParameter("unit_price"));
			double incrementUnit = Double.parseDouble(request.getParameter("increment_unit"));
			double discount = Double.parseDouble(request.getParameter("discount_rate"));
			String category = request.getParameter("category");
			
			Product p = new Product();
			p.setName(name);
			p.setQuantity(quantity);
			p.setUnitPrice(unitPrice);
			p.setIncrementUnit(incrementUnit);
			p.setDiscount(discount);
			p.setCategory(category);
			p.setId(id);
			
			ProductDao product = new ProductDao(DbCon.getConnection());
			boolean success = product.editProductInfo(p);
			if(success) {
				p.DisplaySuccessMessage();
				response.sendRedirect("displayProduct.jsp");
			}else {
				p.DisplayFailedMessage();
			}
			
		}catch(Exception e) {
			
		}
	}

}
