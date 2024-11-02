package com.smartqueueweb.Model;

import java.sql.Timestamp;

public class ServicesBean {
    
	int id;
    String purpose;
    String course;
    int amount;
	String serviceType;
	int window_number;
	String fullname;
	long id_number;
	Timestamp date;
	String queue_number;
	String queue_status;

	public ServicesBean() {
		super();
	}

	public ServicesBean(int id, String queue_number, String purpose, String fullname, long id_number, Timestamp date,
			String queue_status) {
		this.id = id;
		this.purpose = purpose;
		this.fullname = fullname;
		this.id_number = id_number;
		this.date = date;
		this.queue_number = queue_number;
		this.queue_status = queue_status;
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

	public int getWindow_number() {
		return window_number;
	}

	public void setWindow_number(int window_number) {
		this.window_number = window_number;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public long getId_number() {
		return id_number;
	}

	public void setId_number(long id_number) {
		this.id_number = id_number;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getQueue_number() {
		return queue_number;
	}

	public void setQueue_number(String queue_number) {
		this.queue_number = queue_number;
	}

	public String getQueue_status() {
		return queue_status;
	}

	public void setQueue_status(String queue_status) {
		this.queue_status = queue_status;
	}

	@Override
	public String toString() {
		return "ServicesBean [id=" + id + ", purpose=" + purpose + ", course=" + course + ", amount=" + amount
				+ ", serviceType=" + serviceType + ", window_number=" + window_number + ", fullname=" + fullname
				+ ", id_number=" + id_number + ", date=" + date + ", queue_number=" + queue_number + ", queue_status="
				+ queue_status + "]";
	}

	

}
