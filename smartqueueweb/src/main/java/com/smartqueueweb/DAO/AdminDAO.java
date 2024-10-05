package com.smartqueueweb.DAO;

import java.sql.SQLException;

import com.smartqueueweb.Model.AdminBean;

public class AdminDAO extends SQLConnection {

	AdminBean adminbean = null;

	public AdminDAO() {
		super();
	}

	public boolean authLoginAdmin(String username, String password) {
		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT username FROM tbl_login_admin WHERE username=? AND password=?");
			prs.setString(1, username);
			prs.setString(2, password);
			rs = prs.executeQuery();

			return rs.next();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} finally {
			SQLClose();
		}
	}

	public AdminBean adminDetail(String username) {

		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT * FROM tbl_login_admin WHERE username=?");
			prs.setString(1, username);
			rs = prs.executeQuery();

			while (rs.next()) {
				adminbean = new AdminBean();
				adminbean.setAdminId(rs.getInt("admin_id"));
				adminbean.setUsername(rs.getString("username"));
				adminbean.setPassword(rs.getString("password"));
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			SQLClose();
		}
		return adminbean;
	}

}
