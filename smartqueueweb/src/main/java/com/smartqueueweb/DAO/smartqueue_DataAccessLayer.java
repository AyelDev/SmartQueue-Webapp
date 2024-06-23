package com.smartqueueweb.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class smartqueue_DataAccessLayer {
	public Connection conn = null;
	private PreparedStatement prs = null;
	
	public smartqueue_DataAccessLayer() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3307/smartqueuedb", "root", "");
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.getMessage();
			e.printStackTrace();
		}
	}
	
	public boolean Login(String username, String password) {
		try {
			prs = conn.prepareStatement("SELECT username FROM staff WHERE username=? AND password=?");
			prs.setString(1, username);
			prs.setString(2, password);
			ResultSet loginResult = prs.executeQuery();
			return loginResult.next();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean Register(String firstname, String lastname, String email, Integer contactnumber, String username, String password) {
		try {
			prs = conn.prepareStatement("INSERT INTO staff (staff_id, firstname, lastname, email, contactnumber, username, password) VALUES (? ,? ,? ,? ,? ,? ,?)");
			prs.setString(1, "");
			prs.setString(2, firstname);
			prs.setString(3, lastname);
			prs.setString(4, email);
			prs.setInt(5, contactnumber);
			prs.setString(6, username);
			prs.setString(7, password);
			
			ResultSet registerStaffResult = prs.executeQuery();
			
			return true;
		}catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
