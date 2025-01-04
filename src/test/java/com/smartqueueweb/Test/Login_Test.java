package com.smartqueueweb.Test;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.Before;
import org.junit.Test;

import com.smartqueueweb.Model.StaffBean;
import com.smartqueueweb.Service.ServiceImpl;

public class Login_Test {

	private StaffBean staffBean;
	private ServiceImpl mockServiceImpl;

	@Before
	public void setup() {
	
	mockServiceImpl = mock(ServiceImpl.class);
	staffBean = new StaffBean();
	}

	@Test
	public void test() {
		
		when(mockServiceImpl.loginStaff("testStaff", "testStaffPassword")).thenReturn(true);
		
		String User = "testStaff";
		String Pass = "testStaffPassword";
		
		
		boolean actual = mockServiceImpl.loginStaff(User, Pass);
		boolean expected = true;
		assertEquals(expected, actual);
	
		
		
		
		
	
	}

}
