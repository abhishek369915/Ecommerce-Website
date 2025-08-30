package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Calendar;

import com.example.dao.CartDAO;
import com.example.model.Cart;
import com.example.model.Customer;

/**
 * Servlet implementation class AddtoCArt
 */
@WebServlet("/AddtoCart")
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddtoCart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//int customerId = Integer.parseInt(request.getParameter("customerId"));
		
		int productCode = Integer.parseInt(request.getParameter("productCode"));

		HttpSession session = request.getSession();
		Customer customer = (Customer)session.getAttribute("customer");
		if(customer == null) {  //customer not login
			response.sendRedirect("/EcommerceWebsite/view/customer/CustomerLogin.jsp");
		}
		
		Cart cart = new Cart();
		cart.setProductcode(productCode);
		cart.setCustomerId(customer.getCustomerId());
		Calendar c = Calendar.getInstance();
		String date = String.format("%d-%d-%d", c.get(c.YEAR), (c.get(c.MONTH)+1), c.get(c.DAY_OF_MONTH));
		cart.setSelectedDate(date);
		
		CartDAO cartDAO = new CartDAO();
		int n = cartDAO.addCart(cart);
		if(n==1) { //product added to cart
			response.sendRedirect("/EcommerceWebsite/view/index.jsp?addtocart=1");
		}else {  //product not added to cart
			response.sendRedirect("/EcommerceWebsite/view/index.jsp?addtocart=0");
		}
	}

	

}
