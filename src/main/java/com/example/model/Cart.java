package com.example.model;

import java.sql.Timestamp;

public class Cart {
	
	private int cartId;
	private int customerId;
	private String selectedDate;
	private int productcode;
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	
	public String getSelectedDate() {
		return selectedDate;
	}
	public void setSelectedDate(String selectedDate) {
		this.selectedDate = selectedDate;
	}
	public int getProductcode() {
		return productcode;
	}
	public void setProductcode(int productcode) {
		this.productcode = productcode;
	}
	
	

}
