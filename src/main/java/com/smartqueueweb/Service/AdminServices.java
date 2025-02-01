package com.smartqueueweb.Service;

import com.smartqueueweb.Class.ServiceType;
import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.CountersBean;
import com.smartqueueweb.Model.MediaBean;
import com.smartqueueweb.Model.ServicesBean;
import com.smartqueueweb.Model.QueueEntryBean;
import com.smartqueueweb.Model.MonthQueueSummaryBean;

import java.util.List;

public interface AdminServices {

	boolean loginAdmin(String username, String password);
	
	AdminBean adminDetails(String username);
	
	List<ServicesBean> serviceList();
	
	Integer addService(String program, String purpose, int amount, ServiceType serviceType);
	
	Boolean updateService(Integer id, String program, String purpose, int amount);
	
	Boolean deleteService(Integer id);
	
	Integer addCounters(Integer counterNumber, String description);
	
	List<CountersBean> counterList();
	
	Boolean updateCounters(Integer id, Integer counterNumber, String description, String status);
	
	Boolean deleteCounters(Integer id);
	
	List<MediaBean> videoList();
	
	List<QueueEntryBean> listOfEnquiries();

	List<MonthQueueSummaryBean> listOfMonthlyQueues();

	Integer addMonthlyEnquiry();

	Boolean clearAllQueueEntries();

}
