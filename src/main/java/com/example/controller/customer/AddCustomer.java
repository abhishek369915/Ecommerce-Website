package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.Calendar;

import com.example.dao.CustomerDAO;
import com.example.model.Customer;

/**
 * Servlet implementation class RegisterCustomer
 */
@WebServlet("/RegisterCustomer")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
maxFileSize = 1024 * 1024 * 10, // 10 MB
maxRequestSize = 1024 * 1024 * 100 // 100 MB
)


public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String mobileNumber = request.getParameter("mobileNumber");
		String emailId = request.getParameter("emailId");
		String password = request.getParameter("password");
		
		Part filePart1 = request.getPart("profilePic");
		String uploadPath = "d:\\uploads\\";

        String fileName1 = System.currentTimeMillis() + "_" + filePart1.getSubmittedFileName();
        filePart1.write(uploadPath + fileName1);
        
        
        Customer customer = new Customer();
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setMobilenumber(mobileNumber);
        customer.setEmailId(emailId);
        customer.setPassword(password);
        customer.setProfilepic(fileName1);
        
        Calendar cal = Calendar.getInstance();
	    String dateTime = ""+ cal.get(cal.YEAR) +"-" + (cal.get(cal.MONTH)+1) + "-" + cal.get(cal.DAY_OF_MONTH)+" " + cal.get(cal.HOUR)+":"+cal.get(cal.MINUTE);
        
        customer.setRegisterdate(dateTime);
        
        CustomerDAO cdao = new CustomerDAO();
        int n = cdao.addCustomer(customer);
        
        
        
        if (n > 0) {
            response.sendRedirect("/EcommerceWebsite/view/index.jsp?res="+1);
        } else {
            response.sendRedirect("/EcommerceWebsite/view/register.jsp?res="+0);
        }

		
	}

}
