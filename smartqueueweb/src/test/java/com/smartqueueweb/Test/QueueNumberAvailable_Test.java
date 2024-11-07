package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Service.ServiceImpl;

public class QueueNumberAvailable_Test {

	@Test
	public void test() {
		ServiceImpl service = new ServiceImpl();
		
		long expected = service.queueNumberAvailable(12552);
		System.out.println(expected);
	}

}
