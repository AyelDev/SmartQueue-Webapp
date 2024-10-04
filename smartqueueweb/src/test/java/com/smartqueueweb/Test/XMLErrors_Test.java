package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class XMLErrors_Test {

	@Test
	public void testIfPathSpecifiedIsCorrect() {
		var service = new ServiceImpl();
		
		String expected = "Login failed!";
		String actual = service.XMLERRORNAME("API.LOGINFAILED");
		
		assertEquals(expected, actual);
	}

}
