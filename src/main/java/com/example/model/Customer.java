package com.example.model;

import java.sql.Timestamp;

public class Customer {
	private int customerId;
	private String firstName;
	private String lastName;
	private String emailId;
	private String mobilenumber;
	private String password;
	private String profilepic;
	private String registerdate;
	
	
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getEmailId() {
		return emailId;
	}


	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}


	public String getMobilenumber() {
		return mobilenumber;
	}


	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getProfilepic() {
		return profilepic;
	}


	public void setProfilepic(String profilepic) {
		this.profilepic = profilepic;
	}


	public String getRegisterdate() {
		return registerdate;
	}


	public void setRegisterdate(String dateTime) {
		this.registerdate = dateTime;
	}


	public int getCustomerId() {
		return customerId;
	}


	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", emailId=" + emailId + ", mobilenumber=" + mobilenumber + ", password=" + password + ", profilepic="
				+ profilepic + ", registerdate=" + registerdate + "]";
	}
	
	
	
	
	
	

}
