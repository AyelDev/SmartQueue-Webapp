package com.smartqueueweb.Service;

import com.smartqueueweb.DAO.AdminDAO;
import com.smartqueueweb.DAO.StaffDAO;
import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.StaffBean;

public class ServiceImpl implements StaffServices, StudentServices, AdminServices {
	StaffDAO staffdata = new StaffDAO();
	AdminDAO admindata = new AdminDAO();
	
	/////////////////// ------------------      Staff
	@Override
	public boolean loginStaff(String username, String password) {
		// TODO Auto-generated method stub
		return staffdata.authLoginStaff(username, password);
	}
	
	@Override
	public StaffBean loginStaffDetail(String username) {
		// TODO Auto-generated method stub
		return staffdata.staffDetails(username);
	}
	
	///////////////// --------------------       Admin
	@Override
	public boolean loginAdmin(String username, String password) {
		// TODO Auto-generated method stub
		return admindata.authLoginAdmin(username, password);
	}

	@Override
	public AdminBean adminDetails(String username) {
		// TODO Auto-generated method stub
		return admindata.adminDetail(username);
	}

	
	//Student
	


}
