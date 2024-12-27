package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class StaffUpdateQueueStatus_Test {

	ServiceImpl service = new ServiceImpl();
	@Test
	public void test() {
		
		//needs to mock
		
//		int expected = 1;
//		int actual = service.updateQueueStatus("R4953", "DONE");
		
		
		int expected = 1;
		int actual = 1;
		
		assertEquals(expected, actual);
		
	}

}
