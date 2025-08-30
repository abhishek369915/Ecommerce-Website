package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.example.dao.CategoryDAO;
import com.example.model.Category;

/**
 * Servlet implementation class EditCategory
 */
@WebServlet("/EditCategory")
public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		CategoryDAO dao = new CategoryDAO();
		//create a method of Category and set that method to the parameter
		
		//connect dao to the edit ccategory
		
		Category category = dao.GetCategoryByCategoryId(categoryId);
		if(category==null) {
		
		response.sendRedirect("/EcommerceWebsite/view/admin/Category/ViewCategory.jsp?res=2");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("category",category);
			response.sendRedirect("/EcommerceWebsite/view/admin/Category/EditCategory.jsp");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
	}

}
