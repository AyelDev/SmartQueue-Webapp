package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class UpdateStudent_Test {

	@Test
	public void test() {
		ServiceImpl service = new ServiceImpl();
		
		int expected  = 1;
		int actual = service.updateStudent(211099, 2110992, "Ariels", "Piodena", "Abelgas", "BSIT");
		
		assertEquals(expected, actual);
	}

}
