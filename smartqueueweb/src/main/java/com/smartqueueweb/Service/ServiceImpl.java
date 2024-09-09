package com.smartqueueweb.Service;

import java.util.List;

import com.smartqueueweb.DAO.AdminDAO;
import com.smartqueueweb.DAO.StaffDAO;
import com.smartqueueweb.DAO.StudentDAO;
import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.StaffBean;

public class ServiceImpl implements StaffServices, StudentServices, AdminServices {
	StaffDAO staffdata = new StaffDAO();
	AdminDAO admindata = new AdminDAO();
	StudentDAO studentdata = new StudentDAO();
	/////////////////// ------------------      Staff
	@Override
	public boolean loginStaff(String username, String password) {
		// TODO Auto-generated method stub
		return staffdata.authLoginStaff(username, password);
	}
	
	@Override
	public Integer registerStaff(String firstname, String lastname, String email, double contactNumber,
			String username) {
		// TODO Auto-generated method stub
		return staffdata.registerStaff(firstname, lastname, email, contactNumber, username);
	}
	
	@Override
	public StaffBean loginStaffDetail(String username) {
		// TODO Auto-generated method stub
		return staffdata.staffDetails(username);
	}
	
	@Override
	public Boolean isStaffLocked(String username) {
		// TODO Auto-generated method stub
		return staffdata.checkStaffIfLocked(username);
	}
	
	@Override
	public List<StaffBean> listsOfStaff() {
		// TODO Auto-generated method stub
		return staffdata.listOfStaff();
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

	
	//////////////// -----------------------	Student
	
	@Override
	public Integer addStudent(long idnumber, String firstname, String lastname) {
		return studentdata.addStudent(idnumber, firstname, lastname);
	}


}
