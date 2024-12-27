package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class StaffUpdateQueueStatus_Test {

	ServiceImpl service = new ServiceImpl();
	@Test
	public void test() {
		
		int expected = 1;
		int actual = service.updateQueueStatus("R4953", "DONE");
		
		assertEquals(expected, actual);
		
	}

}
