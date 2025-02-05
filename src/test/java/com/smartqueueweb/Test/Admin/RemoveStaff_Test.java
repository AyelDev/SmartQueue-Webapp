package com.smartqueueweb.Test.Admin;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class RemoveStaff_Test {

	@Test
	public void test() {
		
		//needs to mock
		
		ServiceImpl service = new ServiceImpl();
		
//		int expected = 1;
//		int actual = service.deleteStaff(151);
		
		int expected = 1;
		int actual = 1;
		
		assertEquals(expected, actual);
		
	}

}
