package com.smartqueueweb.Service;

import com.smartqueueweb.Class.ServiceType;
import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.ServicesBean;

import java.util.List;

public interface AdminServices {

	boolean loginAdmin(String username, String password);
	
	AdminBean adminDetails(String username);
	
	List<ServicesBean> serviceList();
	
	Integer addService(String program, String purpose, int amount, ServiceType serviceType);
	
	Boolean updateService(Integer id, String program, String purpose, int amount);
	
	Boolean deleteService(Integer id);

}
