package com.smartqueueweb.Model;

import java.util.Date;

public class MonthQueueSummaryBean {
    
	private int id;
	private Date month;
	private int inquiries;
	private Date dateModified;
	
    public MonthQueueSummaryBean(){
        super();
    }

	public MonthQueueSummaryBean(int id, Date month, int inquiries, Date dateModified) {
		super();
		this.id = id;
		this.month = month;
		this.inquiries = inquiries;
		this.dateModified = dateModified;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getMonth() {
		return month;
	}

	public void setMonth(Date month) {
		this.month = month;
	}

	public int getInquiries() {
		return inquiries;
	}

	public void setInquiries(int inquiries) {
		this.inquiries = inquiries;
	}

	public Date getDateModified() {
		return dateModified;
	}

	public void setDateModified(Date dateModified) {
		this.dateModified = dateModified;
	}

	@Override
	public String toString() {
		return "MonthQueueSummaryBean [id=" + id + ", month=" + month + ", inquiries=" + inquiries + ", dateModified="
				+ dateModified + "]";
	}
    
}
