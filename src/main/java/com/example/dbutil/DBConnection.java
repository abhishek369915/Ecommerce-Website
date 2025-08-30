package com.example.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
		public static Connection getConnection() {
			Connection conn = null;
			try {
				// step1
					//Bring in the driver class
				   Class.forName("com.mysql.cj.jdbc.Driver");

				// step2
				   //bring in the connection where it will contain the access to connect to database
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fullstack_ecommerce?autoReconnect=true&useSSL=false",
									"root", "");

			}catch(Exception e) {
				conn = null;
			}
			
			return conn;//return conn
		}

	}