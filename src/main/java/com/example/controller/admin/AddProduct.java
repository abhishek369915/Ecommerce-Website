
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
import com.example.model.Products;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
maxFileSize = 1024 * 1024 * 10, // 10 MB
maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	//}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryname = request.getParameter("categoryName");
        System.out.println("categoryName:" + categoryname);
        String productname = request.getParameter("productName");
        String description = request.getParameter("description");
        int discount = Integer.parseInt(request.getParameter("discount"));
        int cost = Integer.parseInt(request.getParameter("cost"));

        // Handle file uploads
        Part filePart1 = request.getPart("productImage1");
        Part filePart2 = request.getPart("productImage2");
        Part filePart3 = request.getPart("productImage3");

        String uploadPath = "d:\\uploads\\";

        String fileName1 = System.currentTimeMillis() + "_" + filePart1.getSubmittedFileName();
        filePart1.write(uploadPath + fileName1);

        String fileName2 = System.currentTimeMillis() + "_" + filePart2.getSubmittedFileName();
        filePart2.write(uploadPath + fileName2);

        String fileName3 = System.currentTimeMillis() + "_" + filePart3.getSubmittedFileName();
        filePart3.write(uploadPath + fileName3);

        // Populate Product object
     
        System.out.println("ok");
        Products prod = new Products();
        prod.setCategoryName(categoryname);
        prod.setProductName(productname);
        prod.setDescription(description);
        prod.setDiscount(discount);
        prod.setCost(cost);
        prod.setProductImage1(fileName1);
        prod.setProductImage2(fileName2);
        prod.setProductImage3(fileName3);

        // Save to DB
        ProductsDAO dao = new ProductsDAO();
        int n = dao.AddProduct(prod);

        response.sendRedirect("/EcommerceWebsite/view/admin/Product/AddProduct.jsp?res=" + n);
    }


}
