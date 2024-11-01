package com.smartqueueweb.Model;

public class ServicesBean {
    
	int id;
    String purpose;
    String course;
    int amount;
	String serviceType;
	int window_number;
	
	public ServicesBean() {
		super();
	}
	
	public ServicesBean(int window_number, String serviceType) {
		this.window_number = window_number;
		this.serviceType = serviceType;
	}
	
	public ServicesBean(int id, String purpose, String course, int amount, String serviceType) {
		this.id = id;
		this.purpose = purpose;
		this.course = course;
		this.amount = amount;
		this.serviceType = serviceType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	@Override
	public String toString() {
		return "ServicesBean [id=" + id + ", purpose=" + purpose + ", course=" + course + ", amount=" + amount
				+ ", window_number=" + window_number + ", serviceType=" + serviceType + "]";
	}
    
	
}
