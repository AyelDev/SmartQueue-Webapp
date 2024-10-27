package com.smartqueueweb.Service;

import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.ServicesBean;

import java.util.List;

public interface AdminServices {

	boolean loginAdmin(String username, String password);
	
	AdminBean adminDetails(String username);
	
	List<ServicesBean> serviceList();

}
