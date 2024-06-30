package com.smartqueueweb.Service;

import com.smartqueueweb.Model.StaffBean;

public interface StaffServices {

	boolean loginStaff(String username, String password);
	
	StaffBean loginStaffDetail(String username);
}
