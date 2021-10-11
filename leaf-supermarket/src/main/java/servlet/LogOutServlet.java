package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogOutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out=response.getWriter()){
			if(request.getSession().getAttribute("auth")!=null && request.getSession().getAttribute("auth1")==null) {
				request.getSession().removeAttribute("auth");
				response.sendRedirect("index.jsp");
			}else if(request.getSession().getAttribute("auth1")!=null && request.getSession().getAttribute("auth")!=null) {
				request.getSession().removeAttribute("auth1");
				request.getSession().removeAttribute("auth");
				response.sendRedirect("index.jsp");
			}else {
				response.sendRedirect("index.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
