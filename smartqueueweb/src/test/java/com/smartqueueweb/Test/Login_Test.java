package com.smartqueueweb.Test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class Login_Test {

	@Test
	public void test() {
		
		ServiceImpl services = new ServiceImpl();
		String User = "cindy";
		String Pass = "labra";
		
		
		boolean actual = services.loginStaff(User, Pass);
		boolean expected = true;
		assertEquals(expected, actual);
	
		
		
		
		
	
	}

}
