package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.example.dbutil.DBConnection;
import com.example.model.Employees;

public class EmployeeDAO {
//1.ADD EMPLOYEE
	
	public int addEmployee(Employees employee) {
		int n=0;
		
		try {
			Connection conn = DBConnection.getConnection();
			if(conn==null){
				return n;
			}
			
			String addQuery = "insert into employees where employeeId=?";
			PreparedStatement pst = conn.prepareStatement(addQuery);
			
			pst.setInt(1, employee.getEmployeeId());
			
		}catch(Exception e) {
			System.out.println("ERROR: "+ e);
		}
		
		return n;
	}
	
	//2.VIEW EMPLOYEES
	public ArrayList<Employees> ViewEmployees(){
		ArrayList<Employees> empList = new ArrayList<Employees>();
		
		try {
			Connection conn = DBConnection.getConnection();
			if(conn==null){
				return empList;			
			}
			
			String showQuery = "select * from employees";
			PreparedStatement pst=conn.prepareStatement(showQuery);
			
			Employees employee = new Employees();
			System.out.println("Select Query: "+pst.toString());
			
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
			   Employees employees = new Employees();
			   employees.setFirstName(rs.getString("firstName"));
			   employees.setLastName(rs.getString("lastName"));
			   employees.setGender(rs.getString("gender"));
			   employees.setMobile(rs.getString("mobile"));
			   employees.setEmail(rs.getString("email"));
			   employees.setDesignation(rs.getString("designation"));
			   employees.setSalary(rs.getInt("salary"));
			   employees.setPassword(rs.getString("password"));
			   employees.setEmployeepic(rs.getString("employeePic"));			   
			}
			
			pst.close();
			conn.close();
		
		}catch(Exception e) {
			System.out.println("Error: " +  e);
		}
		
		return empList;
	}
	//3.DELETE EMPLOYEE
	public int deleteEmployee(Employees employee) {
		
		int n=0;
		
		try {
			Connection conn = DBConnection.getConnection();
			if(conn==null) {
				System.out.println("Error in DB");
				return n;
			}
			
			String deleteQuery = "delete from employees where ";
			PreparedStatement pst = conn.prepareStatement(deleteQuery);
			
			ResultSet rs = pst.executeQuery();
			
			System.out.println("deleteQuery: "+pst.toString());
			
		}catch(Exception e) {
			System.out.println("Error: "+e);
		}
		
		return n;
	}
	//4.UPDATE EMPLOYEE
	public int updateEmployee(Employees employee) {
		int n=0;
		
		try {
			Connection conn = DBConnection.getConnection();
			if(conn ==null) {
				System.out.println("Error in db");
			return n;
			}
			String updateEmp = "update employees set employeeId=?,firstName=?,lastName=?,gender=?,mobile=?,email=?,designation=?,salary=?,password=?,employeePic=?";
			PreparedStatement pst = conn.prepareStatement("updateEmp");
			
			
				conn.close();
			
		}catch(Exception e){
			System.out.println("Error: "+e);
		}
		
		return n;
	}
}
