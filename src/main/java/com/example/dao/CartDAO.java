package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

import com.example.dbutil.DBConnection;
import com.example.model.Cart;


public class CartDAO {
	
	public int addCart(Cart cart) {
		int n = 0;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return n;
			}
			String insertQuery = "insert into cart (productcode,customerId,selectedDate) values(?,?,?)";
			PreparedStatement pst = conn.prepareStatement(insertQuery);

			pst.setInt(1,cart.getProductcode());
			pst.setInt(2, cart.getCustomerId());
			pst.setString(3, cart.getSelectedDate());

			System.out.println("Insert Query:" + pst.toString());
			n = pst.executeUpdate();

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}
		return n;
	}
	
	
	public ArrayList<Cart> getAllItems() {

		ArrayList<Cart> cList = new ArrayList<Cart>();

		try {
			// step1
			Connection conn = DBConnection.getConnection();
			if (conn == null) {
				System.out.println("DBError: ");
				return cList;
			}

			// Step3
			String selectQuery = "select * from cart";
			PreparedStatement pst = conn.prepareStatement(selectQuery);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				Cart cart = new Cart();
				cart.setCartId(rs.getInt("cartId"));
				cart.setCustomerId(rs.getInt("customerId"));
				cart.setProductcode(rs.getInt("productCode"));
				cart.setSelectedDate(rs.getString("selectedDate"));

				cList.add(cart);
			}

			pst.close();
			conn.close();

		} catch (Exception ee) {
			System.out.println("Error: " + ee);
		}

		return cList;

	}


	// Delete Cart Item

		public boolean deleteCartBycartId(int cartId) {
			boolean flag = false;
			try {
				// step1
				Connection conn = DBConnection.getConnection();
				if (conn == null) {
					System.out.println("DBError: ");
					return false;
				}

				// Step3
				String deleteQuery = "delete from cart where cartId=?";
				PreparedStatement pst = conn.prepareStatement(deleteQuery);

				pst.setInt(1, cartId);

				System.out.println("Delete Query:" + pst.toString());
				int n = pst.executeUpdate();
				if (n == 0) {
					flag = false;
				} else {
					flag = true;
				}

				pst.close();
				conn.close();

			} catch (Exception ee) {
				System.out.println("Error: " + ee);
			}

			return flag;
		}

	

}
