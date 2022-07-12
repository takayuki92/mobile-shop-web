package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListProductDAO;
import model.Product;

/**
 * Servlet implementation class SearchByAjax
 */
@WebServlet("/SearchByAjax")
public class SearchByAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchByAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			
			String txtSearch = request.getParameter("txtSearch");
			ListProductDAO dao = new ListProductDAO();
			List<Product> list = dao.searchAjax(txtSearch);
			PrintWriter out = response.getWriter();	
			String content = "";
			Locale localeVN = new Locale("vi", "VN");
			NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
			    
				for(Product o: list) {
					content += "<div class=\"col-sm-6 justify-content-center text-center\">\n"
							+ "						<div class=\"card\">\n"
							+ "							<div class=\"card-body\">\n"
							+ "								<a href=\"InformationProductController?id="+o.getId()+"\"><img alt=\"product "+o.getId()+"\" src=\"./assets/"+o.getSrc()+"\" class=\"img-fluid\" style=\"width:350px\"></a>							\n"
							+ "								<h4 class=\"card-title\">"+o.getName()+"</h4>\n"
							+ "								<p class=\"card-subtitle lead\"><span class=\"badge bg-danger bg-opacity-75 rounded-circle\">-25%</span>\n"
							+ "									"+currencyVN.format(o.getPrice())+"\n"
							+ "								</p>								\n"
							+ "							</div> \n"
							+ "						</div>\n"
							+ "					</div>	\n";
				}
				out.println(content);
			
		} catch(Exception ex) {
			response.getWriter().println(ex);
		}		
	}

}
