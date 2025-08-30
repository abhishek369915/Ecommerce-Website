package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.example.dao.CustomerDAO;
import com.example.model.Customer;

/**
 * Servlet implementation class CustomerLoginValidate
 */
@WebServlet("/CustomerLoginValidate")
public class CustomerLoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLoginValidate() {
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
		
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		
		Customer customer = new Customer();
		customer.setEmailId(emailId);
		customer.setPassword(password);
		
		CustomerDAO cdao = new CustomerDAO();
		Customer c_new = cdao.CustomerLoginValidate(customer);
		
		if(c_new == null) {
			response.sendRedirect("/EcommerceWebsite/view/Customer/CustomerLogin.jsp?res=0");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("customer", c_new);
			response.sendRedirect("/EcommerceWebsite/view/index.jsp");	
		}
		
		
		
	}

}
