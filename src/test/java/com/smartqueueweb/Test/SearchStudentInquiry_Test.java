package com.smartqueueweb.Test;

import static org.junit.Assert.assertNotEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;

import com.smartqueueweb.Model.StudentBean;
import com.smartqueueweb.Service.ServiceImpl;

public class SearchStudentInquiry_Test {
	
	private StudentBean studentBean;
	private ServiceImpl mockServiceImpl;
	
	@Before
	public void setup() {
		studentBean = new StudentBean();
		mockServiceImpl = mock(ServiceImpl.class);
	}

	@Test
	public void TestIfSearchIsNull() {
		
		
		when(mockServiceImpl.searchStudentInquiry(2110010, "Merilyn", "Villamor", "Geronda")).thenReturn(studentBean);
		StudentBean expected = null;
		StudentBean actual = mockServiceImpl.searchStudentInquiry(2110010, "Merilyn", "Villamor", "Geronda");
		assertNotEquals(expected, actual);
	}

}
