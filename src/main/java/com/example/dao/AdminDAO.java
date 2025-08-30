package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.example.dbutil.DBConnection;
import com.example.model.Admin;

public class AdminDAO {
	//Take a new class so you can call it any time for validating
	public Admin AdminLoginValidate(Admin admin) {
		//create an admin object through a class where it is taken from Admin.java
		
		
		try {
			Connection conn= DBConnection.getConnection(); //bring the connetion process
			if(conn==null) {
				System.out.println("ERROR!!");
				return null;
			}
			
			
		//Extract the Query 
		String CheckQuery = "select * from admin where username=? AND password=? AND role=?";
		//prerare the statement by connecting it to the query
		PreparedStatement pst = conn.prepareStatement(CheckQuery);
		
		//supply the parameters to the query
		//here we have to set the Parameters
		pst.setString(1, admin.getUsername());
		pst.setString(2,admin.getPassword());
		pst.setString(3,admin.getRole());
		//This process is for executing the query using rs by conneccting to the result set
		ResultSet rs = pst.executeQuery();
		
		//If the above code runs successfully then return the admin objecct
		if(rs.next()) {
			return admin;
		}
		
		pst.close();
		rs.close();
		
		}catch(Exception e) {
			System.out.println("Error: "+e);
		}

		return null;
	}
}
