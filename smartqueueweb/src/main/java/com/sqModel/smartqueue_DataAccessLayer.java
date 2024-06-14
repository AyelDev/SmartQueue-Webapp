package com.sqModel;

import java.sql.Connection;
import java.sql.DriverManager;

public class smartqueue_DataAccessLayer {
	public Connection conn;
	public smartqueue_DataAccessLayer() {
		String Url = "jdbc:mysql://127.0.0.2:3307/smartqueuetest";
		String userName = "root";
		String passWord = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(Url, userName, passWord);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.getMessage();
			e.printStackTrace();
		}
	}
	
}
