package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.example.dao.EmployeeDAO;
import com.example.dao.ProductsDAO;

import com.example.model.Products;

/**
 * Servlet implementation class EditProducts
 */
@WebServlet("/EditProducts")
public class EditProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		ProductsDAO dao = new ProductsDAO();
		
		Products product = dao.GetProductByProductCode(productCode);
		if(product == null) {  // not found
			
			response.sendRedirect("/EcommerceWebsite/view/admin/Product/ViewProducts.jsp?res=2");
		}else {
			//found
			HttpSession session = request.getSession();
			session.setAttribute("product", product);
			
			response.sendRedirect("/EcommerceWebsite/view/admin/Product/EditProduct.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
