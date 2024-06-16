package sqModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class smartqueue_DataAccessLayer {
	public Connection conn = null;
	
	public smartqueue_DataAccessLayer() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.2:3307/smartqueuetest", "root", "");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.getMessage();
			e.printStackTrace();
		}
	}
	
	public boolean Login(String username, String password) {
		
		try {
			PreparedStatement prs = conn.prepareStatement("SELECT uname FROM user WHERE uname=? AND upass=?");
			prs.setString(1, username);
			prs.setString(2, password);
			ResultSet loginResult = prs.executeQuery();
			return loginResult.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
}
