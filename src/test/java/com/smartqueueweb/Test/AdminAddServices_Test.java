package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.smartqueueweb.Class.ServiceType;
import com.smartqueueweb.Service.ServiceImpl;

public class AdminAddServices_Test {
	
	@Mock
	private ServiceImpl serviceImpl;
	
//	@Before
//	public void setup() {
//	MockitoAnnotations.openMocks(this);
//	}

	@Test
	public void AddServicesGeneral_ShouldReturnOne_One() {
		serviceImpl = new ServiceImpl();
		
		int expected = 1;
		int actual = serviceImpl.addService("CRIM", null, 0, ServiceType.GENERAL);
		assertEquals(expected, actual);
	}
	

//	@Test
//	public void AddServicesArchiving_ShouldReturnOne_One() {
//		serviceImpl = new ServiceImpl();
//		
//		int expected = 1;
//		int actual = serviceImpl.addService("CRIM", null, 0, ServiceType.GENERAL);
//		assertEquals(expected, actual);
//	}
//	
//
//	@Test
//	public void AddServicesRecords_ShouldReturnOne_One() {
//		serviceImpl = new ServiceImpl();
//		
//		int expected = 1;
//		int actual = serviceImpl.addService("CRIM", null, 0, ServiceType.GENERAL);
//		assertEquals(expected, actual);
//	}

}
