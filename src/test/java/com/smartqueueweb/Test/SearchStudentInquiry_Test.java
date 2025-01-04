package com.smartqueueweb.Test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.smartqueueweb.Model.StudentBean;
import com.smartqueueweb.Service.ServiceImpl;

public class SearchStudentInquiry_Test {

	@Test
	public void TestIfSearchIsNull() {
		
		ServiceImpl service = new ServiceImpl();
		
		StudentBean expected = null;
		StudentBean actual = service.searchStudentInquiry(2110010, "Merilyn", "Villamor", "Geronda");
		System.out.println(actual);
		assertNotEquals(expected, actual);
	}

}
