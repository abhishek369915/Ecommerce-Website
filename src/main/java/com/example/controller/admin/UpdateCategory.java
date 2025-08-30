package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.example.dao.CategoryDAO;
import com.example.model.Category;

/**
 * Servlet implementation class UpdateCategory
 */
@WebServlet("/UpdateCategory")
public class UpdateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCategory() {
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
		
		//Retrive all the parameters
		
		
		
		int categoryId= Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("categoryName");
		
		//create an object and store all the paramters
		Category category = new Category();
		category.setCategoryId(categoryId);
		category.setCategoryName(categoryName);
		//As we've created the object where the parameters are present, We have to connect that 
		//category object to dao
		
		CategoryDAO dao = new CategoryDAO();
		boolean flag = dao.UpdateCategoryByCategoryId(categoryId, category);
		
		if(flag=true) {
			response.sendRedirect("/EcommerceWebsite/view/admin/Category/ViewCategory.jsp?res=2");
		}else {
			response.sendRedirect("/EcommerceWebsite/view/admin/Category/ViewCategory.jsp?res=3");
		}
		
	}

}
