package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class addStudentQueue_Test {
	ServiceImpl service = new ServiceImpl();

	@Test
	public void testIfAllSampleFilled() {

		int expected = 1;
		int actual = service.addToQueue("152G", 12313, "cindy labra", "enrollment");

		assertEquals(expected, actual);

	}

	@Test
	public void testIfSomeSampleNotFilled() {

		int expected = 1;
		int actual = service.addToQueue("223G", 3213, "", "enrollment");

		assertEquals(expected, actual);
	}

}
