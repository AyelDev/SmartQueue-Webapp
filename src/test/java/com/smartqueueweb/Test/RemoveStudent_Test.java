package com.smartqueueweb.Test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class RemoveStudent_Test {

	@Test
	public void test() {
		ServiceImpl service = new ServiceImpl();
		
		int expected = 1;
		int actual = service.deleteStudent(132131);
		
		assertEquals(expected, actual);
		
	}

}
