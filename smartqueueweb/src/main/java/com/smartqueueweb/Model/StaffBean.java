package com.smartqueueweb.Model;

public class StaffBean {
	private int staffID;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String email;
	private long contactNumber;
	private int isLocked;
	
	public StaffBean() {};
	
	public StaffBean(int staffID, String username, String password, String firstname, String lastname, String email,
			long contactNumber, int isLocked) {
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

	public long getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}

	public int getIsLocked() {
		return isLocked;
	}

	public void setIsLocked(int isLocked) {
		this.isLocked = isLocked;
	}

	@Override
	public String toString() {
		return "StaffBean [staffID=" + staffID + ", username=" + username + ", password=" + password + ", firstname="
				+ firstname + ", lastname=" + lastname + ", email=" + email + ", contactNumber=" + contactNumber
				+ ", isLocked=" + isLocked + "]";
	}
	
	
	
}
