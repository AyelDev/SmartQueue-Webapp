package com.smartqueueweb.Test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class Login_Test {

	@Test
	public void test() {
		
		ServiceImpl services = new ServiceImpl();
		String User = "Cindev";
		String Pass = "CEC24GK$&";
		
		
		boolean actual = services.loginStaff(User, Pass);
		boolean expected = true;
		assertEquals(expected, actual);
	
		
		
		
		
	
	}

}
