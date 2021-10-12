package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cart;

/**
 * Servlet implementation class QuantityIncrementDecrementServlet
 */
@WebServlet("/quantity-inc-dec")
public class QuantityIncrementDecrementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String action = request.getParameter("action");
			int id = Integer.parseInt(request.getParameter("id"));

			@SuppressWarnings("unchecked")
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

			if (action != null && id >= 1) {
				if (action.equals("inc")) {
					for (Cart c : cart_list) {
						if (c.getId() == id) {
							double quantity = c.getQuantity();
							double incre = c.getIncrementUnit();
							quantity = quantity + incre;
							c.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}
					}
				}

				if (action.equals("dec")) {
					for (Cart c : cart_list) {
						if (c.getId() == id && c.getQuantity() > 1) {
							double quantity = c.getQuantity();
							double decre = c.getIncrementUnit();
							quantity = quantity - decre;
							c.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}
					}
					
				}
			} else {
				response.sendRedirect("cart.jsp");
			}
		}
	}

}
