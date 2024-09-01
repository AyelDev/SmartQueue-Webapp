package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;
import org.mindrot.jbcrypt.BCrypt;

import com.smartqueueweb.DAO.StaffDAO;

public class StaffRegister_Test {

	@Test
	public void test() {

		String mypass = "password";
		StaffDAO obj = new StaffDAO();
		String hashed = BCrypt.hashpw(mypass, BCrypt.gensalt(10));
		
		int expected = 1;
		
		int actual = obj.registerStaff("kia", "bobi", "aao@gmail.com", 3131, "john");
		assertEquals(expected, actual);
		
	}
}
