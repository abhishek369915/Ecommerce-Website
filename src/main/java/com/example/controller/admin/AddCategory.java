package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.example.dao.CategoryDAO;
import com.example.model.Category;

/**
 * Servlet implementation class AddCategory
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
maxFileSize = 1024 * 1024 * 10, // 10 MB
maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategory() {
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
	    
	    String categoryName = request.getParameter("categoryName");
	    Part filePart = request.getPart("categoryPic");
	    
	    String uploadPath = "d:\\uploads\\";
	    
	    String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
	    filePart.write(uploadPath + fileName);

	    Category category = new Category();
	    category.setCategoryName(categoryName);

	    // Set the filename/path of the uploaded picture
	    category.setCategoryPic(fileName);  // or "uploads/" + fileName if you store relative paths

	    CategoryDAO dao = new CategoryDAO();
	    int n = dao.AddCategory(category);
	    
	    response.sendRedirect("/EcommerceWebsite/view/admin/Category/AddCategory.jsp?res=" + n);
	}


}
