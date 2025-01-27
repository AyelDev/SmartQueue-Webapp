package com.smartqueueweb.Model;

import java.util.Date;

public class CountersBean {

	private int id;
	private int counterNumber;
	private String description;
	private Date dateCreated;
	private String status;
	
	public CountersBean() {
		super();
	}

	public CountersBean(int id, int counterNumber, String description, Date dateCreated, String status) {
		super();
		this.id = id;
		this.counterNumber = counterNumber;
		this.description = description;
		this.dateCreated = dateCreated;
		this.status = status;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCounterNumber() {
		return counterNumber;
	}

	public void setCounterNumber(int counterNumber) {
		this.counterNumber = counterNumber;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CountersBean [id=" + id + ", counterNumber=" + counterNumber + ", description=" + description
				+ ", dateCreated=" + dateCreated + ", status=" + status + "]";
	}
}