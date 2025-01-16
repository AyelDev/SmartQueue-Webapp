package com.smartqueueweb.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Test;

import com.smartqueueweb.Model.ServicesBean;
import com.smartqueueweb.Service.ServiceImpl;

public class ListStudentEntries_Test {
	
	ServiceImpl services = new ServiceImpl();
	
	@Test
	public void servingShouldNotAppearNull() {
		List<ServicesBean> expected = null;
		List<ServicesBean> actual = services.studentQueueEntries(0, "SERVING");
		
		System.out.println(actual);
		assertNotEquals(expected, actual);
	}
	
	@Test
	public void queueShouldNotAppearNull() {
		List<ServicesBean> expected = null;
		List<ServicesBean> actual = services.studentQueueEntries(1, "QUEUE");
		
		System.out.println(actual);
		assertNotEquals(expected, actual);
	}
	
	@Test
	public void doneShouldNotAppearNull() {
		List<ServicesBean> expected = null;
		List<ServicesBean> actual = services.studentQueueEntries(2, "DONE");
		
		System.out.println(actual);
		assertNotEquals(expected, actual);
	}

}
