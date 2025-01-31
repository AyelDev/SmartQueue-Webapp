package com.smartqueueweb.Model;

import java.util.Date;
public class QueueEntryBean {
    
    private int id;
    private String queueNumber; 
    private String id_number; 
    private String fullName; 
    private String purpose; 
    private String serviceType; 
    private int windowNumber;
    private Date DateInquired;
    private String queueStatus;

    public QueueEntryBean(){
        super();
    }

    public QueueEntryBean(int id, String queueNumber, String id_number, String fullName, String purpose,
            String serviceType, int windowNumber, Date dateInquired, String queueStatus) {
        this.id = id;
        this.queueNumber = queueNumber;
        this.id_number = id_number;
        this.fullName = fullName;
        this.purpose = purpose;
        this.serviceType = serviceType;
        this.windowNumber = windowNumber;
        DateInquired = dateInquired;
        this.queueStatus = queueStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQueueNumber() {
        return queueNumber;
    }

    public void setQueueNumber(String queueNumber) {
        this.queueNumber = queueNumber;
    }

    public String getId_number() {
        return id_number;
    }

    public void setId_number(String id_number) {
        this.id_number = id_number;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public int getWindowNumber() {
        return windowNumber;
    }

    public void setWindowNumber(int windowNumber) {
        this.windowNumber = windowNumber;
    }

    public Date getDateInquired() {
        return DateInquired;
    }

    public void setDateInquired(Date dateInquired) {
        DateInquired = dateInquired;
    }

    public String getQueueStatus() {
        return queueStatus;
    }

    public void setQueueStatus(String queueStatus) {
        this.queueStatus = queueStatus;
    }

    @Override
    public String toString() {
        return "QueueEntryBean [id=" + id + ", queueNumber=" + queueNumber + ", id_number=" + id_number + ", fullName="
                + fullName + ", purpose=" + purpose + ", serviceType=" + serviceType + ", windowNumber=" + windowNumber
                + ", DateInquired=" + DateInquired + ", queueStatus=" + queueStatus + "]";
    }
    
}
