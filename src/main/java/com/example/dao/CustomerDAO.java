package com.example.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

import com.example.dbutil.DBConnection;
import com.example.model.Customer;

public class CustomerDAO {	
	public Customer CustomerLoginValidate(Customer customer){
		boolean flag= false;
		
		try {
			
			Connection conn = DBConnection.getConnection();
			if(conn == null) {
				System.out.println("Error in DBC");
			}
			String validateQuery = "select * from customers where emailId=? AND password=?";
			PreparedStatement pst = conn.prepareStatement(validateQuery);
			
			pst.setString(1, customer.getEmailId());
			pst.setString(2, customer.getPassword());
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				return customer;
			}
			
		}catch(Exception e) {
			System.out.println("Error: "+e);
		}
		return null;
	}
	public int addCustomer(Customer customer) {
	    int n = 0;
	    try {
	        Connection conn = DBConnection.getConnection();
	        if (conn == null) {
	            System.out.println("Error in database");
	            return n;
	        }

	        String addQuery = "INSERT INTO customers(firstName, lastName, mobileNumber, emailId, password, profilePic) VALUES (?, ?, ?, ?, ?, ?)";
	        PreparedStatement pst = conn.prepareStatement(addQuery);

	        pst.setString(1, customer.getFirstName());
	        pst.setString(2, customer.getLastName());
	        pst.setString(3, customer.getMobilenumber());
	        pst.setString(4, customer.getEmailId());
	        pst.setString(5, customer.getPassword());
	        pst.setString(6, customer.getProfilepic());
	        
	        n = pst.executeUpdate(); // returns number of rows affected
	        System.out.println("Customer added, rows affected: " + n);

	    } catch (Exception e) {
	        System.out.println("Error: " + e);
	    }
	    return n;
	}}

