package com.example.model;

public class CustomerOrders {
	private long orderId;
	private int customerId;
	private long invoiceNumber;
	private int productCode;
	private String orderDateTime;
	private int cost;
	private int discountAmount;
	private int quantity;
	private int gstAmount;
	private int billAmount;
	private String orderStatus;
	private long orderNumber;
	
	
	
	public long getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(long orderNumber) {
		this.orderNumber = orderNumber;
	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public long getInvoiceNumber() {
		return invoiceNumber;
	}
	public void setInvoiceNumber(long invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public String getOrderDateTime() {
		return orderDateTime;
	}
	public void setOrderDateTime(String orderDateTime) {
		this.orderDateTime = orderDateTime;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getDiscountAmount() {
		return discountAmount;
	}
	public void setDiscountAmount(int discountAmount) {
		this.discountAmount = discountAmount;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getGstAmount() {
		return gstAmount;
	}
	public void setGstAmount(int gstAmount) {
		this.gstAmount = gstAmount;
	}
	public int getBillAmount() {
		return billAmount;
	}
	public void setBillAmount(int billAmount) {
		this.billAmount = billAmount;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	@Override
	public String toString() {
		return "CustomerOrders [orderId=" + orderId + ", customerId=" + customerId + ", invoiceNumber=" + invoiceNumber
				+ ", productCode=" + productCode + ", orderDateTime=" + orderDateTime + ", cost=" + cost
				+ ", discountAmount=" + discountAmount + ", quantity=" + quantity + ", gstAmount=" + gstAmount
				+ ", billAmount=" + billAmount + ", orderStatus=" + orderStatus + "]";
	}
}
