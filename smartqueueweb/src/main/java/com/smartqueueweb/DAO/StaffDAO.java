package com.smartqueueweb.DAO;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;

import com.smartqueueweb.Model.ServicesBean;
import com.smartqueueweb.Model.StaffBean;

public class StaffDAO extends SQLConnection {

	StaffBean staffbean = null;
	ServicesBean servicesBean = null;

	public StaffDAO() {
		super();
	}

	public Boolean authLoginStaff(String username, String password) {

		try {
			String candidate = null;
			ConnectDriver();
			prs = conn.prepareStatement("SELECT password FROM tbl_login_staff WHERE username=? AND isDeleted=0");
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
			String dateLast2Digit = String.valueOf(currentDate.getYear()).substring(2);
			int length = 2;
			boolean useLetters = true;
			boolean useNumbers = true;
			String GeneratedPassword = "CEC" + dateLast2Digit
					+ RandomStringUtils.random(length, useLetters, useNumbers);
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
			prs = conn.prepareStatement("SELECT * FROM tbl_login_staff WHERE isDeleted=0");
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
		} finally {
			SQLClose();
		}
		return null;
	}

	public Integer removeStaff(long idNumber) {
		try {
			ConnectDriver();
			prs = conn.prepareStatement(
					"UPDATE `tbl_login_staff` SET `isDeleted` = '1' WHERE `tbl_login_staff`.`staff_id` = ?");
			prs.setLong(1, idNumber);

			return prs.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SQLClose();
		}
		return 0;
	}

	public Integer updateStaff(long staffId, String inputFirstname, String inputLastname, String inputEmail,
			double inputContactnumber, String inputUsername, String inputPassword, int inputStafflocked) {

				try {
					ConnectDriver();
					prs = conn.prepareStatement("UPDATE `tbl_login_staff` SET `firstname` = ?, `lastname` = ?, `email` = ?,"+
					" `contact_number` = ?, `username` = ?, `password` = ?, `isLocked` = ? WHERE `tbl_login_staff`.`staff_id` = ?;");
					prs.setString(1, inputFirstname);
					prs.setString(2, inputLastname);
					prs.setString(3, inputEmail);
					prs.setDouble(4, inputContactnumber);
					prs.setString(5, inputUsername);
					prs.setString(6, inputPassword);
					prs.setInt(7, inputStafflocked);
					prs.setLong(8, staffId);
					
					return prs.executeUpdate();

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}finally{
					SQLClose();
				}

		return 0;
	}

	public List<StaffBean> listOfStaffPasswordRequest(int isCompleted) {
		try {
		ConnectDriver();
		prs = conn.prepareStatement("SELECT * FROM tbl_staff_request_password WHERE is_completed=?");
		prs.setInt(1, isCompleted);
		rs = prs.executeQuery();
		listOfStaff = new ArrayList<StaffBean>();
		while (rs.next()) {
			staffbean = new StaffBean(
					rs.getString("username"),
					rs.getString("email"),
					rs.getInt("request_id"),
					rs.getDate("date_requested"));
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

		public Integer requestStaffPassword(String username, String email) {
		// TODO Auto-generated method stub
		try {
			ConnectDriver();
			prs = conn.prepareStatement("INSERT INTO tbl_staff_request_password (`request_id`, `username`, `email`, "
					+ "`date_requested`, `is_completed`) VALUES (NULL, ?, ?, current_timestamp(), '0');");
			prs.setString(1, username);
			prs.setString(2, email);
			return prs.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			SQLClose();
		}
		return 0;
	}

	List<ServicesBean> listOfWindow = null;
        public List<ServicesBean> windowList() {
			try {
				ConnectDriver();
				prs = conn.prepareStatement("SELECT * FROM tbl_servicetype");
				rs = prs.executeQuery();
				listOfWindow = new ArrayList<ServicesBean>();
				while (rs.next()) {
					servicesBean = new ServicesBean(
						rs.getInt("window_number"),
						rs.getString("servicetype")
					);
					listOfWindow.add(servicesBean);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				SQLClose();
			}
			return listOfWindow;
        }

		List<ServicesBean> studentQueueEntries = null;
		public List<ServicesBean> studentQueueEntries(int window_number, String queue_status) {
			// TODO Auto-generated method stub
			try {
				ConnectDriver();
				prs = conn.prepareStatement("SELECT * FROM student_queue_entries WHERE window_number = ? AND queue_status = ? ");
				prs.setInt(1, window_number);
				prs.setString(2, queue_status);
				rs = prs.executeQuery();
				studentQueueEntries = new ArrayList<ServicesBean>();
				while (rs.next()) {
					servicesBean = new ServicesBean(
						rs.getInt("id"),
						rs.getString("queue_number"),
						rs.getString("purpose"),
						rs.getString("fullname"),
						rs.getLong("id_number"),
						rs.getTimestamp("date"),
						rs.getString("queue_status")
					);
					studentQueueEntries.add(servicesBean);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				SQLClose();
			}
			return studentQueueEntries;
		}

		public Integer updateQueueStatus(String queueNumber, String queue_status) {
			// TODO Auto-generated method stub
			try {
				ConnectDriver();
				prs = conn.prepareStatement("UPDATE `student_queue_entries` SET `queue_status` = ?"
						+ " WHERE `student_queue_entries`.`queue_number` = ?");
				prs.setString(1, queue_status);
				prs.setString(2, queueNumber);
				return prs.executeUpdate();

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				SQLClose();
			}
			return 0;
		}
}
