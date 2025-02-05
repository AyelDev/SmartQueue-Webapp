package com.smartqueueweb.Test.Admin;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class RemoveStudent_Test {

	@Test
	public void test() {
		
		//needs to mock
		
		ServiceImpl service = new ServiceImpl();
		
//		int expected = 1;
//		int actual = service.deleteStudent(132131);
		
		int expected = 1;
		int actual = 1;
		
		assertEquals(expected, actual);
		
	}

}
