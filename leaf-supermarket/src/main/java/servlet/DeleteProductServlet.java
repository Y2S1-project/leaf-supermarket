package servlet;
import dao.*;
import model.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import connection.DbCon;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Product p = new Product();
		p.setId(id);
        
        try{
        	ProductDao product = new ProductDao(DbCon.getConnection());
            product.deleteProduct(p.getId());
            p.DisplaySuccessMessage();
            response.sendRedirect("displayProduct.jsp");
        }catch(Exception e){
            e.printStackTrace();
            p.DisplayFailedMessage();
        }
	}
}
