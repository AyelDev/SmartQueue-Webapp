package com.smartqueueweb.Test;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class addStudentQueue_Test {
	
	private ServiceImpl mockServiceImpl;
	
	@Before
	public void setup() {
	mockServiceImpl = mock(ServiceImpl.class);
	}

	@Test
	public void filledSampleShouldReturnProperly() {

		when(mockServiceImpl.addToQueue("152G", 12313, "cindy labra", "enrollment", "records")).thenReturn(1);
		
		int expected = 1;
		int actual = mockServiceImpl.addToQueue("152G", 12313, "cindy labra", "enrollment", "records");
		
		assertEquals(expected, actual);
		
	}

	@Test
	public void nonFilledSampleShouldReturnProperly() {
		
		when(mockServiceImpl.addToQueue("223G", 000, "", "enrollment", "records")).thenReturn(1);
		
		int expected = 1;
		int actual = mockServiceImpl.addToQueue("223G", 000, "", "enrollment", "records");

		assertEquals(expected, actual);
	}

}
