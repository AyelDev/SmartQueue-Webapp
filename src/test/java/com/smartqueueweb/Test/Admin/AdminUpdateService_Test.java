package com.smartqueueweb.Test.Admin;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.smartqueueweb.Class.ServiceType;
import com.smartqueueweb.Service.ServiceImpl;

public class AdminUpdateService_Test {

ServiceImpl service;
	
	@Before
	public void setup() {
		service = new ServiceImpl();
	}

	@Test
	public void test() {
		int id = 37;
		String program = "CRIMS";
		String purpose = null;
		int amount = 0;
		
		boolean expected = true;
		boolean actual = service.updateService(id, program, purpose, amount);
		
		assertEquals(expected, actual);
	}
}
