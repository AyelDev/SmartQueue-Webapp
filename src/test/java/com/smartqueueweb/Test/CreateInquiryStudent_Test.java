package com.smartqueueweb.Test;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class CreateInquiryStudent_Test {

private ServiceImpl mockServiceImpl;
	
	@Before
	public void setup() {
	mockServiceImpl = mock(ServiceImpl.class);
	}
	
	@Test
	public void StudentCreateInquiryShouldReturn1() {
		
		when(mockServiceImpl.addToQueue("123a", "1231313112", "sample", "sample", "sample")).thenReturn(1);
		
		int expected = 1;
		int actual = mockServiceImpl.addToQueue("123a", "1231313112", "sample", "sample", "sample");
		
		assertEquals(expected, actual);
		
	}
}
