package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.example.dao.ProductsDAO;

@WebServlet("/UpdateProductPic")
@MultipartConfig // Needed for file upload
public class UpdateProductPic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateProductPic() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String codeParam = request.getParameter("productCode");
		int productCode = 0;
		try {
			productCode = Integer.parseInt(codeParam);
		} catch (NumberFormatException e) {
			response.sendRedirect("/EcommerceWebsite/view/admin/Product/ViewProducts.jsp?res=invalid_code");
			return;
		}

		// Upload location
		String uploadDir = "D:\\uploads\\";

		// Save and name the uploaded files
		String fileName1 = saveFile(request.getPart("productImage1"), uploadDir);
		String fileName2 = saveFile(request.getPart("productImage2"), uploadDir);
		String fileName3 = saveFile(request.getPart("productImage3"), uploadDir);

		// Update DB
		ProductsDAO dao = new ProductsDAO();
		dao.UpdateProductPicByProductCode(productCode, fileName1, fileName2, fileName3);

		response.sendRedirect("/EcommerceWebsite/view/admin/Product/ViewProducts.jsp?res=4");
	}

	private String saveFile(Part filePart, String uploadDir) throws IOException {
		if (filePart != null && filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
			String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
			filePart.write(uploadDir + fileName);
			return fileName;
		}
		return null;
	}
}
