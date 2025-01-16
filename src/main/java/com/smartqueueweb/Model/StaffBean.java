package com.smartqueueweb.Model;

import java.sql.Date;

public class StaffBean {
	private int staffID;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String email;
	private String contactNumber;
	private int isLocked;
	
	private int requestId;
	private Date requestedPassCreated;
	
	
	public StaffBean() {}
	
	/*
	 * Requested list of staff Constructor
	 */
	public StaffBean(String username, String email, int requestId, Date requestedPassCreated) {
		this.username = username;
		this.email = email;
		this.requestId = requestId;
		this.requestedPassCreated = requestedPassCreated;
	}
	
	public StaffBean(int staffID, String username, String password, String firstname, String lastname, String email,
			String contactNumber, int isLocked) {
		this.staffID = staffID;
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.contactNumber = contactNumber;
		this.isLocked = isLocked;
	}

	public int getStaffID() {
		return staffID;
	}

	public void setStaffID(int staffID) {
		this.staffID = staffID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public int getIsLocked() {
		return isLocked;
	}

	public void setIsLocked(int isLocked) {
		this.isLocked = isLocked;
	}

	public int getRequestId() {
		return requestId;
	}

	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}

	public Date getRequestedPassCreated() {
		return requestedPassCreated;
	}

	public void setRequestedPassCreated(Date requestedPassCreated) {
		this.requestedPassCreated = requestedPassCreated;
	}

	@Override
	public String toString() {
		return "StaffBean [staffID=" + staffID + ", username=" + username + ", password=" + password + ", firstname="
				+ firstname + ", lastname=" + lastname + ", email=" + email + ", contactNumber=" + contactNumber
				+ ", isLocked=" + isLocked + ", requestId=" + requestId + ", requestedPassCreated="
				+ requestedPassCreated + "]";
	}
	
}
