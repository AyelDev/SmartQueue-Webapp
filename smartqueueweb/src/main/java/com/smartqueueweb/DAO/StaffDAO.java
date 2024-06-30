package com.smartqueueweb.DAO;

import java.sql.Connection;
import java.sql.SQLException;

import com.smartqueueweb.Model.StaffBean;

public class StaffDAO extends SQLConnection {

	StaffBean staffbean = null;

	public StaffDAO() {
		super();
	}

	public Boolean authLoginStaff(String username, String password) {

		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT * FROM tbl_login_staff WHERE username=? AND password=?");
			prs.setString(1, username);
			prs.setString(2, password);
			rs = prs.executeQuery();

			return rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			SQLClose();
		}

	}

	public StaffBean staffDetails(String username) {
		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT * FROM tbl_login_staff WHERE username=?");
			prs.setString(1, username);
			rs = prs.executeQuery();

			while (rs.next()) {
				staffbean = new StaffBean();
				staffbean.setUsername(rs.getString("username"));
				staffbean.setPassword(rs.getString("password"));
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			SQLClose();
		}
		return staffbean;
	}

}
