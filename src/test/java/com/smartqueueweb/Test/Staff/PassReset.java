package com.smartqueueweb.Test.Staff;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class PassReset {

	@Test
	public void test() {
		ServiceImpl service = new ServiceImpl();
		boolean expected = true;
		boolean actual = service.completePasswordReset("newpass", 208);
		
		assertEquals(expected, actual);
	}

}
