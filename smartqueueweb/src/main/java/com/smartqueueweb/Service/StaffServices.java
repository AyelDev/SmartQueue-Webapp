package com.smartqueueweb.Service;

import java.util.List;

import com.smartqueueweb.Model.ServicesBean;
import com.smartqueueweb.Model.StaffBean;

public interface StaffServices {

	boolean loginStaff(String username, String password);
	
	//staff can register but unable to use (need verification to the admin)
	Integer registerStaff(String firstname, String lastname, String email, double contactNumber,
			String username);
	
	StaffBean loginStaffDetail(String username);
	
	Boolean isStaffLocked(String username);
	
	List<StaffBean> listsOfStaff();

	Integer GenerateStaffToken(String role, String value);
	
	Integer deleteStaff(long staffId);

	Integer updateStaff(long staffId, String inputFirstname, String inputLastname, String inputEmail, double inputContactnumber, String inputUsername ,String inputPassword, int inputStafflocked);

	Integer requestStaffPassword(String username, String email);
	
	List<StaffBean> listOfStaffPasswordRequests(int isCompleted);
	
	List<ServicesBean> windowList();
}
