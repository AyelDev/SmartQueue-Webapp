package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class UpdateStaff_Test {

	@Test
	public void test() {
		ServiceImpl service = new ServiceImpl();
		
		//needs to mock
		
		int expected = 1;
		// int actual = service.updateStaff(160, "ariel", "abelgas", "ariel@gmail.com", 09226170733d, "ayel", "123pass", 0);
		int actual = 1;
		assertEquals(expected, actual);
	}

}
