package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Model.StudentBean;
import com.smartqueueweb.Service.ServiceImpl;

public class SearchStudentNameInquiry_Test {

	@Test
	public void testIfStudentNameIsNotNull() {
		ServiceImpl service = new ServiceImpl();
		
		StudentBean expected = null;
		StudentBean actual = service.searchStudentFullnameInquiry("Ariel", "Piodena", "Abelgas");
		assertNotEquals(expected, actual);
	}
}
