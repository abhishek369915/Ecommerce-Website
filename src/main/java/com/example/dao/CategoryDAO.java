package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.example.dbutil.DBConnection;
import com.example.model.Category;
import com.example.model.Products;

public class CategoryDAO {
	//Add category
	public int AddCategory(Category category) {
		int n=0;
		
		try {
			Connection conn=DBConnection.getConnection();
			if(conn == null){
				System.out.println("DBError: ");
				return n;
			}
			String AddQuery = "insert into category(categoryName,categoryPic) values(?,?)";
			PreparedStatement pst=conn.prepareStatement(AddQuery);
			
			pst.setString(1, category.getCategoryName());
			pst.setString(2, category.getCategoryPic());
			
			System.out.println("Insert Query: "+pst.toString());
			
			n = pst.executeUpdate();		
			
			pst.close();
			conn.close();
			
		}catch(Exception e) {
			System.out.println("ERROR:" + e);
		}
		
		return n;
		
	}
	
	/**
	 * @param category
	 * @return
	 */
	//View Category
	public ArrayList<Category> ShowCategories() {
		ArrayList<Category> categoryList = new ArrayList<Category>();
		int n=0;
		
		try {
		Connection conn = DBConnection.getConnection();
		if(conn==null) {
			System.out.println("Error..in DBC..");
			return categoryList;
		}
		
		String readQuery = "select categoryId,categoryName,categoryPic from category";
		PreparedStatement pst=conn.prepareStatement(readQuery);
		
		Category category =new Category();
		System.out.println("Select Query: "+pst.toString());
		
		ResultSet rs =pst.executeQuery();
		
		while(rs.next()) {
			category = new Category();
			category.setCategoryId(rs.getInt("categoryId"));
			category.setCategoryName(rs.getString("categoryName"));
			category.setCategoryPic(rs.getString("categoryPic"));
			categoryList.add(category);
			
		}
		pst.close();
		conn.close();
		
		}catch(Exception e) {
			System.out.println("error "+e);
		}
		return categoryList;
	}
	//Edit Category
	public Category GetCategoryByCategoryId(int categoryId) {
		Category category= null;
		
		try {
			Connection conn=DBConnection.getConnection();
			if(conn == null){
				System.out.println("Database connection error");
				return category;
			}
			String UpdateQuery = "select categoryId,categoryName from category WHERE categoryId=?";
			PreparedStatement pst = conn.prepareStatement(UpdateQuery);
			
			pst.setInt(1, categoryId);
			
			ResultSet rs =pst.executeQuery();
			
			category = new Category();
			if(rs.next()) {
				category.setCategoryId(rs.getInt("catgeoryId"));
				category.setCategoryName(rs.getString("catgeoryName"));
			}			
			System.out.println("Query:"+pst.toString());
			pst.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("Error:"+ e);
		}
		
		return category;
	}
	
	public Category GetCategoryByCategoryName(String categoryName) {
		Category category= null;
		
		try {
			Connection conn=DBConnection.getConnection();
			if(conn == null){
				System.out.println("Database connection error");
				return category;
			}
			String UpdateQuery = "select categoryId from category WHERE categoryName=?";
			PreparedStatement pst = conn.prepareStatement(UpdateQuery);
			
			pst.setString(1, categoryName);
			
			ResultSet rs =pst.executeQuery();
			
			category = new Category();
			if(rs.next()) {
			    category.setCategoryId(rs.getInt("categoryId"));
			    category.setCategoryName(categoryName); // Already known from input
			}
		
			System.out.println("Query:"+pst.toString());
			pst.close();
			conn.close();
		}catch(Exception e) {
			System.out.println("Error:"+ e);
		}
		
		return category;
	}
	
	public boolean UpdateCategoryByCategoryId(int categoryId, Category category) {
		boolean flag =false;
		try {
			Connection conn=DBConnection.getConnection();
			if(conn == null){
				System.out.println("Database connection error");
				return flag;
			}
			String UpdateQuery = "UPDATE category SET categoryName=? WHERE categoryId=?";

			PreparedStatement pst = conn.prepareStatement(UpdateQuery);
			
			pst.setString(1, category.getCategoryName());
			pst.setInt(2,categoryId);
			
			System.out.println("Query:"+pst.toString());
			
			int rs= pst.executeUpdate();
			if(rs>0) {
				flag= true;
			}else {
				flag=false;
			}
			pst.close();
			conn.close();
			
			
		}catch(Exception e) {
			System.out.println("Error: "+e);
		}
		
		
		
		return flag;
	}
//delete category
	public boolean DeleteCategoryByCategoryId(int categoryId){
		boolean flag = false; 
		try {
			Connection conn= DBConnection.getConnection();
			if(conn == null){
				System.out.println("Database connection error...");
				return flag;
			}
			String deleteQuery = "delete from category where categoryId=?";
			PreparedStatement pst = conn.prepareStatement(deleteQuery);
			
			pst.setInt(1, categoryId);
			
			int n = pst.executeUpdate();	
			
			if(n==0) {
				flag = false;
			}else {
				flag= true ;
			}
			
			pst.close();
			conn.close();
			
			
			
		}catch(Exception e) {
			System.out.println("Error "+e);	
		}
		return flag;
	}

public boolean UpdateCategoryPicByCategoryId(int CategoryId, String categoryPic){
	boolean flag = false;
	
	try {
		Connection conn=DBConnection.getConnection();
		if(conn == null){
			System.out.println("Database connection error");
			return flag;
		}
		String UpdateQuery = "update category set categoryPic=? where categoryId=?";
		PreparedStatement pst = conn.prepareStatement(UpdateQuery);
		
		pst.setString(1, categoryPic);
		pst.setInt(2, CategoryId);
		
		int n =pst.executeUpdate();
		
		if(n == 0 ) {
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
}
