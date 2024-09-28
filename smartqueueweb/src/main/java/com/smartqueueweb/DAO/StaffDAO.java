package com.smartqueueweb.DAO;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;

import com.smartqueueweb.Model.StaffBean;

public class StaffDAO extends SQLConnection {

	StaffBean staffbean = null;

	public StaffDAO() {
		super();
	}

	public Boolean authLoginStaff(String username, String password) {

		try {
			String candidate = null;
			ConnectDriver();
			prs = conn.prepareStatement("SELECT password FROM tbl_login_staff WHERE username=?");
			prs.setString(1, username);
			rs = prs.executeQuery();

			while (rs.next()) {
				candidate = rs.getString("password");
			}

			if (candidate == null)
				return false;
			else
				return password.equals(candidate);

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

	public Integer registerStaff(String firstname, String lastname, String email, double contactNumber,
			String username) {
		try {
			 LocalDate currentDate = LocalDate.now();
			int length = 1;
			boolean useLetters = true;
			boolean useNumbers = true;
			String GeneratedPassword = "CEC" + currentDate.getYear() + RandomStringUtils.random(length, useLetters, useNumbers);
			String specialChars = "!@#$&*";

			GeneratedPassword += RandomStringUtils.random(2, specialChars);

			ConnectDriver();
			prs = conn.prepareStatement(
					"INSERT INTO tbl_login_staff (firstname, lastname, email, contact_number, username, password) "
							+ " VALUES (?, ?, ?, ?, ?, ?)");

			prs.setString(1, firstname);
			prs.setString(2, lastname);
			prs.setString(3, email);
			prs.setDouble(4, contactNumber);
			prs.setString(5, username);
			prs.setString(6, GeneratedPassword.toUpperCase());

			return prs.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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

			while (rs.next()) {
				isLocked = rs.getInt("isLocked");
			}

			if (isLocked == 1)
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

	List<StaffBean> listOfStaff = null;

	public List<StaffBean> listOfStaff() {
		try {
			ConnectDriver();
			prs = conn.prepareStatement("SELECT * FROM tbl_login_staff");
			rs = prs.executeQuery();
			listOfStaff = new ArrayList<StaffBean>();

			while (rs.next()) {
				staffbean = new StaffBean(rs.getInt("staff_id"),
						rs.getString("username"),
						rs.getString("password"),
						rs.getString("firstname"),
						rs.getString("lastname"),
						rs.getString("email"),
						rs.getDouble("contact_number"),
						rs.getInt("isLocked"));
				listOfStaff.add(staffbean);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			SQLClose();
		}
		return listOfStaff;
	}

	public Integer GenerateToken(String role, String value) {

		try {
			ConnectDriver();
			LocalDateTime now = LocalDateTime.now();
			LocalDateTime expiryDate = now.plusHours(2);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

			prs = conn.prepareStatement(
					"INSERT INTO accesstokens (role, value, date_expired) "
							+ " VALUES (?, ?, ?)");

			prs.setString(1, role);
			prs.setString(2, value);
			prs.setString(3, expiryDate.format(formatter));

			return prs.executeUpdate();

		} catch (Exception err) {
			err.printStackTrace();
		}finally{
			SQLClose();
		}
		return null;
	}
}
