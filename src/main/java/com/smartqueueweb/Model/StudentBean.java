package com.smartqueueweb.Model;

import java.util.Date;

public class StudentBean {

	private long idnumber;
	private String firstname;
	private String middlename;
	private String lastname;
	private String course;
	private Date dateCreated;

	public StudentBean() {
		super();
	}
	
	public StudentBean(long idnumber, String firstname, String middlename, String lastname, String course, Date dateCreated) {
		this.idnumber = idnumber;
		this.firstname = firstname;
		this.middlename = middlename;
		this.lastname = lastname;
		this.course = course;
		this.dateCreated = dateCreated;
	}
	
	public StudentBean(long idnumber, String firstname, String middlename, String lastname, String course) {
		this.idnumber = idnumber;
		this.firstname = firstname;
		this.middlename = middlename;
		this.lastname = lastname;
		this.course = course;
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

	public String getMiddlename() {
		return middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "StudentBean [idnumber=" + idnumber + ", firstname=" + firstname + ", middlename=" + middlename
				+ ", lastname=" + lastname + ", course=" + course + ", dateCreated=" + dateCreated + "]";
	}

}
