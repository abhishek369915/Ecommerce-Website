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
import com.example.dao.EmployeeDAO;

@WebServlet("/UpdateCategoryPic")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
    maxFileSize = 1024 * 1024 * 10,      // 10 MB
    maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class UpdateCategoryPic extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateCategoryPic() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        Part filePart = request.getPart("categoryPic");
        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();

		for (Part part : request.getParts()) {
			part.write("D:\\uploads\\" + fileName);
		}
		
		//update picname in db
		CategoryDAO dao = new CategoryDAO();
		dao.UpdateCategoryPicByCategoryId(categoryId, fileName);
		
        // Redirect
        response.sendRedirect("/EcommerceWebsite/view/admin/Category/ViewCategory.jsp?res=4");
    }
}
