package com.smartqueueweb.Test.Staff;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class UpdateStaffPin {

	@Test
	public void UpdateUnupdatedStaffPin_ShouldReturnOne() {
		ServiceImpl service = new ServiceImpl();
		
		int expected = 1;
		int actual = service.setStaffPin("0", 205);
		
		assertEquals(expected, actual);
	}
}
