package com.smartqueueweb.Test;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class AdminDeleteService {
	
	ServiceImpl service;
	
	@Before
	public void setup() {
		service = new ServiceImpl();
	}

	@Test
	public void test() {
		boolean expected = true;
		boolean actual = service.deleteService(38);
		
		assertEquals(expected, actual);
	}

}
