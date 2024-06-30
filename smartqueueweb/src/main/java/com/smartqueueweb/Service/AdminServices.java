package com.smartqueueweb.Service;

import com.smartqueueweb.Model.AdminBean;

public interface AdminServices {

	
	boolean loginAdmin(String username, String password);
	
	AdminBean adminDetails(String username);
	
}
