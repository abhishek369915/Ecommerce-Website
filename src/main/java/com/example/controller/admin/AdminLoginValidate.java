package com.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.example.dao.AdminDAO;
import com.example.model.Admin;
 	
/**
 * Servlet implementation class AdminLoginValidate
 */
@WebServlet("/AdminLoginValidate")
public class AdminLoginValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginValidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		//Retrive the parameters and store them in the keywords
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
		//Create an object:admin from Admin.java where it will store the parameters in to the objecct
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		admin.setRole(role);
		
		//create an object:dao from AdminDAO where it will be used to connect the admin object and dao		
		AdminDAO dao = new AdminDAO();
		//create a new object of Admin.java which connecct dao,validate and admin
		Admin admin_new = dao.AdminLoginValidate(admin);
		//If admin_new object contains null return to same page
		if(admin_new==null) {
			response.sendRedirect("/EcommerceWebsite/view/admin/AdminLogin.jsp?res=0");
			System.out.println("Null...");
		}else {// else return to the dashboard
			//inorder to use the admin object in other pages create it as a session object
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin_new);
			response.sendRedirect("/EcommerceWebsite/view/admin/AdminDashboard.jsp");
		}
	}
}
