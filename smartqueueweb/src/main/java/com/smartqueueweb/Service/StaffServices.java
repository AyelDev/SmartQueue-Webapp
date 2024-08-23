package com.smartqueueweb.Service;

import com.smartqueueweb.Model.StaffBean;

public interface StaffServices {

	boolean loginStaff(String username, String password);
	
	//staff can register but unable to use (need verification to the admin)
	boolean registerStaff();
	
	StaffBean loginStaffDetail(String username);
}
