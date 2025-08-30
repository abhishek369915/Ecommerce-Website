package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.example.dao.ProductsDAO;
import com.example.model.Products;

/**
 * Servlet implementation class ViewProducts
 */
@WebServlet("/UpdateProducts")
public class UpdateProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProducts() {
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		int productCode = Integer.parseInt(request.getParameter("productCode"));
		String categoryName = request.getParameter("categoryName");
		String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        int discount = Integer.parseInt(request.getParameter("discount"));
        int cost = Integer.parseInt(request.getParameter("cost"));
        
        
        Products product = new Products();
        
        product.setProductCode(productCode);
        product.setCategoryName(categoryName);
        product.setProductName(productName);
        product.setDescription(description);
        product.setDiscount(discount);
        product.setCost(cost);
        
		
		
		ProductsDAO dao = new ProductsDAO();
		boolean flag = dao.UpdateProductByProductCode(productCode, product);
		
		
		if(flag == true) {
			response.sendRedirect("http://localhost:8085/EcommerceWebsite/view/admin/Product/ViewProducts.jsp?res=2");
		}else {
			response.sendRedirect("http://localhost:8085/EcommerceWebsite/view/admin/Product/ViewProducts.jsp?res=3");
		}
		
		
		
	}

}
