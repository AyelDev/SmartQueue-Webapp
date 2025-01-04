package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class ListOfStudent_Test {

	@Test
	public void test() {
		ServiceImpl data = new ServiceImpl();
		
		boolean excpected = true;
		boolean actual = data.listsOfStaff() != null;
		assertEquals(excpected, actual);
		
	}

}
