package com.smartqueueweb.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SQLConnection {

	public Connection conn = null;
	protected PreparedStatement prs = null;
	protected ResultSet rs = null;

	private final String url = "jdbc:mysql://ufauwjqub0rglxhu:GZBLe6Rgv8CmDNsCICd7@bwbgikdqwnc5oeaubua2-mysql.services.clever-cloud.com:3306/bwbgikdqwnc5oeaubua2";
	private final String username = "ufauwjqub0rglxhu";
	private final String password = "GZBLe6Rgv8CmDNsCICd7";

	public SQLConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			SQLClose();
		}
	}

	public void ConnectDriver(){
		try {
			conn = DriverManager.getConnection(url, username, password);
			// conn = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3307/smartqueuedb", "root", "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void SQLClose() {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (prs != null) {
			try {
				prs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public Connection getConn() {
		return conn;
	}
}
