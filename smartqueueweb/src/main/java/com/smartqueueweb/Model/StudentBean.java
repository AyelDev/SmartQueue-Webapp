package com.smartqueueweb.Model;

public class StudentBean {

	private long idnumber;
	private String firstname;
	private String lastname;
	
	public StudentBean(long idnumber, String firstname, String lastname) {
		this.idnumber = idnumber;
		this.firstname = firstname;
		this.lastname = lastname;
	}
	
	public long getIdnumber() {
		return idnumber;
	}
	public void setIdnumber(long idnumber) {
		this.idnumber = idnumber;
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

	@Override
	public String toString() {
		return "StudentBean [idnumber=" + idnumber + ", firstname=" + firstname + ", lastname=" + lastname + "]";
	}
	
	
	
}
