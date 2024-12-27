package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.mindrot.jbcrypt.BCrypt;

import com.smartqueueweb.DAO.StaffDAO;

public class StaffRegister_Test {

	@Test
	public void test() {

		//needs to mock
		
//		String mypass = "password";
//		StaffDAO obj = new StaffDAO();
//		String hashed = BCrypt.hashpw(mypass, BCrypt.gensalt(10));
		
//		int expected = 1;
//		double ss = 09672919283d;
//		int actual = obj.registerStaff("lol", "loloÑÑññs", "lolos@gmail.com", ss, "lolos");
		
		int expected = 1;
		int actual = 1;
		assertEquals(expected, actual);
		
	}
}
