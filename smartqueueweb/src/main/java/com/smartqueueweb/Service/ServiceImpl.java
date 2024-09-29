package com.smartqueueweb.Service;

import java.text.DateFormat;
import java.util.List;

import com.smartqueueweb.DAO.AdminDAO;
import com.smartqueueweb.DAO.StaffDAO;
import com.smartqueueweb.DAO.StudentDAO;
import com.smartqueueweb.Model.AdminBean;
import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Model.StudentBean;

public class ServiceImpl implements StaffServices, StudentServices, AdminServices {
	StaffDAO staffdata = new StaffDAO();
	AdminDAO admindata = new AdminDAO();
	StudentDAO studentdata = new StudentDAO();

	//////////////////////////////////////////////////////////////////////// ------------------      Staff
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
	
	@Override
	public Integer GenerateStaffToken(String role, String value) {
		// TODO Auto-generated method stub
		return staffdata.GenerateToken(role, value);
	}

	@Override
	public Integer deleteStaff(long staffId) {
		// TODO Auto-generated method stub
		return staffdata.removeStaff(staffId);
	}

	@Override
	public Integer updateStaff(long staffId, String inputFirstname, String inputLastname, String inputEmail,
			double inputContactnumber, String inputUsername, String inputPassword, int inputStafflocked) {
		// TODO Auto-generated method stub
		return staffdata.updateStaff(staffId, inputFirstname, inputLastname, inputEmail, inputContactnumber, inputUsername, inputPassword, inputStafflocked);
	}
	//////////////////////////////////////////////////////////////////////// --------------------       Admin
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

	
	//////////////////////////////////////////////////////////////////////// -----------------------	Student
	
	@Override
	public Integer addStudent(long idnumber, String firstname, String middlename, String lastname, String course) {
		return studentdata.addStudent(idnumber, firstname, middlename, lastname, course);
	}

	@Override
	public List<StudentBean> listsOfStudent() {
		// TODO Auto-generated method stub
		return studentdata.listOfStudent();
	}

	@Override
	public Integer deleteStudent(long idnumber) {
		// TODO Auto-generated method stub
		return studentdata.removeStudent(idnumber);
	}

	@Override
	public Integer updateStudent(long idNumber, long inputIdnumber, String inputfirstname, String inputMiddlename, String inputLastname, String inputCourse) {
		// TODO Auto-generated method stub
		return studentdata.updateStudent(idNumber, inputIdnumber, inputfirstname, inputMiddlename, inputLastname, inputCourse);
	}


}
