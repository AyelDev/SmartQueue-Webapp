package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class RegisterToken_Test {

	@Test
	public void test() {
		ServiceImpl service = new ServiceImpl();
		
		int expected = 1;
		int actual = service.GenerateStaffToken("admin", "dsdadasdwe");
		
		assertEquals(expected, actual);
	}

}
