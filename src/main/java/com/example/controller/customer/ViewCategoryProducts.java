package com.example.controller.customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import com.example.dao.CategoryDAO;
import com.example.dao.ProductsDAO;
import com.example.model.Category;
import com.example.model.Products;@WebServlet("/ViewCategoryProducts")
public class ViewCategoryProducts extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categoryName = request.getParameter("categoryName");

        CategoryDAO categoryDao = new CategoryDAO();
        Category category = categoryDao.GetCategoryByCategoryName(categoryName);

        ProductsDAO productDao = new ProductsDAO();
        ArrayList<Products> productsList = productDao.getProductsByCategoryName(categoryName);

        request.setAttribute("category", category);
        request.setAttribute("productsList", productsList);
        request.setAttribute("categoryName", categoryName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewCategoryProducts.jsp");
        dispatcher.forward(request, response);
    }
}
