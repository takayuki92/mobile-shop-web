package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListProductDAO;
import model.Product;

/**
 * Servlet implementation class SearchController2
 */
@WebServlet("/SearchController2")
public class SearchController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController2() {
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
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			String txtSearch = request.getParameter("txtSearch");
			int index = Integer.parseInt(request.getParameter("index"));
			ListProductDAO dao = new ListProductDAO();
			int count = dao.countSearch(txtSearch);
			int pageSize = 4;
			int endPage = 0;
			endPage = count/ pageSize;
			if(count % pageSize != 0) {
				endPage++;
			}
			
			List<Product> listSearch = dao.search(txtSearch, index, pageSize);
			request.setAttribute("listS", listSearch);
			request.setAttribute("endP", endPage);
			request.setAttribute("txtSearch", txtSearch);
			request.getRequestDispatcher("search.jsp").forward(request, response);
		} catch(Exception ex) {
			response.getWriter().println(ex);
		}		
	}

}
