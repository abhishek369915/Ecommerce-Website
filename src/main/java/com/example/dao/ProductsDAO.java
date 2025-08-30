package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.dbutil.DBConnection;
import com.example.model.Category;
import com.example.model.Products;

import jakarta.servlet.http.HttpSession;

public class ProductsDAO {
	//1.ADD PRODUCTS
	public int AddProduct(Products product) {
	    int n = 0;

	    try {
	        Connection conn = DBConnection.getConnection();
	        if (conn == null) {
	            System.out.println("Database issue!!");
	            return 0;
	        }

	        String addQuery = "INSERT INTO products(categoryName, productName, description, discount, cost, productImage1, productImage2, productImage3) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        PreparedStatement pst = conn.prepareStatement(addQuery);

	        pst.setString(1, product.getCategoryName());  // corrected order
	        pst.setString(2, product.getProductName());
	        pst.setString(3, product.getDescription());
	        pst.setInt(4, product.getDiscount());
	        pst.setInt(5, product.getCost());
	        pst.setString(6, product.getProductImage1());
	        pst.setString(7, product.getProductImage2());
	        pst.setString(8, product.getProductImage3());
	        	
	        System.out.println("addQuery: " + addQuery);
	        
	        n = pst.executeUpdate();  // use executeUpdate
	        
	        pst.close();
	        conn.close();
	        
	    } catch (Exception e) {
	        System.out.println("Error: " + e);
	    }

	    return n;
	}
	//VIEW PRODUCTS USING ARRAY LIST
	public ArrayList<Products> ViewProducts() {
		ArrayList<Products> productList = new ArrayList<Products>();
		
		try {
			
			Connection conn = DBConnection.getConnection();
			if(conn==null) {
				System.out.println("Database issue!!");
				return productList;				
			}
			String ViewQuery="select productCode,categoryName,productName,description,discount,cost,productImage1,productImage2,productImage3 from products";
			PreparedStatement pst = conn.prepareStatement(ViewQuery);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				Products product = new Products();
				product.setProductCode(rs.getInt("productCode"));
				product.setCategoryName(rs.getString("categoryName"));
				product.setProductName(rs.getString("productName"));
				product.setDescription(rs.getString("description"));
				product.setDiscount(rs.getInt("discount"));
				product.setCost(rs.getInt("cost"));
				product.setProductImage1(rs.getString("productImage1"));
				product.setProductImage2(rs.getString("productImage2"));
				product.setProductImage3(rs.getString("productImage3"));
				
				productList.add(product);
			}
			pst.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("Error: "+ e);
		}
		
		return productList;
		
	}
	
	public ArrayList<Products> getProductsByCategoryName(String categoryName) {
	    ArrayList<Products> productsList = new ArrayList<>();
	    
	    try {
	        Connection conn = DBConnection.getConnection();
	        if (conn == null) {
	            System.out.println("Database issue!!");
	            return productsList;
	        }

	        String query = "SELECT * FROM products WHERE categoryName=?";
	        PreparedStatement pst = conn.prepareStatement(query);
	        pst.setString(1, categoryName);
	        ResultSet rs = pst.executeQuery();

	        while (rs.next()) {
	            Products product = new Products();
	            product.setProductCode(rs.getInt("productCode"));
	            product.setCategoryName(rs.getString("categoryName"));
	            product.setProductName(rs.getString("productName"));
	            product.setDescription(rs.getString("description"));
	            product.setDiscount(rs.getInt("discount"));
	            product.setCost(rs.getInt("cost"));
	            product.setProductImage1(rs.getString("productImage1"));
	            product.setProductImage2(rs.getString("productImage2"));
	            product.setProductImage3(rs.getString("productImage3"));
	            productsList.add(product);
	        }
	        
	        rs.close();
	        pst.close();
	        conn.close();
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return productsList;
	}

	
	
	//3.DELETE PRODUCTS
	public boolean DeleteProductByProductCode(int productCode) {
		boolean flag = false;
		
		try {
			Connection conn =DBConnection.getConnection();
			if(conn==null) {
				System.out.println("DB Connection failed.");
				return false;
			}
			String deleteQuery = "delete from products where productCode=?";
			PreparedStatement pst = conn.prepareStatement(deleteQuery);
			pst.setInt(1,productCode);
			
			System.out.println("DeleteQuery: "+pst.toString());
			
			int n = pst.executeUpdate();
			
			if(n==0) {
				flag=false;
			}else {
				flag= true;
			}
			
			pst.close();
			conn.close();
			
		}catch(Exception e) {
			System.out.println("Error: "+ e);
		}
		
		return flag;
	}
	//GetProductByProductCode
	public Products GetProductByProductCode(int productCode) {
		Products product =null;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return product;
				}
			String UpdateQuery = "select productCode,categoryName,productName,description,discount,cost from products where productCode=?";
			PreparedStatement pst = conn.prepareStatement(UpdateQuery);
			
			pst.setInt(1, productCode);
			
	        ResultSet rs= pst.executeQuery();
	        
	        if(rs.next()) {
	        product = new Products();
	        	product.setProductCode(rs.getInt("productCode"));
	        	product.setCategoryName(rs.getString("categoryName"));
	        	product.setProductName(rs.getString("productName"));
	        	product.setDescription(rs.getString("description"));
	        	product.setDiscount(rs.getInt("discount"));
	        	product.setCost(rs.getInt("cost"));
	        
	        }
	        	System.out.println("get Query:" + pst.toString());
			pst.close();
			conn.close();
			
			
		}catch(Exception ee) {
			System.out.println("Error: " + ee);
		}
		
		return product;
	}
	//Update Product By Product Code
	public boolean UpdateProductByProductCode(int produtCode, Products product ) {
		boolean flag =false;
		try {
			// step1
			Connection conn = DBConnection.getConnection();
				if(conn == null){
					System.out.println("DBError: ");
					return flag;
				}
				
				String updateQuery = "update products set productCode=?,categoryName=?,productName=?,description=?,discount=?,cost=? where productCode=?";
				PreparedStatement pst = conn.prepareStatement(updateQuery);
				
				pst.setInt(1, product.getProductCode());
				pst.setString(2, product.getCategoryName());  // corrected order
		        pst.setString(3, product.getProductName());
		        pst.setString(4, product.getDescription());
		        pst.setInt(5, product.getDiscount());
		        pst.setInt(6, product.getCost());
		        pst.setInt(7, product.getProductCode());
		        
		        System.out.println("Insert Query: "+ pst.toString());
		        
		        int n = pst.executeUpdate();
		        
		        if(n==0) {
		        		flag=false;
		        }else {
		        	flag = true;
		        }
		        
		        pst.close();
		        conn.close();
				
		}catch(Exception e) {
			System.out.println("Error: "+e);
		}
		return flag;
	}
	public boolean UpdateProductPicByProductCode(int productCode, String productPic1, String productPic2, String productPic3) {
	    boolean flag = false;
	    Connection conn = null;
	    PreparedStatement pst = null;

	    try {
	        conn = DBConnection.getConnection();
	        if (conn == null) {
	            System.out.println("DB connection failed.");
	            return false;
	        }

	        String updateQuery = "UPDATE products SET productImage1 = ?, productImage2 = ?, productImage3 = ? WHERE productCode = ?";
	        pst = conn.prepareStatement(updateQuery);

	        pst.setString(1, productPic1);
	        pst.setString(2, productPic2);
	        pst.setString(3, productPic3);
	        pst.setInt(4, productCode);

	        int rowsAffected = pst.executeUpdate();
	        flag = (rowsAffected > 0); // true if at least one row updated

	    } catch (SQLException e) {
	        System.out.println("Error updating product pictures: " + e.getMessage());
	    } finally {
	        try {
	            if (pst != null) pst.close();
	            if (conn != null) conn.close();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }

	    return flag;
	}}
