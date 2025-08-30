package com.example.controller.customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import com.example.dao.BankAccountDAO;
import com.example.dao.BankTransactionDAO;
import com.example.dao.CartDAO;
import com.example.dao.CustomerOrdersDAO;
import com.example.dao.InvoicesDAO;
import com.example.dao.ProductsDAO;
import com.example.dao.ShippingDAO;
import com.example.model.BankTransaction;
import com.example.model.Cart;
import com.example.model.Customer;
import com.example.model.CustomerOrders;
import com.example.model.Invoices;
import com.example.model.Products;
import com.example.model.Shipping;

/**
 * Servlet implementation class addPayment
 */
@WebServlet("/addPayment")
public class addPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public addPayment() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		Calendar cal = Calendar.getInstance();
		
		// get customer object from session
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");

		// 1. reading parameters
		String deliveryAddress = request.getParameter("deliveryAddress");
		String mobileNumber = request.getParameter("mobileNumber");
		String zipCode = request.getParameter("zipCode");
		String cardType = request.getParameter("cardType");
		String cardNumber = request.getParameter("cardNumber");
		String customerName = request.getParameter("customerName");
		String expiryDate = request.getParameter("expiryDate");
		String cvvNumber = request.getParameter("cvvNumber");

		// invoice number generation
		Random rnd = new Random();
		String invoiceNumber = "" + customer.getCustomerId() + rnd.nextInt(100000) + rnd.nextInt(1000);
		long invoiceNumber1 = Long.parseLong(invoiceNumber);

		// order number generation
		String orderNumber = "" + cal.get(cal.YEAR)+cal.get(cal.MONTH) + cal.get(cal.DAY_OF_MONTH)+rnd.nextInt(1000);
		long orderNumber1 = Long.parseLong(orderNumber);

		
		
		// 2. Add shipping address
		Shipping ship = new Shipping();
		ship.setDeliveryAddress(deliveryAddress);
		ship.setMobileNumber(mobileNumber);
		ship.setZipCode(zipCode);
		ship.setCustomerId(customer.getCustomerId());
		ship.setInvoiceNumber(12121212);

		ShippingDAO shipDAO = new ShippingDAO();
		int n = shipDAO.addShipping(ship);
		System.out.println("n=" + n);

		// add customer order details
		// get qty
		CustomerOrdersDAO corderdao = new CustomerOrdersDAO();

		String qty = (String) session.getAttribute("qty");
		String qty1[] = qty.split(",");

		// get products list from cart
		CartDAO catDAO = new CartDAO();
		List<Cart> clist = catDAO.getAllItems();

		ProductsDAO pdao = new ProductsDAO();

		
		String dateTime = "" + cal.get(cal.YEAR) + "-" + (cal.get(cal.MONTH) + 1) + "-" + cal.get(cal.DAY_OF_MONTH)
				+ " " + cal.get(cal.HOUR) + ":" + cal.get(cal.MINUTE);
		int i = 0;

		int invoiceAmount = 0;
		for (Cart c : clist) {
			Products p = pdao.GetProductByProductCode(c.getProductcode());
			CustomerOrdersDAO cdao = new CustomerOrdersDAO();

			CustomerOrders corder = new CustomerOrders();
			corder.setCustomerId(c.getCustomerId());

			corder.setInvoiceNumber(invoiceNumber1);
			corder.setOrderNumber(orderNumber1);
			corder.setProductCode(c.getProductcode());
			corder.setOrderDateTime(dateTime);
			corder.setCost(p.getCost());
			int discountAmount = (int) (p.getDiscount() / 100.0 * p.getCost());
			corder.setDiscountAmount(discountAmount);
			corder.setQuantity(Integer.parseInt(qty1[i]));
			int gstAmount = (int) (0.18 * (p.getCost() - discountAmount));
			corder.setGstAmount(gstAmount);

			int billAmount = p.getCost() - discountAmount - gstAmount;
			invoiceAmount += billAmount;
			corder.setBillAmount(billAmount);
			corder.setOrderStatus("Pending");

			int m = corderdao.addOrder(corder);
			System.out.println("m=" + m);

			i++;
		}

		// bank transaction
		// check cardType,cardNumber, cvv, expiryDate,
		// if exist get balance otherwise null
		BankAccountDAO bdao = new BankAccountDAO();
		Integer balance = bdao.getBalanceByAccount(cardType, cardNumber, cvvNumber, expiryDate);
		if (balance == null) {
			System.out.println("Invalid card details..");
			response.sendRedirect("/EcommerceWebsite/view/customer/showCart.jsp?res=0");
			return;
		}
		System.out.println("account details found");

		Integer accountNumber = bdao.getAccountNumberByCardNumber(cardNumber);
		if (accountNumber == null) {
			System.out.println("Payment Failed");
			response.sendRedirect("/EcommerceWebsite/view/customer/showCart.jsp?res=0");
			return;
		}
		
		// accountNumber found
		bdao.updateBalanceByAccountNumber(accountNumber, invoiceAmount, "W"); // deduct from customer
		bdao.updateBalanceByAccountNumber(1001, invoiceAmount, "D"); // add to ecommerce
		
		// insert transaction details in bank
		BankTransactionDAO btdao = new BankTransactionDAO();
		BankTransaction trans = new BankTransaction();
		trans.setAmount(invoiceAmount);
		trans.setFromAccount(accountNumber);
		trans.setToAccount(1001);
		
		trans.setTransactionDate(dateTime);
		btdao.addTransaction(trans);
		
		
		// add invoice details
		InvoicesDAO indao = new InvoicesDAO();
		Invoices invoice = new Invoices();
		invoice.setInvoiceNumber(invoiceNumber1);
		invoice.setInvoiceAmount(invoiceAmount);
		invoice.setOrderId(orderNumber1);
		invoice.setInvoiceDate(dateTime);
		invoice.setInvoiceType("card");
		invoice.setCardNumber(cardNumber);
		invoice.setCardType("debit");
		invoice.setPaymentStatus("Success");
		
		indao.addInvoice(invoice);
		
		
		// make cart empty
		for(Cart c : clist) {
			catDAO.deleteCartBycartId(c.getCartId());
		}
		
		response.sendRedirect("/EcommerceWebsite/view/index.jsp?res=" + 1);
		
		

	}

}
