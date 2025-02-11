package com.smartqueueweb.Model;

import java.sql.Blob;

public class AdminBean {

	private int adminId;
	private String username;
	private String password;
	private Blob profilePicture;
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
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
	public Blob getProfilePicture() {
		return profilePicture;
	}
	public void setProfilePicture(Blob profilePicture) {
		this.profilePicture = profilePicture;
	}
	
	@Override
	public String toString() {
		return "AdminBean [adminId=" + adminId + ", username=" + username + ", password=" + password
				+ ", profilePicture=" + profilePicture + "]";
	}
	
}
