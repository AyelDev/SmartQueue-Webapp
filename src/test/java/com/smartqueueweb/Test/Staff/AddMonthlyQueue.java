package com.smartqueueweb.Test.Staff;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class AddMonthlyQueue {

	@Test
	public void AddMonthlyQueue_ShouldreturnTrue() {
		ServiceImpl service = new ServiceImpl();
		
		int expected = 1;
		int actual = service.addMonthlyEnquiry();

		assertEquals(expected, actual);
	}

}
