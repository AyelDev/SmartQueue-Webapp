package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class RemoveStaff_Test {

	@Test
	public void test() {
		ServiceImpl service = new ServiceImpl();
		
		int expected = 1;
		int actual = service.deleteStaff(151);
		
		assertEquals(expected, actual);
		
	}

}
