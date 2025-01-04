package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import com.smartqueueweb.Model.ServicesBean;
import com.smartqueueweb.Service.ServiceImpl;

public class ListOfInquiries_Test {

	@Test
	public void testIfInquiryIsNotNull() {
		
		ServiceImpl services = new ServiceImpl();
		
		List<ServicesBean> expected = null;
		List<ServicesBean> actual = services.serviceList();
		
		System.out.println(actual);
		
		assertNotEquals(expected, actual);
	}
	

}
