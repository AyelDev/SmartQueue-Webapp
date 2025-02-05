package com.smartqueueweb.Test.Admin;

import java.util.List;

import org.junit.Test;

import com.smartqueueweb.DAO.StaffDAO;
import com.smartqueueweb.Model.StaffBean;

public class ListOfStaff_test {

	@Test
	public void test() {
		StaffDAO test = new StaffDAO();
		
		List<StaffBean> obj = test.listOfStaff();
		
		for(var a : obj) {
			System.out.println(a);
			System.out.println(a.getStaffID() + " : " + a.getFirstname() + " " + a.getLastname() + " : " +
			a.getContactNumber() + " : " + a.getEmail() + " : " + a.getContactNumber() + " : " + a.getIsLocked());
		}
	 
	}

}
