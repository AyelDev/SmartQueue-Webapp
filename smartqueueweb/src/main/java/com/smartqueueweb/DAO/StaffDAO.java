package com.smartqueueweb.DAO;

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
		} finally {
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
				staffbean.setStaffID(rs.getInt("staff_id"));
				staffbean.setUsername(rs.getString("username"));
				staffbean.setPassword(rs.getString("password"));
				staffbean.setFirstname(rs.getString("firstname"));
				staffbean.setLastname(rs.getString("lastname"));
				staffbean.setEmail(rs.getString("email"));
				staffbean.setContactNumber(rs.getLong("contact_number"));
				staffbean.setIsLocked(rs.getInt("isLocked"));
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			SQLClose();
		}
		return staffbean;
	}

	public Integer registerStaff(String firstname, String lastname, String email, int contactNumber,
			String username, String password) {
		try {
			ConnectDriver();
			prs = conn.prepareStatement(
					"INSERT INTO tbl_login_staff (firstname, lastname, email, contact_number, username, password) "
					+ " VALUES (?, ?, ?, ?, ?, ?)");

			prs.setString(1, firstname);
			prs.setString(2, lastname);
			prs.setString(3, email);
			prs.setInt(4, contactNumber);
			prs.setString(5, username);
			prs.setString(6, password);

			return prs.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			SQLClose();
		}
		return 0;
	}
	
	public boolean checkStaffIfLocked(String username) {
		int isLocked = 0;
		
		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT isLocked FROM tbl_login_staff WHERE username=?");
			prs.setString(1, username);
			rs = prs.executeQuery();
			
			while(rs.next()) {
			isLocked = rs.getInt("isLocked");
			}
			
			if(isLocked == 1) 
			return true;
			else
			return false;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQLClose();
		}
		return false;
	}
}
