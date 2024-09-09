package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.google.protobuf.Service;
import com.smartqueueweb.Service.ServiceImpl;

public class addStudent_Test {

	@Test
	public void test() {
		
		ServiceImpl service = new ServiceImpl();
		
		int actual = service.addStudent(123131231, "ariel", "abelgas");
		int expected = 1;
		
		assertEquals(expected, actual);
	}

}
