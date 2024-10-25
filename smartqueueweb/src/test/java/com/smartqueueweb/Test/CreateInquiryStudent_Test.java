package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Model.StudentBean;
import com.smartqueueweb.Service.ServiceImpl;

public class CreateInquiryStudent_Test {

	@Test
	public void testIfStudentCreateInquiry() {
		ServiceImpl service = new ServiceImpl();
		
		
		
		int expected = 1;
		int actual = service.addToQueue("123a", 1231313112, "sample", "sample", "sample");
		
		assertEquals(expected, actual);
		
		//StudentBean actual = service.searchStudentFullnameInquiry("Ariel", "Piodena", "Abelgas");
	//assertNotEquals(expected, actual);
	}
}
