package com.smartqueueweb.Test.Admin;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class RequestAStaffPassword_Test {

	@Test
	public void testIfStaffCanRequestAPasswordTrue() {
		ServiceImpl service = new ServiceImpl();
		
		int expected = 1;
		int actual = service.requestStaffPassword("Ayeldev", "Ariel@gmail.com");
		
		assertEquals(expected, actual);
	}

}
